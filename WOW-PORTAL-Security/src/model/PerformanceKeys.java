package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "performancekeys")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
@JsonIgnoreProperties(ignoreUnknown = true)
public class PerformanceKeys {

	@Id
	@Column(name = "unique_id")
	@GenericGenerator(name = "generator", strategy = "identity")
	private int unique_id;

	@Column(name = "scope")
	private String scope;

	@Column(name = "cost")
	private String cost;

	@Column(name = "schedule")
	private String schedule;

	@Column(name = "resources")
	private String resources;

	@Column(name = "benefits_realization")
	private String benefits_realization;

	@Column(name = "risks")
	private String risks;

	@Column(name = "issues")
	private String issues;

	@Column(name = "stakeholders")
	private String stakeholders;

	public int getUnique_id() {
		return unique_id;
	}

	public void setUnique_id(int unique_id) {
		this.unique_id = unique_id;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getResources() {
		return resources;
	}

	public void setResources(String resources) {
		this.resources = resources;
	}

	public String getBenefits_realization() {
		return benefits_realization;
	}

	public void setBenefits_realization(String benefits_realization) {
		this.benefits_realization = benefits_realization;
	}

	public String getRisks() {
		return risks;
	}

	public void setRisks(String risks) {
		this.risks = risks;
	}

	public String getIssues() {
		return issues;
	}

	public void setIssues(String issues) {
		this.issues = issues;
	}

	public String getStakeholders() {
		return stakeholders;
	}

	public void setStakeholders(String stakeholders) {
		this.stakeholders = stakeholders;
	}

}
