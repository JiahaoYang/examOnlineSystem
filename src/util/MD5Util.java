package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
	public static String encodeByMD5(String str) {
		StringBuffer result = new StringBuffer();
		try {
			MessageDigest md5 = MessageDigest.getInstance("md5");
			byte[] bytes = md5.digest(str.getBytes());
			for (byte b : bytes) {
				int val = b & 0xff;
				if (val < 16)
					result.append("0");
				result.append(Integer.toHexString(val));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result.toString();
	}
	
	public static void main(String[] args) {
		String string = "123456";
		System.out.println(encodeByMD5(string));
	}
}
