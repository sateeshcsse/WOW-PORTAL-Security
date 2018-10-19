package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "com.dummy.testexecution")
@Table(name = "testexecution")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
@JsonIgnoreProperties(ignoreUnknown = true)
public class TestExecutionUAT {

	@Id
	@Column(name = "test_execution_id")
	private int test_execution_id;

	@Column(name = "pass")
	private int uat_pass;

	@Column(name = "fail")
	private int uat_fail;

	@Column(name = "blocked")
	private int uat_blocked;

	@Column(name = "in_progress")
	private int uat_in_progress;

	@Column(name = "no_run")
	private int uat_no_run;

	@Column(name = "not_available")
	private int uat_not_available;

	@Column(name = "total")
	private int uat_total;

	@Column(name = "percentage_completion")
	private String uat_percentage_completion;

	@Column(name = "expected_percent")
	private String uat_expected_percent;

	public int getTest_execution_id() {
		return test_execution_id;
	}

	public void setTest_execution_id(int test_execution_id) {
		this.test_execution_id = test_execution_id;
	}

	public int getUat_pass() {
		return uat_pass;
	}

	public void setUat_pass(int uat_pass) {
		this.uat_pass = uat_pass;
	}

	public int getUat_fail() {
		return uat_fail;
	}

	public void setUat_fail(int uat_fail) {
		this.uat_fail = uat_fail;
	}

	public int getUat_blocked() {
		return uat_blocked;
	}

	public void setUat_blocked(int uat_blocked) {
		this.uat_blocked = uat_blocked;
	}

	public int getUat_in_progress() {
		return uat_in_progress;
	}

	public void setUat_in_progress(int uat_in_progress) {
		this.uat_in_progress = uat_in_progress;
	}

	public int getUat_no_run() {
		return uat_no_run;
	}

	public void setUat_no_run(int uat_no_run) {
		this.uat_no_run = uat_no_run;
	}

	public int getUat_not_available() {
		return uat_not_available;
	}

	public void setUat_not_available(int uat_not_available) {
		this.uat_not_available = uat_not_available;
	}

	public int getUat_total() {
		return uat_total;
	}

	public void setUat_total(int uat_total) {
		this.uat_total = uat_total;
	}

	public String getUat_percentage_completion() {
		return uat_percentage_completion;
	}

	public void setUat_percentage_completion(String uat_percentage_completion) {
		this.uat_percentage_completion = uat_percentage_completion;
	}

	public String getUat_expected_percent() {
		return uat_expected_percent;
	}

	public void setUat_expected_percent(String uat_expected_percent) {
		this.uat_expected_percent = uat_expected_percent;
	}

	@Override
	public String toString() {
		return "TestExecutionUAT [test_execution_id=" + test_execution_id
				+ ", uat_pass=" + uat_pass + ", uat_fail=" + uat_fail
				+ ", uat_blocked=" + uat_blocked + ", uat_in_progress="
				+ uat_in_progress + ", uat_no_run=" + uat_no_run
				+ ", uat_not_available=" + uat_not_available + ", uat_total="
				+ uat_total + ", uat_percentage_completion="
				+ uat_percentage_completion + ", uat_expected_percent="
				+ uat_expected_percent + "]";
	}

}
