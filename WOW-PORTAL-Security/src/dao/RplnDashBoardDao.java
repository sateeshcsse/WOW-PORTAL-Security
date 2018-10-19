package dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

public class RplnDashBoardDao {

	public String getJavaUatDetails() {
		Transaction t;
		String key, value;
		int i = 0;
		try {
			Session session = HibernateConnection.openConnection().openSession();
			t = session.beginTransaction();
			Query query = session
					.createSQLQuery("select application_name,STATUS from javadashboard where status_5='LATEST'");
			List<Object[]> list = query.list();
			t.commit();
			session.close();

			Map<String, String> javaConsolidated = new HashMap<String, String>();
			Map<String, List<String>> javaFinal = new HashMap<String, List<String>>();
			List<String> tempList = new LinkedList<String>();

			for (Object[] obj : list) {
				System.out.println(obj[0]);
				key = ((String) obj[0]).split("_")[0];
				value = ((String) obj[1]);
				if (javaConsolidated.containsKey(key)) {
					if (!javaConsolidated.get(key).equals(value) && javaConsolidated.get(key).equals("FINE")) {
						javaConsolidated.remove(key);
						javaConsolidated.put(key, value);
					}
				} else
					javaConsolidated.put(key, value);
			}
			for (String key1 : javaConsolidated.keySet()) {
				i++;
				tempList = new LinkedList<String>();
				tempList.add(key1);
				tempList.add(javaConsolidated.get(key1));
				javaFinal.put(Integer.toString(i), tempList);
			}
			Gson gson = new Gson();
			String json = gson.toJson(javaFinal);
			System.out.println(json);
			return json;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String getJavaAppDetails(String env, String port) {
		Transaction t;
		String key, value;
		int i = 0;
		String portfolio = getExactPortfolio(port);
		try {
			Session session = HibernateConnection.openConnection().openSession();
			t = session.beginTransaction();
			Query query = session.createSQLQuery(
					"select application_name,STATUS from javadashboard a,javaappmaster b where a.status_5='LATEST' and a.STATUS_2=b.APP_NAME and b.PORTFOLIO='"
							+ portfolio + "' and status_3='" + env + "'");
			List<Object[]> list = query.list();
			t.commit();
			session.close();

			Map<String, String> javaConsolidated = new HashMap<String, String>();
			List<List<String>> dataMap = new ArrayList<List<String>>();
			List<String> tempList = new LinkedList<String>();

			for (Object[] obj : list) {
				System.out.println(obj[0]);
				key = ((String) obj[0]).split("_")[0];
				value = ((String) obj[1]);
				if (javaConsolidated.containsKey(key)) {
					if (!javaConsolidated.get(key).equals(value) && javaConsolidated.get(key).equals("FINE")) {
						javaConsolidated.remove(key);
						javaConsolidated.put(key, value);
					}
				} else
					javaConsolidated.put(key, value);
			}
			for (String key1 : javaConsolidated.keySet()) {
				i++;
				tempList = new LinkedList<String>();
				tempList.add(key1);
				tempList.add(javaConsolidated.get(key1));
				dataMap.add(tempList);
			}
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String getExactPortfolio(String port) {
		if (port.equals("ONL"))
			return "Online";
		else if (port.equals("LOG"))
			return "Logistics";
		else if (port.equals("SUP"))
			return "Supply Chain";
		else if (port.equals("STO"))
			return "Stores";
		else if (port.equals("COR"))
			return "Corporate";
		else if (port.equals("OTH"))
			return "Others";
		else
			return port;

	}

	public String getRplnDetails(String environment, String stream) {
		Map<String, List<String>> jobDetails = null, uiDetails = null;
		Map<String, List<String>> combFinal = new HashMap<String, List<String>>();
		if (stream.equals("SMKT")) {
			jobDetails = getJobDetails(environment, "SMKT/PEL/Liquor");
			uiDetails = getUIDetails(environment, "SMKT/PEL/Liquor/RC");

		}
		if (stream.equals("BIGW")) {
			jobDetails = getJobDetails(environment, "BigW");
			uiDetails = getUIDetails(environment, "BigW");
		}
		if (uiDetails != null && jobDetails != null) {
			for (String key : jobDetails.keySet()) {
				combFinal.put(key.replaceAll("\\s+", "").replaceAll("\\(", "").replaceAll("\\)", ""),
						jobDetails.get(key));
			}
			for (String key : uiDetails.keySet()) {
				combFinal.put(key.replaceAll("\\s+", "").replaceAll("\\(", "").replaceAll("\\)", ""),
						uiDetails.get(key));
			}
			Gson gson = new Gson();
			String json = gson.toJson(combFinal);
			System.out.println(json);
			return json;
		} else
			return null;

	}

	public Double[] getSmktOverview(String environment) {
		Map<String, List<String>> jobDetails = getJobDetails(environment, "SMKT/PEL/Liquor");
		Map<String, List<String>> uiDetails = getUIDetails(environment, "SMKT/PEL/Liquor/RC");

		Double[] status = new Double[2];
		status[0] = 0.0;
		status[1] = 0.0;
		double total = jobDetails.size();
		double fine = 0.0;

		for (String key : jobDetails.keySet()) {
			List<String> eachRow = jobDetails.get(key);

			if (key.equals("JOB PDM UI AU") && jobDetails.get("JOB PDM UI AU").get(0).equals("COMPLETED")
					&& uiDetails.get("PDM AU").get(0).equals("UP"))
				fine++;
			else if (key.equals("JOB SDM UI AU") && jobDetails.get("JOB SDM UI AU").get(0).equals("COMPLETED")
					&& uiDetails.get("SDM AU").get(0).equals("UP"))
				fine++;
			else if (key.equals("JOB PDM UI NZ") && jobDetails.get("JOB PDM UI NZ").get(0).equals("COMPLETED")
					&& uiDetails.get("PDM NZ").get(0).equals("UP"))
				fine++;
			else if (key.equals("JOB SDM UI NZ") && jobDetails.get("JOB SDM UI NZ").get(0).equals("COMPLETED")
					&& uiDetails.get("SDM NZ").get(0).equals("UP"))
				fine++;
			else if (eachRow.get(0).equals("COMPLETED") && (!key.equals("JOB SDM UI AU") && !key.equals("JOB SDM UI NZ")
					&& !key.equals("JOB PDM UI AU") && !key.equals("JOB PDM UI NZ")))
				fine++;
		}
		status[0] = (fine * 100) / total;
		status[1] = 100 - status[0];
		return status;
	}

	public Double[] getBigwOverview(String environment) {
		Map<String, List<String>> jobDetails = getJobDetails(environment, "BigW");
		Map<String, List<String>> uiDetails = getUIDetails(environment, "BigW");

		Double[] status = new Double[2];
		status[0] = 0.0;
		status[1] = 0.0;
		double total = jobDetails.size();
		double fine = 0.0;

		for (String key : jobDetails.keySet()) {
			List<String> eachRow = jobDetails.get(key);

			if (key.equals("PDM UI availabilty") && jobDetails.get("PDM UI availabilty").get(0).equals("COMPLETED")
					&& uiDetails.get("PDM").get(0).equals("UP"))
				fine++;
			else if (key.equals("SDM UI availability")
					&& jobDetails.get("SDM UI availability").get(0).equals("COMPLETED")
					&& uiDetails.get("SDM").get(0).equals("UP"))
				fine++;
			else if (key.equals("Profiler UI availability")
					&& jobDetails.get("Profiler UI availability").get(0).equals("COMPLETED")
					&& uiDetails.get("PROFILER").get(0).equals("UP"))
				fine++;
			else if (eachRow.get(0).equals("COMPLETED") && (!key.equals("PDM UI availabilty")
					&& !key.equals("SDM UI availability") && !key.equals("Profiler UI availability")))
				fine++;
		}
		status[0] = (fine * 100) / total;
		status[1] = 100 - status[0];
		return status;
	}

	public Map<String, List<String>> getJobDetails(String stream, String environment) {
		Transaction t;
		try {
			Session session = HibernateConnection.openConnection().openSession();
			t = session.beginTransaction();
			Query query = session.createSQLQuery(
					"select job_ui_name,status,completion_date,completion_time from repl_dashboard where status_5='LATEST' and status_1='JOB' and environment='"
							+ stream + "' and stream='" + environment + "'");
			List<Object[]> list = query.list();
			t.commit();
			session.close();
			return getMapList(list, false);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Map<String, List<String>> getUIDetails(String stream, String environment) {
		Transaction t;
		try {
			Session session = HibernateConnection.openConnection().openSession();
			t = session.beginTransaction();
			Query query = session.createSQLQuery(
					"select job_ui_name,status from repl_dashboard where status_5='LATEST' and status_1='UI' and environment='"
							+ stream + "' and stream='" + environment + "'");
			List<Object[]> list = query.list();
			t.commit();
			session.close();
			return getMapList(list, true);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Map<String, List<String>> getMapList(List<Object[]> list, Boolean ui) {
		Map<String, List<String>> dataMap = new HashMap<>();

		for (Object[] obj : list) {
			System.out.println(obj[0]);
			List<String> tempList = new LinkedList<String>();
			System.out.println(obj[0]);
			System.out.println(obj.length);
			for (int i = 1; i < obj.length; i++) {
				if (obj[i].equals("0000-00-00") || obj[i].equals("00:00:00"))
					obj[i] = " ";
				tempList.add(String.valueOf(obj[i]));
			}
			if (ui) {
				tempList.add(" ");
				tempList.add(" ");
			}
			dataMap.put((String) obj[0], tempList);
		}

		return dataMap;
	}

	public List getJavaStatus(String env) {

		System.out.println("In DAO to get RCA Values for all portfolios");
		Session session = HibernateConnection.openConnection().openSession();
		Query getJava = session.createSQLQuery(
				"select total.PORTFOLIO,round(IF(ISNULL(fine.cnt),0,fine.cnt)*100/total.cnt,2),round(IF(ISNULL(err.cnt),0,err.cnt)*100/total.cnt,2) from (select b.PORTFOLIO,count(*) as cnt from javadashboard a, javaappmaster b where a.status_5='LATEST' and status_3='"
						+ env
						+ "' and a.STATUS_2=b.APP_NAME group by b.PORTFOLIO) total left outer join (select b.PORTFOLIO,a.STATUS,count(*) cnt from javadashboard a, javaappmaster b where a.status_5='LATEST' and status_3='"
						+ env
						+ "' and a.status='ERROR' and a.STATUS_2=b.APP_NAME group by b.PORTFOLIO,a.STATUS) err on err.portfolio=total.portfolio left outer join (select b.PORTFOLIO,a.STATUS,count(*) cnt from javadashboard a, javaappmaster b where a.status_5='LATEST' and status_3='"
						+ env
						+ "' and a.status='FINE' and a.STATUS_2=b.APP_NAME group by b.PORTFOLIO,a.STATUS) fine on fine.portfolio=total.portfolio");

		List<Object[]> list = getJava.list();
		return list;
	}

	public List<String> getNonProdCounts(String team, String environment, String sub1) {
		Transaction t;
		try {
			Session session = HibernateConnection.openConnection().openSession();
			t = session.beginTransaction();

			String queryString = "select concat(MONTHNAME(STR_TO_DATE(month(date), '%m')),'-',year(date)),concat(sum(count)) from nonprodcounts where year(date)>2016 and ";
			if (team != null)
				queryString = queryString + " team='" + team + "'";
			if (environment != null)
				queryString = queryString + " and environment='" + environment + "'";
			if (sub1 != null)
				queryString = queryString + " and sub1='" + sub1 + "'";
			queryString = queryString
					+ " group by concat(MONTHNAME(STR_TO_DATE(month(date), '%m')),'-',year(date)) order by year(date),month(date);";
			System.out.println(queryString);

			Query query = session.createSQLQuery(queryString);
			List<Object[]> list = query.list();
			t.commit();
			session.close();
			List<String> listin = new LinkedList<>();
			for (Object[] io : list) {

				for (int i = 0; i < io.length; i++)
					listin.add((String) io[i]);
			}
			return listin;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<String> getNonProdCountsByStream(String stream, String environment) {
		Transaction t;
		try {
			Session session = HibernateConnection.openConnection().openSession();
			t = session.beginTransaction();

			String queryString = "select concat(MONTHNAME(STR_TO_DATE(month(date), '%m')),'-',year(date)),concat(sum(count)) from nonprodcounts where year(date)>2016 and ";
			if (stream != null)
				queryString = queryString + " stream='" + stream + "'";
			if (environment != null)
				queryString = queryString + " and environment='" + environment + "'";
			queryString = queryString
					+ " group by concat(MONTHNAME(STR_TO_DATE(month(date), '%m')),'-',year(date)) order by year(date),month(date);";
			System.out.println(queryString);

			Query query = session.createSQLQuery(queryString);
			List<Object[]> list = query.list();
			t.commit();
			session.close();
			List<String> listin = new LinkedList<>();
			for (Object[] io : list) {

				for (int i = 0; i < io.length; i++)
					listin.add((String) io[i]);
			}
			return listin;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
