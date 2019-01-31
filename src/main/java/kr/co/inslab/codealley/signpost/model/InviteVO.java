package kr.co.inslab.codealley.signpost.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import kr.co.inslab.codealley.signpost.utils.ModelUtils;

/**
 * 그룹 초대 정보를 관리하는 클래스
 * @author minchulahn
 *
 */
@Entity
@Table(name = "invite")
public class InviteVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int 	id;
	private String 	from_user_id;
	private String 	to_user_email;
	private String 	domain;
	
	@Id
	@GeneratedValue(strategy = javax.persistence.GenerationType.AUTO)
	@Column(name = "id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public String getFrom_user_id() {
		return from_user_id;
	}
	public void setFrom_user_id(String from_user_id) {
		this.from_user_id = from_user_id;
	}
	public String getTo_user_email() {
		return to_user_email;
	}
	public void setTo_user_email(String to_user_email) {
		this.to_user_email = to_user_email;
	}
	@Column(name = "domain")
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	@Override
	public String toString() {
		return ModelUtils.toString(this);
	}
}
