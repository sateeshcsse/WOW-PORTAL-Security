package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "rootcause_uat")
@Table(name = "rootcause_uat")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
@JsonIgnoreProperties(ignoreUnknown = true)
public class RootCauseUAT {

	@Id
	@Column(name = "unique_id")
	private int unique_id;

	@Column(name = "uat_code_caused_by_earlier_fix")
	private int uat_code_caused_by_earlier_fix;

	@Column(name = "uat_code_data_handling")
	private int uat_code_data_handling;

	@Column(name = "uat_code_database_design")
	private int uat_code_database_design;

	@Column(name = "uat_code_exists_in_prod")
	private int uat_code_exists_in_prod;

	@Column(name = "uat_code_login_error")
	private int uat_code_login_error;

	@Column(name = "uat_code_program_code_error")
	private int uat_code_program_code_error;

	@Column(name = "uat_code_security")
	private int uat_code_security;

	@Column(name = "uat_code_standards_compliance")
	private int uat_code_standards_compliance;

	@Column(name = "uat_data_configuration_error")
	private int uat_data_configuration_error;

	@Column(name = "uat_data_problem")
	private int uat_data_problem;

	@Column(name = "uat_doc_ambiguity")
	private int uat_doc_ambiguity;

	@Column(name = "uat_doc_business_rq_problem")
	private int uat_doc_business_rq_problem;

	@Column(name = "uat_doc_functional_spec_problem")
	private int uat_doc_functional_spec_problem;

	@Column(name = "uat_doc_solution_design_problem")
	private int uat_doc_solution_design_problem;

	@Column(name = "uat_doc_as_per_design")
	private int uat_doc_as_per_design;

	@Column(name = "uat_doc_standards_non_conformance")
	private int uat_doc_standards_non_conformance;

	@Column(name = "uat_doc_technical_spec_problem")
	private int uat_doc_technical_spec_problem;

	@Column(name = "uat_doc_test_script_problem")
	private int uat_doc_test_script_problem;

	@Column(name = "uat_env_environment_problem")
	private int uat_env_environment_problem;

	@Column(name = "uat_env_installation_error")
	private int uat_env_installation_error;

	@Column(name = "uat_env_interface_timing_problem")
	private int uat_env_interface_timing_problem;

	@Column(name = "uat_env_interop_compatability")
	private int uat_env_interop_compatability;

	@Column(name = "uat_env_performance_problem")
	private int uat_env_performance_problem;

	@Column(name = "uat_env_scheduling_error")
	private int uat_env_scheduling_error;

	@Column(name = "uat_other_duplicate_defect")
	private int uat_other_duplicate_defect;

	@Column(name = "uat_other_not_a_defect")
	private int uat_other_not_a_defect;

	public int getUnique_id() {
		return unique_id;
	}

	public void setUnique_id(int unique_id) {
		this.unique_id = unique_id;
	}

	public int getUat_code_caused_by_earlier_fix() {
		return uat_code_caused_by_earlier_fix;
	}

	public void setUat_code_caused_by_earlier_fix(
			int uat_code_caused_by_earlier_fix) {
		this.uat_code_caused_by_earlier_fix = uat_code_caused_by_earlier_fix;
	}

	public int getUat_code_data_handling() {
		return uat_code_data_handling;
	}

	public void setUat_code_data_handling(int uat_code_data_handling) {
		this.uat_code_data_handling = uat_code_data_handling;
	}

	public int getUat_code_database_design() {
		return uat_code_database_design;
	}

	public void setUat_code_database_design(int uat_code_database_design) {
		this.uat_code_database_design = uat_code_database_design;
	}

	public int getUat_code_exists_in_prod() {
		return uat_code_exists_in_prod;
	}

	public void setUat_code_exists_in_prod(int uat_code_exists_in_prod) {
		this.uat_code_exists_in_prod = uat_code_exists_in_prod;
	}

	public int getUat_code_login_error() {
		return uat_code_login_error;
	}

	public void setUat_code_login_error(int uat_code_login_error) {
		this.uat_code_login_error = uat_code_login_error;
	}

	public int getUat_code_program_code_error() {
		return uat_code_program_code_error;
	}

	public void setUat_code_program_code_error(int uat_code_program_code_error) {
		this.uat_code_program_code_error = uat_code_program_code_error;
	}

	public int getUat_code_security() {
		return uat_code_security;
	}

	public void setUat_code_security(int uat_code_security) {
		this.uat_code_security = uat_code_security;
	}

	public int getUat_code_standards_compliance() {
		return uat_code_standards_compliance;
	}

	public void setUat_code_standards_compliance(
			int uat_code_standards_compliance) {
		this.uat_code_standards_compliance = uat_code_standards_compliance;
	}

	public int getUat_data_configuration_error() {
		return uat_data_configuration_error;
	}

	public void setUat_data_configuration_error(int uat_data_configuration_error) {
		this.uat_data_configuration_error = uat_data_configuration_error;
	}

	public int getUat_data_problem() {
		return uat_data_problem;
	}

	public void setUat_data_problem(int uat_data_problem) {
		this.uat_data_problem = uat_data_problem;
	}

	public int getUat_doc_ambiguity() {
		return uat_doc_ambiguity;
	}

	public void setUat_doc_ambiguity(int uat_doc_ambiguity) {
		this.uat_doc_ambiguity = uat_doc_ambiguity;
	}

	public int getUat_doc_business_rq_problem() {
		return uat_doc_business_rq_problem;
	}

	public void setUat_doc_business_rq_problem(int uat_doc_business_rq_problem) {
		this.uat_doc_business_rq_problem = uat_doc_business_rq_problem;
	}

	public int getUat_doc_functional_spec_problem() {
		return uat_doc_functional_spec_problem;
	}

