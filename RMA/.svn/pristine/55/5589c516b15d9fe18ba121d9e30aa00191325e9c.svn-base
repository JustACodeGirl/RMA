package com.ovt.aftersale.common.tools;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


/**
 * bean工厂，用来获取bean
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public class BeanFactoryUtil
{
    public static ApplicationContext ctx = null;
    static
    {
        ctx = new ClassPathXmlApplicationContext(new String[] {
                "classpath:applicationContext-servlet.xml",
                "classpath:applicationContext-datasource.xml", });

    }

    public static Object getBean(String name)
    {
        return ctx.getBean(name);
    }
}
