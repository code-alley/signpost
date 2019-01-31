package kr.co.inslab.codealley.signpost;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.directory.api.ldap.model.constants.LdapSecurityConstants;
import org.apache.directory.api.ldap.model.password.PasswordUtil;

public class SHA1 {
	private static final String SALT_KEY = "CodeAlley-Password-Key";
	
	public static String encrypt(String str) {		
		String sha1Data = "";
		MessageDigest md;
		
		try {
			md = MessageDigest.getInstance("SHA1");

			byte[] bytData = (str + SALT_KEY).getBytes();
			md.update(bytData);
			byte[] digest = md.digest();
			for (int i = 0; i < digest.length; i++) {
				sha1Data = sha1Data
						+ Integer.toHexString(digest[i] & 0xFF).toUpperCase();
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sha1Data;
	}
	
	/**
	 * SSHA 암호화(LDAP용)
	 * @param password
	 * @return
	 */
	public static String encryptLdapPassword(String password) {
		return new String(PasswordUtil.createStoragePassword(password, LdapSecurityConstants.HASH_METHOD_SSHA));
	}
}