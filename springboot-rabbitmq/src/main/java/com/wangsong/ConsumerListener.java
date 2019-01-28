package com.wangsong;


import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
public class ConsumerListener {
    @RabbitListener(queues="queue")    //监听器监听指定的Queue
    public void processC(String str) {
        System.out.println("Receive:"+str);
    }
}  