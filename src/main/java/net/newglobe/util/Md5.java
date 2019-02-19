package net.newglobe.util;

import java.util.Random;

import org.apache.shiro.crypto.hash.SimpleHash;

public class Md5 {

	private static char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	public static String getMD5(String password, String salt) {
		int hashIterations = 1;// 加密的次数
		String hashAlgorithmName = "MD5";// 加密方式
		Object simpleHash = new SimpleHash(hashAlgorithmName, password, salt, hashIterations);
		//System.out.println("密码:" + password + "加密盐：" + salt + "加密后的密码:" + simpleHash);
		return simpleHash.toString();
	}

	public static String getSalt() {
		Random random = new Random();
		StringBuffer bf = new StringBuffer();
		for (int i = 0; i < 20; i++) {
			bf.append(hexDigits[random.nextInt(16)]);
		}
		return bf.toString();
	}

	public static void main(String[] args) {
		for (int i = 0; i < 5; i++) {
			getMD5("123456", getSalt());
		}
	}

}
