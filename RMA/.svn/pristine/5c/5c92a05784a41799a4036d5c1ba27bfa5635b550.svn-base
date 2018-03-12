package com.ovt.aftersale.common.tools;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

/**
 * 
 * JsonUtil
 * 
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public class JsonUtil
{
    public static String convertToJson(final Object obj)
            throws JsonGenerationException, JsonMappingException, IOException
    {
        String result = null;
        ObjectMapper objectMapper = new ObjectMapper();
        result = objectMapper.writeValueAsString(obj);
        return result;
    }

    public static <T> T convertToObject(final String str, final Class<T> cls)
            throws JsonParseException, JsonMappingException, IOException
    {
        T result = null;
        ObjectMapper objectMapper = new ObjectMapper();
        result = objectMapper.readValue(str, cls);
        return result;
    }
}