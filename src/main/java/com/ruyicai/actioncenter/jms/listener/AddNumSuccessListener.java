package com.ruyicai.actioncenter.jms.listener;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.camel.Header;
import org.apache.camel.Produce;
import org.apache.camel.ProducerTemplate;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ruyicai.actioncenter.consts.ActionJmsType;
import com.ruyicai.actioncenter.domain.Tactivity;
import com.ruyicai.actioncenter.domain.TaddNumActivity;
import com.ruyicai.actioncenter.domain.TuserPrizeDetail;
import com.ruyicai.actioncenter.service.LotteryService;
import com.ruyicai.actioncenter.util.DateUtil;
import com.ruyicai.actioncenter.util.JsonUtil;
import com.ruyicai.lottery.domain.Tuserinfo;

@Service
public class AddNumSuccessListener {

	private Logger logger = LoggerFactory.getLogger(AddNumSuccessListener.class);

	@Autowired
	private LotteryService lotteryService;

	@Produce(uri = "jms:topic:sendActivityPrize")
	private ProducerTemplate sendActivityPrizeProducer;

	@Transactional
	public void addNumSuccessCustomer(@Header("flowno") String flowno, @Header("userno") String userno) {
		logger.info("追号成功消息flowno:{},userno:{}", new String[] { flowno, userno });
		if (StringUtils.isBlank(flowno) || StringUtils.isBlank(userno)) {
			return;
		}
		TaddNumActivity addNumActivity = TaddNumActivity.findTaddNumActivityByFlownoAndUserno(flowno, userno);
		if (addNumActivity == null) {
			return;
		}
		Tuserinfo tuserinfo = lotteryService.findTuserinfoByUserno(userno);
		if (tuserinfo == null) {
			return;
		}
		Tactivity tactivity = Tactivity.findTactivity(null, null, tuserinfo.getSubChannel(), null,
				ActionJmsType.AddNumOneYear.value);
		if (tactivity == null) {
			return;
		}
		TuserPrizeDetail prizeDetail = TuserPrizeDetail.findTuserPrizeDetailByUsernoAndActivityType(userno,
				ActionJmsType.AddNumOneYear.value);
		String express = tactivity.getExpress();
		Map<String, Object> activity = JsonUtil.transferJson2Map(express);
		Integer prize = (Integer) activity.get("prize");
		Date date = null;
		if (prizeDetail == null) {
			logger.info("第一次赠送追号包年套餐奖金");
			sendPrize2UserJMS(addNumActivity.getUserno(), new BigDecimal(prize), ActionJmsType.AddNumOneYear,
					tactivity.getMemo());
		} else {
			date = prizeDetail.getCreateTime();
			String dateStr = DateUtil.format(date);
			/*
			 * Long count = lotteryService.findTtransactionCount(userno,
			 * dateStr); if (count != null) { if (count == 0) {
			 * logger.info("取消用户追号包年套餐userno:" + userno);
			 * addNumActivity.setAddNumState(BigDecimal.ZERO);
			 * addNumActivity.setModifyTime(new Date()); addNumActivity.merge();
			 * } else if (count > 0) { logger.info("赠送用户追号包年套餐userno:" + userno
			 * + ",prize:" + prize);
			 * sendPrize2UserJMS(addNumActivity.getUserno(), new
			 * BigDecimal(prize), ActionJmsType.AddNumOneYear); } }
			 */
			BigDecimal count = lotteryService.findTtransactionSum(userno, dateStr);
			if (count != null) {
				if (count.compareTo(new BigDecimal(200)) < 0) {
					logger.info("取消用户追号包年套餐userno:" + userno);
					addNumActivity.setAddNumState(BigDecimal.ZERO);
					addNumActivity.setModifyTime(new Date());
					addNumActivity.merge();
				} else {
					logger.info("赠送用户追号包年套餐userno:" + userno + ",prize:" + prize);
					sendPrize2UserJMS(addNumActivity.getUserno(), new BigDecimal(prize), ActionJmsType.AddNumOneYear,
							tactivity.getMemo());
				}
			}
		}
	}

	private void sendPrize2UserJMS(String userno, BigDecimal amt, ActionJmsType actionJmsType, String memo) {
		TuserPrizeDetail userPrizeDetail = TuserPrizeDetail.createTprizeUserBuyLog(userno, amt, actionJmsType);
		Map<String, Object> headers = new HashMap<String, Object>();
		headers.put("prizeDetailId", userPrizeDetail.getId());
		headers.put("actionJmsType", actionJmsType.value);
		headers.put("memo", memo);
		sendActivityPrizeProducer.sendBodyAndHeaders(null, headers);
	}

}
