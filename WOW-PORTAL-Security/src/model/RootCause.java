package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "rootcause")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
@JsonIgnoreProperties(ignoreUnknown = true)
public class RootCause {

	 @Id
		@Column(name="unique_id")
		private int unique_id;
		
		@Column(name="code_caused_by_earlier_fix")
		private int code_caused_by_earlier_fix=0;
		
		@Column(name="code_data_handling")
		private int code_data_handling=0;
		
		@Column(name="code_database_design")
		private int code_database_design=0;
		
		@Column(name="code_exists_in_prod")
		private int code_exists_in_prod=0;
		
		@Column(name="code_login_error")
		private int code_login_error=0;
		
		@Column(name="code_program_code_error")
		private int code_program_code_error=0;
		
		@Column(name="code_security")
		private int code_security=0;
		
		@Column(name="code_standards_compliance")
		private int code_standards_compliance=0;
		
		@Column(name="data_configuration_error")
		private int data_configuration_error=0;
		
		@Column(name="data_problem")
		private int data_problem=0;
		
		@Column(name="doc_ambiguity")
		private int doc_ambiguity=0;
		
		@Column(name="doc_business_rq_problem")
		private int doc_business_rq_problem=0;
		
		@Column(name="doc_functional_spec_problem")
		private int doc_functional_spec_problem=0;
		
		@Column(name="doc_solution_design_problem")
		private int doc_solution_design_problem=0;
		
		@Column(name="doc_as_per_design")
		private int doc_as_per_design=0;
		
		@Column(name="doc_standards_non_conformance")
		private int doc_standards_non_conformance=0;
		
		@Column(name="doc_technical_spec_problem")
		private int doc_technical_spec_problem=0;
		
		@Column(name="doc_test_script_problem")
		private int doc_test_script_problem=0;
		
		@Column(name="env_environment_problem")
		private int env_environment_problem=0;
		
		@Column(name="env_installation_error")
		private int env_installation_error=0;
		
		@Column(name="env_interface_timing_problem")
		private int env_interface_timing_problem=0;
		
		@Column(name="env_interop_compatability")
		private int env_interop_compatability=0;
		
		@Column(name="env_performance_problem")
		private int env_performance_problem=0;
		
		@Column(name="env_scheduling_error")
		private int env_scheduling_error=0;
		
		
		@Column(name="other_duplicate_defect")
		private int other_duplicate_defect=0;
		
		@Column(name="other_not_a_defect")
		private int other_not_a_defect=0;
		
		@Column(name="data_others")
		private int data_others=0;
		
		@Column(name="other_others")
		private int other_others=0;
		
		@Column(name="doc_others")
		private int doc_others=0;
		
		@Column(name="env_others")
		private int env_others=0;
		
		@Column(name="code_others")
		private int code_others=0;
		
		@Column(name="req_others")
		private int req_others=0;
		
		@Column(name="scr_others")
		private int scr_others=0;
		

		@Column(name="req_new_requirement")
		private int req_new_requirement=0;
		
		@Column(name="req_incomplete")
		private int req_incomplete=0;
		
		@Column(name="req_changed_requirement")
		private int req_changed_requirement=0;
		
		@Column(name="scr_incomplete_test_script")
		private int scr_incomplete_test_script=0;
		
		@Column(name="scr_incorrect_test_script")
		private int scr_incorrect_test_script=0;
		
		@Column(name="other_not_reproducible")
		private int other_not_reproducible=0;
		
		@Column(name="other_exists_in_production")
		private int other_exists_in_production=0;
		
		@Column(name="other_query")
		private int other_query=0;
		
		@Column(name="env_cutover_issues")
		private int env_cutover_issues=0;
		
		@Column(name="env_inadequeate_infrastructure")
		private int env_inadequeate_infrastructure=0;
		            
		
		@Column(name="env_Access_limitation")
		private int env_Access_limitation=0;
		
		@Column(name="env_network")
		private int env_network=0;
		
		@Column(name="env_integration")
		private int env_integration=0;
		
		@Column(name="env_hardware_issues")
		private int env_hardware_issues=0;
		
		@Column(name="doc_architecture_issues")
		private int doc_architecture_issues=0;
		
		@Column(name="doc_functional_design_gap")
		private int doc_functional_design_gap=0;
		
		@Column(name="doc_design_error")
		private int doc_design_error=0;
		
		@Column(name="doc_design_change")
		private int doc_design_change=0;
		
		@Column(name="data_incorrect_setup")
		private int data_incorrect_setup=0;
		
