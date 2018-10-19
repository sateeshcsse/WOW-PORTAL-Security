package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "defect_status_uat")
@Table(name = "defect_status_uat")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Defect_Status_UAT {

	@Id
	@Column(name = "unique_id")
	private int unique_id;

	@Column(name = "uat_new_def_sev1")
	private int uat_new_Def_Severity1;

	@Column(name = "uat_new_def_sev2")
	private int uat_new_Def_Severity2;

	@Column(name = "uat_new_def_sev3")
	private int uat_new_Def_Severity3;

	@Column(name = "uat_new_def_sev4")
	private int uat_new_Def_Severity4;

	@Column(name = "uat_open_def_sev1")
	private int uat_open_Def_Severity1;

	@Column(name = "uat_open_def_sev2")
	private int uat_open_Def_Severity2;

	@Column(name = "uat_open_def_sev3")
	private int uat_open_Def_Severity3;

	@Column(name = "uat_open_def_sev4")
	private int uat_open_Def_Severity4;

	@Column(name = "uat_rejected_def_sev1")
	private int uat_rejected_Def_Severity1;

	@Column(name = "uat_rejected_def_sev2")
	private int uat_rejected_Def_Severity2;

	@Column(name = "uat_rejected_def_sev3")
	private int uat_rejected_Def_Severity3;

	@Column(name = "uat_rejected_def_sev4")
	private int uat_rejected_Def_Severity4;

	@Column(name = "uat_in_progress_def_sev1")
	private int uat_inprogress_Def_Severity1;

	@Column(name = "uat_in_progress_def_sev2")
	private int uat_inprogress_Def_Severity2;

	@Column(name = "uat_in_progress_def_sev3")
	private int uat_inprogress_Def_Severity3;

	@Column(name = "uat_in_progress_def_sev4")
	private int uat_inprogress_Def_Severity4;

	@Column(name = "uat_clarify_def_sev1")
	private int uat_clarify_Def_Severity1;

	@Column(name = "uat_clarify_def_sev2")
	private int uat_clarify_Def_Severity2;

	@Column(name = "uat_clarify_def_sev3")
	private int uat_clarify_Def_Severity3;

	@Column(name = "uat_clarify_def_sev4")
	private int uat_clarify_Def_Severity4;

	@Column(name = "uat_fixed_def_sev1")
	private int uat_fixed_Def_Severity1;

	@Column(name = "uat_fixed_def_sev2")
	private int uat_fixed_Def_Severity2;

	@Column(name = "uat_fixed_def_sev3")
	private int uat_fixed_Def_Severity3;

	@Column(name = "uat_fixed_def_sev4")
	private int uat_fixed_Def_Severity4;

	@Column(name = "uat_assigned_def_sev1")
	private int uat_assigned_Def_Severity1;

	@Column(name = "uat_assigned_def_sev2")
	private int uat_assigned_Def_Severity2;

	@Column(name = "uat_assigned_def_sev3")
	private int uat_assigned_Def_Severity3;

	@Column(name = "uat_assigned_def_sev4")
	private int uat_assigned_Def_Severity4;

	@Column(name = "uat_retest_def_sev1")
	private int uat_retest_Def_Severity1;

	@Column(name = "uat_retest_def_sev2")
	private int uat_retest_Def_Severity2;

	@Column(name = "uat_retest_def_sev3")
	private int uat_retest_Def_Severity3;

	@Column(name = "uat_retest_def_sev4")
	private int uat_retest_Def_Severity4;

	@Column(name = "uat_reopen_def_sev1")
	private int uat_reopen_Def_Severity1;

	@Column(name = "uat_reopen_def_sev2")
	private int uat_reopen_Def_Severity2;

	@Column(name = "uat_reopen_def_sev3")
	private int uat_reopen_Def_Severity3;

	@Column(name = "uat_reopen_def_sev4")
	private int uat_reopen_Def_Severity4;

	@Column(name = "uat_deferred_def_sev1")
	private int uat_deferred_Def_Severity1;

	@Column(name = "uat_deferred_def_sev2")
	private int uat_deferred_Def_Severity2;

	@Column(name = "uat_deferred_def_sev3")
	private int uat_deferred_Def_Severity3;

	@Column(name = "uat_deferred_def_sev4")
	private int uat_deferred_Def_Severity4;

	@Column(name = "uat_cancelled_def_sev1")
	private int uat_cancelled_Def_Severity1;

	@Column(name = "uat_cancelled_def_sev2")
	private int uat_cancelled_Def_Severity2;

	@Column(name = "uat_cancelled_def_sev3")
	private int uat_cancelled_Def_Severity3;

	@Column(name = "uat_cancelled_def_sev4")
	private int uat_cancelled_Def_Severity4;

	@Column(name = "uat_closed_def_sev1")
	private int uat_closed_Def_Severity1;

	@Column(name = "uat_closed_def_sev2")
	private int uat_closed_Def_Severity2;

	@Column(name = "uat_closed_def_sev3")
	private int uat_closed_Def_Severity3;

	@Column(name = "uat_closed_def_sev4")
	private int uat_closed_Def_Severity4;

	public int getUnique_id() {
		return unique_id;
	}

	public void setUnique_id(int unique_id) {
		this.unique_id = unique_id;
	}

	public int getUat_new_Def_Severity1() {
		return uat_new_Def_Severity1;
	}

	public void setUat_new_Def_Severity1(int uat_new_Def_Severity1) {
		this.uat_new_Def_Severity1 = uat_new_Def_Severity1;
	}

	public int getUat_new_Def_Severity2() {
		return uat_new_Def_Severity2;
	}

	public void setUat_new_Def_Severity2(int uat_new_Def_Severity2) {
		this.uat_new_Def_Severity2 = uat_new_Def_Severity2;
	}

	public int getUat_new_Def_Severity3() {
		return uat_new_Def_Severity3;
	}

	public void setUat_new_Def_Severity3(int uat_new_Def_Severity3) {
		this.uat_new_Def_Severity3 = uat_new_Def_Severity3;
	}

	public int getUat_new_Def_Severity4() {
		return uat_new_Def_Severity4;
	}

	public void setUat_new_Def_Severity4(int uat_new_Def_Severity4) {
		this.uat_new_Def_Severity4 = uat_new_Def_Severity4;
	}

	public int getUat_open_Def_Severity1() {
		return uat_open_Def_Severity1;
	}

	public void setUat_open_Def_Severity1(int uat_open_Def_Severity1) {
		this.uat_open_Def_Severity1 = uat_open_Def_Severity1;
	}

	public int getUat_open_Def_Severity2() {
		return uat_open_Def_Severity2;
	}

	public void setUat_open_Def_Severity2(int uat_open_Def_Severity2) {
		this.uat_open_Def_Severity2 = uat_open_Def_Severity2;
	}

	public int getUat_open_Def_Severity3() {
		return uat_open_Def_Severity3;
	}

	public void setUat_open_Def_Severity3(int uat_open_Def_Severity3) {
		this.uat_open_Def_Severity3 = uat_open_Def_Severity3;
	}

	public int getUat_open_Def_Severity4() {
		return uat_open_Def_Severity4;
	}

	public void setUat_open_Def_Severity4(int uat_open_Def_Severity4) {
		this.uat_open_Def_Severity4 = uat_open_Def_Severity4;
	}

	public int getUat_rejected_Def_Severity1() {
		return uat_rejected_Def_Severity1;
	}

	public void setUat_rejected_Def_Severity1(int uat_rejected_Def_Severity1) {
		this.uat_rejected_Def_Severity1 = uat_rejected_Def_Severity1;
	}

	public int getUat_rejected_Def_Severity2() {
		return uat_rejected_Def_Severity2;
	}

	public void setUat_rejected_Def_Severity2(int uat_rejected_Def_Severity2) {
		this.uat_rejected_Def_Severity2 = uat_rejected_Def_Severity2;
	}

	public int getUat_rejected_Def_Severity3() {
		return uat_rejected_Def_Severity3;
	}

	public void setUat_rejected_Def_Severity3(int uat_rejected_Def_Severity3) {
		this.uat_rejected_Def_Severity3 = uat_rejected_Def_Severity3;
	}

	public int getUat_rejected_Def_Severity4() {
		return uat_rejected_Def_Severity4;
	}

	public void setUat_rejected_Def_Severity4(int uat_rejected_Def_Severity4) {
		this.uat_rejected_Def_Severity4 = uat_rejected_Def_Severity4;
	}

	public int getUat_inprogress_Def_Severity1() {
		return uat_inprogress_Def_Severity1;
	}

	public void setUat_inprogress_Def_Severity1(int uat_inprogress_Def_Severity1) {
		this.uat_inprogress_Def_Severity1 = uat_inprogress_Def_Severity1;
	}

	public int getUat_inprogress_Def_Severity2() {
		return uat_inprogress_Def_Severity2;
	}

	public void setUat_inprogress_Def_Severity2(int uat_inprogress_Def_Severity2) {
		this.uat_inprogress_Def_Severity2 = uat_inprogress_Def_Severity2;
	}

	public int getUat_inprogress_Def_Severity3() {
		return uat_inprogress_Def_Severity3;
	}

	public void setUat_inprogress_Def_Severity3(int uat_inprogress_Def_Severity3) {
		this.uat_inprogress_Def_Severity3 = uat_inprogress_Def_Severity3;
	}

	public int getUat_inprogress_Def_Severity4() {
		return uat_inprogress_Def_Severity4;
	}

	public void setUat_inprogress_Def_Severity4(int uat_inprogress_Def_Severity4) {
		this.uat_inprogress_Def_Severity4 = uat_inprogress_Def_Severity4;
	}

	public int getUat_clarify_Def_Severity1() {
		return uat_clarify_Def_Severity1;
	}

	public void setUat_clarify_Def_Severity1(int uat_clarify_Def_Severity1) {
		this.uat_clarify_Def_Severity1 = uat_clarify_Def_Severity1;
	}

	public int getUat_clarify_Def_Severity2() {
		return uat_clarify_Def_Severity2;
	}

	public void setUat_clarify_Def_Severity2(int uat_clarify_Def_Severity2) {
		this.uat_clarify_Def_Severity2 = uat_clarify_Def_Severity2;
	}

	public int getUat_clarify_Def_Severity3() {
		return uat_clarify_Def_Severity3;
	}

	public void setUat_clarify_Def_Severity3(int uat_clarify_Def_Severity3) {
		this.uat_clarify_Def_Severity3 = uat_clarify_Def_Severity3;
	}

	public int getUat_clarify_Def_Severity4() {
		return uat_clarify_Def_Severity4;
	}

	public void setUat_clarify_Def_Severity4(int uat_clarify_Def_Severity4) {
		this.uat_clarify_Def_Severity4 = uat_clarify_Def_Severity4;
	}

	public int getUat_fixed_Def_Severity1() {
		return uat_fixed_Def_Severity1;
	}

	public void setUat_fixed_Def_Severity1(int uat_fixed_Def_Severity1) {
		this.uat_fixed_Def_Severity1 = uat_fixed_Def_Severity1;
	}

	public int getUat_fixed_Def_Severity2() {
		return uat_fixed_Def_Severity2;
	}

	public void setUat_fixed_Def_Severity2(int uat_fixed_Def_Severity2) {
		this.uat_fixed_Def_Severity2 = uat_fixed_Def_Severity2;
	}

	public int getUat_fixed_Def_Severity3() {
		return uat_fixed_Def_Severity3;
	}

	public void setUat_fixed_Def_Severity3(int uat_fixed_Def_Severity3) {
		this.uat_fixed_Def_Severity3 = uat_fixed_Def_Severity3;
	}

	public int getUat_fixed_Def_Severity4() {
		return uat_fixed_Def_Severity4;
	}

	public void setUat_fixed_Def_Severity4(int uat_fixed_Def_Severity4) {
		this.uat_fixed_Def_Severity4 = uat_fixed_Def_Severity4;
	}

	public int getUat_assigned_Def_Severity1() {
		return uat_assigned_Def_Severity1;
	}

	public void setUat_assigned_Def_Severity1(int uat_assigned_Def_Severity1) {
		this.uat_assigned_Def_Severity1 = uat_assigned_Def_Severity1;
	}

	public int getUat_assigned_Def_Severity2() {
		return uat_assigned_Def_Severity2;
	}

	public void setUat_assigned_Def_Severity2(int uat_assigned_Def_Severity2) {
		this.uat_assigned_Def_Severity2 = uat_assigned_Def_Severity2;
	}

	public int getUat_assigned_Def_Severity3() {
		return uat_assigned_Def_Severity3;
	}

	public void setUat_assigned_Def_Severity3(int uat_assigned_Def_Severity3) {
		this.uat_assigned_Def_Severity3 = uat_assigned_Def_Severity3;
	}

	public int getUat_assigned_Def_Severity4() {
		return uat_assigned_Def_Severity4;
	}

	public void setUat_assigned_Def_Severity4(int uat_assigned_Def_Severity4) {
		this.uat_assigned_Def_Severity4 = uat_assigned_Def_Severity4;
	}

	public int getUat_retest_Def_Severity1() {
		return uat_retest_Def_Severity1;
	}

	public void setUat_retest_Def_Severity1(int uat_retest_Def_Severity1) {
		this.uat_retest_Def_Severity1 = uat_retest_Def_Severity1;
	}

	public int getUat_retest_Def_Severity2() {
		return uat_retest_Def_Severity2;
	}

	public void setUat_retest_Def_Severity2(int uat_retest_Def_Severity2) {
		this.uat_retest_Def_Severity2 = uat_retest_Def_Severity2;
	}

	public int getUat_retest_Def_Severity3() {
		return uat_retest_Def_Severity3;
	}

	public void setUat_retest_Def_Severity3(int uat_retest_Def_Severity3) {
		this.uat_retest_Def_Severity3 = uat_retest_Def_Severity3;
	}

	public int getUat_retest_Def_Severity4() {
		return uat_retest_Def_Severity4;
	}

	public void setUat_retest_Def_Severity4(int uat_retest_Def_Severity4) {
		this.uat_retest_Def_Severity4 = uat_retest_Def_Severity4;
	}

	public int getUat_reopen_Def_Severity1() {
		return uat_reopen_Def_Severity1;
	}

	public void setUat_reopen_Def_Severity1(int uat_reopen_Def_Severity1) {
		this.uat_reopen_Def_Severity1 = uat_reopen_Def_Severity1;
	}

	public int getUat_reopen_Def_Severity2() {
		return uat_reopen_Def_Severity2;
	}

	public void setUat_reopen_Def_Severity2(int uat_reopen_Def_Severity2) {
		this.uat_reopen_Def_Severity2 = uat_reopen_Def_Severity2;
	}

	public int getUat_reopen_Def_Severity3() {
		return uat_reopen_Def_Severity3;
	}

	public void setUat_reopen_Def_Severity3(int uat_reopen_Def_Severity3) {
		this.uat_reopen_Def_Severity3 = uat_reopen_Def_Severity3;
	}

	public int getUat_reopen_Def_Severity4() {
		return uat_reopen_Def_Severity4;
	}

	public void setUat_reopen_Def_Severity4(int uat_reopen_Def_Severity4) {
		this.uat_reopen_Def_Severity4 = uat_reopen_Def_Severity4;
	}

	public int getUat_deferred_Def_Severity1() {
		return uat_deferred_Def_Severity1;
	}

	public void setUat_deferred_Def_Severity1(int uat_deferred_Def_Severity1) {
		this.uat_deferred_Def_Severity1 = uat_deferred_Def_Severity1;
	}

	public int getUat_deferred_Def_Severity2() {
		return uat_deferred_Def_Severity2;
	}

	public void setUat_deferred_Def_Severity2(int uat_deferred_Def_Severity2) {
		this.uat_deferred_Def_Severity2 = uat_deferred_Def_Severity2;
	}

	public int getUat_deferred_Def_Severity3() {
		return uat_deferred_Def_Severity3;
	}

	public void setUat_deferred_Def_Severity3(int uat_deferred_Def_Severity3) {
		this.uat_deferred_Def_Severity3 = uat_deferred_Def_Severity3;
	}

	public int getUat_deferred_Def_Severity4() {
		return uat_deferred_Def_Severity4;
	}

	public void setUat_deferred_Def_Severity4(int uat_deferred_Def_Severity4) {
		this.uat_deferred_Def_Severity4 = uat_deferred_Def_Severity4;
	}

	public int getUat_cancelled_Def_Severity1() {
		return uat_cancelled_Def_Severity1;
	}

	public void setUat_cancelled_Def_Severity1(int uat_cancelled_Def_Severity1) {
		this.uat_cancelled_Def_Severity1 = uat_cancelled_Def_Severity1;
	}

	public int getUat_cancelled_Def_Severity2() {
		return uat_cancelled_Def_Severity2;
	}

	public void setUat_cancelled_Def_Severity2(int uat_cancelled_Def_Severity2) {
		this.uat_cancelled_Def_Severity2 = uat_cancelled_Def_Severity2;
	}

	public int getUat_cancelled_Def_Severity3() {
		return uat_cancelled_Def_Severity3;
	}

	public void setUat_cancelled_Def_Severity3(int uat_cancelled_Def_Severity3) {
		this.uat_cancelled_Def_Severity3 = uat_cancelled_Def_Severity3;
	}

	public int getUat_cancelled_Def_Severity4() {
		return uat_cancelled_Def_Severity4;
	}

	public void setUat_cancelled_Def_Severity4(int uat_cancelled_Def_Severity4) {
		this.uat_cancelled_Def_Severity4 = uat_cancelled_Def_Severity4;
	}

	public int getUat_closed_Def_Severity1() {
		return uat_closed_Def_Severity1;
	}

	public void setUat_closed_Def_Severity1(int uat_closed_Def_Severity1) {
		this.uat_closed_Def_Severity1 = uat_closed_Def_Severity1;
	}

	public int getUat_closed_Def_Severity2() {
		return uat_closed_Def_Severity2;
	}

	public void setUat_closed_Def_Severity2(int uat_closed_Def_Severity2) {
		this.uat_closed_Def_Severity2 = uat_closed_Def_Severity2;
	}

	public int getUat_closed_Def_Severity3() {
		return uat_closed_Def_Severity3;
	}

	public void setUat_closed_Def_Severity3(int uat_closed_Def_Severity3) {
		this.uat_closed_Def_Severity3 = uat_closed_Def_Severity3;
	}

	public int getUat_closed_Def_Severity4() {
		return uat_closed_Def_Severity4;
	}

	public void setUat_closed_Def_Severity4(int uat_closed_Def_Severity4) {
		this.uat_closed_Def_Severity4 = uat_closed_Def_Severity4;
	}

	@Override
	public String toString() {
		return "Defect_Status_UAT [unique_id=" + unique_id
				+ ", uat_new_Def_Severity1=" + uat_new_Def_Severity1
				+ ", uat_new_Def_Severity2=" + uat_new_Def_Severity2
				+ ", uat_new_Def_Severity3=" + uat_new_Def_Severity3
				+ ", uat_new_Def_Severity4=" + uat_new_Def_Severity4
				+ ", uat_open_Def_Severity1=" + uat_open_Def_Severity1
				+ ", uat_open_Def_Severity2=" + uat_open_Def_Severity2
				+ ", uat_open_Def_Severity3=" + uat_open_Def_Severity3
				+ ", uat_open_Def_Severity4=" + uat_open_Def_Severity4
				+ ", uat_rejected_Def_Severity1=" + uat_rejected_Def_Severity1
				+ ", uat_rejected_Def_Severity2=" + uat_rejected_Def_Severity2
				+ ", uat_rejected_Def_Severity3=" + uat_rejected_Def_Severity3
				+ ", uat_rejected_Def_Severity4=" + uat_rejected_Def_Severity4
				+ ", uat_inprogress_Def_Severity1="
				+ uat_inprogress_Def_Severity1
				+ ", uat_inprogress_Def_Severity2="
				+ uat_inprogress_Def_Severity2
				+ ", uat_inprogress_Def_Severity3="
				+ uat_inprogress_Def_Severity3
				+ ", uat_inprogress_Def_Severity4="
				+ uat_inprogress_Def_Severity4 + ", uat_clarify_Def_Severity1="
				+ uat_clarify_Def_Severity1 + ", uat_clarify_Def_Severity2="
				+ uat_clarify_Def_Severity2 + ", uat_clarify_Def_Severity3="
				+ uat_clarify_Def_Severity3 + ", uat_clarify_Def_Severity4="
				+ uat_clarify_Def_Severity4 + ", uat_fixed_Def_Severity1="
				+ uat_fixed_Def_Severity1 + ", uat_fixed_Def_Severity2="
				+ uat_fixed_Def_Severity2 + ", uat_fixed_Def_Severity3="
				+ uat_fixed_Def_Severity3 + ", uat_fixed_Def_Severity4="
				+ uat_fixed_Def_Severity4 + ", uat_assigned_Def_Severity1="
				+ uat_assigned_Def_Severity1 + ", uat_assigned_Def_Severity2="
				+ uat_assigned_Def_Severity2 + ", uat_assigned_Def_Severity3="
				+ uat_assigned_Def_Severity3 + ", uat_assigned_Def_Severity4="
				+ uat_assigned_Def_Severity4 + ", uat_retest_Def_Severity1="
				+ uat_retest_Def_Severity1 + ", uat_retest_Def_Severity2="
				+ uat_retest_Def_Severity2 + ", uat_retest_Def_Severity3="
				+ uat_retest_Def_Severity3 + ", uat_retest_Def_Severity4="
				+ uat_retest_Def_Severity4 + ", uat_reopen_Def_Severity1="
				+ uat_reopen_Def_Severity1 + ", uat_reopen_Def_Severity2="
				+ uat_reopen_Def_Severity2 + ", uat_reopen_Def_Severity3="
				+ uat_reopen_Def_Severity3 + ", uat_reopen_Def_Severity4="
				+ uat_reopen_Def_Severity4 + ", uat_deferred_Def_Severity1="
				+ uat_deferred_Def_Severity1 + ", uat_deferred_Def_Severity2="
				+ uat_deferred_Def_Severity2 + ", uat_deferred_Def_Severity3="
				+ uat_deferred_Def_Severity3 + ", uat_deferred_Def_Severity4="
				+ uat_deferred_Def_Severity4 + ", uat_cancelled_Def_Severity1="
				+ uat_cancelled_Def_Severity1
				+ ", uat_cancelled_Def_Severity2="
				+ uat_cancelled_Def_Severity2
				+ ", uat_cancelled_Def_Severity3="
				+ uat_cancelled_Def_Severity3
				+ ", uat_cancelled_Def_Severity4="
				+ uat_cancelled_Def_Severity4 + ", uat_closed_Def_Severity1="
				+ uat_closed_Def_Severity1 + ", uat_closed_Def_Severity2="
				+ uat_closed_Def_Severity2 + ", uat_closed_Def_Severity3="
				+ uat_closed_Def_Severity3 + ", uat_closed_Def_Severity4="
				+ uat_closed_Def_Severity4 + "]";
	}

}
