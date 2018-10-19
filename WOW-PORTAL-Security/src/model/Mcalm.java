package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "mcalm")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Mcalm {
	
	@Id
	@GenericGenerator(name="increment", strategy = "identity")
    @Column(name = "id")
	private int id;
	
	@Column(name = "others_domain")
	private String others_domain;
	
	@Column(name = "onepos_domain")
	private String onepos_domain;
	
	@Column(name = "hcm_domain")
	private String hcm_domain;
	
	@Column(name = "galaxy_domain")
	private String galaxy_domain;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOthers_domain() {
		return others_domain;
	}

	public void setOthers_domain(String others_domain) {
		this.others_domain = others_domain;
	}

	public String getOnepos_domain() {
		return onepos_domain;
	}

	public void setOnepos_domain(String onepos_domain) {
		this.onepos_domain = onepos_domain;
	}

	public String getHcm_domain() {
		return hcm_domain;
	}

	public void setHcm_domain(String hcm_domain) {
		this.hcm_domain = hcm_domain;
	}

	public String getGalaxy_domain() {
		return galaxy_domain;
	}

	public void setGalaxy_domain(String galaxy_domain) {
		this.galaxy_domain = galaxy_domain;
	}

	
}