		@Column(name="data_corrupted")
		private int data_corrupted=0;
		
		@Column(name="code_logic_error")
		private int code_logic_error=0;
		
		@Column(name="code_exception_handling")
		private int code_exception_handling=0;
		
		@Column(name="code_code_not_delivered")
		private int code_code_not_delivered=0;
		
		@Column(name="code_application_installation_error")
		private int code_application_installation_error=0;
		
		@Column(name="code_security_code_compilance")
		private int code_security_code_compilance=0;
		
		
		
		
		
		
	public int getData_others() {
			return data_others;
		}
		public void setData_others(int data_others) {
			this.data_others = data_others;
		}
		public int getOther_others() {
			return other_others;
		}
		public void setOther_others(int other_others) {
			this.other_others = other_others;
		}
		public int getDoc_others() {
			return doc_others;
		}
		public void setDoc_others(int doc_others) {
			this.doc_others = doc_others;
		}
		public int getEnv_others() {
			return env_others;
		}
		public void setEnv_others(int env_others) {
			this.env_others = env_others;
		}
		public int getCode_others() {
			return code_others;
		}
		public void setCode_others(int code_others) {
			this.code_others = code_others;
		}
		public int getReq_others() {
			return req_others;
		}
		public void setReq_others(int req_others) {
			this.req_others = req_others;
		}
		public int getScr_others() {
			return scr_others;
		}
		public void setScr_others(int scr_others) {
			this.scr_others = scr_others;
		}
	@Override
	public String toString() {
		return "Rootcause [unique_id=" + unique_id + ", code_caused_by_earlier_fix=" + code_caused_by_earlier_fix
				+ ", code_data_handling=" + code_data_handling + ", code_database_design=" + code_database_design
				+ ", code_exists_in_prod=" + code_exists_in_prod + ", code_login_error=" + code_login_error
				+ ", code_program_code_error=" + code_program_code_error + ", code_security=" + code_security
				+ ", code_standards_compliance=" + code_standards_compliance + ", data_configuration_error="
				+ data_configuration_error + ", data_problem=" + data_problem + ", doc_ambiguity=" + doc_ambiguity
				+ ", doc_business_rq_problem=" + doc_business_rq_problem + ", doc_functional_spec_problem="
				+ doc_functional_spec_problem + ", doc_solution_design_problem=" + doc_solution_design_problem
				+ ", doc_as_per_design=" + doc_as_per_design + ", doc_standards_non_conformance="
				+ doc_standards_non_conformance + ", doc_technical_spec_problem=" + doc_technical_spec_problem
				+ ", doc_test_script_problem=" + doc_test_script_problem + ", env_environment_problem="
				+ env_environment_problem + ", env_installation_error=" + env_installation_error
				+ ", env_interface_timing_problem=" + env_interface_timing_problem + ", env_interop_compatability="
				+ env_interop_compatability + ", env_performance_problem=" + env_performance_problem
				+ ", env_scheduling_error=" + env_scheduling_error + ", other_duplicate_defect=" + other_duplicate_defect
				+ ", other_not_a_defect=" + other_not_a_defect + "]";
	}
	public int getUnique_id() {
		return unique_id;
	}
	public void setUnique_id(int unique_id) {
		this.unique_id = unique_id;
	}
	public int getCode_caused_by_earlier_fix() {
		return code_caused_by_earlier_fix;
	}
	public void setCode_caused_by_earlier_fix(int code_caused_by_earlier_fix) {
		this.code_caused_by_earlier_fix = code_caused_by_earlier_fix;
	}
	public int getCode_data_handling() {
		return code_data_handling;
	}
	public void setCode_data_handling(int code_data_handling) {
		this.code_data_handling = code_data_handling;
	}
	public int getCode_database_design() {
		return code_database_design;
	}
	public void setCode_database_design(int code_database_design) {
		this.code_database_design = code_database_design;
	}
	public int getCode_exists_in_prod() {
		return code_exists_in_prod;
	}
	public void setCode_exists_in_prod(int code_exists_in_prod) {
		this.code_exists_in_prod = code_exists_in_prod;
	}
	public int getCode_login_error() {
		return code_login_error;
	}
	public void setCode_login_error(int code_login_error) {
		this.code_login_error = code_login_error;
	}
	public int getCode_program_code_error() {
		return code_program_code_error;
	}
	public void setCode_program_code_error(int code_program_code_error) {
		this.code_program_code_error = code_program_code_error;
	}
	public int getCode_security() {
		return code_security;
	}
	public void setCode_security(int code_security) {
		this.code_security = code_security;
	}
	public int getCode_standards_compliance() {
		return code_standards_compliance;
	}
	public void setCode_standards_compliance(int code_standards_compliance) {
		this.code_standards_compliance = code_standards_compliance;
	}
	public int getData_configuration_error() {
		return data_configuration_error;
	}
	public void setData_configuration_error(int data_configuration_error) {
		this.data_configuration_error = data_configuration_error;
	}
	public int getData_problem() {
		return data_problem;
	}
	public void setData_problem(int data_problem) {
		this.data_problem = data_problem;
	}
	public int getDoc_ambiguity() {
		return doc_ambiguity;
	}
	public void setDoc_ambiguity(int doc_ambiguity) {
		this.doc_ambiguity = doc_ambiguity;
	}
	public int getDoc_business_rq_problem() {
		return doc_business_rq_problem;
	}
	public void setDoc_business_rq_problem(int doc_business_rq_problem) {
		this.doc_business_rq_problem = doc_business_rq_problem;
	}
	public int getDoc_functional_spec_problem() {
		return doc_functional_spec_problem;
	}
	public void setDoc_functional_spec_problem(int doc_functional_spec_problem) {
		this.doc_functional_spec_problem = doc_functional_spec_problem;
	}
	public int getDoc_solution_design_problem() {
		return doc_solution_design_problem;
	}
	public void setDoc_solution_design_problem(int doc_solution_design_problem) {
		this.doc_solution_design_problem = doc_solution_design_problem;
	}
	public int getDoc_as_per_design() {
		return doc_as_per_design;
	}
	public void setDoc_as_per_design(int doc_as_per_design) {
		this.doc_as_per_design = doc_as_per_design;
	}
	public int getDoc_standards_non_conformance() {
		return doc_standards_non_conformance;
	}
	public void setDoc_standards_non_conformance(int doc_standards_non_conformance) {
		this.doc_standards_non_conformance = doc_standards_non_conformance;
	}
	public int getDoc_technical_spec_problem() {
		return doc_technical_spec_problem;
	}
	public void setDoc_technical_spec_problem(int doc_technical_spec_problem) {
		this.doc_technical_spec_problem = doc_technical_spec_problem;
	}
	public int getDoc_test_script_problem() {
		return doc_test_script_problem;
	}
	public void setDoc_test_script_problem(int doc_test_script_problem) {
		this.doc_test_script_problem = doc_test_script_problem;
	}
	public int getEnv_environment_problem() {
		return env_environment_problem;
	}
	public void setEnv_environment_problem(int env_environment_problem) {
		this.env_environment_problem = env_environment_problem;
	}
	public int getEnv_installation_error() {
		return env_installation_error;
	}
	public void setEnv_installation_error(int env_installation_error) {
		this.env_installation_error = env_installation_error;
	}
	public int getEnv_interface_timing_problem() {
		return env_interface_timing_problem;
	}
	public void setEnv_interface_timing_problem(int env_interface_timing_problem) {
		this.env_interface_timing_problem = env_interface_timing_problem;
	}
	public int getEnv_interop_compatability() {
		return env_interop_compatability;
	}
	public void setEnv_interop_compatability(int env_interop_compatability) {
		this.env_interop_compatability = env_interop_compatability;
	}
	public int getEnv_performance_problem() {
		return env_performance_problem;
	}
	public void setEnv_performance_problem(int env_performance_problem) {
		this.env_performance_problem = env_performance_problem;
	}
	public int getEnv_scheduling_error() {
		return env_scheduling_error;
	}
	public void setEnv_scheduling_error(int env_scheduling_error) {
		this.env_scheduling_error = env_scheduling_error;
	}
	public int getOther_duplicate_defect() {
		return other_duplicate_defect;
	}
	public void setOther_duplicate_defect(int other_duplicate_defect) {
		this.other_duplicate_defect = other_duplicate_defect;
	}
	public int getOther_not_a_defect() {
		return other_not_a_defect;
	}
	public void setOther_not_a_defect(int other_not_a_defect) {
		this.other_not_a_defect = other_not_a_defect;
	}
	public int getReq_new_requirement() {
		return req_new_requirement;
	}
	public void setReq_new_requirement(int req_new_requirement) {
		this.req_new_requirement = req_new_requirement;
	}
	public int getReq_incomplete() {
		return req_incomplete;
	}
	public void setReq_incomplete(int req_incomplete) {
		this.req_incomplete = req_incomplete;
	}
	public int getReq_changed_requirement() {
		return req_changed_requirement;
	}
	public void setReq_changed_requirement(int req_changed_requirement) {
		this.req_changed_requirement = req_changed_requirement;
	}
	public int getScr_incomplete_test_script() {
		return scr_incomplete_test_script;
	}
	public void setScr_incomplete_test_script(int scr_incomplete_test_script) {
		this.scr_incomplete_test_script = scr_incomplete_test_script;
	}
	public int getScr_incorrect_test_script() {
		return scr_incorrect_test_script;
	}
	public void setScr_incorrect_test_script(int scr_incorrect_test_script) {
		this.scr_incorrect_test_script = scr_incorrect_test_script;
	}
	public int getOther_not_reproducible() {
		return other_not_reproducible;
	}
	public void setOther_not_reproducible(int other_not_reproducible) {
		this.other_not_reproducible = other_not_reproducible;
	}
	public int getOther_exists_in_production() {
		return other_exists_in_production;
	}
	public void setOther_exists_in_production(int other_exists_in_production) {
		this.other_exists_in_production = other_exists_in_production;
	}
	public int getEnv_cutover_issues() {
		return env_cutover_issues;
	}
	public void setEnv_cutover_issues(int env_cutover_issues) {
		this.env_cutover_issues = env_cutover_issues;
	}
	
