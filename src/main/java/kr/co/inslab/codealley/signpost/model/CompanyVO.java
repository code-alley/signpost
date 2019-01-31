package kr.co.inslab.codealley.signpost.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import kr.co.inslab.codealley.signpost.utils.ModelUtils;

/**
 * Billing - Company 정보를 관리하는 클래스
 * @author minchulahn
 *
 */
@Entity
@Table(name = "company")
@NamedQueries({
	@NamedQuery(name = "company.select", query = "select A from CompanyVO A"),
	@NamedQuery(name = "company.selectByID", query = "select A from CompanyVO A where A.user_id=:user_id") })
public class CompanyVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private long id;
	private String user_id;
	private String name;
	private String id_number;
	private String vat_number;
	private String website;
	private String work_phone;
	
	private String address1;
	private String address2;
	private String city;
	private String state;
	private String postal_code;
	private int country_id;
	
	private String contact_first_name;
	private String contact_last_name;
	private String contact_email;
	private String contact_phone;

	@Id
	@GeneratedValue(strategy = javax.persistence.GenerationType.AUTO)
	@Column(name = "id")
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getId_number() {
		return id_number;
	}

	public void setId_number(String id_number) {
		this.id_number = id_number;
	}

	public String getVat_number() {
		return vat_number;
	}

	public void setVat_number(String vat_number) {
		this.vat_number = vat_number;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getWork_phone() {
		return work_phone;
	}

	public void setWork_phone(String work_phone) {
		this.work_phone = work_phone;
	}
	
	
	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}

	public int getCountry_id() {
		return country_id;
	}

	public void setCountry_id(int country_id) {
		this.country_id = country_id;
	}

	public String getContact_first_name() {
		return contact_first_name;
	}

	public void setContact_first_name(String contact_first_name) {
		this.contact_first_name = contact_first_name;
	}

	public String getContact_last_name() {
		return contact_last_name;
	}

	public void setContact_last_name(String contact_last_name) {
		this.contact_last_name = contact_last_name;
	}
	
	public String getContact_email() {
		return contact_email;
	}

	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}	

	public String getContact_phone() {
		return contact_phone;
	}

	public void setContact_phone(String contact_phone) {
		this.contact_phone = contact_phone;
	}

	@Override
	public String toString() {
		/*
		return "[" + this.id + "] " + "/" + this.user_id + "/" + this.name + "/" + this.id_number + "/" + this.vat_number + "/"+ this.website + "/"  + this.work_phone + "/" 
				+ this.address1 + "/" + this.address2 + "/" + this.city + "/" + this.state + "/" + this.postal_code + "/" + this.country_id + "/" 
				+ this.contact_first_name + "/" + this.contact_last_name + "/" + this.contact_email + "/" + this.contact_phone;
		*/
		return ModelUtils.toString(this);
	}
	
}
