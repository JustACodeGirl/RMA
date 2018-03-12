package com.ovt.aftersale.common.context;

import com.ovt.aftersale.common.vo.Human;

/**
 * SessionContext
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public class SessionContext
{
    private static ThreadLocal<Human> currentHuman = new ThreadLocal<Human>();
    
    /**
     * @param user the currentUser to set.
     */
    public static void setCurrentHuman(Human human)
    {
        currentHuman.set(human);
    }
    
    /**
     * @return the currentUser.
     */
    public static Human getCurrentHuman()
    {
        return currentHuman.get();
    }
    
    /**
     * remove current user to avoid memory leak.
     */
    public static void destroy()
    {
        currentHuman.remove();
    }
}
