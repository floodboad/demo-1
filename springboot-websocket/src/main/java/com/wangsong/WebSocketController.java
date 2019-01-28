package com.wangsong;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class WebSocketController {
	
	@Autowired
    private SimpMessagingTemplate template;

    @MessageMapping("/queue")
    public void userMessageQueue(String param) {
        //找到需要发送的地址
        //推送消息
        this.template.convertAndSend("/queue/client1", param);
    }

    @RequestMapping("/push.do")
    @ResponseBody
    public Map<String, Object> pushMessage(String param) {
        Map<String, Object> result = new HashMap<String, Object>();
        this.template.convertAndSend("/queue/client1", param);
        return result;
    }

}
