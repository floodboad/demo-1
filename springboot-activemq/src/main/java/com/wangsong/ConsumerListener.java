package com.wangsong;


import org.springframework.jms.annotation.JmsListener;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;  

@Component
public class ConsumerListener {
      // 使用JmsListener配置消费者监听的队列，其中text是接收到的消息  
  @JmsListener(destination = "mytest.queue") 
  @SendTo("out.queue") 
  public void receiveQueue(String text) {  
      System.out.println("Consumer收到的报文为:"+text);  
  }  
}  