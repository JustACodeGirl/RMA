package com.ovt.aftersale.common.vo;

import java.util.Date;
import java.util.Map;

import com.ovt.aftersale.common.tools.DataConvertUtils;

/**
 * 对应表t_human
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public class Human
{
    private Integer human_id;
    private String human_name;
    private String password;
    private String phone;
    private String email;
    private int unit_id;
    private String description;
    private Date create_time;
    private Date update_time;
    private Integer is_deleted;
    private Integer role_id;
    
    public Human()
    {
        
    }
    
    public Human(Map<String, Object> human)
    {
        this.setHuman_id(DataConvertUtils.toInt(human.get("human_id")));
        this.setHuman_name(DataConvertUtils.toString(human.get("human_name")));
        this.setPhone(DataConvertUtils.toString(human.get("phone")));
        this.setEmail(DataConvertUtils.toString(human.get("email")));
        this.setUnit_id(DataConvertUtils.toInt(human.get("unit_id")));
        this.setDescription(DataConvertUtils.toString(human.get("description")));
        this.setIs_deleted(DataConvertUtils.toInt(human.get("is_deleted")));
        this.setRole_id(DataConvertUtils.toInt(human.get("role_id")));
    }
    
    public Integer getHuman_id()
    {
        return human_id;
    }
    public void setHuman_id(Integer human_id)
    {
        this.human_id = human_id;
    }
    public String getHuman_name()
    {
        return human_name;
    }
    public void setHuman_name(String human_name)
    {
        this.human_name = human_name;
    }
    public String getPassword()
    {
        return password;
    }
    public void setPassword(String password)
    {
        this.password = password;
    }
    public String getPhone()
    {
        return phone;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    public String getDescription()
    {
        return description;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }
    public Date getCreate_time()
    {
        return create_time;
    }
    public void setCreate_time(Date create_time)
    {
        this.create_time = create_time;
    }
    public Date getUpdate_time()
    {
        return update_time;
    }
    public void setUpdate_time(Date update_time)
    {
        this.update_time = update_time;
    }
    public Integer getIs_deleted()
    {
        return is_deleted;
    }
    public void setIs_deleted(Integer is_deleted)
    {
        this.is_deleted = is_deleted;
    }
	@Override
	public String toString() {
		return "Human [human_id=" + human_id 
				+ ", human_name=" + human_name 
				+ ", password=" + password + ", phone="
				+ phone + ", description=" 
				+ description + ", create_time="
				+ create_time + ", update_time="
				+ update_time + ", is_deleted="
				+ is_deleted + "]";
	}

    public Integer getRole_id()
    {
        return role_id;
    }

    public void setRole_id(Integer role_id)
    {
        this.role_id = role_id;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public int getUnit_id()
    {
        return unit_id;
    }

    public void setUnit_id(int unit_id)
    {
        this.unit_id = unit_id;
    }
}
