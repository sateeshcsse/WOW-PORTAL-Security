package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "performance")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Performance {
	
	@Id
	@GenericGenerator(name="increment", strategy = "identity")
    @Column(name = "id")
	private int id;
	
	@Column(name = "project", unique =true)
	private String project;
	
	@Column(name = "porfolio")
	private String portfolio;
	
	@Column(name = "nfr")
	private String nfr;
	
	@Column(name = "workmodel")
	private String workmodel;
	
	@Column(name = "performance_baseline")
	private String performance_baseline;
	
	@Column(name = "environment_prod")
	private String environment_prod;
	
	@Column(name = "flag")
	private String flag;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}

	public String getNfr() {
		return nfr;
	}

	public void setNfr(String nfr) {
		this.nfr = nfr;
	}

	public String getWorkmodel() {
		return workmodel;
	}

	public void setWorkmodel(String workmodel) {
		this.workmodel = workmodel;
	}

	public String getPerformance_baseline() {
		return performance_baseline;
	}

	public void setPerformance_baseline(String performance_baseline) {
		this.performance_baseline = performance_baseline;
	}

	public String getEnvironment_prod() {
		return environment_prod;
	}

	public void setEnvironment_prod(String environment_prod) {
		this.environment_prod = environment_prod;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	
	
	
	
}