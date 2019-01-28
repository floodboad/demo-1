package com.wangsong.system.service;

import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.common.model.Result;
import com.wangsong.system.model.ScheduleJob;

public interface ScheduleJobService{
	public Result add(ScheduleJob scheduleJob);
	public GetEasyUIData getAllScheduleJob();	
	public Result modifyTrigger(ScheduleJob scheduleJob);
	
	public Result restartJob(String[] name,String[] group);
	public Result startNowJob(String[] name,String[] group);
	public Result delJob(String[] name,String[] group);
	public Result stopJob(String[] name,String[] group);
}
