package com.ruyicai.actioncenter.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import com.ruyicai.actioncenter.consts.Fund2DrawState;
import com.ruyicai.actioncenter.dao.Fund2DrawDao;
import com.ruyicai.actioncenter.dao.TactivityDao;
import com.ruyicai.actioncenter.domain.Chong20Mobile;
import com.ruyicai.actioncenter.domain.FirstChargeUser;
import com.ruyicai.actioncenter.domain.Fund2Draw;
import com.ruyicai.actioncenter.domain.FundAndJoinAction;
import com.ruyicai.actioncenter.domain.Tactivity;
import com.ruyicai.actioncenter.util.JsonUtil;
import com.ruyicai.actioncenter.util.Page;

@Service
public class Fund2DrawService {

	private Logger logger = LoggerFactory.getLogger(Fund2DrawService.class);

	@Autowired
	private Fund2DrawDao fund2DrawDao;
	
	@Autowired
	private TactivityDao tactivityDao;

	@Autowired
	private LotteryService lotteryService;

	@Produce(uri = "jms:topic:sendFund2Draw")
	private ProducerTemplate sendFund2Draw;

	public void quartzFindFund2Draw() {
		Tactivity tactivity = tactivityDao.findTactivity(null, null, "00092493", null, ActionJmsType.Fund2Draw.value);
		if (tactivity != null) {
			logger.info("查询待增加可提现充值");
			List<Fund2Draw> list = fund2DrawDao.findCanFund2Draw(Fund2DrawState.waitToDraw.value(), new Date());
			for (Fund2Draw draw : list) {
				if (draw != null && draw.getTtransactionid() != null) {
					sendFund2DrawJMS(draw.getTtransactionid());
				}
			}
		} else {
			logger.info("增加可提现充值未开启");
		}
	}

	public void sendFund2DrawJMS(String ttransactionid) {
		logger.info("发送增加可提现充值ttransactionid:" + ttransactionid);
		Map<String, Object> headers = new HashMap<String, Object>();
		headers.put("ttransactionid", ttransactionid);
		sendFund2Draw.sendBodyAndHeaders(null, headers);
	}

	@Transactional
	public void fund2Draw(@Header("ttransactionid") String ttransactionid) {
		Fund2Draw draw = fund2DrawDao.findFund2Draw(ttransactionid, true);
		if (draw.getState() != Fund2DrawState.waitToDraw.value()) {
			logger.info("该充值ttransactionid:" + ttransactionid + "状态非等待状态state:" + draw.getState());
			return;
		}
		FundAndJoinAction action = FundAndJoinAction.findFundAndJoinAction(ttransactionid);
		if (action != null) {
			logger.info("该充值已参加活动，不可提现ttransactionid:" + ttransactionid);
			draw.setState(Fund2DrawState.haveJoinAction.value());
			fund2DrawDao.merge(draw);
			return;
		}
		Boolean flag = lotteryService.fund2Draw(ttransactionid);
		if (flag) {
			draw.setState(Fund2DrawState.haveDraw.value());
			draw.setSuccessTime(new Date());
			fund2DrawDao.merge(draw);
			logger.info("充值增加提现ttransactionid:" + ttransactionid + "已调用lottery完毕");
		} else {
			draw.setState(Fund2DrawState.hasError.value());
			fund2DrawDao.merge(draw);
			logger.info("充值增加提现ttransactionid:" + ttransactionid + "调用lottery失败");
		}
	}
	
	/**
	 * 根据ttransactionid查找Fund2Draw
	 * @param ttransactionid
	 * @return
	 */
	public Fund2Draw findFund2Draw(String ttransactionid) {
		if(StringUtils.isBlank(ttransactionid)) {
			throw new IllegalArgumentException("The argument ttransactionid is required.");
		}
		return fund2DrawDao.findFund2Draw(ttransactionid);
	}
	
	/**
	 * 分页查询Fund2Draw
	 * @param condition	条件
	 * @param pageIndex	页号
	 * @param maxResult	返回结果数
	 * @param orderBy		排序关键字
	 * @param orderDir		排序顺序
	 * @return
	 */
	public Page<Fund2Draw> findFund2DrawByPage(String condition, Integer pageIndex, Integer maxResult, String orderBy, String orderDir) {
		Page<Fund2Draw> page = new Page<Fund2Draw>(pageIndex, maxResult, orderBy, orderDir);
		Map<String, Object> conditionMap = JsonUtil.transferJson2Map(condition);
		fund2DrawDao.findFund2DrawByPage(conditionMap, page);
		return page;
	}
	
	public FirstChargeUser findFirstChargeUser(String userno, Integer state) {
		if(StringUtils.isBlank(userno)) {
			throw new IllegalArgumentException("The argument userno is required.");
		}
		return FirstChargeUser.findFirstChargeUser(userno, state);
	}
	
	public Chong20Mobile findChong20Mobile(String mobileid) {
		if(StringUtils.isBlank(mobileid)) {
			throw new IllegalArgumentException("The argument mobileid is required.");
		}
		return Chong20Mobile.findChong20Mobile(mobileid);
	}

}
