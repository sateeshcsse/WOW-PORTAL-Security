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
@Table(name = "sla_defect_count")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SlaDefect {
	
	@Id
	@Expose
	@GeneratedValue(generator="increment")
	@GenericGenerator(name="increment", strategy = "increment")
	@Column(name = "def_id")
	private int def_id;
	
	@Expose
	@Column(name = "sit_open")
	private int sit_open;
	
	@Expose
	@Column(name = "sit_close")
	private int sit_close;
	
	@Expose
	@Column(name = "sit_reopen")
	private int sit_reopen;
	
	@Expose
	@Column(name = "sit_deferred")
	private int sit_deferred;
	
	@Expose
	@Column(name = "sit_cancelled")
	private int sit_cancelled;
	
	@Expose
	@Column(name = "sit_rejected")
	private int sit_rejected;
	
	@Expose
	@Column(name = "sit_sev1")
	private int sit_sev1;
	
	@Expose
	@Column(name = "sit_sev2")
	private int sit_sev2;
	
	@Expose
	@Column(name = "sit_sev3")
	private int sit_sev3;
	
	@Expose
	@Column(name = "sit_sev4")
	private int sit_sev4;
	
	@Expose
	@Column(name = "uat_open")
	private int uat_open;
	
	@Expose
	@Column(name = "uat_close")
	private int uat_close;
	
	@Expose
	@Column(name = "uat_reopen")
	private int uat_reopen;
	
	@Expose
	@Column(name = "uat_deferred")
	private int uat_deferred;
	
	@Expose
	@Column(name = "uat_cancelled")
	private int uat_cancelled;
	
	@Expose
	@Column(name = "uat_rejected")
	private int uat_rejected;
	
	@Expose
	@Column(name = "uat_sev1")
	private int uat_sev1;
	
	@Expose
	@Column(name = "uat_sev2")
	private int uat_sev2;
	
	@Expose
	@Column(name = "uat_sev3")
	private int uat_sev3;
	
	@Expose
	@Column(name = "uat_sev4")
	private int uat_sev4;
	
	@Expose
	@Column(name = "prod_open")
	private int prod_open;
	
	@Expose
	@Column(name = "prod_close")
	private int prod_close;
	
	@Expose
	@Column(name = "prod_reopen")
	private int prod_reopen;
	
	@Expose
	@Column(name = "prod_deferred")
	private int prod_deferred;
	
	@Expose
	@Column(name = "prod_cancelled")
	private int prod_cancelled;
	
	@Expose
	@Column(name = "prod_rejected")
	private int prod_rejected;
	
	@Expose
	@Column(name = "prod_sev1")
	private int prod_sev1;
	
	@Expose
	@Column(name = "prod_sev2")
	private int prod_sev2;
	
	@Expose
	@Column(name = "prod_sev3")
	private int prod_sev3;
	
	@Expose
	@Column(name = "prod_sev4")
	private int prod_sev4;
	
	@Column(name = "def_comments")
	@Expose
	private String def_comments;
	
	@OneToOne
	@PrimaryKeyJoinColumn
	private  SlaMain slamain;
	
	
	
	
	@Override
	public String toString() {
		return "SlaDefect [def_id=" + def_id + ", sla_id=" + ", sit_open=" + sit_open + ", sit_close="
				+ sit_close + ", sit_reopen=" + sit_reopen + ", sit_deferred=" + sit_deferred + ", sit_sev1="
				+ sit_sev1 + ", sit_sev2=" + sit_sev2 + ", sit_sev3=" + sit_sev3 + ", sit_sev4=" + sit_sev4
				+ ", uat_open=" + uat_open + ", uat_close=" + uat_close + ", uat_reopen=" + uat_reopen
				+ ", uat_deferred=" + uat_deferred + ", uat_sev1=" + uat_sev1 + ", uat_sev2=" + uat_sev2
				+ ", uat_sev3=" + uat_sev3 + ", uat_sev4=" + uat_sev4 + ", prod_open=" + prod_open + ", prod_close="
				+ prod_close + ", prod_reopen=" + prod_reopen + ", prod_deferred=" + prod_deferred + ", prod_sev1="
				+ prod_sev1 + ", prod_sev2=" + prod_sev2 + ", prod_sev3=" + prod_sev3 + ", prod_sev4=" + prod_sev4
				+ ", def_comments=" + def_comments + ", slamain=" + slamain + "]";
	}

	public SlaDefect() {
		
	}
	@JsonIgnore
	public SlaMain getSlamain() {
		return slamain;
	}

	@JsonIgnore
	public void setSlamain(SlaMain slamain) {
		this.slamain = slamain;
	}


	public int getDef_id() {
		return def_id;
	}

	public void setDef_id(int def_id) {
		this.def_id = def_id;
	}



	public int getSit_open() {
		return sit_open;
	}

	public void setSit_open(int sit_open) {
		this.sit_open = sit_open;
	}

	public int getSit_close() {
		return sit_close;
	}

	public void setSit_close(int sit_close) {
		this.sit_close = sit_close;
	}

	public int getSit_reopen() {
		return sit_reopen;
	}

	public void setSit_reopen(int sit_reopen) {
		this.sit_reopen = sit_reopen;
	}

	public int getSit_deferred() {
		return sit_deferred;
	}

	public void setSit_deferred(int sit_deferred) {
		this.sit_deferred = sit_deferred;
	}

	public int getSit_sev1() {
		return sit_sev1;
	}

	public void setSit_sev1(int sit_sev1) {
		this.sit_sev1 = sit_sev1;
	}

	public int getSit_sev2() {
		return sit_sev2;
	}

	public void setSit_sev2(int sit_sev2) {
		this.sit_sev2 = sit_sev2;
	}

	public int getSit_sev3() {
		return sit_sev3;
	}

	public void setSit_sev3(int sit_sev3) {
		this.sit_sev3 = sit_sev3;
	}

	public int getSit_sev4() {
		return sit_sev4;
	}

	public void setSit_sev4(int sit_sev4) {
		this.sit_sev4 = sit_sev4;
	}

	public int getUat_open() {
		return uat_open;
	}

	public void setUat_open(int uat_open) {
		this.uat_open = uat_open;
	}

	public int getUat_close() {
		return uat_close;
	}

	public void setUat_close(int uat_close) {
		this.uat_close = uat_close;
	}

	public int getUat_reopen() {
		return uat_reopen;
	}

	public void setUat_reopen(int uat_reopen) {
		this.uat_reopen = uat_reopen;
	}

	public int getUat_deferred() {
		return uat_deferred;
	}

	public void setUat_deferred(int uat_deferred) {
		this.uat_deferred = uat_deferred;
	}

	public int getUat_sev1() {
		return uat_sev1;
	}

	public void setUat_sev1(int uat_sev1) {
		this.uat_sev1 = uat_sev1;
	}

	public int getUat_sev2() {
		return uat_sev2;
	}

	public void setUat_sev2(int uat_sev2) {
		this.uat_sev2 = uat_sev2;
	}

	public int getUat_sev3() {
		return uat_sev3;
	}

	public void setUat_sev3(int uat_sev3) {
		this.uat_sev3 = uat_sev3;
	}

	public int getUat_sev4() {
		return uat_sev4;
	}

	public void setUat_sev4(int uat_sev4) {
		this.uat_sev4 = uat_sev4;
	}

	public int getProd_open() {
		return prod_open;
	}

	public void setProd_open(int prod_open) {
		this.prod_open = prod_open;
	}

	public int getProd_close() {
		return prod_close;
	}

	public void setProd_close(int prod_close) {
		this.prod_close = prod_close;
	}

	public int getProd_reopen() {
		return prod_reopen;
	}

	public void setProd_reopen(int prod_reopen) {
		this.prod_reopen = prod_reopen;
	}

	public int getProd_deferred() {
		return prod_deferred;
	}

	public void setProd_deferred(int prod_deferred) {
		this.prod_deferred = prod_deferred;
	}

	public int getProd_sev1() {
		return prod_sev1;
	}

	public void setProd_sev1(int prod_sev1) {
		this.prod_sev1 = prod_sev1;
	}

	public int getProd_sev2() {
		return prod_sev2;
	}

	public void setProd_sev2(int prod_sev2) {
		this.prod_sev2 = prod_sev2;
	}

	public int getProd_sev3() {
		return prod_sev3;
	}

	public void setProd_sev3(int prod_sev3) {
		this.prod_sev3 = prod_sev3;
	}

	public int getProd_sev4() {
		return prod_sev4;
	}

	public void setProd_sev4(int prod_sev4) {
		this.prod_sev4 = prod_sev4;
	}

	public String getDef_comments() {
		return def_comments;
	}

	public void setDef_comments(String def_comments) {
		this.def_comments = def_comments;
	}
	
	public int getSit_cancelled() {
		return sit_cancelled;
	}

	public void setSit_cancelled(int sit_cancelled) {
		this.sit_cancelled = sit_cancelled;
	}

	public int getSit_rejected() {
		return sit_rejected;
	}

	public void setSit_rejected(int sit_rejected) {
		this.sit_rejected = sit_rejected;
	}

	public int getUat_cancelled() {
		return uat_cancelled;
	}

	public void setUat_cancelled(int uat_cancelled) {
		this.uat_cancelled = uat_cancelled;
	}

	public int getUat_rejected() {
		return uat_rejected;
	}

	public void setUat_rejected(int uat_rejected) {
		this.uat_rejected = uat_rejected;
	}

	public int getProd_cancelled() {
		return prod_cancelled;
	}

	public void setProd_cancelled(int prod_cancelled) {
		this.prod_cancelled = prod_cancelled;
	}

	public int getProd_rejected() {
		return prod_rejected;
	}

	public void setProd_rejected(int prod_rejected) {
		this.prod_rejected = prod_rejected;
	}

	
	

}
