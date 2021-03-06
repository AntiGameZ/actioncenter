package com.ruyicai.actioncenter.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruyicai.actioncenter.domain.UserExperience;
import com.ruyicai.actioncenter.domain.UserExperienceAvailableVoteTimes;
import com.ruyicai.actioncenter.domain.UserExperienceVoteLog;
import com.ruyicai.actioncenter.exception.RuyicaiException;
import com.ruyicai.actioncenter.service.LotteryService;
import com.ruyicai.actioncenter.service.UserExperienceService;
import com.ruyicai.actioncenter.util.ErrorCode;
import com.ruyicai.actioncenter.util.JsonUtil;
import com.ruyicai.actioncenter.util.Page;

@RequestMapping("/userexperience")
@Controller
public class UserExperienceController {
	
	private Logger logger = LoggerFactory.getLogger(UserExperienceController.class);
	
	@Autowired
	private UserExperienceService userExperieneService;
	
	@Autowired
	private LotteryService lotteryService;

	/**
	 * 应聘体验官 <br/>
	 * 需要传入userno、name、age、contact、question1-5 <br/>
	 * @param userExperience
	 * @return ResponseData 包含ErrorCode和创建的UserExperience实体或错误原因描述
	 */
	@RequestMapping("/recruit")
	public @ResponseBody ResponseData recruit(@ModelAttribute("userExperience") UserExperience userExperience) {
		logger.info("/userexperience/recruit " + userExperience.toString());
		ResponseData rd = new ResponseData();
		ErrorCode result = ErrorCode.OK;
		try {
			userExperieneService.recruit(userExperience);
			rd.setValue(userExperience);
		} catch (IllegalArgumentException e) {
			rd.setValue(e.getMessage());
			result = ErrorCode.PARAMTER_ERROR;
		} catch(RuyicaiException e) {
			rd.setValue(e.getMessage());
			result = e.getErrorCode();
		} catch (Exception e) {
			logger.error("recruit error", e);
			rd.setValue(e.getMessage());
			result = ErrorCode.ERROR;
		}
		rd.setErrorCode(result.value);
		return rd;
	}
	
	/**
	 * 投票选举用户体验师
	 * @param voteruserno	投票人的用户id
	 * @param userno			被投票的体验师的用户id
	 * @return	ResponseData	包含ErrorCode和创建的UserExperience实体或错误原因描述
	 */
	@RequestMapping("/vote")
	public @ResponseBody ResponseData vote(@RequestParam(value = "voteruserno") String voteruserno,
			@RequestParam(value = "userno") String userno) {
		logger.info("/userexperience/vote voteruserno:{} userno:{}", new String[] {voteruserno, userno});
		ResponseData rd = new ResponseData();
		ErrorCode result = ErrorCode.OK;
		try {
//			UserExperience userExperience = userExperieneService.vote(voteruserno, userno);
//			rd.setValue(userExperience);
			throw new RuyicaiException(ErrorCode.UserExperience_Closed);
		} catch (IllegalArgumentException e) {
			rd.setValue(e.getMessage());
			result = ErrorCode.PARAMTER_ERROR;
		} catch(RuyicaiException e) {
			rd.setValue(e.getMessage());
			result = e.getErrorCode();
		} catch (Exception e) {
			logger.error("vote error", e);
			rd.setValue(e.getMessage());
			result = ErrorCode.ERROR;
		}
		rd.setErrorCode(result.value);
		return rd;
	}
	
	/**
	 * 查找体验师
	 * @param condition	条件
	 * @param pageIndex	当前页码（第一页为0）
	 * @param maxResult	每页显示结果数
	 * @param orderBy		排序的字段，如"applytime,vote"
	 * @param orderDir		排序字段升序或者降序，如"DESC,ASC"
	 * @return	ResponseData	包含ErrorCode和创建的Page或错误原因描述
	 */
	@RequestMapping("/listUserExperienceByPage")
	public @ResponseBody ResponseData listUserExperienceByPage(@RequestParam(value = "condition", required = false) String condition,
			@RequestParam(value = "pageIndex", required = false, defaultValue = "0") int pageIndex,
			@RequestParam(value = "maxResult", required = false, defaultValue = "30") int maxResult,
			@RequestParam(value = "orderBy", required = false) String orderBy,
			@RequestParam(value = "orderDir", required = false) String orderDir) {
		logger.info("/userexperience/listUserExperienceByPage condition:{} pageIndex:{} maxResult:{} orderBy:{} orderDir:{}", new String[] {condition, pageIndex + "", maxResult + "", orderBy, orderDir});
		ResponseData rd = new ResponseData();
		ErrorCode result = ErrorCode.OK;
		Page<UserExperience> page = new Page<UserExperience>(pageIndex, maxResult, orderBy, orderDir);
		try {
			Map<String, Object> conditionMap = JsonUtil.transferJson2Map(condition);
			UserExperience.findByPage(conditionMap, page);
			rd.setValue(page);
		} catch (Exception e) {
			logger.error("listUserExperienceByPage error", e);
			rd.setValue(e.getMessage());
			result = ErrorCode.ERROR;
		}
		rd.setErrorCode(result.value);
		return rd;
	}
	
