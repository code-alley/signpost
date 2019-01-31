package kr.co.inslab.codealley.signpost.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import kr.co.inslab.codealley.signpost.SHA1;
import kr.co.inslab.codealley.signpost.utils.ModelUtils;

/**
 * 사용자 정보를 관리하는 클래스
 * @author minchulahn
 *
 */
@Entity
@Table(name = "user_info")
@NamedQueries({
		@NamedQuery(name = "user_info.select", query = "select A from UserVO A"),
		@NamedQuery(name = "user_info.selectByID", query = "select A from UserVO A where A.user_id=:user_id"),
		@NamedQuery(name = "user_info.selectByEmail", query = "select A from UserVO A where A.email=:email") })
public class UserVO implements Serializable {
	private static final long serialVersionUID = 1L;	

	private long id;
	private String user_id;
	private String name;
	
	@NotNull
	@Size(min = 8)
	@Pattern.List({
		//비밀번호 조합 (문자 + 숫자 혹은 특수문자)
	    @Pattern(regexp = "(?=.*[0-9`~!@#$%^&*()-_=+\\|\\[\\]{};:'\",.<>/?]).+", message = "Password must contain one digit or special character."),
	    @Pattern(regexp = "(?=.*[a-zA-Z]).+", message = "Password must contain one letter."),
	})
	private String password;
	
	private String email;
	
	//LDAP 등록시 사용할 암호화된 패스워드 (기존 암호화 로직을 사용할수없어 따로만든다)
	private String ldapPassword;

	@Id
	@GeneratedValue(strategy = javax.persistence.GenerationType.AUTO)
	@Column(name = "id")
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(name = "user_id")
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void encryptPassword() {
		this.password = SHA1.encrypt(this.password);
	}

	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Transient
	public String getLdapPassword() {
		return ldapPassword;
	}

	public void setLdapPassword(String ldapPassword) {
		this.ldapPassword = ldapPassword;
	}
	
	@Override
	public String toString() {
		/*
		return "[" + this.id + "] " + "/" + this.user_id + "/" + this.name
				+ "/" + this.password + "/" + this.email;
		*/
		return ModelUtils.toString(this);
	}
}
