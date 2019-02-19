package net.newglobe.job;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class Job1 {
	//没10秒执行一次
	@Scheduled(cron = "0/10 * * * * ?")
	public void pushDataScheduled() {
		System.out.println("定时任务执行了");
	}
}