	public void setUat_doc_functional_spec_problem(
			int uat_doc_functional_spec_problem) {
		this.uat_doc_functional_spec_problem = uat_doc_functional_spec_problem;
	}

	public int getUat_doc_solution_design_problem() {
		return uat_doc_solution_design_problem;
	}

	public void setUat_doc_solution_design_problem(
			int uat_doc_solution_design_problem) {
		this.uat_doc_solution_design_problem = uat_doc_solution_design_problem;
	}

	public int getUat_doc_as_per_design() {
		return uat_doc_as_per_design;
	}

	public void setUat_doc_as_per_design(int uat_doc_as_per_design) {
		this.uat_doc_as_per_design = uat_doc_as_per_design;
	}

	public int getUat_doc_standards_non_conformance() {
		return uat_doc_standards_non_conformance;
	}

	public void setUat_doc_standards_non_conformance(
			int uat_doc_standards_non_conformance) {
		this.uat_doc_standards_non_conformance = uat_doc_standards_non_conformance;
	}

	public int getUat_doc_technical_spec_problem() {
		return uat_doc_technical_spec_problem;
	}

	public void setUat_doc_technical_spec_problem(
			int uat_doc_technical_spec_problem) {
		this.uat_doc_technical_spec_problem = uat_doc_technical_spec_problem;
	}

	public int getUat_doc_test_script_problem() {
		return uat_doc_test_script_problem;
	}

	public void setUat_doc_test_script_problem(int uat_doc_test_script_problem) {
		this.uat_doc_test_script_problem = uat_doc_test_script_problem;
	}

	public int getUat_env_environment_problem() {
		return uat_env_environment_problem;
	}

	public void setUat_env_environment_problem(int uat_env_environment_problem) {
		this.uat_env_environment_problem = uat_env_environment_problem;
	}

	public int getUat_env_installation_error() {
		return uat_env_installation_error;
	}

	public void setUat_env_installation_error(int uat_env_installation_error) {
		this.uat_env_installation_error = uat_env_installation_error;
	}

	public int getUat_env_interface_timing_problem() {
		return uat_env_interface_timing_problem;
	}

	public void setUat_env_interface_timing_problem(
			int uat_env_interface_timing_problem) {
		this.uat_env_interface_timing_problem = uat_env_interface_timing_problem;
	}

	public int getUat_env_interop_compatability() {
		return uat_env_interop_compatability;
	}

	public void setUat_env_interop_compatability(
			int uat_env_interop_compatability) {
		this.uat_env_interop_compatability = uat_env_interop_compatability;
	}

	public int getUat_env_performance_problem() {
		return uat_env_performance_problem;
	}

	public void setUat_env_performance_problem(int uat_env_performance_problem) {
		this.uat_env_performance_problem = uat_env_performance_problem;
	}

	public int getUat_env_scheduling_error() {
		return uat_env_scheduling_error;
	}

	public void setUat_env_scheduling_error(int uat_env_scheduling_error) {
		this.uat_env_scheduling_error = uat_env_scheduling_error;
	}

	public int getUat_other_duplicate_defect() {
		return uat_other_duplicate_defect;
	}

	public void setUat_other_duplicate_defect(int uat_other_duplicate_defect) {
		this.uat_other_duplicate_defect = uat_other_duplicate_defect;
	}

	public int getUat_other_not_a_defect() {
		return uat_other_not_a_defect;
	}

	public void setUat_other_not_a_defect(int uat_other_not_a_defect) {
		this.uat_other_not_a_defect = uat_other_not_a_defect;
	}

	@Override
	public String toString() {
		return "RootCauseUAT [unique_id=" + unique_id
				+ ", uat_code_caused_by_earlier_fix="
				+ uat_code_caused_by_earlier_fix + ", uat_code_data_handling="
				+ uat_code_data_handling + ", uat_code_database_design="
				+ uat_code_database_design + ", uat_code_exists_in_prod="
				+ uat_code_exists_in_prod + ", uat_code_login_error="
				+ uat_code_login_error + ", uat_code_program_code_error="
				+ uat_code_program_code_error + ", uat_code_security="
				+ uat_code_security + ", uat_code_standards_compliance="
				+ uat_code_standards_compliance
				+ ", uat_data_configuration_error="
				+ uat_data_configuration_error + ", uat_data_problem="
				+ uat_data_problem + ", uat_doc_ambiguity=" + uat_doc_ambiguity
				+ ", uat_doc_business_rq_problem="
				+ uat_doc_business_rq_problem
				+ ", uat_doc_functional_spec_problem="
				+ uat_doc_functional_spec_problem
				+ ", uat_doc_solution_design_problem="
				+ uat_doc_solution_design_problem + ", uat_doc_as_per_design="
				+ uat_doc_as_per_design
				+ ", uat_doc_standards_non_conformance="
				+ uat_doc_standards_non_conformance
				+ ", uat_doc_technical_spec_problem="
				+ uat_doc_technical_spec_problem
				+ ", uat_doc_test_script_problem="
				+ uat_doc_test_script_problem
				+ ", uat_env_environment_problem="
				+ uat_env_environment_problem + ", uat_env_installation_error="
				+ uat_env_installation_error
				+ ", uat_env_interface_timing_problem="
				+ uat_env_interface_timing_problem
				+ ", uat_env_interop_compatability="
				+ uat_env_interop_compatability
				+ ", uat_env_performance_problem="
				+ uat_env_performance_problem + ", uat_env_scheduling_error="
				+ uat_env_scheduling_error + ", uat_other_duplicate_defect="
				+ uat_other_duplicate_defect + ", uat_other_not_a_defect="
				+ uat_other_not_a_defect + "]";
	}

}
