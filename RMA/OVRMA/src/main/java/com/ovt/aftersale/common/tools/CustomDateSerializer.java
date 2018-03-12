package com.ovt.aftersale.common.tools;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

/**
 * VO中Date字段的序列化
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public class CustomDateSerializer extends JsonSerializer<Date>
{

    public void serialize(Date value, JsonGenerator jgen,
            SerializerProvider provider) throws IOException,
            JsonProcessingException
    {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",
        		Locale.SIMPLIFIED_CHINESE);
        String formattedDate = formatter.format(value);
        jgen.writeString(formattedDate);
    }
}
