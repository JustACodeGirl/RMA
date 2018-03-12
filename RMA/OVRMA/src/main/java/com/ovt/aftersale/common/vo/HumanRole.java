package com.ovt.aftersale.common.vo;

/**
 * 对应表t_human_role
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public class HumanRole
{
    private Integer human_role_id;
    private Integer human_id;
    private Integer role_id;
    public Integer getHuman_role_id()
    {
        return human_role_id;
    }
    public void setHuman_role_id(Integer human_role_id)
    {
        this.human_role_id = human_role_id;
    }
    public Integer getHuman_id()
    {
        return human_id;
    }
    public void setHuman_id(Integer human_id)
    {
        this.human_id = human_id;
    }
    public Integer getRole_id()
    {
        return role_id;
    }
    public void setRole_id(Integer role_id)
    {
        this.role_id = role_id;
    }
}
