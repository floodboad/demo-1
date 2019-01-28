package com.wangsong;


import com.baidu.disconf.client.DisconfMgrBean;
import com.baidu.disconf.client.DisconfMgrBeanSecond;
import com.baidu.disconf.client.addons.properties.ReloadablePropertiesFactoryBean;
import com.baidu.disconf.client.addons.properties.ReloadingPropertyPlaceholderConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;
import java.util.Properties;

/**
 * @author wuweifeng wrote on 2017/10/16.
 */
@Configuration
public class DisconfConfig {
    @Bean(destroyMethod = "destroy")
    public DisconfMgrBean getDisconfMgrBean() {
        DisconfMgrBean disconfMgrBean = new DisconfMgrBean();
        disconfMgrBean.setScanPackage("com.wangsong");
        return disconfMgrBean;
    }

    @Bean(destroyMethod = "destroy", initMethod = "init")
    public DisconfMgrBeanSecond getDisconfMgrBean2() {
        return new DisconfMgrBeanSecond();
    }

    @Bean
    public ReloadablePropertiesFactoryBean configproperties_disconf() throws IOException {
        ReloadablePropertiesFactoryBean reloadablePropertiesFactoryBean = new ReloadablePropertiesFactoryBean();
        reloadablePropertiesFactoryBean.setLocation("application.properties");
        return reloadablePropertiesFactoryBean;
    }

    @Bean
    public ReloadingPropertyPlaceholderConfigurer propertyConfigurer() throws IOException {
        ReloadingPropertyPlaceholderConfigurer reloadingPropertyPlaceholderConfigurer = new ReloadingPropertyPlaceholderConfigurer();
        reloadingPropertyPlaceholderConfigurer.setIgnoreResourceNotFound(true);
        reloadingPropertyPlaceholderConfigurer.setIgnoreUnresolvablePlaceholders(true);
        reloadingPropertyPlaceholderConfigurer.setProperties(configproperties_disconf().getObject());
        return reloadingPropertyPlaceholderConfigurer;
    }
}

