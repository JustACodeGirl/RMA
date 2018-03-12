package com.ovt.aftersale.common.tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.Clob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.rowset.ResultSetWrappingSqlRowSetMetaData;

/**
 * 
 * DAORowMapper
 * 
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public class DAORowMapper<T> implements RowMapper<T>
{
    private static final Log LOG = LogFactory.getLog(DAORowMapper.class);
    
    public DAORowMapper(Class<? extends T> rowObjClass)
    {
        super();
        this.rowObjClass = rowObjClass;
        this.direct = this.isDirectClass();
    }

    public DAORowMapper(Class<? extends T> rowObjClass, boolean direct)
    {
        super();
        this.rowObjClass = rowObjClass;
        boolean directClass = this.isDirectClass();
        this.direct = directClass ? true : direct;
    }

    @SuppressWarnings(value = "unchecked")
    public T mapRow(ResultSet resultRet, int index) throws SQLException
    {
        T object = null;
        Method[] methods = null;
        if (!this.direct)
        {
            // 获取数据保存对象所有的公开方法，包括继承的方法
            methods = this.rowObjClass.getMethods();
        }
        // 获取列数据
        ResultSetWrappingSqlRowSetMetaData wapping = new ResultSetWrappingSqlRowSetMetaData(
        		resultRet.getMetaData());
        int columnCount = wapping.getColumnCount();

        for (int columnIndex = 0; columnIndex++ != columnCount;)
        {
            // 列被封装的java类型名称,下面使用它表示可以封装到那些java类型
            String paramClassName = wapping.getColumnClassName(columnIndex);
            int type = wapping.getColumnType(columnIndex);
            Object value = resultRet.getObject(columnIndex);

            // 是否字符串类型
            boolean stringType = (paramClassName != null
                    && ("java.lang.String").equals(paramClassName) || type == Types.CLOB);

            // 将字符串类型的 null 转换为 ""
            if (stringType && value == null)
            {
                value = "";
            }

            // 对于取不到值的字段不进行处理，直接处理下一个字段
            if (value == null)
            {
                continue;
            }
            switch (type)
            {
            case Types.NUMERIC: // 处理整数和浮点数等数字类型
            {
                if (this.direct)
                {
                    String className = this.rowObjClass.getName();
                    DAORowMapper.ClassType classType = DAORowMapper.classNameMap
                            .get(className);
                    if (classType == null)
                    {
                        classType = DAORowMapper.ClassType.UNDEFINED;
                    }
                    // 根据所需数据类型对当前值进行变形、返回
                    switch (classType)
                    {
                    case BOOLEAN:
                    {
                        value = resultRet.getBoolean(columnIndex);
                        return (T) value;
                    }
                    case BYTE:
                    {
                        value = resultRet.getBytes(columnIndex);
                        return (T) value;
                    }
                    case SHORT:
                    {
                        value = resultRet.getShort(columnIndex);
                        return (T) value;
                    }
                    case INT:
                    {
                        value = resultRet.getInt(columnIndex);
                        return (T) value;
                    }
                    case LONG:
                    {
                        value = resultRet.getLong(columnIndex);
                        return (T) value;
                    }
                    case FLOAT:
                    {
                        value = resultRet.getFloat(columnIndex);
                        return (T) value;
                    }
                    case DOUBLE:
                    {
                        value = resultRet.getDouble(columnIndex);
                        return (T) value;
                    }
                    default:
                    {
                    	return null;
                    }
                    }
                }
                else
                {
                    // 判断小数位数
                    if (wapping.getScale(columnIndex) <= 0)
                    {// 没有小数位
                        if (wapping.getPrecision(columnIndex) <= 38)
                        { // 整数
                            value = resultRet.getInt(columnIndex);
                        }
                        else
                        {// 超出整数最大保存能力，所以用浮点类型保存
                            value = resultRet.getFloat(columnIndex);
                        }
                        paramClassName = "java.lang.Integer,int,java.lang.Boolean,boolean,java.lang.Float,"
                        		+ "float,java.lang.Double,double";
                    }
                    else
                    {// 有小数位所以为浮点类型
                        value = resultRet.getFloat(columnIndex);
                        paramClassName = "java.lang.Float,float,java.lang.Double,double";
                    }
                }
                break;
            }
            case Types.CLOB:// 处理 CLOB 为字符串
            {
                Clob clob = resultRet.getClob(columnIndex);
                if (clob != null)
                {
                    StringBuffer content = new StringBuffer();
                    BufferedReader bufferedReader = new BufferedReader(
                            clob.getCharacterStream());
                    String line;
                    try
                    {
                    	line = bufferedReader.readLine();
                        while (line != null)
                        {
                            content.append(line);
                            line = bufferedReader.readLine();
                        }
                    }
                    catch (IOException e)
                    {
                        LOG.info(e.getMessage(),e);
                    }
                    value = content.toString();
                    paramClassName = "java.lang.String";
                }
                if (this.direct
                        && DAORowMapper.classNameMap.get(this.rowObjClass
                                .getName()) == DAORowMapper.ClassType.STRING)
                {
                    return this.rowObjClass.cast(value);
                }
                break;
            }
            // 处理日期时间类型
            case Types.TIMESTAMP:
            case Types.DATE:
            {
                value = resultRet.getTimestamp(columnIndex);
                if (this.direct)
                {
                    String className = this.rowObjClass.getName();
                    DAORowMapper.ClassType classType = DAORowMapper.classNameMap
                            .get(className);
                    if (classType == null)
                    {
                        classType = DAORowMapper.ClassType.UNDEFINED;
                    }
                    // 根据所需数据类型对当前值进行变形、返回
                    switch (classType)
                    {
                    case UTILDATE:
                    case CALENDAR:
                    case SQLDATE:
                    {
                        return (T) this.transDateValue(this.rowObjClass, value);
                    }
                    default:
                    {
                    	return null;
                    }
                    }
                }
                else
                {
                    paramClassName = "java.sql.Date,java.util.Date,java.util.Calendar";
                }
                break;
            }
            case Types.BLOB: // 处理 BLOB
            {
                value = null; // 暂时不对该之处理。目前不支持在数据库中保存文件：如图片等
                break;
            }
            case Types.VARCHAR:
            case Types.CHAR:
            {
                paramClassName = "java.lang.String,java.lang.Boolean,boolean";
                break;
            }
            default:
            {
            	break;
            }
        }

            if (this.direct)
            { // 直接映射情况下，对剩余字段类型，比如 VARCHAR 类型或 CHAR 类型，进行补充处理
                String className = this.rowObjClass.getName();
                DAORowMapper.ClassType classType = DAORowMapper.classNameMap
                        .get(className);
                if (classType == null)
                {
                    classType = DAORowMapper.ClassType.UNDEFINED;
                }
                switch (classType)
                {
                case STRING:
                {
                    return this.rowObjClass.cast(value);
                }
                case BOOLEAN:
                {
                    value = resultRet.getBoolean(columnIndex);
                    return (T) value;
                }
                case CHAR:
                {
                    String stringValue = resultRet.getString(columnIndex);
                    if (stringValue == null || stringValue.length() == 0)
                    {
                        value = (char) 0;
                    }
                    else
                    {
                        value = stringValue.charAt(0);
                    }
                    return (T) value;
                }
                default:
                {
                	return null;
                }
                }
            }
            else
            {
                try
                {
                    if (columnIndex == 1 || object == null)
                    {
                        object = this.rowObjClass.newInstance();
                    }
                }
                catch (Exception e)
                {
                	LOG.error(e.getMessage(),e);
                }
                // 找到和当前字段名称一致的对象属性设置方法，然后赋值
                String name = wapping.getColumnName(columnIndex);
                for (Method method : methods)
                {
                    // 通过方法名以及参数类型来过滤掉不匹配的方法，过滤之后剩下的就是对应的 setter
                    String methodName = method.getName();
                    if (methodName == null
                            || !methodName.equalsIgnoreCase("set".concat(name)))
                    {
                        continue;
                    }
                    // 获取参数类型
                    Class<?>[] params = method.getParameterTypes();
                    if (params.length != 1)
                    {
                        continue;
                    }
                    // 参数不匹配则继续
                    if (!paramClassName.contains(params[0].getName())
                            && !params[0].getName().equals("java.lang.Object"))
                    {
                        continue;
                    }
                    // Integer value = 0.0
                    if (String.valueOf(value).equals("0.0")
                            && params[0].getName().equals("java.lang.Integer"))
                    {
                        value = 0;
                    }
                    // 如果是时间类型，根据 setter 的参数类型进行类型转换
                    if (type == Types.DATE)
                    {
                        value = this.transDateValue(params[0], value);
                    }
                    // 如果方法参数是逻辑类型，取逻辑值
                    if (DAORowMapper.classNameMap.get(params[0].getName()) == DAORowMapper.ClassType.BOOLEAN)
                    {
                        value = resultRet.getBoolean(columnIndex);
                    }

                    if (DAORowMapper.classNameMap.get(params[0].getName()) == DAORowMapper.ClassType.STRING
                            && value == null)
                    {
                        value = "";
                    }
                    // 执行 setter
                    try
                    {
                        method.invoke(object, value);
                    }
                    catch (Exception e)
                    {
                    	LOG.error(e.getMessage(),e);
                    }
                    break;
                }
            }
        }
        return object;
    }

    protected Object transDateValue(Class<?> targetClass, Object value)
    {
        if (!(value instanceof Timestamp))
        {
            return value;
        }
        Object valueCopy = value;
        Timestamp realValue = (Timestamp) value;
        String targetClassName = targetClass.getName();
        DAORowMapper.ClassType classType = DAORowMapper.classNameMap
                .get(targetClassName);
        if (classType == null)
        {
            classType = DAORowMapper.ClassType.UNDEFINED;
        }
        long timestamp = realValue.getTime();
        switch (classType)
        {
        case UTILDATE:
        {
        	valueCopy = new java.util.Date(timestamp);
            break;
        }
        case CALENDAR:
        {
            Calendar targetValue = Calendar.getInstance();
            targetValue.setTimeInMillis(timestamp);
            valueCopy = targetValue;
            break;
        }
        case SQLDATE:
        {
        	valueCopy = new java.sql.Date(timestamp);
            break;
        }
        default:
        {
            break;
        }
        }
        return valueCopy;
    }

    private final boolean isDirectClass()
    {
        if (this.rowObjClass == null)
        {
            return false;
        }
        String className = this.rowObjClass.getName();
        boolean result = DAORowMapper.classNameMap.get(className) != null;
        return result;
    }

    static protected enum ClassType
    {
        UNDEFINED, STRING, CHAR, INT, BYTE, SHORT, LONG, FLOAT, DOUBLE, BOOLEAN, UTILDATE, CALENDAR, SQLDATE;
    }

    static protected Map<String, DAORowMapper.ClassType> classNameMap = new HashMap<String, DAORowMapper.ClassType>();
    static
    {
        DAORowMapper.classNameMap.put("java.lang.String", ClassType.STRING);
        DAORowMapper.classNameMap.put("java.lang.Character", ClassType.CHAR);
        DAORowMapper.classNameMap.put("char", ClassType.CHAR);
        DAORowMapper.classNameMap.put("java.lang.Integer", ClassType.INT);
        DAORowMapper.classNameMap.put("int", ClassType.INT);
        DAORowMapper.classNameMap.put("java.lang.Byte", ClassType.BYTE);
        DAORowMapper.classNameMap.put("byte", ClassType.BYTE);
        DAORowMapper.classNameMap.put("java.lang.Short", ClassType.SHORT);
        DAORowMapper.classNameMap.put("short", ClassType.SHORT);
        DAORowMapper.classNameMap.put("java.lang.Long", ClassType.LONG);
        DAORowMapper.classNameMap.put("long", ClassType.LONG);
        DAORowMapper.classNameMap.put("java.lang.Float", ClassType.FLOAT);
        DAORowMapper.classNameMap.put("float", ClassType.FLOAT);
        DAORowMapper.classNameMap.put("java.lang.Double", ClassType.DOUBLE);
        DAORowMapper.classNameMap.put("double", ClassType.DOUBLE);
        DAORowMapper.classNameMap.put("java.lang.Boolean", ClassType.BOOLEAN);
        DAORowMapper.classNameMap.put("boolean", ClassType.BOOLEAN);
        DAORowMapper.classNameMap.put("java.util.Date", ClassType.UTILDATE);
        DAORowMapper.classNameMap.put("java.util.Calendar", ClassType.CALENDAR);
        DAORowMapper.classNameMap.put("java.sql.Date", ClassType.SQLDATE);
    }

    private Class<? extends T> rowObjClass;
    private boolean direct;
}