import com.wangsong.Application;
import com.wangsong.User;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Map;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class Test {

    @Autowired
    private User user;

    @Value("${user.password}")
    private String name;

    @org.junit.Test
    public void test() throws InterruptedException {
        for (int i = 0; i < 1000; i++) {
            System.out.println(user.toString());
            System.out.println( name);
            Thread.sleep(1000 * 5);
        }

    }
}