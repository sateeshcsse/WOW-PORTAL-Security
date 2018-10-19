package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.gson.annotations.Expose;

@Entity
@Table(name = "sla_root_cause")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SlaRootCause {
	
	
	@Expose
	@Id
	@GeneratedValue(generator="increment")
	@GenericGenerator(name="increment", strategy = "increment")
	@Column(name = "root_id")
	private int root_id;
	
//	@Expose
//	@Id
//    @Column(name="sla_id")
//    @GeneratedValue(generator="gen")
//    @GenericGenerator(name="gen", strategy="foreign",parameters=@Parameter(name="property", value="slamain"))
//	private int sla_id;
	
	@Expose
	@Column(name = "sit_code")
	private int sit_code;
	
	@Expose
	@Column(name = "sit_req")
	private int sit_req;
	
	@Expose
	@Column(name = "sit_design")
	private int sit_design;
	
	@Expose
	@Column(name = "sit_environment")
	private int sit_environment;
	
	@Expose
	@Column(name = "sit_data")
	private int sit_data;
	
	@Expose
	@Column(name = "sit_test_script")
	private int sit_test_script;
	
	@Expose
	@Column(name = "sit_exist_prod")
	private int sit_exist_prod;
	
	@Expose
	@Column(name = "sit_others")
	private int sit_others;
	
	@Expose
	@Column(name = "uat_code")
	private int uat_code;
	
	@Expose
	@Column(name = "uat_req")
	private int uat_req;
	
	@Expose
	@Column(name = "uat_design")
	private int uat_design;
	
	@Expose
	@Column(name = "uat_environment")
	private int uat_environment;
	
	@Expose
	@Column(name = "uat_data")
	private int uat_data;
	
	@Expose
	@Column(name = "uat_test_script")
	private int uat_test_script;
	
	@Expose
	@Column(name = "uat_exist_prod")
	private int uat_exist_prod;
	
	@Expose
	@Column(name = "uat_others")
	private int uat_others;
	
	@Expose
	@Column(name = "prod_code")
	private int prod_code;
	
	@Expose
	@Column(name = "prod_req")
	private int prod_req;
	
	@Expose
	@Column(name = "prod_design")
	private int prod_design;
	
	@Expose
	@Column(name = "prod_environment")
	private int prod_environment;
	
	@Expose
	@Column(name = "prod_data")
	private int prod_data;
	
	@Expose
	@Column(name = "prod_test_script")
	private int prod_test_script;
	
	@Expose
	@Column(name = "prod_exist_prod")
	private int prod_exist_prod;
	
	@Expose
	@Column(name = "prod_others")
	private int prod_others;
	
	@Expose
	@Column(name = "root_comments")
	private String root_comments;
	
	@Expose
	@Column(name = "reviewed")
	private String reviewed;
	
	public void setReviewed(String reviewed) {
		this.reviewed = reviewed;
	}

	@Expose
	@Column(name = "reviewed_date")
	private String reviewed_date;
	
	@Expose
	@Column(name = "proj_team_comments")
	private String proj_team_comments;
	
	@Expose
	@Column(name = "lesson_learnt")
	private String lesson_learnt;
	
	@Expose
	@Column(name = "tdm")
	private String tdm;
	
	
	@Expose
	@Column(name = "tdm_date")
	private String tdm_date;
	
	@Expose
	@Column(name = "best_practices")
	private String best_practices;
	
	@Expose
	@Column(name = "total_defects_rc_sit")
	private int total_defects_rc_sit;

	@OneToOne
	@PrimaryKeyJoinColumn
	private  SlaMain slamain;
	
	public SlaRootCause() {
		
	}
	
	
	@Override
	public String toString() {
		return "SlaRootCause [root_id=" + root_id + ", sla_id=" + ", sit_code=" + sit_code + ", sit_req="
				+ sit_req + ", sit_design=" + sit_design + ", sit_environment=" + sit_environment + ", sit_data="
				+ sit_data + ", sit_test_script=" + sit_test_script + ", sit_exist_prod=" + sit_exist_prod
				+ ", sit_others=" + sit_others + ", uat_code=" + uat_code + ", uat_req=" + uat_req + ", uat_design="
				+ uat_design + ", uat_environment=" + uat_environment + ", uat_data=" + uat_data + ", uat_test_script="
				+ uat_test_script + ", uat_exist_prod=" + uat_exist_prod + ", uat_others=" + uat_others
				+ ", prod_code=" + prod_code + ", prod_req=" + prod_req + ", prod_design=" + prod_design
				+ ", prod_environment=" + prod_environment + ", prod_data=" + prod_data + ", prod_test_script="
				+ prod_test_script + ", prod_exist_prod=" + prod_exist_prod + ", prod_others=" + prod_others
				+ ", root_comments=" + root_comments + ", reviewed=" + reviewed + ", reviewed_date=" + reviewed_date
				+ ", proj_team_comments=" + proj_team_comments + ", lesson_learnt=" + lesson_learnt
				+ ", best_practices=" + best_practices + ", slamain=" + slamain + "]";
	}

	@JsonIgnore
	public SlaMain getSlamain() {
		return slamain;
	}
	@JsonIgnore
	public void setSlamain(SlaMain slamain) {
		this.slamain = slamain;
	}
	
	public String getLesson_learnt() {
		return lesson_learnt;
	}


	public void setLesson_learnt(String lesson_learnt) {
		this.lesson_learnt = lesson_learnt;
	}


	public String getBest_practices() {
		return best_practices;
	}
	
	
	public int getTotal_defects_rc_sit() {
		return total_defects_rc_sit;
	}


	public void setTotal_defects_rc_sit(int total_defects_rc_sit) {
		this.total_defects_rc_sit = total_defects_rc_sit;
	}


	public String getReviewed() {
		return reviewed;
	}


	public void setBest_practices(String best_practices) {
		this.best_practices = best_practices;
	}

	public int getRoot_id() {
		return root_id;
	}

	public void setRoot_id(int root_id) {
		this.root_id = root_id;
	}



	public int getSit_code() {
		return sit_code;
	}

	public void setSit_code(int sit_code) {
		this.sit_code = sit_code;
	}

	public int getSit_req() {
		return sit_req;
	}

	public void setSit_req(int sit_req) {
		this.sit_req = sit_req;
	}

	public int getSit_design() {
		return sit_design;
	}

	public void setSit_design(int sit_design) {
		this.sit_design = sit_design;
	}

	public int getSit_environment() {
		return sit_environment;
	}

	public void setSit_environment(int sit_environment) {
		this.sit_environment = sit_environment;
	}

	public int getSit_data() {
		return sit_data;
	}

	public void setSit_data(int sit_data) {
		this.sit_data = sit_data;
	}

	public int getSit_test_script() {
		return sit_test_script;
	}

	public void setSit_test_script(int sit_test_script) {
		this.sit_test_script = sit_test_script;
	}

	public int getSit_exist_prod() {
		return sit_exist_prod;
	}

	public void setSit_exist_prod(int sit_exist_prod) {
		this.sit_exist_prod = sit_exist_prod;
	}

	public int getSit_others() {
		return sit_others;
	}

	public void setSit_others(int sit_others) {
		this.sit_others = sit_others;
	}

	public int getUat_code() {
		return uat_code;
	}

	public void setUat_code(int uat_code) {
		this.uat_code = uat_code;
	}

	public int getUat_req() {
		return uat_req;
	}

	public void setUat_req(int uat_req) {
		this.uat_req = uat_req;
	}

	public int getUat_design() {
		return uat_design;
	}

	public void setUat_design(int uat_design) {
		this.uat_design = uat_design;
	}

	public int getUat_environment() {
		return uat_environment;
	}

	public void setUat_environment(int uat_environment) {
		this.uat_environment = uat_environment;
	}

	public int getUat_data() {
		return uat_data;
	}

	public void setUat_data(int uat_data) {
		this.uat_data = uat_data;
	}

	public int getUat_test_script() {
		return uat_test_script;
	}

	public void setUat_test_script(int uat_test_script) {
		this.uat_test_script = uat_test_script;
	}

	public int getUat_exist_prod() {
		return uat_exist_prod;
	}

	public void setUat_exist_prod(int uat_exist_prod) {
		this.uat_exist_prod = uat_exist_prod;
	}

	public int getUat_others() {
		return uat_others;
	}

	public void setUat_others(int uat_others) {
		this.uat_others = uat_others;
	}

	public int getProd_code() {
		return prod_code;
	}

	public void setProd_code(int prod_code) {
		this.prod_code = prod_code;
	}

	public int getProd_req() {
		return prod_req;
	}

	public void setProd_req(int prod_req) {
		this.prod_req = prod_req;
	}

	public int getProd_design() {
		return prod_design;
	}

	public void setProd_design(int prod_design) {
		this.prod_design = prod_design;
	}

	public int getProd_environment() {
		return prod_environment;
	}

	public void setProd_environment(int prod_environment) {
		this.prod_environment = prod_environment;
	}

	public int getProd_data() {
		return prod_data;
	}

	public void setProd_data(int prod_data) {
		this.prod_data = prod_data;
	}

	public int getProd_test_script() {
		return prod_test_script;
	}

	public void setProd_test_script(int prod_test_script) {
		this.prod_test_script = prod_test_script;
	}

	public int getProd_exist_prod() {
		return prod_exist_prod;
	}

	public void setProd_exist_prod(int prod_exist_prod) {
		this.prod_exist_prod = prod_exist_prod;
	}

	public int getProd_others() {
		return prod_others;
	}

	public void setProd_others(int prod_others) {
		this.prod_others = prod_others;
	}

	public String getRoot_comments() {
		return root_comments;
	}

	public void setRoot_comments(String root_comments) {
		this.root_comments = root_comments;
	}


	public String getReviewed_date() {
		return reviewed_date;
	}

	public void setReviewed_date(String reviewed_date) {
		this.reviewed_date = reviewed_date;
	}

	public String getProj_team_comments() {
		return proj_team_comments;
	}

	public void setProj_team_comments(String proj_team_comments) {
		this.proj_team_comments = proj_team_comments;
	}
	
	public String getTdm() {
		return tdm;
	}


	public void setTdm(String tdm) {
		this.tdm = tdm;
	}


	public String getTdm_date() {
		return tdm_date;
	}


	public void setTdm_date(String tdm_date) {
		this.tdm_date = tdm_date;
	}


	
	
}
