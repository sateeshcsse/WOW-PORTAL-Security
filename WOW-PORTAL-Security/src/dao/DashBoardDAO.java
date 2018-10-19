package dao;

import java.util.ArrayList;
import java.util.List;

import dao.HibernateConnection;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.type.StandardBasicTypes;

public class DashBoardDAO {

	public Integer[] getProjectPerformance() {
		Transaction t;
		try {
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			Query query = session
					.createSQLQuery(
							"select count(*) as Green from wowmain  WHERE performance <>'' and performance <>'-' and date(str_to_date(golivedate, '%d/%m/%Y'))> date(curdate())  group by (performance)")
					.addScalar("Green", StandardBasicTypes.INTEGER);
			List<Integer> list = query.list();
			Integer[] countries = list.toArray(new Integer[list.size()]);
			t.commit();
			session.close();
			return countries;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public List<Double> getResorceRatio() {
		Transaction t;
		try {
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			Double[] resources = {};
			Query query = session
					.createSQLQuery(
							"select totalWomenRatio as WomenRatio, totalOffshoreLeverage as offshoreLeverage, totalOnsite as Onsite, totalOffshore as Offshore, totalMen as Men, totalWomen as Women from resources ORDER BY resourceTableId DESC")
					.setMaxResults(1);
			List<Object[]> list = query.list();
			List<Double> listin = new ArrayList<>();
			for (Object[] io : list) {

				listin.add((double) io[0]);
				listin.add((double) io[1]);
				listin.add(1.0 * ((int) io[2]));
				listin.add(1.0 * ((int) io[3]));
				listin.add(1.0 * ((int) io[4]));
				listin.add(1.0 * ((int) io[5]));

			}

			t.commit();
			session.close();
			return listin;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Double getCotRatios() {
		Transaction t;
		try {
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			Double[] resources = {};
			Query query = session
					.createSQLQuery(
							"select round((SUM(testingTotal)/SUM(overAllCost))*100 ,2) as COT from coqdatatable")
					.addScalar("COT", StandardBasicTypes.DOUBLE);
			List<Double> dob = query.list();
			Double result = dob.get(0);
			t.commit();
			session.close();
			return result;

			// return listin;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public List getSLAData() {
        try {
            Session session = HibernateConnection.openConnection().openSession();
            Transaction t = session.beginTransaction();
            Query query = session.createSQLQuery("Select "
            		+ "round(((sum(s.actual_duration_sit)-sum(s.planned_duration_sit))/sum(s.planned_duration_sit)*100),2) Schedule_slippage, "
            		+ "round((((sum(sr.sit_data) + sum(sr.sit_test_script)) / sum(sr.total_defects_rc_sit))*100),2) as Defect_Rejection, "
            		+ "round((((sum(sp.sit_actual_effort) - sum(sp.gold))/sum(sp.gold))*100),2) Effort_Slipage,  "
					+ "(100 - round(((sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected)) /(sum(sd.prod_close) + sum(sd.prod_deferred) "
					+ " + sum(sd.prod_open) + sum(sd.prod_reopen) + sum(sd.prod_rejected) + sum(sd.uat_close) + sum(sd.uat_deferred) + sum(sd.uat_open) + sum(sd.uat_rejected) + sum(sd.uat_reopen) "
					+ " + sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) )*100),2)) as Test_EFFECTIVENESS "
					+ "from  sla s, sla_defect_count sd, sla_root_cause sr, sla_project_details sp "
					+ "where s.def_id = sd.def_id and s.root_id=sr.root_id and s.project_id=sp.project_id and "
					+ " year(STR_TO_DATE(sit_actual_period_to,'%d-%m-%Y')) > 1990");
            List<Object[]> list = query.list();
            System.out.println("fdgfdgfdg"+list.get(0).toString());

            Query getEffortSlippage = session.createSQLQuery("select round(((sum(sp.sit_actual_effort) - sum(sp.gold)) / "
					+ "sum(sp.gold) )*100,2) from sla_project_details sp, sla s where s.project_id = sp.project_id and "
					+ "(((sp.sit_actual_effort - sp.gold) / sp.gold) > 0) and year(STR_TO_DATE(sp.sit_actual_period_from,'%d-%m-%Y')) > 1990");

			
            Query getScheduleSlippage = session.createSQLQuery("select round(((sum(s.actual_duration_sit)- sum(s.planned_duration_sit)) / "
					+ "sum(s.planned_duration_sit)*100),2) Schedule_slippage  from sla s, sla_project_details sp where  "
					+ "year(STR_TO_DATE(sp.sit_actual_period_from,'%d-%m-%Y')) > 1990 and s.project_id=sp.project_id "
					+ "and (((s.actual_duration_sit) - (s.planned_duration_sit))/(s.planned_duration_sit)) > 0");
            
           System.out.println("1");
            List<Object[]> effortResult = getEffortSlippage.list();
            System.out.println("2");
			List<Object[]> scheduleResult = getScheduleSlippage.list();
			System.out.println("3");
			List<Float> output = new ArrayList<>(list.size());
			System.out.println("4");
            for (Object[] obj : list) {
            	obj[0] = 0;
            	obj[2] = 0;
            	System.out.println("5");
            	
            	if( effortResult.get(0) != null)
            	{System.out.println("6");
            		obj[2] = effortResult.get(0);
            		System.out.println(effortResult.get(0));
            		
            	}
            	
            	if( scheduleResult.get(0) != null)
            	{System.out.println("7");
            		obj[0] = scheduleResult.get(0);
            		System.out.println("8");
            		
            	}
            	System.out.println("9");
            	 output.add(Float.parseFloat(String.valueOf(obj[0])));
            	 System.out.println("10");
            	 output.add(Float.parseFloat(String.valueOf(obj[1])));
            	 System.out.println("11");
            	 System.out.println(obj[2]);
            	 output.add(Float.parseFloat(String.valueOf(obj[2])));
            	 System.out.println("12");
            	 output.add(Float.parseFloat(String.valueOf(obj[3])));
            	 System.out.println("13");
            }
            
            
           
            
//            
//            List<Float> output = new ArrayList<>(list.size());
//            for (Object[] obj : list) {
//            	 System.out.println(obj[0]);
//            	 System.out.println(obj[1]);
//            	 System.out.println(obj[2]);
//            	 System.out.println(obj[3]);
//            	// output.add(String.valueOf(obj[0]));
//            	 output.add(Float.parseFloat(String.valueOf(obj[0])));
//            	 output.add(Float.parseFloat(String.valueOf(obj[1])));
//            	 output.add(Float.parseFloat(String.valueOf(obj[2])));
//            	 output.add(Float.parseFloat(String.valueOf(obj[3])));
//
//            }
//
//            System.out.println("" + output.toString());
           if(output.get(0) < 0 || output.get(0) == null )
           {
        	   output.set(0,(float) 0);
           }
           
           if(output.get(2) < 0 || output.get(0) == null )
           {
        	   output.set(2,(float) 0);
           }
            
            t.commit();
            session.close();
            return output;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	
	public List<Integer> getRCAValues() {
		
		Transaction t;
		try {
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
//			Query RCADashQuery = session.createSQLQuery("select sum(r.code_logic_error) + "
//					+ "sum(r.code_standards_compliance) + sum(r.code_exception_handling) + "
//					+ "sum(r.code_code_not_delivered) + sum(r.code_application_installation_error) + "
//					+ "sum(r.code_security_code_compilance) + sum(code_caused_by_earlier_fix)  as code, "
//					+ "sum(r.req_incomplete) + sum(r.req_changed_requirement) + sum(r.req_new_requirement) as req, "
//					+ "sum(r.data_incorrect_setup) + sum(r.data_corrupted) + sum(doc_technical_spec_problem)  as data_rac, "
//					+ "sum(r.doc_architecture_issues) + sum(r.doc_functional_design_gap) + "
//					+ "sum(r.doc_design_change) + sum(r.doc_design_error) as doc, "
//					+ "sum(r.env_installation_error) + sum(r.env_cutover_issues) + "
//					+ "sum(r.env_inadequeate_infrastructure) + sum(r.env_access_limitation) + "
//					+ "sum(r.env_network) + sum(r.env_integration) + sum(r.env_hardware_issues) as env, "
//					+ "sum(r.scr_incorrect_test_script) + sum(r.scr_incomplete_test_script) as Scr, "
//					+ "sum(r.other_duplicate_defect) + sum(r.other_query) + sum(r.other_not_reproducible) + "
//					+ "sum(r.other_exists_in_production) + sum(code_others) + sum(env_others) + sum(doc_others) "
//					+ "+ sum(scr_others) + sum(data_others) + sum(other_others) + sum(code_database_design) + sum(data_configuration_error) "
//					+ " + sum(doc_functional_spec_problem) +sum(env_environment_problem) + sum(doc_test_script_problem) as Other "
//					+ "from rootcause r, wowmain w where w.unique_id = r.unique_id "
//					+ "and STR_TO_DATE(golivedate, '%d/%m/%Y') < CURDATE() and STR_TO_DATE(golivedate, '%d/%m/%Y') != '0000-00-00'");
			
			Query RCADashQuery = session.createSQLQuery("select "
					+ "sum(rc.sit_req) + sum(rc.uat_req) + sum(rc.prod_req) as Requirement, "
					+ "sum(rc.sit_design) + sum(rc.uat_design) + sum(rc.prod_design) as Design, "
					+ " sum(rc.sit_code) + sum(rc.uat_code) + sum(rc.prod_code) as SCode, "
					+ "sum(rc.sit_data) + sum(rc.uat_data) + sum(rc.prod_data) as RData, "
					+ "sum(rc.sit_environment) + sum(rc.uat_environment) +sum(rc.prod_environment) as Environment, "
					+ "sum(rc.sit_test_script) + sum(rc.uat_test_script) + sum(rc.prod_test_script) as Test_Script, "
					+ "sum(rc.sit_exist_prod) + sum(rc.sit_exist_prod) +sum(rc.sit_exist_prod) as Exist_prod, "
					+ "sum(rc.sit_others) + sum(rc.uat_others) + sum(rc.prod_others) as Others "
					+ " from sla_root_cause rc");
			
			List<Integer> RCAResult = RCADashQuery.list();
			t.commit();
			session.close();
			return RCAResult;

			// return listin;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public List<Integer> getVMValues() {
		// TODO Auto-generated method stub
		Transaction t;
		try {
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			Query VMDashNotAvailabeQuery = session.createSQLQuery("select count(id) as no_available from vmdata where current_status = 'assigned' ");
			Query VMDashAvailableQuery = session.createSQLQuery("select count(id) as no_available from vmdata where current_status = 'available' ");
			
			List<Integer> VMResult = VMDashNotAvailabeQuery.list();
			VMResult.addAll(VMDashAvailableQuery.list());
			t.commit();
			session.close();
			return VMResult;

			// return listin;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public List<Integer> getMcalmValues() {
		Transaction t;
		try {
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
//			Query McalmDashQuery = session.createSQLQuery("select max(others_domain) , max(hcm_domain), "
//					+ "max(onepos_domain), max(galaxy_domain) from mcalm where str_to_date(date ,'%d/%m/%Y') = curdate()");
			
			Query McalmDashQuery = session.createSQLQuery("select max(others_domain) ,  max(onepos_domain),"
					+ "max(galaxy_domain), max(hcm_domain) from mcalm where str_to_date(date ,'%d/%m/%Y') = curdate()");
			
			List<Integer> McalmResult = McalmDashQuery.list();
			t.commit();
			session.close();
			return McalmResult;

			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

//	public List<Integer> getPerfValues() {
//		Transaction t;
//		try {
//			Session session = HibernateConnection.openConnection()
//					.openSession();
//			t = session.beginTransaction();
//			Query PerfDashQuery = session.createSQLQuery("select count(*) from performance "
//					+ "union "
//					+ "select count(*) from performance where flag = 1");
//			List<Integer> PerfDashResult = PerfDashQuery.list();
//			t.commit();
//			session.close();
//			return PerfDashResult;
//
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//	public List getAutoValues() {
//		Transaction t;
//		try {
//			Session session = HibernateConnection.openConnection()
//					.openSession();
//			t = session.beginTransaction();
//			Query AutoDashQueryRegCount = session.createSQLQuery("select count(inprogress) as inprogress from automation where inprogress = 1").addScalar("inprogress", StandardBasicTypes.LONG);
//			Query AutoDashQueryinprogCount = session.createSQLQuery("select count(regression_pack) as pack from automation").addScalar("pack", StandardBasicTypes.LONG);
//			
//			List<Long> AutoDashResult = AutoDashQueryRegCount.list();
//			AutoDashResult.addAll(AutoDashQueryinprogCount.list());
//			
//			//AutoDashResult.add((AutoDashResult.get(0) / AutoDashResult.get(1))*100 );
//		
//			t.commit();
//			session.close();
//			return AutoDashResult;
//
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
//


}
