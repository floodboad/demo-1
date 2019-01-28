import com.wangsong.Application;
import com.wangsong.CuratorService;
import org.apache.curator.framework.recipes.locks.InterProcessMutex;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.*;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class Test {
    DateFormat bf = new SimpleDateFormat("yyyy-MM-dd E a HH:mm:ss");//多态

    private static ExecutorService THREAD_POOL = new ThreadPoolExecutor(50, 50, 60, TimeUnit.MINUTES,
            new LinkedBlockingQueue<Runnable>(), Executors.defaultThreadFactory(),
            new ThreadPoolExecutor.AbortPolicy());

    int j = 1;

    @Autowired
    private CuratorService curatorService;

    @org.junit.Test
    public void test() throws Exception {
        System.out.println("11111" + curatorService.getChildren("/"));


    }

    @org.junit.Test
    public void test2() throws Exception {
        System.out.println("11111" + curatorService.getChildren("/"));
        System.out.println("11111" + curatorService.getChildren("/"));
    }

    @org.junit.Test
    public void test3() throws Exception {

        for (int i = 0; i < 100; i++) {

            /**
             * 例子1: 没有返回结果的异步任务
             */
            THREAD_POOL.submit(new Runnable() {
                @Override
                public void run() {
                    InterProcessMutex acquire = null;
                    try {
                        acquire = curatorService.acquire("/super");
                        System.out.println(bf.format(new Date()) + "------" + j);
                        if(j==20){
                            Thread.sleep(2000L);
                        }
                        if(j==40){
                            Thread.sleep(10000L);
                        }
                        j += 1;
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            curatorService.release(acquire);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            });
        }


        Thread.sleep(999999999999999999L);
    }

}