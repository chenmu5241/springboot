package net.newglobe.util;

import java.io.UnsupportedEncodingException;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

/**
 * 类描述：时间格式化工具类 创建人：辛石磊 创建时间：2011-7-4 下午02:08:02
 * 
 * @version
 */
public class DateFormatUtil {

	// 系统默认日起时间格式
	public static final String DATE_FORMAT = "yyyy-MM-dd";

	public static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	public static final String DATE_CSV_TIME_FORMAT = "yyyy/MM/dd HH:mm";
	public static final String CTS_DATE_FORMAT = "EEE MMM dd HH:mm:ss zzz yyyy";
	public static final String DATE_TIME_FORMAT_14 = "yyyyMMddHHmmss";
	public static final String UTC_DATE_FORMAT = "EEE MMM dd HH:mm:ss ZZZ yyyy";
	public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * 获得系统当前日期时间，以默认格式显示
	 * 
	 * @return e.g.2006-10-12 10:55:06
	 */
	public static String getCurrentFormatDateTime() {
		Date currentDate = getCurrentDate();
		SimpleDateFormat dateFormator = new SimpleDateFormat(DateFormatUtil.DATE_TIME_FORMAT);

		return dateFormator.format(currentDate);
	}

	/**
	 * 获得系统的当前时间
	 * 
	 * @return e.g.Thu Oct 12 10:25:14 CST 2006
	 */
	public static Date getCurrentDate() {
		return new Date(getCurrentTimeMillis());
	}

	/**
	 * 获得系统的当前时间，毫秒.
	 * 
	 * @return
	 */
	public static long getCurrentTimeMillis() {
		return System.currentTimeMillis();
	}

	/**
	 * 输入日期，按照指定格式返回
	 * 
	 * @param date
	 * @param pattern
	 *            e.g.DATE_FORMAT_8 = "yyyyMMdd"; DATE_TIME_FORMAT_14 =
	 *            "yyyyMMddHHmmss"; 或者类似于二者的格式,e.g."yyyyMMddHH"，"yyyyMM"
	 * @return
	 */
	public static String formatDate(Date date, String pattern) {
		if (checkPara(pattern) || checkPara(date)) {
			return "";
		}
		SimpleDateFormat dateFormator = new SimpleDateFormat(pattern);

		return dateFormator.format(date);
	}

	/**
	 * 将时间字符串按照默认格式DATE_TIME_FORMAT ="yyyy-MM-dd HH:mm:ss",转换为Date
	 * 
	 * @param dateStr
	 * @return
	 */
	public static Date parseStrToDateTime(String dateStr) throws ParseException {
		if (checkPara(dateStr)) {
			return null;
		}
		SimpleDateFormat dateFormator = new SimpleDateFormat(DATE_TIME_FORMAT);
		Date resDate = dateFormator.parse(dateStr, new ParsePosition(0));

		return resDate;
	}

	/**
	 * 将时间字符串按照默认格式DATE_TIME_FORMAT ="yyyy/MM/dd HH:mm",转换为Date
	 * 
	 * @param dateStr
	 * @return
	 */
	public static Date parseStrToCsvDateTime(String dateStr) throws ParseException {
		if (checkPara(dateStr)) {
			return null;
		}
		SimpleDateFormat dateFormator = new SimpleDateFormat(DATE_CSV_TIME_FORMAT);
		Date resDate = dateFormator.parse(dateStr, new ParsePosition(0));

		return resDate;
	}

	/**
	 * 将时间字符串按照默认格式DATE_TIME_FORMAT ="yyyy/MM/dd",转换为Date
	 * 
	 * @param dateStr
	 * @return
	 */
	public static Date parseStrToCsvDate(String dateStr) throws ParseException {
		if (checkPara(dateStr)) {
			return null;
		}
		SimpleDateFormat dateFormator = new SimpleDateFormat("yyyy/MM/dd");
		Date resDate = dateFormator.parse(dateStr, new ParsePosition(0));

		return resDate;
	}

	/**
	 * 将时间字符串按照默认格式DATE_TIME_FORMAT ="yyyy-MM-dd",转换为Date
	 * 
	 * @param dateStr
	 * @return
	 */
	public static Date parseStringToDate(String dateStr) {
		if (checkPara(dateStr)) {
			return null;
		}
		SimpleDateFormat dateFormator = new SimpleDateFormat(DATE_FORMAT);
		Date resDate = dateFormator.parse(dateStr, new ParsePosition(0));

		return resDate;
	}

	public static Date parseStringToDateNew(String dateStr) throws ParseException {
		if (checkPara(dateStr)) {
			return null;
		}
		SimpleDateFormat dateFormator = new SimpleDateFormat(DATE_TIME_FORMAT);

		return dateFormator.parse(dateStr);
	}

