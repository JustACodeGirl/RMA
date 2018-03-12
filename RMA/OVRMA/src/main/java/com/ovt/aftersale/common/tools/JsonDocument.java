package com.ovt.aftersale.common.tools;

import com.ovt.aftersale.common.constant.StateCode;


/**
 * JsonDocument is the api unified output data format
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See
 * @Since [OVT UAF Protocol]/[SERVER] 1.0
 */
public class JsonDocument
{
    private Object data;
    
    private String stateCode;
    
    public static final JsonDocument SUCCESS = new JsonDocument();
    
    public static final String STATE_SUCCESS = StateCode.SUCCESS;
    
    public JsonDocument()
    {
    	this.stateCode = STATE_SUCCESS;
    }
    
    public JsonDocument(Object data)
    {
        this.stateCode = STATE_SUCCESS;
        this.data = data;
    }
    
	public JsonDocument(String stateCode) 
	{
		this.stateCode = stateCode;
	}

	public Object getData() 
	{
		return data;
	}

	public void setData(Object data) 
	{
		this.data = data;
	}

	public String getStateCode() 
	{
		return stateCode;
	}

	public void setStateCode(String stateCode) 
	{
		this.stateCode = stateCode;
	}
}
