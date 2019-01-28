import com.wangsong.Application;
import com.wangsong.ProducerService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;



@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class Test {

    @Autowired
    private ProducerService producer;

    @org.junit.Test
    public void test() throws InterruptedException {

        for(int i=0; i<100; i++){
            producer.send(i+"hello,rabbit~");
        }
        Thread.sleep(999999999L);
    }
}