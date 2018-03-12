/**
 * PartType.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 2, 2016
 */
package com.ovt.aftersale.common.constant;

/**
 * PartType
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
public enum PartType
{

    HUMAN(1), ROLE(2), DEPARTMENT(3);
    
    private int value;
    
    PartType(int value)
    {
        this.value = value;
    }
    
    public PartType valueOf(int value)
    {
        if (value == 2) {
            return ROLE;
        }
        else if (value == 3) {
            return DEPARTMENT;
        }
        else 
        {
            return HUMAN;
        }
    }

    public int getValue()
    {
        return value;
    }

    public void setValue(int value)
    {
        this.value = value;
    }
}
