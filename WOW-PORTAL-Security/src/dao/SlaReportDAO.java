package dao;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;

@Repository
public class SlaReportDAO {

	public String getSlaReport(String year) {
		
		System.out.println("In SLAREPORT DAO");
		if(year.equals("Overall") || (year.equals("")))
		{
			//For overall and Portfolio wise data when year is overall
			Transaction t;
			System.out.println("--------------In sla Portfolio and Total Report Dao for overall year--------------" );
			System.out.println("Year value inside Overall Portfolio ::::::: " +year);
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			Map<String, List<String>> dataMap;
			try {
				dataMap = new HashMap<>();
				
				//Test Effectivness is known as defect slippage in UI
			
			Query getProjects = session.createSQLQuery("select s.portfolio,"
					+ "(100 - round(((sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + "
					+ "sum(sd.sit_reopen) + sum(sd.sit_rejected) ) /(sum(sd.prod_close) + sum(sd.prod_deferred) "
					+ "+ sum(sd.prod_open) + sum(sd.prod_reopen) + sum(sd.prod_rejected) + sum(sd.uat_close) + "
					+ " sum(sd.uat_deferred) + sum(sd.uat_open) + sum(sd.uat_rejected) + sum(sd.uat_reopen) "
					+ "+ sum(sd.sit_open) + sum(sd.sit_close) + "
					+ " sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) )*100),2)) as Test_EFFECTIVENESS, "
					+ "round((((sum(sp.sit_actual_effort) - sum(sp.gold))/sum(sp.gold))*100),2) Effort_Slipage, "
					+ "round((((sum(sr.sit_data) + sum(sr.sit_test_script)) / sum(sr.total_defects_rc_sit))*100),2) as Defect_Rejection, "
					+ "round(((sum(s.actual_duration_sit)-sum(s.planned_duration_sit))/sum(s.planned_duration_sit)*100),2) Schedule_slippage,"
					+ "round(((((sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) + sum(sd.sit_cancelled))-(sum(sr.sit_data) + sum(sd.sit_cancelled)"
					+ " + sum(sr.sit_test_script))) "
					+ "/sum(sp.total_scripts))*100),2) Failure_Rate "
					+ "from  sla s, sla_defect_count sd, sla_root_cause sr, sla_project_details sp "
					+ "where s.def_id = sd.def_id and s.root_id=sr.root_id and s.project_id=sp.project_id "
					+ "and year(STR_TO_DATE(sit_actual_period_to,'%d-%m-%Y')) > ? "
					+ "group by s.portfolio "
					+ "union "
					+ "select 'Total' as portfolio, "
					+ "(100 - round(((sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) ) /(sum(sd.prod_close) + sum(sd.prod_deferred) "
					+ " + sum(sd.prod_open) + sum(sd.prod_reopen) + sum(sd.prod_rejected)  + sum(sd.uat_close) + sum(sd.uat_deferred) + sum(sd.uat_open) + sum(sd.uat_rejected)  + sum(sd.uat_reopen) "
					+ " + sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected)  )*100),2)) as Test_EFFECTIVENESS, "
					+ "round((((sum(sp.sit_actual_effort) - sum(sp.gold))/sum(sp.gold))*100),2) Effort_Slipage, "
					+ "round((((sum(sr.sit_data) + sum(sr.sit_test_script)) / sum(sr.total_defects_rc_sit))*100),2) as Defect_Rejection, "
					+ "round(((sum(s.actual_duration_sit)-sum(s.planned_duration_sit))/sum(s.planned_duration_sit)*100),2) Schedule_slippage, "
					+ "round(((((sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) + sum(sd.sit_cancelled))-(sum(sr.sit_data) + sum(sd.sit_cancelled)"
					+ " + sum(sr.sit_test_script))) "
					+ "/sum(sp.total_scripts))*100),2) Failure_Rate "
					+ "from  sla s, sla_defect_count sd, sla_root_cause sr, sla_project_details sp "
					+ "where s.def_id = sd.def_id and s.root_id=sr.root_id and s.project_id=sp.project_id and "
					+ " year(STR_TO_DATE(sit_actual_period_to,'%d-%m-%Y')) > ?");
			
			//String temp=portfolioName;
			//temp.toString(portfolioName)
			
			
			getProjects.setParameter(0, "1900");
			getProjects.setParameter(1, "1900");
			
			
			//Query queryForTable = session.createSQLQuery(query);
			
			Query getEffortSlippage = session.createSQLQuery("select  s.portfolio,  round(((sum(sp.sit_actual_effort) - "
					+ "sum(sp.gold)) / sum(sp.gold) )*100,2) from sla_project_details sp, sla s where s.project_id = sp.project_id "
					+ "and (((sp.sit_actual_effort - sp.gold) / sp.gold) > 0) and year(STR_TO_DATE(sp.sit_actual_period_to,'%d-%m-%Y')) "
					+ "> ? group by s.portfolio union select 'Total' as portfolio, round(((sum(sp.sit_actual_effort) - sum(sp.gold)) / "
					+ "sum(sp.gold) )*100,2) from sla_project_details sp, sla s where s.project_id = sp.project_id and "
					+ "(((sp.sit_actual_effort - sp.gold) / sp.gold) > 0) and year(STR_TO_DATE(sp.sit_actual_period_to,'%d-%m-%Y')) > ?");
			
			getEffortSlippage.setParameter(0, "1900");
			getEffortSlippage.setParameter(1, "1900");
			
			Query getScheduleSlippage = session.createSQLQuery("select s.portfolio, round(((sum(s.actual_duration_sit) - "
					+ "sum(s.planned_duration_sit))/sum(s.planned_duration_sit)*100),2) Schedule_slippage from sla s, "
					+ "sla_project_details sp where  year(STR_TO_DATE(sp.sit_actual_period_to,'%d-%m-%Y')) > ? "
					+ "and s.project_id=sp.project_id and (((s.actual_duration_sit) - (s.planned_duration_sit)) / "
					+ "(s.planned_duration_sit)) > 0 group by s.portfolio "
					+ "union "
					+ "select 'Total' as portfolio, round(((sum(s.actual_duration_sit)- sum(s.planned_duration_sit)) / "
					+ "sum(s.planned_duration_sit)*100),2) Schedule_slippage  from sla s, sla_project_details sp where  "
					+ "year(STR_TO_DATE(sp.sit_actual_period_to,'%d-%m-%Y')) > ? and s.project_id=sp.project_id "
					+ "and (((s.actual_duration_sit) - (s.planned_duration_sit))/(s.planned_duration_sit)) > 0");
			
			getScheduleSlippage.setParameter(0, "1900");
			getScheduleSlippage.setParameter(1, "1900");
			
			List<Object[]> effortResult = getEffortSlippage.list();
			List<Object[]> queryResult = getProjects.list();
			List<Object[]> scheduleResult = getScheduleSlippage.list();
			

			String totport = "" , eport ="", scheduleport="";
			System.out.println("Query result Size: " +queryResult.size());
			for (Object[] obj : queryResult) 
			{
				obj[2]=0;
				obj[4]=0;
				totport = String.valueOf(obj[0]);
				System.out.println("Total Portfolio: " +totport);
				
				for (Object[] sobj : effortResult) 
				{
					eport =String.valueOf(sobj[0]);
					
					//System.out.println("Effort slippgae  " +eport);
					
					if(totport.equals(eport))
					{
						obj[2] = sobj[1];
					}
					
				}
				
				for (Object[] scheduleobj : scheduleResult) 
				{
					scheduleport =String.valueOf(scheduleobj[0]);
					
					System.out.println("Schedule slippgae  " +scheduleport+ " Value :" +scheduleobj[1]);
					
					if(totport.equals(scheduleport))
					{
						obj[4] = scheduleobj[1];
					}
					
				}
				
				
				
				List<String> tempList = new LinkedList<String>();
	
				for (int i = 1; i < obj.length; i++) {
					//System.out.println(obj[0]);
					
					String tempStorage = String.valueOf(obj[i]);
					//System.out.println(tempStorage + "*****" + i);
					// tempTotal+=(Double)obj[i];
					tempList.add(tempStorage);
					//System.out.println("End of second for loop");

				}
				// tempList.add(String.valueOf(tempTotal));

				dataMap.put((String) obj[0], tempList);
				System.out.println("End of first for loop");
			}
			
			t.commit();
			session.close();
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
			
			
			}
			
			catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
			
			
			
			
	
			//end of if
		}
		else
		{
			//For overall and Portfolio wise data when year is given
			Transaction t;
		System.out.println("--------------In sla Portfolio and Total Report Dao--------------" );
		Session session = HibernateConnection.openConnection()
				.openSession();
		t = session.beginTransaction();
		Map<String, List<String>> dataMap;
		try {
			dataMap = new HashMap<>();
			int newYear = Integer.parseInt(year);
			System.out.println("Year value inside year Portfolio ::::::: " +year);
		
			Query getProjects = session.createSQLQuery("select s.portfolio,"
					+ "(100 - round(((sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + "
					+ "sum(sd.sit_reopen) + sum(sd.sit_rejected) ) /(sum(sd.prod_close) + sum(sd.prod_deferred) "
					+ "+ sum(sd.prod_open) + sum(sd.prod_reopen) + sum(sd.prod_rejected) + sum(sd.uat_close) + "
					+ " sum(sd.uat_deferred) + sum(sd.uat_open) + sum(sd.uat_rejected) + sum(sd.uat_reopen) "
					+ "+ sum(sd.sit_open) + sum(sd.sit_close) + "
					+ " sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) )*100),2)) as Test_EFFECTIVENESS, "
					+ "round((((sum(sp.sit_actual_effort) - sum(sp.gold))/sum(sp.gold))*100),2) Effort_Slipage, "
					+ "round((((sum(sr.sit_data) + sum(sr.sit_test_script)) / sum(sr.total_defects_rc_sit))*100),2) as Defect_Rejection, "
					+ "round(((sum(s.actual_duration_sit)-sum(s.planned_duration_sit))/sum(s.planned_duration_sit)*100),2) Schedule_slippage,"
					+ "round(((((sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) + sum(sd.sit_cancelled))-(sum(sr.sit_data) + sum(sd.sit_cancelled)"
					+ " + sum(sr.sit_test_script))) "
					+ "/sum(sp.total_scripts))*100),2) Failure_Rate "
					+ "from  sla s, sla_defect_count sd, sla_root_cause sr, sla_project_details sp "
					+ "where s.def_id = sd.def_id and s.root_id=sr.root_id and s.project_id=sp.project_id "
					+ "and year(STR_TO_DATE(sit_actual_period_to,'%d-%m-%Y')) = ? "
					+ "group by s.portfolio "
					+ "union "
					+ "select 'Total' as portfolio, "
					+ "(100 - round(((sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) ) /(sum(sd.prod_close) + sum(sd.prod_deferred) "
					+ " + sum(sd.prod_open) + sum(sd.prod_reopen) + sum(sd.prod_rejected)  + sum(sd.uat_close) + sum(sd.uat_deferred) + sum(sd.uat_open) + sum(sd.uat_rejected)  + sum(sd.uat_reopen) "
					+ " + sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected)  )*100),2)) as Test_EFFECTIVENESS, "
					+ "round((((sum(sp.sit_actual_effort) - sum(sp.gold))/sum(sp.gold))*100),2) Effort_Slipage, "
					+ "round((((sum(sr.sit_data) + sum(sr.sit_test_script)) / sum(sr.total_defects_rc_sit))*100),2) as Defect_Rejection, "
					+ "round(((sum(s.actual_duration_sit)-sum(s.planned_duration_sit))/sum(s.planned_duration_sit)*100),2) Schedule_slippage, "
					+ "round(((((sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) + sum(sd.sit_cancelled))-(sum(sr.sit_data) + sum(sd.sit_cancelled)"
					+ " + sum(sr.sit_test_script))) "
					+ "/sum(sp.total_scripts))*100),2) Failure_Rate "
					+ "from  sla s, sla_defect_count sd, sla_root_cause sr, sla_project_details sp "
					+ "where s.def_id = sd.def_id and s.root_id=sr.root_id and s.project_id=sp.project_id and "
					+ " year(STR_TO_DATE(sit_actual_period_to,'%d-%m-%Y')) = ?");
			
			//String temp=portfolioName;
			//temp.toString(portfolioName)
			
			
			getProjects.setParameter(0, newYear);
			getProjects.setParameter(1, newYear);
			
			
			//Query queryForTable = session.createSQLQuery(query);
			
			Query getEffortSlippage = session.createSQLQuery("select  s.portfolio,  round(((sum(sp.sit_actual_effort) - "
					+ "sum(sp.gold)) / sum(sp.gold) )*100,2) from sla_project_details sp, sla s where s.project_id = sp.project_id "
					+ "and (((sp.sit_actual_effort - sp.gold) / sp.gold) > 0) and year(STR_TO_DATE(sp.sit_actual_period_to,'%d-%m-%Y')) "
					+ "= ? group by s.portfolio "
					+ "union "
					+ "select 'Total' as portfolio, round(((sum(sp.sit_actual_effort) - sum(sp.gold)) / "
					+ "sum(sp.gold) )*100,2) from sla_project_details sp, sla s where s.project_id = sp.project_id and "
					+ "(((sp.sit_actual_effort - sp.gold) / sp.gold) > 0) and year(STR_TO_DATE(sp.sit_actual_period_to,'%d-%m-%Y')) = ?");
			
			getEffortSlippage.setParameter(0, newYear);
			getEffortSlippage.setParameter(1, newYear);
			
			Query getScheduleSlippage = session.createSQLQuery("select s.portfolio, round(((sum(s.actual_duration_sit) - "
					+ "sum(s.planned_duration_sit))/sum(s.planned_duration_sit)*100),2) Schedule_slippage from sla s, "
					+ "sla_project_details sp where  year(STR_TO_DATE(sp.sit_actual_period_to,'%d-%m-%Y')) = ? "
					+ "and s.project_id=sp.project_id and (((s.actual_duration_sit) - (s.planned_duration_sit)) / "
					+ "(s.planned_duration_sit)) > 0 group by s.portfolio "
					+ "union "
					+ "select 'Total' as portfolio, round(((sum(s.actual_duration_sit)- sum(s.planned_duration_sit)) / "
					+ "sum(s.planned_duration_sit)*100),2) Schedule_slippage  from sla s, sla_project_details sp where  "
					+ "year(STR_TO_DATE(sp.sit_actual_period_to,'%d-%m-%Y')) = ? and s.project_id=sp.project_id "
					+ "and (((s.actual_duration_sit) - (s.planned_duration_sit))/(s.planned_duration_sit)) > 0");
			
			getScheduleSlippage.setParameter(0, newYear);
			getScheduleSlippage.setParameter(1, newYear);
			
			List<Object[]> effortResult = getEffortSlippage.list();
			List<Object[]> queryResult = getProjects.list();
			List<Object[]> scheduleResult = getScheduleSlippage.list();
			

			String totport = "" , eport ="", scheduleport="";
			System.out.println("Query result Size: " +queryResult.size());
			for (Object[] obj : queryResult) 
			{
				obj[2]=0;
				obj[4]=0;
				totport = String.valueOf(obj[0]);
				System.out.println("Total Portfolio: " +totport);
				
				for (Object[] sobj : effortResult) 
				{
					eport =String.valueOf(sobj[0]);
					
					//System.out.println("Effort slippgae  " +eport);
					
					if(totport.equals(eport))
					{
						obj[2] = sobj[1];
					}
					
				}
				
				for (Object[] scheduleobj : scheduleResult) 
				{
					scheduleport =String.valueOf(scheduleobj[0]);
					
					System.out.println("Schedule slippgae  " +scheduleport+ " Value :" +scheduleobj[1]);
					
					if(totport.equals(scheduleport))
					{
						obj[4] = scheduleobj[1];
					}
					
				}
				
				
				
				List<String> tempList = new LinkedList<String>();
	
				for (int i = 1; i < obj.length; i++) {
					//System.out.println(obj[0]);
					
					String tempStorage = String.valueOf(obj[i]);
					//System.out.println(tempStorage + "*****" + i);
					// tempTotal+=(Double)obj[i];
					tempList.add(tempStorage);
					//System.out.println("End of second for loop");

				}
				// tempList.add(String.valueOf(tempTotal));

				dataMap.put((String) obj[0], tempList);
				System.out.println("End of first for loop");
			}
			
			t.commit();
			session.close();
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
			
			
			}
			
			catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
		
		//end of else part
		}
		

	}
	
