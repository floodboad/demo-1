import com.wangsong.Application;
import com.wangsong.RedisService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.concurrent.*;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class Test {
    private static ExecutorService THREAD_POOL = new ThreadPoolExecutor(50, 50, 60, TimeUnit.MINUTES,
            new LinkedBlockingQueue<Runnable>(), Executors.defaultThreadFactory(),
            new ThreadPoolExecutor.AbortPolicy());
    @Autowired
    private RedisService redisService;

    @org.junit.Test
    public void test() throws InterruptedException {
        System.out.println(redisService.test3add("1"));
        Thread.sleep(1000*5);
        System.out.println(redisService.test3list("1"));
        Thread.sleep(1000*5);
        System.out.println(redisService.test3del("1"));
        Thread.sleep(1000*5);
        System.out.println(redisService.test3list("1"));
    }

    @org.junit.Test
    public void test3() throws InterruptedException {

        while (true) {

            /**
             * 例子1: 没有返回结果的异步任务
             */
            THREAD_POOL.submit(new Runnable() {
                @Override
                public void run() {
                    System.out.println(redisService.idG("test15"));
                }
            });
        }


    }

}
