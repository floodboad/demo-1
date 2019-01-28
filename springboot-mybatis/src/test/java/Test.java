import com.wangsong.Application;
import com.wangsong.alibaba.dao.AlibabaMapper;
import com.wangsong.alibaba.model.Alibaba;
import com.wangsong.alibaba.service.AlibabaService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.sql.DataSource;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class Test {

    @Autowired
    private AlibabaMapper alibabaMapper;
    @Autowired
    private AlibabaService alibabaService;

    @Autowired
    private DataSource dataSource;
    @org.junit.Test
    public void test() {
        System.out.println(dataSource);
        Alibaba a=new Alibaba();
        a.setAli(1);
        a.setBaba("222");
        alibabaService.updateByPrimaryKey(a);


        System.out.println(alibabaMapper.selectByPrimaryKey(1));
        System.out.println(alibabaMapper.selectByPrimaryKey(1));

        System.out.println(alibabaMapper.updateByPrimaryKey(a));
        System.out.println(alibabaMapper.selectByPrimaryKey(1));
    }
}