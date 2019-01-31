package kr.co.inslab.codealley.signpost.utils;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class AESCipher {
	private static Log log = LogFactory.getLog(AESCipher.class);
	
	private static String iv;
    private static Key keySpec;
    private static final String secretKey = "CodeAlley-Password-Key";
    
	static {
		try {
			iv = secretKey.substring(0,16);
	    	
	    	byte[] keyBytes = new byte[16];
	        byte[] b;
			b = secretKey.getBytes("UTF-8");
			
			int len = b.length;
	        if (len > keyBytes.length) {
	            len = keyBytes.length;
	        }
	        System.arraycopy(b, 0, keyBytes, 0, len);
	        SecretKeySpec secretKeySpec = new SecretKeySpec(keyBytes, "AES");
	        keySpec = secretKeySpec;
	        
		} catch (UnsupportedEncodingException e) {
			log.error(e);
		}
	}
	 
	/**
	 * AES128 암호화
	 * @param str
	 * @return
	 */
	public static String encrypt(String str) {
		String encStr = "";
		try {
			Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
			c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
			
			byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
			
			encStr = new String(Base64.encodeBase64URLSafeString(encrypted));
			
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException | NoSuchPaddingException | InvalidKeyException | InvalidAlgorithmParameterException | IllegalBlockSizeException | BadPaddingException e) {
			log.error(e);
		}
		return encStr;
	}

	/**
	 * AES128 복호화
	 * @param str
	 * @return
	 */
	public static String decrypt(String str) {
		String decStr = "";
		
		try {
			Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
			c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
			
			byte[] byteStr = Base64.decodeBase64(str.getBytes());
			
			decStr = new String(c.doFinal(byteStr),"UTF-8");
			
		} catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | InvalidAlgorithmParameterException | UnsupportedEncodingException | IllegalBlockSizeException | BadPaddingException e) {
			log.error(e);
		}
		return decStr;
	}
}