	/**
	 * 返回选定的20名候选人
	 * @return
	 */
	@RequestMapping("/listSelectedUserExperience")
	public @ResponseBody ResponseData listSelectedUserExperience() {
		logger.info("/userexperience/listSelectedUserExperience");
		ResponseData rd = new ResponseData();
		ErrorCode result = ErrorCode.OK;
		Page<UserExperience> page = new Page<UserExperience>(0, 20, "votes", "desc");
		try {
			Map<String, Object> conditionMap = new HashMap<String, Object>();
			conditionMap.put("EQI_selected", 1);
			int i = 1;
			UserExperience.findByPage(conditionMap, page);
			for(UserExperience user : page.getList()) {
				user.setUserinfo(lotteryService.findTuserinfoByUserno(user.getUserno()));
				user.setRank(i);
				i++;
			}
			logger.info("排序开始");
			Collections.sort(page.getList());
			logger.info("排序结束");
			rd.setValue(page);
		} catch (Exception e) {
			logger.error("listUserExperienceByPage error", e);
			rd.setValue(e.getMessage());
			result = ErrorCode.ERROR;
		}
		rd.setErrorCode(result.value);
		return rd;
	}
	
	/**
	 * 查找投票
	 * @param condition	条件
	 * @param pageIndex	当前页码（第一页为0）
	 * @param maxResult	每页显示结果数
	 * @param orderBy		排序的字段，如"voteruserno,votedate"
	 * @param orderDir		排序字段升序或者降序，如"DESC,ASC"
	 * @return	ResponseData	包含ErrorCode和创建的Page或错误原因描述
	 */
	@RequestMapping("/listVotersByPage")
	public @ResponseBody ResponseData listVotersByPage(@RequestParam(value = "condition", required = false) String condition,
			@RequestParam(value = "pageIndex", required = false, defaultValue = "0") int pageIndex,
			@RequestParam(value = "maxResult", required = false, defaultValue = "10") int maxResult,
			@RequestParam(value = "orderBy", required = false) String orderBy,
			@RequestParam(value = "orderDir", required = false) String orderDir) {
		logger.info("/userexperience/listVotersByPage condition:{} pageIndex:{} maxResult:{} orderBy:{} orderDir:{}", new String[] {condition, pageIndex + "", maxResult + "", orderBy, orderDir});
		ResponseData rd = new ResponseData();
		ErrorCode result = ErrorCode.OK;
		Page<UserExperienceVoteLog> page = new Page<UserExperienceVoteLog>(pageIndex, maxResult, orderBy, orderDir);
		try {
			Map<String, Object> conditionMap = JsonUtil.transferJson2Map(condition);
			UserExperienceVoteLog.findByPage(conditionMap, page);
			for(UserExperienceVoteLog uevl : page.getList()) {
				uevl.setVoteruserinfo(lotteryService.findTuserinfoByUserno(uevl.getVoteruserno()));
				uevl.setUsernoinfo(lotteryService.findTuserinfoByUserno(uevl.getUserno()));
			}
			rd.setValue(page);
		} catch (Exception e) {
			logger.error("listVotersByPage error", e);
			rd.setValue(e.getMessage());
			result = ErrorCode.ERROR;
		}
		rd.setErrorCode(result.value);
		return rd;
	}
	
	/**
	 * 增加用户可投票次数
	 * @param userno	用户id
	 * @param times		次数
	 * @return
	 */
	@RequestMapping("/addAvailableVoteTimes")
	public @ResponseBody ResponseData addAvailableVoteTimes(@RequestParam(value = "userno", required = false) String userno,
			@RequestParam(value = "type", required =false) Integer type) {
		logger.info("/userexperience/addAvailableVoteTimes userno:{} type:{}", new String[] {userno, type + ""});
		ResponseData rd = new ResponseData();
		ErrorCode result = ErrorCode.OK;
		try {
			UserExperienceAvailableVoteTimes ueavt = userExperieneService.addAvailableVoteTimes(userno, type);
			rd.setValue(ueavt);
		} catch(RuyicaiException e) {
			rd.setValue(e.getMessage());
			result = e.getErrorCode();
		} catch(IllegalArgumentException e) {
			rd.setValue(e.getMessage());
			result = ErrorCode.PARAMTER_ERROR;
		} catch (Exception e) {
			logger.error("addAvailableVoteTimes error", e);
			rd.setValue(e.getMessage());
			result = ErrorCode.ERROR;
		}
		rd.setErrorCode(result.value);
		return rd;
	}
	
}
