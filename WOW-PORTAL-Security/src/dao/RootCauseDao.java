package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.stereotype.Repository;


@Repository
public class RootCauseDao {

	
	//To get RCA Values for all the Portfolios
	public List getRCAValuesPort() {
		
		System.out.println("In DAO to get RCA Values for all portfolios");
		Session session = HibernateConnection.openConnection()
				.openSession();
	
		
//		Query getProjects = session.createSQLQuery("select w.portfolio as portfolio, "				
//				+ "sum(r.req_incomplete) + sum(r.req_changed_requirement) + sum(r.req_new_requirement) "
//				+ "+ sum(code_database_design) + sum(data_configuration_error) as req, "
//				+ "sum(r.doc_architecture_issues) + sum(r.doc_functional_design_gap) + "
//				+ "sum(r.doc_design_change) + sum(r.doc_design_error) as doc, "
//				+ "sum(r.code_logic_error) "
//				+ " + sum(r.code_standards_compliance) + sum(r.code_exception_handling) + "
//				+ "sum(r.code_code_not_delivered) + sum(r.code_application_installation_error) + "
//				+ "sum(r.code_security_code_compilance) + sum(code_caused_by_earlier_fix)  as code, "
//				+ "sum(r.data_incorrect_setup) + sum(r.data_corrupted) + sum(doc_technical_spec_problem)  as data_rac, "
//				+ "sum(r.env_installation_error) + sum(r.env_cutover_issues) + "
//				+ "sum(r.env_inadequeate_infrastructure) + sum(r.env_access_limitation) + "
//				+ "sum(r.env_network) + sum(r.env_integration) + sum(r.env_hardware_issues) + sum(doc_functional_spec_problem) as env, "
//				+ "sum(r.scr_incorrect_test_script) + sum(r.scr_incomplete_test_script) as Scr, "
//				+ "sum(r.other_duplicate_defect) + sum(r.other_query) + sum(r.other_not_reproducible) + "
//				+ "sum(r.other_exists_in_production) + sum(code_others) + sum(env_others) + sum(doc_others) "
//				+ "+ sum(scr_others) + sum(data_others) + sum(other_others) "
//				+ " + sum(env_environment_problem) + sum(doc_test_script_problem) as Other "
//				+ "from rootcause r, wowmain w where w.unique_id = r.unique_id and "
//				+ "STR_TO_DATE(golivedate, '%d/%m/%Y') < CURDATE() and "
//				+ "STR_TO_DATE(golivedate, '%d/%m/%Y') != '0000-00-00' group by portfolio ");
		
		Query getProjects = session.createSQLQuery("select s.portfolio, "
				+ "sum(rc.sit_req) + sum(rc.uat_req) + sum(rc.prod_req) as Requirement, "
				+ "sum(rc.sit_design) + sum(rc.uat_design) + sum(rc.prod_design) as Design, "
				+ " sum(rc.sit_code) + sum(rc.uat_code) + sum(rc.prod_code) as SCode, "
				+ "sum(rc.sit_data) + sum(rc.uat_data) + sum(rc.prod_data) as RData, "
				+ "sum(rc.sit_environment) + sum(rc.uat_environment) +sum(rc.prod_environment) as Environment, "
				+ "sum(rc.sit_test_script) + sum(rc.uat_test_script) + sum(rc.prod_test_script) as Test_Script, "
				+ "sum(rc.sit_exist_prod) + sum(rc.sit_exist_prod) +sum(rc.sit_exist_prod) as Exist_prod, "
				+ "sum(rc.sit_others) + sum(rc.uat_others) + sum(rc.prod_others) as Others "
				+ "from sla_root_cause rc, sla s where s.root_id = rc.root_id group by s.portfolio order by s.portfolio");
				
		
		
		
		
		List<Object[]> list = getProjects.list();
		
		
		
		
		//System.out.println(list);
				
		return list;
		
		//return null;
	}

