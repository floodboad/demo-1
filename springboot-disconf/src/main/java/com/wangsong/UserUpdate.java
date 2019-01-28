package com.wangsong;

import com.baidu.disconf.client.common.annotations.DisconfUpdateService;
import com.baidu.disconf.client.common.update.IDisconfUpdate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@DisconfUpdateService(confFileKeys = {"application.properties"})
public class UserUpdate implements IDisconfUpdate {
    @Autowired
    private User user;

    @Override
    public void reload() {
        user.setName(user.getName());
        user.setPassword(user.getPassword());
    }
}
