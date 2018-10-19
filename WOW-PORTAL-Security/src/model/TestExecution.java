package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "testexecution")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
@JsonIgnoreProperties(ignoreUnknown = true)
public class TestExecution {

	@Id
	@Column(name = "test_execution_id")
	private int test_execution_id;

	@Column(name = "pass")
	private int pass;

	@Column(name = "fail")
	private int fail;

	@Column(name = "blocked")
	private int blocked;

	@Column(name = "in_progress")
	private int in_progress;

	@Column(name = "no_run")
	private int no_run;

	@Column(name = "not_available")
	private int not_available;

	@Column(name = "total")
	private int total;

	@Column(name = "percentage_completion")
	private String percentage_completion;

	@Column(name = "expected_percent")
	private String expected_percent;

	public String getPercentage_completion() {
		return percentage_completion;
	}

	public void setPercentage_completion(String percentage_completion) {
		this.percentage_completion = percentage_completion;
	}

	public String getExpected_percent() {
		return expected_percent;
	}

	public void setExpected_percent(String expected_percent) {
		this.expected_percent = expected_percent;
	}

	public int getTest_execution_id() {
		return test_execution_id;
	}

	public void setTest_execution_id(int test_execution_id) {
		this.test_execution_id = test_execution_id;
	}

	public int getPass() {
		return pass;
	}

	public void setPass(int pass) {
		this.pass = pass;
	}

	public int getFail() {
		return fail;
	}

	public void setFail(int fail) {
		this.fail = fail;
	}

	public int getBlocked() {
		return blocked;
	}

	public void setBlocked(int blocked) {
		this.blocked = blocked;
	}

	public int getIn_progress() {
		return in_progress;
	}

	public void setIn_progress(int in_progress) {
		this.in_progress = in_progress;
	}

	public int getNo_run() {
		return no_run;
	}

	public void setNo_run(int no_run) {
		this.no_run = no_run;
	}

	public int getNot_available() {
		return not_available;
	}

	public void setNot_available(int not_available) {
		this.not_available = not_available;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "TestExecution [test_execution_id=" + test_execution_id
				+ ", pass=" + pass + ", fail=" + fail + ", blocked=" + blocked
				+ ", in_progress=" + in_progress + ", no_run=" + no_run
				+ ", not_available=" + not_available + ", total=" + total
				+ ", percentage_completion=" + percentage_completion
				+ ", expected_percent=" + expected_percent + "]";
	}

}
