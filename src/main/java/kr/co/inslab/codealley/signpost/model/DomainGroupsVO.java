package kr.co.inslab.codealley.signpost.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import kr.co.inslab.codealley.signpost.utils.ModelUtils;

/**
 * 도메인 정보를 관리하는 클래스
 * @author minchulahn
 *
 */
@Entity
@Table(name = "domain_groups")
public class DomainGroupsVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private long id;
	@ManyToOne
	@JoinColumn(name = "user_id", table = "user_info")
	private String userId;
	private String domain;
	private String role;
	private int permCreate;
	private int permRead;
	private int permUpdate;
	private int permDelete;

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
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "domain")
	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	@Column(name = "role")
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Column(name = "perm_create")
	public int getPermCreate() {
		return permCreate;
	}

	public void setPermCreate(int permCreate) {
		this.permCreate = permCreate;
	}

	@Column(name = "perm_read")
	public int getPermRead() {
		return permRead;
	}

	public void setPermRead(int permRead) {
		this.permRead = permRead;
	}

	@Column(name = "perm_update")
	public int getPermUpdate() {
		return permUpdate;
	}

	public void setPermUpdate(int permUpdate) {
		this.permUpdate = permUpdate;
	}

	@Column(name = "perm_delete")
	public int getPermDelete() {
		return permDelete;
	}

	public void setPermDelete(int permDelete) {
		this.permDelete = permDelete;
	}

	@Override
	public String toString() {
		return ModelUtils.toString(this);
	}
}