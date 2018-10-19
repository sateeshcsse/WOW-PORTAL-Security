package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
@Entity(name = "wowmain")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
public class Wowmain {

	@Id
	@Column(name = "unique_id")
	@GenericGenerator(name = "generator", strategy = "identity")
	private int unique_id;

	@Column(name = "portfolio")
	private String portfolio;

	@Column(name = "bus_unit")
	private String bus_unit;

	@Column(name = "project_phase")
	private String project_phase;

	@Column(name = "test_phase")
	private String test_phase;

	@Column(name = "project")
	private String project;

	@Column(name = "golivedate")
	private String golivedate;

	@Column(name = "performance")
	private String performance;

	@Column(name = "summary")
	private String summary;

	@Column(name = "last_updated")
	private String last_updated;

	@Column(name = "risks_issues")
	private String risks_issues;

	@Column(name = "project_start")
	private String project_start;

	@Column(name = "batchLast_run")
	private String batchLast_run;

	@Column(name = "custom_project")
	private String custom_project;

	@Transient
	private String defaultDays;

	public String getDefaultDays() {
		return defaultDays;
	}

	public void setDefaultDays(String defaultDays) {
		this.defaultDays = defaultDays;
	}

	public String getCustom_project() {
		return custom_project;
	}

	public void setCustom_project(String custom_project) {
		this.custom_project = custom_project;
	}

	public String getBatchLast_run() {
		return batchLast_run;
	}

	public void setBatchLast_run(String batchLast_run) {
		this.batchLast_run = batchLast_run;
	}

	@Override
	public String toString() {
		return "Wowmain [unique_id=" + unique_id + ", portfolio=" + portfolio
				+ ", bus_unit=" + bus_unit + ", project_phase=" + project_phase
				+ ", test_phase=" + test_phase + ", project=" + project
				+ ", golivedate=" + golivedate + ", performance=" + performance
				+ ", summary=" + summary + ", last_updated=" + last_updated
				+ ", risks_issues=" + risks_issues + ", project_start="
				+ project_start + ", batchLast_run=" + batchLast_run
				+ ", custom_project=" + custom_project + "]";
	}

	public String getProject_start() {
		return project_start;
	}

	public void setProject_start(String project_start) {
		this.project_start = project_start;
	}

	public String getRisks_issues() {
		return risks_issues;
	}

	public void setRisks_issues(String risks_issues) {
		this.risks_issues = risks_issues;
	}

	public int getUnique_id() {
		return unique_id;
	}

	public void setUnique_id(int unique_id) {
		this.unique_id = unique_id;
	}

	public String getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}

	public String getBus_unit() {
		return bus_unit;
	}

	public void setBus_unit(String bus_unit) {
		this.bus_unit = bus_unit;
	}

	public String getProject_phase() {
		return project_phase;
	}

	public void setProject_phase(String project_phase) {
		this.project_phase = project_phase;
	}

	public String getTest_phase() {
		return test_phase;
	}

	public void setTest_phase(String test_phase) {
		this.test_phase = test_phase;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getGolivedate() {
		return golivedate;
	}

	public void setGolivedate(String golivedate) {
		this.golivedate = golivedate;
	}

	public String getPerformance() {
		return performance;
	}

	public void setPerformance(String performance) {
		this.performance = performance;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getLast_updated() {
		return last_updated;
	}

	public void setLast_updated(String last_updated) {
		this.last_updated = last_updated;
	}

}
