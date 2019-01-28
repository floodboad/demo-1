import com.wangsong.Application;
import com.wangsong.ProducerService;
import org.apache.activemq.command.ActiveMQQueue;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.jms.Destination;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class Test {

    @Autowired
    private ProducerService producer;

    @org.junit.Test
    public void test() {
        Destination destination = new ActiveMQQueue("mytest.queue");

        for(int i=0; i<100; i++){
            producer.sendMessage(destination, "myname is chhliu!!!");
        }
    }
}