	public List getProjectReport(String portfolio, String year)
	{
		System.out.println("------------In sla Project Report Dao------------" );
		
		if(year.equals("Overall") || (year.equals("")))
		{
			Session session = HibernateConnection.openConnection()
					.openSession();
			//int newYear = Integer.parseInt(year);
			System.out.println("Year value inside Overall projects ::::: " +year);
			System.out.println("------------In sla Project Report OVERALL------------" );
			
			Query getProjectsReport = session.createSQLQuery("select s.portfolio, s.project, (100 - round(((sum(sd.sit_open) + "
					+ "sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) )"
					+ " / (sum(sd.prod_close) + sum(sd.prod_deferred) + sum(sd.prod_open) + sum(sd.prod_reopen)"
					+ " + sum(sd.prod_rejected) + sum(sd.uat_close) +  sum(sd.uat_deferred) + sum(sd.uat_open)"
					+ " + sum(sd.uat_rejected) + sum(sd.uat_reopen) + sum(sd.sit_open)"
					+ " + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) )*100),2)) as Test_EFFECTIVENESS, "
					+ " round(sp.effortSlippage,2) Effort_Slipage, "
					+ "round((((sum(sr.sit_data) + sum(sr.sit_test_script)) / sum(sr.total_defects_rc_sit))*100),2) as Defect_Rejection,  "
					+ " round(sp.scheduleSlippage,2) Schedule_slippage, "
					+ "round(((((sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) "
					+ "+ sum(sd.sit_rejected) + sum(sd.sit_cancelled))-(sum(sr.sit_data) + sum(sd.sit_cancelled) "
					+ "+ sum(sr.sit_test_script)))/sum(sp.total_scripts))*100),2) Failure_Rate "
					+ "from  sla s, sla_defect_count sd, sla_root_cause sr, sla_project_details sp "
					+ "where s.def_id = sd.def_id and s.root_id=sr.root_id and s.project_id=sp.project_id "
					+ "and s.portfolio = ? and year(STR_TO_DATE(sit_actual_period_to,'%d-%m-%Y')) > ? "
					+ "group by s.project;");
			
			getProjectsReport.setParameter(0, portfolio);
			getProjectsReport.setParameter(1, 1900);
			
			List<String> list = getProjectsReport.list();
			System.out.println("Query Value :   " +getProjectsReport);
			System.out.println("Returned Data from Project Report DAO :  " +list);
			return list;
			
			
			//End of IF
		}
		else
		{
			
		Session session = HibernateConnection.openConnection()
				.openSession();
		int newYear = Integer.parseInt(year);
		System.out.println("Year value inside year Projects ::::::: " +year);
		System.out.println("------------In sla Project Report Yearwise ------------" );
		
		Query getProjectsReport = session.createSQLQuery("select s.portfolio, s.project, (100 - round(((sum(sd.sit_open) + "
				+ "sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) )"
				+ " / (sum(sd.prod_close) + sum(sd.prod_deferred) + sum(sd.prod_open) + sum(sd.prod_reopen)"
				+ " + sum(sd.prod_rejected) + sum(sd.uat_close) +  sum(sd.uat_deferred) + sum(sd.uat_open)"
				+ " + sum(sd.uat_rejected) + sum(sd.uat_reopen) + sum(sd.sit_open)"
				+ " + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) + sum(sd.sit_rejected) )*100),2)) as Test_EFFECTIVENESS, "
				+ " round(sp.effortSlippage,2) Effort_Slipage, "
				+ "round((((sum(sr.sit_data) + sum(sr.sit_test_script)) / sum(sr.total_defects_rc_sit))*100),2) as Defect_Rejection,  "
				+ " round(sp.scheduleSlippage,2) Schedule_slippage, "
				+ "round(((((sum(sd.sit_open) + sum(sd.sit_close) + sum(sd.sit_deferred) + sum(sd.sit_reopen) "
				+ "+ sum(sd.sit_rejected) + sum(sd.sit_cancelled))-(sum(sr.sit_data) + sum(sd.sit_cancelled) "
				+ "+ sum(sr.sit_test_script)))/sum(sp.total_scripts))*100),2) Failure_Rate "
				+ "from  sla s, sla_defect_count sd, sla_root_cause sr, sla_project_details sp "
				+ "where s.def_id = sd.def_id and s.root_id=sr.root_id and s.project_id=sp.project_id "
				+ "and s.portfolio = ? and year(STR_TO_DATE(sit_actual_period_to,'%d-%m-%Y')) = ? "
				+ "group by s.project;");
		
		getProjectsReport.setParameter(0, portfolio);
		getProjectsReport.setParameter(1, newYear);
		
		List<String> list = getProjectsReport.list();
		System.out.println("Query Value :   " +getProjectsReport);
		System.out.println("Returned Data from Project Report DAO :  " +list);
		return list;
		//End of Else
		}

	}

}