	/**
	 * 解析utc时间字符串为DATE类型
	 * 
	 * @param ctsStr
	 *            e.g. Mon Jan 27 00:00:00 UTC+0800 2014
	 * @return
	 * @throws ParseException
	 * @throws ParseException
	 */
	public static Date parseUTCStrToDate(String ctsStr) throws ParseException {

		if (checkPara(ctsStr)) {
			return null;
		}
		ctsStr = ctsStr.replace("UTC", "");
		ctsStr = ctsStr.replace("GMT", "");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(UTC_DATE_FORMAT, Locale.US);
		Date date = null;
		try {
			date = simpleDateFormat.parse(ctsStr);
		} catch (ParseException e) {
			simpleDateFormat = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss ZZZ", Locale.US);
			date = simpleDateFormat.parse(ctsStr);
		}

		return date;
	}

	/**
	 * 解析CTS时间字符串为DATE类型
	 * 
	 * @param ctsStr
	 *            e.g. Wed Sep 07 14:57:28 CST 2011
	 * @return
	 * @throws ParseException
	 */
	public static Date parseCTSStrToDate(String ctsStr) throws ParseException {
		if (checkPara(ctsStr)) {
			return null;
		}
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(CTS_DATE_FORMAT, Locale.US);
		Date date = simpleDateFormat.parse(ctsStr);

		return date;
	}

	/**
	 * 解析时间字符串为DATE类型
	 * 
	 * @param str
	 *            格式yyyyMMddHHmmss e.g. 20111010084617
	 * @return
	 * @throws ParseException
	 */
	public static Date str2Date(String str, String format) throws ParseException {
		if (checkPara(str)) {
			return null;
		}
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		Date date = simpleDateFormat.parse(str);

		return date;
	}

	public static Date str2Date(String str) throws ParseException {
		if (checkPara(str)) {
			return null;
		}
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_TIME_FORMAT_14);
		Date date = simpleDateFormat.parse(str);

