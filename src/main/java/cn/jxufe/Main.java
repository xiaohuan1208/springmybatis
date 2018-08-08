package cn.jxufe;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * Created by Administrator on 2018/8/2.
 */
@SpringBootApplication
@MapperScan("cn.jxufe.dao")
public class Main {

    public static void main(String[] args) {
        SpringApplication.run(Main.class,args);
    }
}
