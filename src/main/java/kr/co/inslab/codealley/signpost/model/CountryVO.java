package kr.co.inslab.codealley.signpost.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import kr.co.inslab.codealley.signpost.utils.ModelUtils;

/**
 * Billing - 각 나라별 도시 정보를 관리하는 클래스
 * @author minchulahn
 *
 */
@Entity
@Table(name = "countries")
public class CountryVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String name;

	@Id
	@Column(name = "id")
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return ModelUtils.toString(this);
	}
	
}