		return date;
	}

	/**
	 * 判断参数是否等于null或者空
	 * 
	 * @param para
	 * @return
	 */
	private static boolean checkPara(Object para) {
		if (null == para || "".equals(para)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 获取两个时间之间的时间差(时分秒时间) author:徐国飞
	 * 
	 * @param oldDate
	 * @param newDate
	 * @return
	 */
	public static String getTimeDifference(Date oldDate, Date newDate) {
		// SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// Date begin = null;
		// Date end = null;
		// try {
		// begin = dfs.parse("2004-01-02 11:30:24");
		// end = dfs.parse("2004-03-26 13:31:40");
		// } catch (ParseException e) {
		// e.printStackTrace();
		// }

		long between = (newDate.getTime() - oldDate.getTime()) / 1000;// 除以1000是为了转换成秒

		long day1 = between / (24 * 3600);
		long hour1 = between % (24 * 3600) / 3600;
		long minute1 = between % 3600 / 60;
		long second1 = between % 60;
		// System.out.println("" + day1 + "天" + hour1 + "小时" + minute1 + "分"
		// + second1 + "秒");
		return "" + day1 + "天" + hour1 + "小时" + minute1 + "分" + second1 + "秒";
	}

	/**
	 * 按类型获取日期 1，本周第一天 2，上周第一天 3，上周最后一天 4，上月第一天 5，上月最后一天
	 * 6，本月第一天7，本月最后一天8，下月第一天,9,下月最后一天
	 **/
	public static String getDate(int type) {
		Calendar c = Calendar.getInstance();

		switch (type) {
		case 1:
			c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			return formatDate(c.getTime(), "yyyy-MM-dd");
		case 2:
			c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			c.add(Calendar.WEEK_OF_MONTH, -1);
			return formatDate(c.getTime(), "yyyy-MM-dd");
		case 3:
			c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			c.add(Calendar.WEEK_OF_MONTH, -1);
			c.add(Calendar.DAY_OF_WEEK, 6);
			return formatDate(c.getTime(), "yyyy-MM-dd");
		case 4:
			c.set(Calendar.DAY_OF_MONTH, 1);// 本月第一天
			c.add(Calendar.DAY_OF_MONTH, -1);// 上月最后一天
			c.set(Calendar.DAY_OF_MONTH, 1);// 上月第一天
			return formatDate(c.getTime(), "yyyy-MM-dd");
		case 5:
			c.set(Calendar.DAY_OF_MONTH, 1);
			c.add(Calendar.DAY_OF_MONTH, -1);
			return formatDate(c.getTime(), "yyyy-MM-dd");
		case 6:
			c.set(Calendar.DAY_OF_MONTH, 1);
			return formatDate(c.getTime(), "yyyy-MM-dd");
		case 7:
			c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
			return formatDate(c.getTime(), "yyyy-MM-dd");
		case 8:
			c.set(Calendar.DAY_OF_MONTH, 1);
			c.add(Calendar.MONTH, 1);
			return formatDate(c.getTime(), "yyyy-MM-dd");
		case 9:
			c.set(Calendar.DAY_OF_MONTH, 1);
			c.add(Calendar.MONTH, 1);
			c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
			return formatDate(c.getTime(), "yyyy-MM-dd");
		default:
			break;
		}

		return formatDate(new Date(), "yyyy-MM-dd");
	}

	/** Constant */
	public static final byte STATUS_ABLED = 1;
	public static final byte STATUS_UNUSED = 0;
	/** 正常的 */
	public static final String NORMAL = "1";
	/** 未激活的 */
	public static final String NOT_ACTIVE = "0";
	/** 锁定的 */
	public static final String LOCKED = "2";

	/** 解决jsp 中文乱码问题 */
	public static String encodeStr(String str) {
		try {
			return new String(str.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 根据给定的流水ID, 生成特定长度的编号
	 * 
	 * @param orderId
	 * @param length
	 * @return
	 * @throws Exception
	 */
	public static String generateCode(Long orderId, int length) {
		String code = "";
		try {
			String idString = orderId.toString();
			if (idString.length() >= length) {
				code = idString.substring(idString.length() - length, idString.length());
			} else {
				// 得到一个NumberFormat的实例
				NumberFormat nf = NumberFormat.getInstance();
				// 设置是否使用分组
				nf.setGroupingUsed(false);
				// 设置最大整数位数
				nf.setMaximumIntegerDigits(length);
				// 设置最小整数位数
				nf.setMinimumIntegerDigits(length);
				// 输出测试语句
				code = nf.format(orderId);
			}
		} catch (Exception e) {
			code = null;
		}
		return code;
	}

	/**
	 * 转换为时间（天,时:分:秒.毫秒）
	 * 
	 * @param timeMillis
	 * @return
	 */
	public static String formatDateTime(long timeMillis) {
		long day = timeMillis / (24 * 60 * 60 * 1000);
		long hour = (timeMillis / (60 * 60 * 1000) - day * 24);
		long min = ((timeMillis / (60 * 1000)) - day * 24 * 60 - hour * 60);
		long s = (timeMillis / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		long sss = (timeMillis - day * 24 * 60 * 60 * 1000 - hour * 60 * 60 * 1000 - min * 60 * 1000 - s * 1000);
		return (day > 0 ? day + "," : "") + hour + ":" + min + ":" + s + "." + sss;
	}

	/**
	 * 计算两个日期之间相差的天数
	 * 
	 * @param smdate
	 *            较小的时间
	 * @param bdate
	 *            较大的时间
	 * @return 相差天数
	 * @throws ParseException
	 */
	public static int daysBetween(Date smdate, Date bdate) {
		long between_days = 0;
		try {
			smdate = sdf.parse(sdf.format(smdate));
			bdate = sdf.parse(sdf.format(bdate));
			Calendar cal = Calendar.getInstance();
			cal.setTime(smdate);
			long time1 = cal.getTimeInMillis();
			cal.setTime(bdate);
			long time2 = cal.getTimeInMillis();
			between_days = (time2 - time1) / (1000 * 3600 * 24);
		} catch (Exception e) {
		}
		return Integer.parseInt(String.valueOf(between_days));
	}

	/**
	 * 判断两个日期大小
	 * 
	 * @param large
	 * @param small
	 * @return
	 * @throws ParseException
	 */
	public static int compareDate(Date large, Date small) {
		int result = 0;
		try {
			large = sdf.parse(sdf.format(large));
			small = sdf.parse(sdf.format(small));
			if (large.getTime() > small.getTime()) {
				result = 1;
			} else if (large.getTime() == small.getTime()) {
				result = 0;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 得到每月底N天的日期类型
	public static Date getMonthDay(Date date, int day) {
		Date parse = null;
		try {
			String formatDate = formatDate(date, "yyyy-MM-" + (day + 1));
			parse = sdf.parse(formatDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return parse;
	}

	public static String getSendTime(Date date) {
		// 第二天早上九点整, 准时发送
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.add(Calendar.DATE, 1);// 把日期往后增加一天.整数往后推,负数往前移动
		calendar.set(Calendar.HOUR_OF_DAY, 9);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		date = calendar.getTime(); // 这个时间就是日期往后推一天的结果
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		return formatter.format(date);
	}
	
	public static void main1(String[] args) {
		try {
			// SimpleDateFormat simpleDateFormat = new
			// SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss ZZZ", Locale.US);
			// System.out.println(DateFormatUtil.formatDate(simpleDateFormat.parse("Mon
			// Mar 03 2014 00:00:00 +0800"),
			// "yyyy-MM-dd"));
			/**
			 * 按类型获取日期 1，本周第一天 2，上周第一天 3，上周最后一天 4，上月第一天 5，上月最后一天 6，本月第一天7，本月最后一天
			 **/
			System.out.println("本周第一天:" + getDate(1));
			System.out.println("上周第一天:" + getDate(2));
			System.out.println("上周第最后一天:" + getDate(3));
			System.out.println("上月第一天:" + getDate(4));
			System.out.println("上月最后一天:" + getDate(5));
			System.out.println("本月第一天:" + getDate(6));
			System.out.println("本月最后一天:" + getDate(7));
			System.out.println("下月第一天:" + getDate(8));
			System.out.println("下月最后一天:" + getDate(9));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		System.out.println(getSendTime(new Date()));
	}
}
