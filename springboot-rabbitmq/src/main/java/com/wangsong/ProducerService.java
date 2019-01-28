package com.wangsong;


import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("producerService")
public class ProducerService {
    @Autowired
    private AmqpTemplate template;

    public void send(String str) {
        template.convertAndSend("queue", str);
    }
}  
