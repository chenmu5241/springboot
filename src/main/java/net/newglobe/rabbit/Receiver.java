package net.newglobe.rabbit;

import java.util.Date;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
public class Receiver {

	/**
	 * 接收消息的方法。采用消息队列监听机制
	 * @param msg
	 */
	@RabbitListener(queues="hello-queue")
	public void process(String msg){
		Date date = new Date();
		System.out.println("B:"+date.getTime());
	}
}