	public List getRCAProjforPort(String portfolio) {
		
		System.out.println("In DAO to get RCA Values for all portfolios");
		Session session = HibernateConnection.openConnection()
				.openSession();

		
//		Query getProjects = session.createSQLQuery("select w.project, "
//				+ "sum(r.req_incomplete) + sum(r.req_changed_requirement) + sum(r.req_new_requirement) "
//				+ "+ sum(code_database_design) + sum(data_configuration_error) as req, "
//				+ "sum(r.doc_architecture_issues) + sum(r.doc_functional_design_gap) + "
//				+ "sum(r.doc_design_change) + sum(r.doc_design_error) as doc, "
//				+ "sum(r.code_logic_error) "
//				+ " + sum(r.code_standards_compliance) + sum(r.code_exception_handling) + "
//				+ "sum(r.code_code_not_delivered) + sum(r.code_application_installation_error) + "
//				+ "sum(r.code_security_code_compilance) + sum(code_caused_by_earlier_fix)  as code, "
//				+ "sum(r.data_incorrect_setup) + sum(r.data_corrupted) + sum(doc_technical_spec_problem)  as data_rac, "
//				+ "sum(r.env_installation_error) + sum(r.env_cutover_issues) + "
//				+ "sum(r.env_inadequeate_infrastructure) + sum(r.env_access_limitation) + "
//				+ "sum(r.env_network) + sum(r.env_integration) + sum(r.env_hardware_issues) + sum(doc_functional_spec_problem) as env, "
//				+ "sum(r.scr_incorrect_test_script) + sum(r.scr_incomplete_test_script) as Scr, "
//				+ "sum(r.other_duplicate_defect) + sum(r.other_query) + sum(r.other_not_reproducible) + "
//				+ "sum(r.other_exists_in_production) + sum(code_others) + sum(env_others) + sum(doc_others) "
//				+ "+ sum(scr_others) + sum(data_others) + sum(other_others) "
//				+ " + sum(env_environment_problem) + sum(doc_test_script_problem) as Other "
//				+ "from rootcause r, wowmain w where w.unique_id = r.unique_id and STR_TO_DATE(golivedate, '%d/%m/%Y') < CURDATE() "
//				+ "and STR_TO_DATE(golivedate, '%d/%m/%Y') != '0000-00-00' and w.portfolio = ? "
//				+ "group by project order by portfolio");
		
		Query getProjects = session.createSQLQuery("select s.project, "
				+ "sum(rc.sit_req) + sum(rc.uat_req) + sum(rc.prod_req) as Requirement, "
				+ "sum(rc.sit_design) + sum(rc.uat_design) + sum(rc.prod_design) as Design, "
				+ " sum(rc.sit_code) + sum(rc.uat_code) + sum(rc.prod_code) as SCode, "
				+ "sum(rc.sit_data) + sum(rc.uat_data) + sum(rc.prod_data) as RData, "
				+ "sum(rc.sit_environment) + sum(rc.uat_environment) +sum(rc.prod_environment) as Environment, "
				+ "sum(rc.sit_test_script) + sum(rc.uat_test_script) + sum(rc.prod_test_script) as Test_Script, "
				+ "sum(rc.sit_exist_prod) + sum(rc.sit_exist_prod) +sum(rc.sit_exist_prod) as Exist_prod, "
				+ "sum(rc.sit_others) + sum(rc.uat_others) + sum(rc.prod_others) as Others "
				+ "from sla_root_cause rc, sla s where s.root_id = rc.root_id and s.portfolio = ? group by s.project order by s.portfolio");
			
				
		
		getProjects.setParameter(0, portfolio);
		
		List<String> list = getProjects.list();
		System.out.println(list);
		return list;
		
		
		
	}
	
public List getRCAProjdetails(String project) {
		
		System.out.println("In DAO to get RCA Values for Specific Project");
		Session session = HibernateConnection.openConnection()
				.openSession();
		
//		Query getProjects = session.createSQLQuery("select w.project, "
//				+ "sum(r.req_incomplete) + sum(r.req_changed_requirement) + sum(r.req_new_requirement) "
//				+ "+ sum(code_database_design) + sum(data_configuration_error) as req, "
//				+ "sum(r.doc_architecture_issues) + sum(r.doc_functional_design_gap) + "
//				+ "sum(r.doc_design_change) + sum(r.doc_design_error) as doc, "
//				+ "sum(r.code_logic_error) "
//				+ " + sum(r.code_standards_compliance) + sum(r.code_exception_handling) + "
//				+ "sum(r.code_code_not_delivered) + sum(r.code_application_installation_error) + "
//				+ "sum(r.code_security_code_compilance) + sum(code_caused_by_earlier_fix)  as code, "
//				+ "sum(r.data_incorrect_setup) + sum(r.data_corrupted) + sum(doc_technical_spec_problem)  as data_rac, "
//				+ "sum(r.env_installation_error) + sum(r.env_cutover_issues) + "
//				+ "sum(r.env_inadequeate_infrastructure) + sum(r.env_access_limitation) + "
//				+ "sum(r.env_network) + sum(r.env_integration) + sum(r.env_hardware_issues) + sum(doc_functional_spec_problem) as env, "
//				+ "sum(r.scr_incorrect_test_script) + sum(r.scr_incomplete_test_script) as Scr, "
//				+ "sum(r.other_duplicate_defect) + sum(r.other_query) + sum(r.other_not_reproducible) + "
//				+ "sum(r.other_exists_in_production) + sum(code_others) + sum(env_others) + sum(doc_others) "
//				+ "+ sum(scr_others) + sum(data_others) + sum(other_others) "
//				+ " + sum(env_environment_problem) + sum(doc_test_script_problem) as Other "
//				+ "from rootcause r, wowmain w where w.unique_id = r.unique_id and STR_TO_DATE(golivedate, '%d/%m/%Y') < CURDATE() "
//				+ "and STR_TO_DATE(golivedate, '%d/%m/%Y') != '0000-00-00' and w.project = ? "
//				+ "group by project order by portfolio");
		
		Query getProjects = session.createSQLQuery("select s.project , "
				+ "sum(rc.sit_req) + sum(rc.uat_req) + sum(rc.prod_req) as Requirement, "
				+ "sum(rc.sit_design) + sum(rc.uat_design) + sum(rc.prod_design) as Design, "
				+ " sum(rc.sit_code) + sum(rc.uat_code) + sum(rc.prod_code) as SCode, "
				+ "sum(rc.sit_data) + sum(rc.uat_data) + sum(rc.prod_data) as RData, "
				+ "sum(rc.sit_environment) + sum(rc.uat_environment) +sum(rc.prod_environment) as Environment, "
				+ "sum(rc.sit_test_script) + sum(rc.uat_test_script) + sum(rc.prod_test_script) as Test_Script, "
				+ "sum(rc.sit_exist_prod) + sum(rc.sit_exist_prod) +sum(rc.sit_exist_prod) as Exist_prod, "
				+ "sum(rc.sit_others) + sum(rc.uat_others) + sum(rc.prod_others) as Others "
				+ "from sla_root_cause rc, sla s where s.root_id = rc.root_id and s.project = ? ");
		
		getProjects.setParameter(0, project);
		
		List<String> list = getProjects.list();
		System.out.println(list);
				
		return list;
		
	
	}


}
