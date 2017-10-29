package util;

public class CommUtil {
	public static String getTypeCnt(int cnt){ 
		if (cnt == 1)
			return "一";
		else if (cnt == 2)
			return "二";
		else if (cnt == 3)
			return "三";
		else if (cnt == 4)
			return "四";
		else if (cnt == 5)
			return "五";
		return "";
	}
	
	public static String getStrType(int type) {
		if (type == 1)
			return "判断题";
		if (type == 2)
			return "选择题";
		if (type == 3)
			return "多选题";
		return "";
	}
	
	public static String getSubString(String str, int index) {
		if (index >= str.length())
			return str;
		String s = str.substring(0, index);
		return s + "...";
	}
}
