package kr.co.inslab.codealley.signpost.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import kr.co.inslab.codealley.signpost.utils.ModelUtils;

/**
 * App Resource 정보를 관리하는 클래스
 * @author minchulahn
 */
@Entity
@Table(name = "v_cloud_resource")
public class CloudResourceVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String user_id;
	private String domain;
	private String type;
	private String name;
	private String core;
	private String memory;
	private long disk;
	
	public CloudResourceVO() {
		
	}
	
	public CloudResourceVO(String domain, String core, String memory, Long disk) {
		this.setDomain(domain);
		this.setCore(core);
		this.setMemory(memory);
		this.setDisk(disk);
	}

	@Column(name = "user_id")
	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Column(name = "domain")
	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	@Id
	@Column(name = "type")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Id
	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "cores")
	public String getCore() {
		return core;
	}

	public void setCore(String core) {
		this.core = core;
	}
	
	@Column(name = "memory")
	public String getMemory() {
		return memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}
	
	@Column(name = "disk")
	public long getDisk() {
		return disk;
	}

	public void setDisk(Long disk) {
		if(disk != null) {
			this.disk = disk;
		}else {
			this.disk = 0L;
		}
	}

	@Override
	public String toString() {
		return ModelUtils.toString(this);
	}
}