	public int getEnv_inadequeate_infrastructure() {
		return env_inadequeate_infrastructure;
	}
	public void setEnv_inadequeate_infrastructure(int env_inadequeate_infrastructure) {
		this.env_inadequeate_infrastructure = env_inadequeate_infrastructure;
	}
	public int getEnv_Access_limitation() {
		return env_Access_limitation;
	}
	public void setEnv_Access_limitation(int env_Access_limitation) {
		this.env_Access_limitation = env_Access_limitation;
	}
	public int getEnv_network() {
		return env_network;
	}
	public void setEnv_network(int env_network) {
		this.env_network = env_network;
	}
	public int getEnv_integration() {
		return env_integration;
	}
	public void setEnv_integration(int env_integration) {
		this.env_integration = env_integration;
	}
	public int getEnv_hardware_issues() {
		return env_hardware_issues;
	}
	public void setEnv_hardware_issues(int env_hardware_issues) {
		this.env_hardware_issues = env_hardware_issues;
	}
	public int getDoc_architecture_issues() {
		return doc_architecture_issues;
	}
	public void setDoc_architecture_issues(int doc_architecture_issues) {
		this.doc_architecture_issues = doc_architecture_issues;
	}
	public int getDoc_functional_design_gap() {
		return doc_functional_design_gap;
	}
	public void setDoc_functional_design_gap(int doc_functional_design_gap) {
		this.doc_functional_design_gap = doc_functional_design_gap;
	}
	public int getDoc_design_error() {
		return doc_design_error;
	}
	public void setDoc_design_error(int doc_design_error) {
		this.doc_design_error = doc_design_error;
	}
	public int getDoc_design_change() {
		return doc_design_change;
	}
	public void setDoc_design_change(int doc_design_change) {
		this.doc_design_change = doc_design_change;
	}
	public int getData_incorrect_setup() {
		return data_incorrect_setup;
	}
	public void setData_incorrect_setup(int data_incorrect_setup) {
		this.data_incorrect_setup = data_incorrect_setup;
	}
	public int getCode_logic_error() {
		return code_logic_error;
	}
	public void setCode_logic_error(int code_logic_error) {
		this.code_logic_error = code_logic_error;
	}
	public int getCode_exception_handling() {
		return code_exception_handling;
	}
	public void setCode_exception_handling(int code_exception_handling) {
		this.code_exception_handling = code_exception_handling;
	}

	public int getCode_code_not_delivered() {
		return code_code_not_delivered;
	}
	public void setCode_code_not_delivered(int code_code_not_delivered) {
		this.code_code_not_delivered = code_code_not_delivered;
	}
	public int getCode_application_installation_error() {
		return code_application_installation_error;
	}
	public void setCode_application_installation_error(int code_application_installation_error) {
		this.code_application_installation_error = code_application_installation_error;
	}
	public int getCode_security_code_compilance() {
		return code_security_code_compilance;
	}
	public void setCode_security_code_compilance(int code_security_code_compilance) {
		this.code_security_code_compilance = code_security_code_compilance;
	}
	public int getOther_query() {
		return other_query;
	}
	public void setOther_query(int other_query) {
		this.other_query = other_query;
	}
	public int getData_corrupted() {
		return data_corrupted;
	}
	public void setData_corrupted(int data_corrupted) {
		this.data_corrupted = data_corrupted;
	}
}
