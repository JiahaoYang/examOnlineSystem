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
}
