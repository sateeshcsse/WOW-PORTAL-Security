package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "test_execution_main")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
@JsonIgnoreProperties(ignoreUnknown = true)
public class TestExecutionMain {

	@Id
	@Column(name = "test_execution_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	@GenericGenerator(name = "increment", strategy = "increment")
	private int test_execution_id;

	@Column(name = "unique_id")
	private int unique_id;

	@Column(name = "release_name")
	private String release_name;

	@Column(name = "release_iteration_name")
	private String release_iteration_name;

	@Column(name = "cycle_name")
	private String cycle_name;

	@Column(name = "suite_name")
	private String suite_name;

	@Column(name = "release_iteration_start_date")
	private String release_iteration_start_date;

	@Column(name = "release_iteration_end_date")
	private String release_iteration_end_date;

	@Override
	public String toString() {
		return "TestExecutionMain [test_execution_id=" + test_execution_id
				+ ", unique_id=" + unique_id + ", release_name=" + release_name
				+ ", release_iteration_name=" + release_iteration_name
				+ ", cycle_name=" + cycle_name + ", suite_name=" + suite_name
				+ ", release_iteration_start_date="
				+ release_iteration_start_date
				+ ", release_iteration_end_date=" + release_iteration_end_date
				+ "]";
	}

	public String getRelease_iteration_start_date() {
		return release_iteration_start_date;
	}

	public void setRelease_iteration_start_date(
			String release_iteration_start_date) {
		this.release_iteration_start_date = release_iteration_start_date;
	}

	public String getRelease_iteration_end_date() {
		return release_iteration_end_date;
	}

	public void setRelease_iteration_end_date(String release_iteration_end_date) {
		this.release_iteration_end_date = release_iteration_end_date;
	}

	public int getTest_execution_id() {
		return test_execution_id;
	}

	public void setTest_execution_id(int test_execution_id) {
		this.test_execution_id = test_execution_id;
	}

	public int getUnique_id() {
		return unique_id;
	}

	public void setUnique_id(int unique_id) {
		this.unique_id = unique_id;
	}

	public String getRelease_name() {
		return release_name;
	}

	public void setRelease_name(String release_name) {
		this.release_name = release_name;
	}

	public String getRelease_iteration_name() {
		return release_iteration_name;
	}

	public void setRelease_iteration_name(String release_iteration_name) {
		this.release_iteration_name = release_iteration_name;
	}

	public String getCycle_name() {
		return cycle_name;
	}

	public void setCycle_name(String cycle_name) {
		this.cycle_name = cycle_name;
	}

	public String getSuite_name() {
		return suite_name;
	}

	public void setSuite_name(String suite_name) {
		this.suite_name = suite_name;
	}

}
