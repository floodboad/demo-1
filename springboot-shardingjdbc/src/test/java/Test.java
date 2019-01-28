import com.wangsong.Application;
import com.wangsong.alibaba.dao.AlibabaMapper;
import com.wangsong.alibaba.model.Alibaba;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class Test {

    @Autowired
    private AlibabaMapper alibabaMapper;

    @org.junit.Test
    public void test() {


        Alibaba a=new Alibaba();
        a.setAli(333);
        a.setBaba(1);
        alibabaMapper.insert(a);

        System.out.println(alibabaMapper.selectByPrimaryKey(333));
    }
}