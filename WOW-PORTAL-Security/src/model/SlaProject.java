package model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.annotations.Expose;
import services.CustomDateSerializer;


@Entity
@Table(name = "sla_project_details")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SlaProject {
	
	@Expose
	@Id
	@GeneratedValue(generator="increment")
	@GenericGenerator(name="increment", strategy = "increment")
	@Column(name = "project_id")
	private int project_id;
	
//	@Column(name = "sla_id")
//	@GeneratedValue(generator = "gen")
//	@GenericGenerator(name = "gen", strategy = "foreign", parameters = @Parameter(name = "property", value = "slamain"))
//	private int sla_id;
	
	@Expose
	@Column(name = "sit_planned_period_from")
	private String sit_planned_period_from;
	
	@Expose
	@Column(name = "sit_planned_period_to")
	private String sit_planned_period_to;
	
	@Expose
	@Column(name = "sit_actual_period_from")
	private String sit_actual_period_from;
	
	@Expose
	@Column(name = "sit_actual_period_to")
	private String sit_actual_period_to;
	
	@Expose
	@Column(name = "silver")
	private int silver;
	
	@Expose
	@Column(name = "bronze")
	private int bronze;
	
	@Expose
	@Column(name = "gold")
	private int gold;
	
	@Expose
	@Column(name = "total_scripts")
	private int total_scripts;
	
	@Expose
	@Column(name = "sit_actual_effort")
	private int sit_actual_effort;
	
	@Expose
	@Column(name = "comments_project_details")
	private String comments_project_details;

	@OneToOne
	@PrimaryKeyJoinColumn
	private  SlaMain slamain;
	
	@Expose
	@Column(name = "sitTestEffectiveness")
	private double sitTestEffectiveness = 0;
	
	@Expose
	@Column(name = "effortSlippage")
	private double effortSlippage = 0;
	
	@Expose
	@Column(name = "sitDefectRejection")
	private double sitDefectRejection = 0;
	
	@Expose
	@Column(name = "scheduleSlippage")
	private double scheduleSlippage = 0;
	
	@Expose
	@Column(name = "failureRate")
	private double failureRate = 0;

	public double getFailureRate() {
		return failureRate;
	}

	public void setFailureRate(double failureRate) {
		this.failureRate = failureRate;
	}

	public double getSitTestEffectiveness() {
		return sitTestEffectiveness;
	}

	public void setSitTestEffectiveness(double sitTestEffectiveness) {
		this.sitTestEffectiveness = sitTestEffectiveness;
	}

	public double getEffortSlippage() {
		return effortSlippage;
	}

	public void setEffortSlippage(double effortSlippage) {
		this.effortSlippage = effortSlippage;
	}

	public double getSitDefectRejection() {
		return sitDefectRejection;
	}

	public void setSitDefectRejection(double sitDefectRejection) {
		this.sitDefectRejection = sitDefectRejection;
	}

	public double getScheduleSlippage() {
		return scheduleSlippage;
	}

	public void setScheduleSlippage(double scheduleSlippage) {
		this.scheduleSlippage = scheduleSlippage;
	}

	@Override
	public String toString() {
		return "SlaProject [project_id=" + project_id + ", sla_id=" + ", sit_planned_period_from="
				+ sit_planned_period_from + ", sit_planned_period_to=" + sit_planned_period_to
				+ ", sit_actual_period_from=" + sit_actual_period_from + ", sit_actual_period_to="
				+ sit_actual_period_to + ", silver=" + silver + ", bronze=" + bronze + ", gold=" + gold
				+ ", total_scripts=" + total_scripts + ", sit_actual_effort=" + sit_actual_effort
				+ ", comments_project_details=" + comments_project_details + ", slamain=" + slamain + "]";
	}

	public SlaProject() {

	}
	@JsonIgnore
	public SlaMain getSlamain() {
		return slamain;
	}
	@JsonIgnore
	public void setSlamain(SlaMain slamain) {
		this.slamain = slamain;
	}

	public int getProject_id() {
		return project_id;
	}

	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}


	public String getSit_planned_period_from() {
		return sit_planned_period_from;
	}

	public void setSit_planned_period_from(String sit_planned_period_from) {
		this.sit_planned_period_from = sit_planned_period_from;
	}

	public String getSit_planned_period_to() {
		return sit_planned_period_to;
	}

	public void setSit_planned_period_to(String sit_planned_period_to) {
		this.sit_planned_period_to = sit_planned_period_to;
	}

	public String getSit_actual_period_from() {
		return sit_actual_period_from;
	}

	public void setSit_actual_period_from(String sit_actual_period_from) {
		this.sit_actual_period_from = sit_actual_period_from;
	}
	
	public String getSit_actual_period_to() {
		 return sit_actual_period_to;
	}

	public void setSit_actual_period_to(String sit_actual_period_to) {
       this.sit_actual_period_to = sit_actual_period_to;
     }

	public int getSilver() {
		return silver;
	}

	public void setSilver(int silver) {
		this.silver = silver;
	}

	public int getBronze() {
		return bronze;
	}

	public void setBronze(int bronze) {
		this.bronze = bronze;
	}

	public int getGold() {
		return gold;
	}

	public void setGold(int gold) {
		this.gold = gold;
	}

	
	public int getTotal_scripts() {
		return total_scripts;
	}

	public void setTotal_scripts(int total_scripts) {
		this.total_scripts = total_scripts;
	}

	public int getSit_actual_effort() {
		return sit_actual_effort;
	}

	public void setSit_actual_effort(int sit_actual_effort) {
		this.sit_actual_effort = sit_actual_effort;
	}

	public String getComments_project_details() {
		return comments_project_details;
	}

	public void setComments_project_details(String comments_project_details) {
		this.comments_project_details = comments_project_details;
	}
}
