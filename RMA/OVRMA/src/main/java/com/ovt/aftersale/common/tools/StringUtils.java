/**
 * StringUtils.java
 * 
 * Copyright@2015 OVT Inc. All rights reserved. 
 * 
 * May 6, 2015
 */
package com.ovt.aftersale.common.tools;

import java.text.NumberFormat;
import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;

/**
 * StringUtils
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public class StringUtils
{
    public static final String CSV_SEPARATOR = ",";

    public static final String SLASH = "/";

    public static final String UNDER_LINE = "_";

    public static final String QUESTION = "?";

    public static final String AND = "&";

    public static final String EQUAL = "=";

    public static final String NEW_LINE = "\n";

    public static final String CHARSET_UTF8 = "UTF-8";

    public static boolean isBlank(Object str)
    {
        return str == null || str.toString().trim().length() == 0;
    }

    public static boolean isNotBlank(Object str)
    {
        return !isBlank(str);
    }

    public static String trim(String str)
    {
        return str == null ? null : str.trim();
    }

    public static boolean equals(String str1, String str2)
    {
        return str1 != null && str1.equals(str2);
    }

    public static boolean equalsIgnoreCase(String str1, String str2)
    {
        return str1 != null && str1.equalsIgnoreCase(str2);
    }

    /**
     * get CSV string from the collections. use comma as separator. blank items
     * will be skipped.
     * 
     * @param values Collection
     * @return StringBuffer
     */
    public static String getCSV(Collection<?> values)
    {
        return getCSV(values, CSV_SEPARATOR, true);
    }

    public static String getCSV(Collection<?> values, boolean warpSingleQutoa)
    {
        return getCSV(values, CSV_SEPARATOR, true, warpSingleQutoa).toString();
    }
    
    /**
     * convert the collection into CSV.
     * 
     * @param values
     * @param separators
     * @param ignoreBlank if true blank entries will be skipped
     * 
     * @return StringBuffer
     */
    public static String getCSV(Collection<?> values, String separators,
            boolean ignoreBlank)
    {
        return getCSV(values, separators, ignoreBlank, false).toString();
    }

    private static StringBuffer getCSV(Collection<?> values, String separators,
            boolean ignoreBlank, boolean warpSingleQutoa)
    {
        StringBuffer sb = new StringBuffer();
        if (values == null || values.size() == 0)
        {
            return sb;
        }

        for (Iterator<?> it = values.iterator(); it.hasNext();)
        {
            String value = it.next().toString();
            if (ignoreBlank && isBlank(value))
            {
                continue;
            }

            if (sb.length() > 0)
            {
                sb.append(separators);
            }
            sb.append(warpSingleQutoa ? addSingleQuote(value) : value);
        }

        return sb;
    }

    private static String addSingleQuote(String strSource)
    {
        if (strSource == null)
        {
            strSource = "";
        }
        return "'" + strSource + "'";
    }

    public static String formatNumber(double num, int maxFractionDigits)
    {
        NumberFormat nf = NumberFormat.getInstance(Locale.US);
        nf.setMaximumFractionDigits(maxFractionDigits);
        return nf.format(num);
    }
}
