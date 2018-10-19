package model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.gson.annotations.Expose;


@Entity
@Table(name = "sla")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SlaMain {
	
	@Id
	@GeneratedValue(generator="increment")
	@GenericGenerator(name="increment", strategy = "increment")
	@Column(name = "id")
	@Expose
	private int id;
	
	@Expose
	@Column(name = "portfolio")
	private String portfolio;
	
	@Column(name = "project", unique=true)
	@Expose
	private String project;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "def_id")
	@Expose
    private SlaDefect sladefect;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "project_id")
	@Expose
    private SlaProject slaproject;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "root_id")
	@Expose
    private SlaRootCause slarootcause;
	
	@Expose
	@Column(name = "actual_duration_sit")
	private int actual_duration_sit;
	
	@Expose
	@Column(name = "planned_duration_sit")
	private int planned_duration_sit;
	
	public int getActual_duration_sit() {
		return actual_duration_sit;
	}

	public void setActual_duration_sit(int actual_duration_sit) {
		this.actual_duration_sit = actual_duration_sit;
	}

	public int getPlanned_duration_sit() {
		return planned_duration_sit;
	}

	public void setPlanned_duration_sit(int planned_duration_sit) {
		this.planned_duration_sit = planned_duration_sit;
	}

	@Override
	public String toString() {
		return "SlaMain [id=" + id + ", portfolio=" + portfolio + ", project=" + project +  "]";
	}

	public SlaProject getSlaproject() {
		return slaproject;
	}

	public void setSlaproject(SlaProject slaproject) {
		this.slaproject = slaproject;
	}

	public SlaRootCause getSlarootcause() {
		return slarootcause;
	}

	public void setSlarootcause(SlaRootCause slarootcause) {
		this.slarootcause = slarootcause;
	}

	public SlaDefect getSladefect() {
		return sladefect;
	}

	public void setSladefect(SlaDefect sladefect) {
		this.sladefect = sladefect;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}	

}
