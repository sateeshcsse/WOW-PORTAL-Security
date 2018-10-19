package dao;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import model.Defect_Status;
import model.Defect_Status_UAT;
import model.PerformanceKeys;
import model.RootCause;
import model.RootCauseUAT;
import model.TableData;
import model.Wowmain;
import dao.HibernateConnection;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.StandardBasicTypes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@SuppressWarnings("unchecked")
public class WowmainHibernate {
	public static Logger logger;
	static {
		logger = LoggerFactory.getLogger(WowmainHibernate.class);
	}

	public WowmainHibernate() {
	}

	public ArrayList<ArrayList<String>> listWowMain() throws Exception {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		List<Wowmain> wowmain = (List<Wowmain>) session.createCriteria(
				Wowmain.class).list();
		ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
		ArrayList<String> temp = new ArrayList<String>();
		for (Wowmain w : wowmain) {
			temp = new ArrayList<String>();
			temp.add(w.getPortfolio());
			// temp.add(w.getBus_unit());
			temp.add(w.getProject());
			// temp.add(w.getProject_phase());
			temp.add(w.getProject_start());
			String tempDate = w.getGolivedate();
			if (tempDate != null && !tempDate.contains("-")) {
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				Date date2 = Calendar.getInstance().getTime();
				System.out.println(df.format(date2));
				try {
					Date tempGolive = df.parse(tempDate);
					Date tempNow = df.parse(df.format(date2));
					if (tempGolive.after(tempNow)) {
						temp.add(w.getGolivedate());
						// temp.add("percentage of completion");
						temp.add(w.getPerformance());

						data.add(temp);
					} else {
						System.out.println("End date beloww");
					}
				} catch (ParseException p) {
					System.out.println(p.getMessage());
				}
			} else {
				continue;
			}

		}
		t.commit();
		session.close();
		return data;
	}

	public ArrayList<ArrayList<String>> listWowMainWithParams(
			String portfolioParam, String status) throws Exception {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria cr = session.createCriteria(Wowmain.class);
		if (!portfolioParam.equalsIgnoreCase("all")) {
			cr.add(Restrictions.eq("portfolio", portfolioParam));
		}

		if (status != null) {
			cr.add(Restrictions.eq("performance", status).ignoreCase());
		}
		List<Wowmain> wowmain = (List<Wowmain>) cr.list();
		ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
		ArrayList<String> temp = new ArrayList<String>();
		for (Wowmain w : wowmain) {
			temp = new ArrayList<String>();
			temp.add(w.getPortfolio());
			// temp.add(w.getBus_unit());
			temp.add(w.getProject());
			// temp.add(w.getProject_phase());
			temp.add(w.getProject_start());
			String tempDate = w.getGolivedate();
			if (tempDate != null && !tempDate.contains("-")) {
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				Date date2 = Calendar.getInstance().getTime();
				System.out.println(df.format(date2));
				try {
					Date tempGolive = df.parse(tempDate);
					Date tempNow = df.parse(df.format(date2));
					if (tempGolive.after(tempNow)) {
						temp.add(w.getGolivedate());
						// temp.add("percentage of completion");
						temp.add(w.getPerformance());

						data.add(temp);
					} else {
						System.out.println("End date beloww");
					}
				} catch (ParseException p) {
					System.out.println(p.getMessage());
				}
			} else {
				continue;
			}
		}
		t.commit();
		session.close();
		return data;
	}

	public List<String> getAllPortfolios() throws Exception {
		System.out.println("******************getAllPortfolios");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = session
				.createCriteria(Wowmain.class)
				.setProjection(
						Projections.distinct(Projections.property("portfolio")));
		List<String> portfolio = criteria.list();
		t.commit();
		session.close();
		return portfolio;
	}

	public List<String> getSomePortfolios(String portfolioParam, String status)
			throws Exception {
		System.out.println("******************getSomePortfolios");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = session
				.createCriteria(Wowmain.class)
				.add(Restrictions.eq("portfolio", portfolioParam))
				.add(Restrictions.eq("performance", status).ignoreCase())
				.setProjection(
						Projections.distinct(Projections.property("portfolio")));
		List<String> portfolio = criteria.list();
		t.commit();
		session.close();
		return portfolio;
	}

	public List<String> getBusUnit(String portfolio) {
		System.out.println("******************getBusUnit");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = session
				.createCriteria(Wowmain.class)
				.add(Restrictions.eq("portfolio", portfolio))
				.setProjection(
						Projections.distinct(Projections.property("bus_unit")));
		List<String> busUnit = criteria.list();
		t.commit();
		session.close();
		return busUnit;
	}

	public List<String> getTestPhase(String portfolio/* , String busUnit */) {
		System.out.println("******************getTestPhase");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = null;
		/*
		 * if(busUnit!=null || busUnit!= "" ){ if(!busUnit.isEmpty() &&
		 * !(busUnit.equalsIgnoreCase("undefined"))){
		 * System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ bus unit not empty"
		 * +busUnit.length()); criteria=session.createCriteria(Wowmain.class)
		 * .add(Restrictions.eq("portfolio", portfolio))
		 * .add(Restrictions.eq("bus_unit", busUnit))
		 * .setProjection(Projections.
		 * distinct(Projections.property("test_phase"))); }
		 * 
		 * else{
		 */
		// System.out.println("inside elseeeeeeeeeeeeeeeee");
		criteria = session.createCriteria(Wowmain.class);
		if ("all".equalsIgnoreCase(portfolio)) {
			// criteria.setProjection(Projections.distinct(Projections.property("project")));

		} else {
			criteria.add(Restrictions.eq("portfolio", portfolio));
			// criteria.setProjection(Projections.distinct(Projections.property("project")));
		}
		// }
		// }
		List<Wowmain> testPhase = criteria.list();
		List<String> projectLsit = new ArrayList();
		for (Wowmain wow : testPhase) {
			DateFormat df2 = new SimpleDateFormat("dd/MM/yyyy");
			String goliveDate = wow.getGolivedate();
			Date d2;
			try {
				d2 = df2.parse(goliveDate);
				Date d3 = new Date();
				if (d2.after(d3)) {
					projectLsit.add(wow.getProject());
				}
			} catch (ParseException e) {
				System.out.println("Unparsable Date");
			}

		}

		t.commit();
		session.close();
		return projectLsit;
	}

	public List<String> getProjectPhase(String portfolio, String busUnit,
			String testPhase) {
		System.out.println("******************getProjectPhase");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = null;
		if (busUnit != null) {
			if (!busUnit.isEmpty() && !(busUnit.equalsIgnoreCase("undefined"))) {
				criteria = session
						.createCriteria(Wowmain.class)
						.add(Restrictions.eq("portfolio", portfolio))
						.add(Restrictions.eq("bus_unit", busUnit))
						.add(Restrictions.eq("test_phase", testPhase))
						.setProjection(
								Projections.distinct(Projections
										.property("project_phase")));
			} else {
				criteria = session
						.createCriteria(Wowmain.class)
						.add(Restrictions.eq("portfolio", portfolio))

						.setProjection(
								Projections.distinct(Projections
										.property("project_phase")));
			}
		}
		List<String> projectPhase = criteria.list();
		t.commit();
		session.close();
		return projectPhase;
	}

	public List<String> getProject(String portfolio, String busUnit,
			String testPhase, String projectPhase) {
		System.out.println("******************getProject");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = null;
		/*
		 * Criteria criteria=session.createCriteria(Wowmain.class)
		 * .add(Restrictions.eq("portfolio", portfolio))
		 * .add(Restrictions.eq("bus_unit", busUnit))
		 * .add(Restrictions.eq("test_phase", testPhase))
		 * .add(Restrictions.eq("project_phase", projectPhase))
		 * .setProjection(Projections
		 * .distinct(Projections.property("project")));
		 */
		if (busUnit != null) {
			if (!busUnit.isEmpty() && !(busUnit.equalsIgnoreCase("undefined"))) {
				criteria = session
						.createCriteria(Wowmain.class)
						.add(Restrictions.eq("portfolio", portfolio))
						.add(Restrictions.eq("bus_unit", busUnit))
						.add(Restrictions.eq("test_phase", testPhase))
						.add(Restrictions.eq("project_phase", projectPhase))
						.setProjection(
								Projections.distinct(Projections
										.property("project")));
			} else {
				System.out.println("inside getting projet");
				System.out.println("Bus unit is empty");
				criteria = session
						.createCriteria(Wowmain.class)
						.add(Restrictions.eq("portfolio", portfolio))
						.add(Restrictions.eq("test_phase", testPhase))
						.add(Restrictions.eq("project_phase", projectPhase))
						.setProjection(
								Projections.distinct(Projections
										.property("project")));
			}
		} else {
			criteria = session
					.createCriteria(Wowmain.class)
					.add(Restrictions.eq("portfolio", portfolio))

					.add(Restrictions.eq("project_phase", projectPhase))
					.setProjection(
							Projections.distinct(Projections
									.property("project")));
		}
		List<String> project = criteria.list();
		System.out.println("Bus unit is empty" + project.size());
		t.commit();
		session.close();
		return project;
	}

	public ArrayList<List<String>> getSelectedReportData(String portfolio,
	/* String busUnit, */String testPhase, String projectPhase, String project) {
		System.out
				.println("****************/getSelectedReportData**************************");
		Transaction t;
		Criteria criteria = null;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		/*
		 * if(!busUnit.isEmpty() && busUnit!= "undefined"){
		 * criteria=session.createCriteria(Wowmain.class)
		 * .add(Restrictions.eq("portfolio", portfolio))
		 * .add(Restrictions.eq("bus_unit", busUnit))
		 * .add(Restrictions.eq("test_phase", testPhase))
		 * .add(Restrictions.eq("project_phase", projectPhase))
		 * .add(Restrictions.eq("project", project)); }else{
		 */
		criteria = session.createCriteria(Wowmain.class)
				.add(Restrictions.eq("portfolio", portfolio))
				.add(Restrictions.eq("test_phase", testPhase))
				.add(Restrictions.eq("project_phase", projectPhase))
				.add(Restrictions.eq("project", project));
		// }
		List<Wowmain> reportData = criteria.list();
		ArrayList<String> temp = new ArrayList<String>();
		ArrayList<List<String>> data = new ArrayList<List<String>>();
		System.out.println(portfolio + " , " + testPhase + " , " + projectPhase
				+ " , " + project);
		for (Wowmain w : reportData) {
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			String goliveDate = w.getGolivedate();
			try {
				Date d3 = df.parse(goliveDate);
				Date d4 = new Date();
				if (d3.after(d4)) {
					temp = new ArrayList<String>();
					temp.add(w.getPortfolio());
					// temp.add(w.getBus_unit());
					temp.add(w.getProject());
					temp.add(w.getProject_phase());
					// temp.add(w.getTest_phase());
					temp.add(w.getGolivedate());
					// temp.add("percentage of completion");
					temp.add(w.getPerformance());

					data.add(temp);
				}
			} catch (ParseException e) {

				System.out.println("Unparsable Date");
			}

		}
		t.commit();
		session.close();
		System.out.println("reportData: " + data);
		return data;
	}

	public List<String> getAllProjects() {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = session.createCriteria(Wowmain.class)
				.setProjection(
						Projections.distinct(Projections.property("project")));
		List<String> projList = criteria.list();
		t.commit();
		session.close();
		return projList;
	}

	public HashMap<String, String> getProjectDetails(String project)
			throws ParseException {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = session
				.createCriteria(Wowmain.class)
				.add(Restrictions.eq("project", project))
				.setProjection(
						Projections.distinct(Projections
								.property("last_updated")));
		String lastUpdated = "", performanceKey;
		HashMap<String, String> projMap = new HashMap<String, String>();
		if (criteria.list().size() > 0)
			lastUpdated = criteria.list().get(0).toString();
		if (lastUpdated != "") {
			criteria = session.createCriteria(Wowmain.class).add(
					Restrictions.eq("project", project));
			List<Wowmain> wowMainList = (List<Wowmain>) criteria.list();
			projMap.put("portfolio", wowMainList.get(0).getPortfolio());
			projMap.put("busUnit", wowMainList.get(0).getBus_unit());
			projMap.put("projPhase", wowMainList.get(0).getProject_phase());
			projMap.put("testPhase", wowMainList.get(0).getTest_phase());

			logger.debug("wowMainList.get(0).getGolivedate().toString() :"
					+ wowMainList.get(0).getGolivedate().toString());

			projMap.put("goLiveDate", wowMainList.get(0).getGolivedate()
					.toString());

			projMap.put("summary", wowMainList.get(0).getSummary());

			criteria = session.createCriteria(PerformanceKeys.class).add(
					Restrictions.eq("unique_id", wowMainList.get(0)
							.getUnique_id()));
			List<PerformanceKeys> performanceKeys = (List<PerformanceKeys>) criteria
					.list();
			performanceKey = performanceKeys.get(0).getScope() + ";"
					+ performanceKeys.get(0).getCost() + ";"
					+ performanceKeys.get(0).getSchedule() + ";"
					+ performanceKeys.get(0).getResources() + ";"
					+ performanceKeys.get(0).getBenefits_realization() + ";"
					+ performanceKeys.get(0).getRisks() + ";"
					+ performanceKeys.get(0).getIssues() + ";"
					+ performanceKeys.get(0).getStakeholders();
			projMap.put("performanceKeys", performanceKey);
		}
		t.commit();
		session.close();
		System.out.println("projMap :" + projMap);
		return projMap;
	}

	public void saveProjectDetails(String portfolio, String busUnit,
			String testPhase, String projectPhase, String project,
			String goLiveDate, String resultColor, String color, String summary) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = session
				.createCriteria(Wowmain.class)
				.add(Restrictions.eq("project", project))
				.setProjection(
						Projections.distinct(Projections.property("unique_id")));

		Wowmain wowmain = (Wowmain) session.get(Wowmain.class,
				Integer.parseInt(criteria.list().get(0).toString()));
		wowmain.setPortfolio(portfolio);
		if (!busUnit.equalsIgnoreCase(""))
			wowmain.setBus_unit(busUnit);
		else
			wowmain.setBus_unit("");
		wowmain.setProject_phase(projectPhase);
		wowmain.setTest_phase(testPhase);
		wowmain.setGolivedate(goLiveDate);
		wowmain.setPerformance(resultColor);
		wowmain.setSummary(summary);
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format1 = new SimpleDateFormat("dd-MMM-yy");

		String lastUpdated = format1.format(cal.getTime());
		wowmain.setLast_updated(lastUpdated);
		session.update(wowmain);
		t.commit();
		session.close();
	}

	public void savePerformanceKeys(String project, String color) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();

		Criteria criteria = session
				.createCriteria(Wowmain.class)
				.add(Restrictions.eq("project", project))
				.setProjection(
						Projections.distinct(Projections.property("unique_id")));
		String colors[] = color.split(";");

		Criteria criteria1 = session
				.createCriteria(PerformanceKeys.class)
				.add(Restrictions.eq("unique_id",
						Integer.parseInt(criteria.list().get(0).toString())))
				.setProjection(
						Projections.distinct(Projections.property("unique_id")));
		if (criteria1.list().size() > 0) {
			PerformanceKeys performanceKeys = (PerformanceKeys) session.get(
					PerformanceKeys.class,
					Integer.parseInt(criteria.list().get(0).toString()));
			performanceKeys.setScope(colors[0]);
			performanceKeys.setCost(colors[1]);
			performanceKeys.setSchedule(colors[2]);
			performanceKeys.setResources(colors[3]);
			performanceKeys.setBenefits_realization(colors[4]);
			performanceKeys.setRisks(colors[5]);
			performanceKeys.setIssues(colors[6]);
			performanceKeys.setStakeholders(colors[7]);
			session.update(performanceKeys);
		} else {
			PerformanceKeys performanceKeys = new PerformanceKeys();
			performanceKeys.setUnique_id(Integer.parseInt(criteria.list()
					.get(0).toString()));

			performanceKeys.setScope(colors[0]);
			performanceKeys.setCost(colors[1]);
			performanceKeys.setSchedule(colors[2]);
			performanceKeys.setResources(colors[3]);
			performanceKeys.setBenefits_realization(colors[4]);
			performanceKeys.setRisks(colors[5]);
			performanceKeys.setIssues(colors[6]);
			performanceKeys.setStakeholders(colors[7]);
			session.save(performanceKeys);
		}

		t.commit();
		session.close();
	}

	@SuppressWarnings("rawtypes")
	public ArrayList<ArrayList> getExecutionStatusDetails(String portfolio,
			String projName, String projPhase, String goLiveDate, String poc,
			String status) throws SQLException {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		System.out.println(portfolio + " , " + " , " + " , " + projPhase
				+ " , " + projName);
		ArrayList<ArrayList> totalData = new ArrayList<ArrayList>();
		ArrayList temp = new ArrayList();

		Criteria criteria = session.createCriteria(Wowmain.class)
				.add(Restrictions.eq("portfolio", portfolio))
				// .add(Restrictions.eq("project_phase", projPhase))
				.add(Restrictions.eq("project", projName))
				.setProjection(
						Projections.distinct(Projections.property("unique_id")));
		List<Integer> uidList = criteria.list();
		System.out.println("$$$$$$$$$$$$$" + uidList.size());
		String query1 = "select 0 as id, sum(te.pass) as pass,sum(te.fail) as fail, sum(te.blocked) as blocked, sum(te.in_progress) as in_progress, sum(te.no_run) as no_run, sum(te.not_available) as not_available, sum(te.total) as total, sum(te.expected_percent) as expected_percent, sum(te.percentage_completion) as percentage_completion,"
				+ " tem.release_iteration_name from testexecution te,test_execution_main tem "
				+ " where te.test_execution_id=tem.test_execution_id and te.test_execution_id "
				+ " in(select test_execution_id from test_execution_main where unique_id=?) "
				+ "  group by tem.release_iteration_name";
		// Query
		// query=session.createSQLQuery("select te.*,tem.cycle_name from testexecution te,test_execution_main tem where te.test_execution_id=tem.test_execution_id and te.test_execution_id  in(select test_execution_id from test_execution_main where unique_id=?)");
		Query query = session.createSQLQuery(query1)
				.addScalar("id", StandardBasicTypes.INTEGER)
				.addScalar("pass", StandardBasicTypes.INTEGER)
				.addScalar("fail", StandardBasicTypes.INTEGER)
				.addScalar("blocked", StandardBasicTypes.INTEGER)
				.addScalar("in_progress", StandardBasicTypes.INTEGER)
				.addScalar("no_run", StandardBasicTypes.INTEGER)
				.addScalar("not_available", StandardBasicTypes.INTEGER)
				.addScalar("total", StandardBasicTypes.INTEGER)
				.addScalar("expected_percent", StandardBasicTypes.INTEGER)
				.addScalar("percentage_completion", StandardBasicTypes.INTEGER)
				.addScalar("release_iteration_name", StandardBasicTypes.STRING);

		query.setParameter(0, uidList.get(0));
		List<Object[]> list = query.list();
		System.out.println("list size:" + list.size());
		for (Object[] obj : list) {
			temp = new ArrayList();
			temp.add(obj[10]);
			temp.add(obj[1]);
			temp.add(obj[2]);
			temp.add(obj[3]);
			temp.add(obj[4]);
			temp.add(obj[5]);
			temp.add(obj[6]);
			temp.add(obj[7]);
			temp.add(obj[8]);
			temp.add(obj[9]);
			Integer quo = new Integer((int) obj[1]);
			Integer den = new Integer((int) obj[7]);
			Integer minusDen = new Integer((int) obj[6]);
			DecimalFormat df = new DecimalFormat("#.##");
			Double passPercent = (quo.doubleValue())
					/ (den.doubleValue() - minusDen.doubleValue()) * 100;
			System.out.println("quo  " + quo + " den  " + den + " minusDen "
					+ minusDen);
			if (Double.isNaN(passPercent)) {
				passPercent = 0.00;
			}
			passPercent = Double.valueOf(df.format(passPercent));
			temp.add(passPercent);
			totalData.add(temp);
			/*
			 * System.out.println("obj[0] :"+obj[0]);
			 * System.out.println("obj[0] :"+obj[1]);
			 * System.out.println("obj[0] :"+obj[2]);
			 * System.out.println("obj[0] :"+obj[3]);
			 * System.out.println("obj[0] :"+obj[4]);
			 * System.out.println("obj[0] :"+obj[5]);
			 * System.out.println("obj[0] :"+obj[6]);
			 * System.out.println("obj[0] :"+obj[7]);
			 * System.out.println("obj[0] :"+obj[8]);
			 * System.out.println("obj[0] :"+obj[9]);
			 * System.out.println("obj[0] :"+obj[10]);
			 */
		}
		t.commit();
		session.close();
		System.out.println("totalData :" + totalData.size());
		return totalData;
	}

	public ArrayList getDefectStatusDetails(String portfolio, String busUnit,
			String testPhase, String projPhase, String projName,
			String goLiveDate, String poc, String status) {

		logger.debug("inside ****getDefectStatusDetails********");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		ArrayList<Object[]> listOfDefectsUAt = null;

		Criteria criteria = session
				.createCriteria(Wowmain.class)
				.add(Restrictions.eq("portfolio", portfolio))
				.add(Restrictions.eq("project", projName))
				.setProjection(
						Projections.distinct(Projections.property("unique_id")));
		List<Integer> uidList = criteria.list();

		Defect_Status_UAT defect_UAT = (Defect_Status_UAT) session.get(
				Defect_Status_UAT.class, uidList.get(0));
		if (defect_UAT != null) {
			Criteria criteriaUAT = session
					.createCriteria(Wowmain.class)
					.add(Restrictions.eq("portfolio", portfolio))
					.add(Restrictions.eq("project", projName))
					.setProjection(
							Projections.distinct(Projections
									.property("unique_id")));
			ProjectionList defectDetListUAT = Projections.projectionList();

			defectDetListUAT
					.add(Projections.property("uat_open_Def_Severity1"));
			defectDetListUAT
					.add(Projections.property("uat_open_Def_Severity2"));
			defectDetListUAT
					.add(Projections.property("uat_open_Def_Severity3"));
			defectDetListUAT
					.add(Projections.property("uat_open_Def_Severity4"));

			defectDetListUAT.add(Projections
					.property("uat_inprogress_Def_Severity1"));
			defectDetListUAT.add(Projections
					.property("uat_inprogress_Def_Severity2"));
			defectDetListUAT.add(Projections
					.property("uat_inprogress_Def_Severity3"));
			defectDetListUAT.add(Projections
					.property("uat_inprogress_Def_Severity4"));

			defectDetListUAT.add(Projections
					.property("uat_fixed_Def_Severity1"));
			defectDetListUAT.add(Projections
					.property("uat_fixed_Def_Severity2"));
			defectDetListUAT.add(Projections
					.property("uat_fixed_Def_Severity3"));
			defectDetListUAT.add(Projections
					.property("uat_fixed_Def_Severity4"));

			defectDetListUAT.add(Projections
					.property("uat_retest_Def_Severity1"));
			defectDetListUAT.add(Projections
					.property("uat_retest_Def_Severity2"));
			defectDetListUAT.add(Projections
					.property("uat_retest_Def_Severity3"));
			defectDetListUAT.add(Projections
					.property("uat_retest_Def_Severity4"));

			defectDetListUAT.add(Projections
					.property("uat_reopen_Def_Severity1"));
			defectDetListUAT.add(Projections
					.property("uat_reopen_Def_Severity2"));
			defectDetListUAT.add(Projections
					.property("uat_reopen_Def_Severity3"));
			defectDetListUAT.add(Projections
					.property("uat_reopen_Def_Severity4"));

			defectDetListUAT.add(Projections
					.property("uat_closed_Def_Severity1"));
			defectDetListUAT.add(Projections
					.property("uat_closed_Def_Severity2"));
			defectDetListUAT.add(Projections
					.property("uat_closed_Def_Severity3"));
			defectDetListUAT.add(Projections
					.property("uat_closed_Def_Severity4"));

			criteriaUAT = session.createCriteria(Defect_Status_UAT.class)
					.add(Restrictions.eq("unique_id", uidList.get(0)))
					.setProjection(defectDetListUAT);
			listOfDefectsUAt = (ArrayList<Object[]>) criteriaUAT.list();
		}
		ProjectionList defectDetList = Projections.projectionList();
		/*
		 * defectDetList.add(Projections.property("new_Def_Severity1"));
		 * defectDetList.add(Projections.property("new_Def_Severity2"));
		 * defectDetList.add(Projections.property("new_Def_Severity3"));
		 * defectDetList.add(Projections.property("new_Def_Severity4"));
		 */

		defectDetList.add(Projections.property("open_Def_Severity1"));
		defectDetList.add(Projections.property("open_Def_Severity2"));
		defectDetList.add(Projections.property("open_Def_Severity3"));
		defectDetList.add(Projections.property("open_Def_Severity4"));

		defectDetList.add(Projections.property("inprogress_Def_Severity1"));
		defectDetList.add(Projections.property("inprogress_Def_Severity2"));
		defectDetList.add(Projections.property("inprogress_Def_Severity3"));
		defectDetList.add(Projections.property("inprogress_Def_Severity4"));

		defectDetList.add(Projections.property("fixed_Def_Severity1"));
		defectDetList.add(Projections.property("fixed_Def_Severity2"));
		defectDetList.add(Projections.property("fixed_Def_Severity3"));
		defectDetList.add(Projections.property("fixed_Def_Severity4"));

		defectDetList.add(Projections.property("retest_Def_Severity1"));
		defectDetList.add(Projections.property("retest_Def_Severity2"));
		defectDetList.add(Projections.property("retest_Def_Severity3"));
		defectDetList.add(Projections.property("retest_Def_Severity4"));

		defectDetList.add(Projections.property("reopen_Def_Severity1"));
		defectDetList.add(Projections.property("reopen_Def_Severity2"));
		defectDetList.add(Projections.property("reopen_Def_Severity3"));
		defectDetList.add(Projections.property("reopen_Def_Severity4"));

		defectDetList.add(Projections.property("closed_Def_Severity1"));
		defectDetList.add(Projections.property("closed_Def_Severity2"));
		defectDetList.add(Projections.property("closed_Def_Severity3"));
		defectDetList.add(Projections.property("closed_Def_Severity4"));

		criteria = session.createCriteria(Defect_Status.class)
				.add(Restrictions.eq("unique_id", uidList.get(0)))
				.setProjection(defectDetList);

		/*
		 * Query query=
		 * session.createSQLQuery("select * from Defect_Status where unique_id = ?"
		 * ); query.setParameter(0, uidList.get(0));
		 */

		ArrayList<Object[]> listOfDefects = (ArrayList<Object[]>) criteria
				.list();

		System.out.println("size of defect list is*********************"
				+ listOfDefects.size());
		ArrayList finalTempList = new ArrayList();
		ArrayList finalList = new ArrayList();

		if (listOfDefectsUAt != null) {
			// listOfDefects.addAll(listOfDefectsUAt);
			for (int i = 0; i < listOfDefects.size(); i++) {
				Object[] temp = listOfDefects.get(i);
				Object[] temp1 = listOfDefectsUAt.get(i);
				for (int j = 0; j < temp.length; j++) {
					int result = Integer.parseInt(String.valueOf(temp[j]))
							+ Integer.parseInt(String.valueOf(temp1[j]));
					System.out.println("defect resulttt" + result);
					finalTempList.add(result);
				}

			}
		} else {
			for (Object[] obj : listOfDefects) {
				for (int i = 0; i < obj.length; i++) {

					finalTempList.add(obj[i]);
				}
			}
		}

		System.out.println(finalTempList.size());
		System.out.println("finalTempList :" + finalTempList);
		t.commit();
		session.close();
		return finalTempList;
	}

	public LinkedList<Integer> getStatusForPieChart(String portfolio,
			String busUnit, String testPhase, String projPhase,
			String projName, String goLiveDate, String poc, String status) {
		List<Object[]> queryListforCodeUAT = null;
		List<Object[]> queryListforDocUAT = null;
		List<Object[]> queryListforEnvUAT = null;
		List<Object[]> queryListforOtherUAT = null;
		List<Object[]> queryListforDataUAT = null;
		logger.debug("inside ****getStatusForPieChart********");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = session.createCriteria(Wowmain.class)
				.add(Restrictions.eq("portfolio", portfolio))

				// .add(Restrictions.eq("project_phase", projPhase))
				.add(Restrictions.eq("project", projName))
				.setProjection(
						Projections.distinct(Projections.property("unique_id")));
		List<Integer> uidList = criteria.list();
		System.out.println("length of Listtttttt*****" + uidList.size());
		System.out.println("id of the query is***********" + uidList.get(0));
		RootCauseUAT rootUat = (RootCauseUAT) session.get(RootCauseUAT.class,
				uidList.get(0));
		if (rootUat != null) {
			ProjectionList pojforCode = Projections.projectionList();
			pojforCode.add(Projections
					.property("uat_code_caused_by_earlier_fix"));
			pojforCode.add(Projections.property("uat_code_data_handling"));
			pojforCode.add(Projections.property("uat_code_database_design"));
			pojforCode.add(Projections.property("uat_code_database_design"));
			pojforCode.add(Projections.property("uat_code_login_error"));
			pojforCode.add(Projections.property("uat_code_program_code_error"));
			pojforCode.add(Projections.property("uat_code_security"));
			pojforCode.add(Projections
					.property("uat_code_standards_compliance"));

			ProjectionList pojforDoc = Projections.projectionList();
			pojforDoc.add(Projections.property("uat_doc_ambiguity"));
			pojforDoc.add(Projections.property("uat_doc_business_rq_problem"));
			pojforDoc.add(Projections
					.property("uat_doc_functional_spec_problem"));
			pojforDoc.add(Projections
					.property("uat_doc_solution_design_problem"));
			pojforDoc.add(Projections.property("uat_doc_as_per_design"));
			pojforDoc.add(Projections
					.property("uat_doc_standards_non_conformance"));
			pojforDoc.add(Projections
					.property("uat_doc_technical_spec_problem"));
			pojforDoc.add(Projections.property("uat_doc_test_script_problem"));

			ProjectionList pojforenv = Projections.projectionList();
			pojforenv.add(Projections.property("uat_env_environment_problem"));
			pojforenv.add(Projections.property("uat_env_installation_error"));
			pojforenv.add(Projections
					.property("uat_env_interface_timing_problem"));
			pojforenv
					.add(Projections.property("uat_env_interop_compatability"));
			pojforenv.add(Projections.property("uat_env_performance_problem"));
			pojforenv.add(Projections.property("uat_env_scheduling_error"));

			ProjectionList pojforOther = Projections.projectionList();
			pojforOther.add(Projections.property("uat_other_duplicate_defect"));
			pojforOther.add(Projections.property("uat_other_not_a_defect"));

			ProjectionList pojforData = Projections.projectionList();
			pojforData
					.add(Projections.property("uat_data_configuration_error"));
			pojforData.add(Projections.property("uat_data_problem"));

			Criteria criteriaForCodeUAT = session
					.createCriteria(RootCauseUAT.class)
					.add(Restrictions.eq("unique_id", uidList.get(0)))
					.setProjection(pojforCode);

			Criteria criteriaForDocUAT = session
					.createCriteria(RootCauseUAT.class)
					.add(Restrictions.eq("unique_id", uidList.get(0)))
					.setProjection(pojforDoc);

			Criteria criteriaForEnvUAT = session
					.createCriteria(RootCauseUAT.class)
					.add(Restrictions.eq("unique_id", uidList.get(0)))
					.setProjection(pojforenv);

			Criteria criteriaForOtherUAT = session
					.createCriteria(RootCauseUAT.class)
					.add(Restrictions.eq("unique_id", uidList.get(0)))
					.setProjection(pojforOther);

			Criteria criteriaForDataUAT = session
					.createCriteria(RootCauseUAT.class)
					.add(Restrictions.eq("unique_id", uidList.get(0)))
					.setProjection(pojforData);

			queryListforCodeUAT = criteriaForCodeUAT.list();
			queryListforDocUAT = criteriaForDocUAT.list();
			queryListforEnvUAT = criteriaForEnvUAT.list();
			queryListforOtherUAT = criteriaForOtherUAT.list();
			queryListforDataUAT = criteriaForDataUAT.list();
		}
		ProjectionList pojforCode = Projections.projectionList();
		pojforCode.add(Projections.property("code_caused_by_earlier_fix"));
		pojforCode.add(Projections.property("code_data_handling"));
		pojforCode.add(Projections.property("code_database_design"));
		pojforCode.add(Projections.property("code_database_design"));
		pojforCode.add(Projections.property("code_login_error"));
		pojforCode.add(Projections.property("code_program_code_error"));
		pojforCode.add(Projections.property("code_security"));
		pojforCode.add(Projections.property("code_standards_compliance"));

		ProjectionList pojforDoc = Projections.projectionList();
		pojforDoc.add(Projections.property("doc_ambiguity"));
		pojforDoc.add(Projections.property("doc_business_rq_problem"));
		pojforDoc.add(Projections.property("doc_functional_spec_problem"));
		pojforDoc.add(Projections.property("doc_solution_design_problem"));
		pojforDoc.add(Projections.property("doc_as_per_design"));
		pojforDoc.add(Projections.property("doc_standards_non_conformance"));
		pojforDoc.add(Projections.property("doc_technical_spec_problem"));
		pojforDoc.add(Projections.property("doc_test_script_problem"));

		ProjectionList pojforenv = Projections.projectionList();
		pojforenv.add(Projections.property("env_environment_problem"));
		pojforenv.add(Projections.property("env_installation_error"));
		pojforenv.add(Projections.property("env_interface_timing_problem"));
		pojforenv.add(Projections.property("env_interop_compatability"));
		pojforenv.add(Projections.property("env_performance_problem"));
		pojforenv.add(Projections.property("env_scheduling_error"));

		ProjectionList pojforOther = Projections.projectionList();
		pojforOther.add(Projections.property("other_duplicate_defect"));
		pojforOther.add(Projections.property("other_not_a_defect"));

		ProjectionList pojforData = Projections.projectionList();
		pojforData.add(Projections.property("data_configuration_error"));
		pojforData.add(Projections.property("data_problem"));

		Criteria criteriaForCode = session.createCriteria(RootCause.class)
				.add(Restrictions.eq("unique_id", uidList.get(0)))
				.setProjection(pojforCode);

		Criteria criteriaForDoc = session.createCriteria(RootCause.class)
				.add(Restrictions.eq("unique_id", uidList.get(0)))
				.setProjection(pojforDoc);

		Criteria criteriaForEnv = session.createCriteria(RootCause.class)
				.add(Restrictions.eq("unique_id", uidList.get(0)))
				.setProjection(pojforenv);

		Criteria criteriaForOther = session.createCriteria(RootCause.class)
				.add(Restrictions.eq("unique_id", uidList.get(0)))
				.setProjection(pojforOther);

		Criteria criteriaForData = session.createCriteria(RootCause.class)
				.add(Restrictions.eq("unique_id", uidList.get(0)))
				.setProjection(pojforData);

		List<Object[]> queryListforCode = criteriaForCode.list();
		List<Object[]> queryListforDoc = criteriaForDoc.list();
		List<Object[]> queryListforEnv = criteriaForEnv.list();
		List<Object[]> queryListforOther = criteriaForOther.list();
		List<Object[]> queryListforData = criteriaForData.list();

		ArrayList<Integer> finalListforCode = new ArrayList<Integer>();
		ArrayList<Integer> finalListforDoc = new ArrayList<Integer>();
		LinkedList<Integer> finalListforToAdd = new LinkedList<Integer>();
		ArrayList<Integer> finalListforCodeUAT = new ArrayList<Integer>();
		ArrayList<Integer> finalListforDocUAT = new ArrayList<Integer>();
		// LinkedList<Integer> finalListforToAddUAT=new LinkedList<Integer>();

		for (Object[] obj : queryListforCode) {
			for (int i = 0; i < obj.length; i++) {
				Integer ia = (Integer) obj[i];

				finalListforCode.add(ia);
			}
		}

		System.out.println("getStatusForPieChart********" + finalListforCode);

		int valueofProduction = (int) finalListforCode.get(3);
		System.out.println(valueofProduction);
		finalListforCode.remove(3);
		Integer iCode = 0;
		for (Integer intr : finalListforCode) {
			iCode += intr;
		}

		for (Object[] obj : queryListforDoc) {
			for (int i = 0; i < obj.length; i++) {
				Integer ia = (Integer) obj[i];
				finalListforDoc.add(ia);

			}
		}

		System.out.println(finalListforDoc);
		int technical_Spec = finalListforDoc.get(6);
		int test_Scripts = finalListforDoc.get(7);

		finalListforDoc.remove(6);
		finalListforDoc.remove(6);

		Integer iDoc = 0;
		for (Integer intr : finalListforDoc) {
			iDoc += intr;
		}
		Integer iEnv = 0;
		for (Object[] obj : queryListforEnv) {
			for (int i = 0; i < obj.length; i++) {
				iEnv += (Integer) obj[i];

			}
		}
		Integer iOther = 0;
		for (Object[] obj : queryListforOther) {
			for (int i = 0; i < obj.length; i++) {
				iOther += (Integer) obj[i];

			}
		}

		Integer iData = 0;
		for (Object[] obj : queryListforData) {
			for (int i = 0; i < obj.length; i++) {
				iData += (Integer) obj[i];

			}
		}

		finalListforToAdd.add(iCode);
		finalListforToAdd.add(valueofProduction);
		finalListforToAdd.add(iData);
		finalListforToAdd.add(iDoc);
		finalListforToAdd.add(technical_Spec);
		finalListforToAdd.add(test_Scripts);
		finalListforToAdd.add(iEnv);
		finalListforToAdd.add(iOther);

		if (rootUat != null) {

			for (Object[] obj : queryListforCodeUAT) {
				for (int i = 0; i < obj.length; i++) {
					Integer ia = (Integer) obj[i];

					finalListforCodeUAT.add(ia);
				}
			}

			System.out.println("getStatusForPieChart********"
					+ finalListforCode);

			int valueofProductionUAT = (int) finalListforCodeUAT.get(3);
			System.out.println(valueofProductionUAT);
			finalListforCode.remove(3);
			Integer iCodeUAT = 0;
			for (Integer intr : finalListforCodeUAT) {
				iCodeUAT += intr;
			}

			for (Object[] obj : queryListforDocUAT) {
				for (int i = 0; i < obj.length; i++) {
					Integer ia = (Integer) obj[i];
					finalListforDocUAT.add(ia);

				}
			}

			System.out.println(finalListforDoc);
			int technical_SpecUAT = finalListforDocUAT.get(6);
			int test_ScriptsUAT = finalListforDocUAT.get(7);

			finalListforDocUAT.remove(6);
			finalListforDocUAT.remove(6);

			Integer iDocUAT = 0;
			for (Integer intr : finalListforDocUAT) {
				iDocUAT += intr;
			}
			Integer iEnvUAT = 0;
			for (Object[] obj : queryListforEnvUAT) {
				for (int i = 0; i < obj.length; i++) {
					iEnvUAT += (Integer) obj[i];

				}
			}
			Integer iOtherUAT = 0;
			for (Object[] obj : queryListforOtherUAT) {
				for (int i = 0; i < obj.length; i++) {
					iOtherUAT += (Integer) obj[i];

				}
			}

			Integer iDataUAT = 0;
			for (Object[] obj : queryListforDataUAT) {
				for (int i = 0; i < obj.length; i++) {
					iDataUAT += (Integer) obj[i];

				}
			}

			iCodeUAT += finalListforToAdd.get(0);
			valueofProductionUAT += finalListforToAdd.get(1);
			iDataUAT += finalListforToAdd.get(2);
			iDocUAT += finalListforToAdd.get(3);
			technical_SpecUAT += finalListforToAdd.get(4);
			test_ScriptsUAT += finalListforToAdd.get(5);
			iEnvUAT += finalListforToAdd.get(6);
			iOtherUAT += finalListforToAdd.get(7);
			finalListforToAdd.clear();
			finalListforToAdd.add(iCodeUAT);
			finalListforToAdd.add(valueofProductionUAT);
			finalListforToAdd.add(iDataUAT);
			finalListforToAdd.add(iDocUAT);
			finalListforToAdd.add(technical_SpecUAT);
			finalListforToAdd.add(test_ScriptsUAT);
			finalListforToAdd.add(iEnvUAT);
			finalListforToAdd.add(iOtherUAT);

		}

		t.commit();
		session.close();
		return finalListforToAdd;

	}

	public LinkedList populateDailyStatusTables(String portfolio,
			String busUnit, String testPhase, String projPhase,
			String projName, String goLiveDate, String poc, String status) {
		System.out.println("inside *******populateDailyStatusTables*********");
		System.out.println(busUnit);
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();

		LinkedList listOfKeys = new LinkedList();
		Criteria criteria = null;
		if (!busUnit.isEmpty()) {
			criteria = session
					.createCriteria(Wowmain.class)
					.add(Restrictions.eq("portfolio", portfolio))
					// .add(Restrictions.eq("project_phase", projPhase))
					.add(Restrictions.eq("project", projName))
					.setProjection(
							Projections.distinct(Projections
									.property("unique_id")));
		} else {
			criteria = session
					.createCriteria(Wowmain.class)
					.add(Restrictions.eq("portfolio", portfolio))

					// .add(Restrictions.eq("project_phase", projPhase))
					.add(Restrictions.eq("project", projName))
					.setProjection(
							Projections.distinct(Projections
									.property("unique_id")));
		}
		List<Integer> uidList = criteria.list();
		int unique_id = uidList.get(0);

		System.out.println("Last updateeeeddd" + uidList);
		System.out.println("uniqueeeeeeeeeeeeeeeeeeeee" + unique_id);
		Query query = session
				.createSQLQuery("select * from PerformanceKeys where unique_id=?");
		// Query
		// query=session.createQuery("from PerformanceKeys  where unique_id = ?");
		query.setParameter(0, unique_id);

		List<Object[]> listofkeys = query.list();
		System.out.println("size of list \t" + listofkeys.size());
		for (Object[] obj : listofkeys) {
			for (int i = 1; i < obj.length; i++) {
				listOfKeys.add(obj[i]);
			}
		}
		Query queryforDate = session
				.createSQLQuery("select w.unique_id, w.portfolio,w.bus_unit, w.project_phase, w.project,w.golivedate, w.performance, w.summary, w.last_updated,w.risks_issues,COALESCE(round(avg(t.pass)/avg((t.total-t.not_available))*100,2),0),tem.release_iteration_name, COALESCE(tem.release_iteration_start_date,''), COALESCE(tem.release_iteration_end_date,'') from Wowmain w, testexecution t, test_execution_main tem where w.unique_id= ? and w.unique_id = tem.unique_id and t.test_execution_id = tem.test_execution_id group by w.unique_id, w.portfolio,w.bus_unit, w.project_phase, w.project,w.golivedate, w.performance, w.summary,w.last_updated,w.risks_issues, tem.release_iteration_name, tem.release_iteration_start_date, tem.release_iteration_end_date");
		// Query
		// queryforDate=session.createQuery("select  Wowmain  where unique_id=?");
		queryforDate.setParameter(0, unique_id);

		List<Object[]> listofkeysforDate = queryforDate.list();
		System.out.println("size of listofkeysforDate \t"
				+ listofkeysforDate.size());
		for (Object[] obj : listofkeysforDate) {
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
					+ obj[6]);
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
					+ obj[7]);
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
					+ obj[8]);
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
					+ obj[9]);
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
					+ obj[10]);
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
					+ obj[11]);
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
					+ obj[12]);
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
					+ obj[13]);

			// listOfKeys.add(obj[1]);
			// listOfKeys.add(obj[4]);
			listOfKeys.add(obj[6]);
			listOfKeys.add(obj[7]);
			listOfKeys.add(obj[8]);
			listOfKeys.add(obj[9]);
			listOfKeys.add(obj[10]);
			listOfKeys.add(obj[11]);
			listOfKeys.add(obj[12]);
			listOfKeys.add(obj[13]);

		}
		System.out.println("listOfKeys ::" + listOfKeys);
		t.commit();
		session.close();
		return listOfKeys;

	}

	@SuppressWarnings("rawtypes")
	public ArrayList<List<String>> getSelectedReportDataForAll() {
		System.out
				.println("************inside getSelectedReportDataForAll*******************");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();

		// Query query= session.createSQLQuery("select * from Wowmain");
		List<Wowmain> listforBusUnit = (List<Wowmain>) session.createCriteria(
				Wowmain.class).list();
		System.out.println("The size is" + listforBusUnit.size());
		List<String> temp;
		ArrayList<List<String>> finalListTobeSent = new ArrayList<List<String>>();

		// for(int k=0;k<listforBusUnit.size();k++){
		for (Wowmain w : listforBusUnit) {

			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			String goliveDate = w.getGolivedate();
			try {
				Date d3 = df.parse(goliveDate);
				Date d4 = new Date();
				if (d3.after(d4)) {
					temp = new LinkedList<String>();
					temp.add(w.getPortfolio());
					// temp.add(w.getBus_unit());
					temp.add(w.getProject());
					temp.add(w.getProject_start());
					// temp.add(w.getTest_phase());
					temp.add(w.getGolivedate());
					// temp.add("percentage of completion");
					temp.add(w.getPerformance());

					finalListTobeSent.add(temp);
				}
			} catch (ParseException e) {

				System.out.println("Unparsable Date");
			}

		}
		/*
		 * System.out.println("totlal items"+listTobeAdded.size());
		 * finalListTobeSent.addAll(listTobeAdded);
		 */
		t.commit();
		session.close();
		return finalListTobeSent;
	}

	public ArrayList<List<String>> getSelectedReportDataForBusUnit(
			String portfolio) {

		System.out
				.println("************inside getSelectedReportDataForBusUnit*******************");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = session.createCriteria(Wowmain.class);
		criteria.add(Restrictions.eq("portfolio", portfolio));
		List<Wowmain> listforBusUnit = criteria.list();
		System.out.println("The size is" + listforBusUnit.size());
		List<String> temp;
		ArrayList<List<String>> finalListTobeSent = new ArrayList<List<String>>();

		for (int k = 0; k < listforBusUnit.size(); k++) {

			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			String goliveDate = listforBusUnit.get(k).getGolivedate();

			try {
				Date d3 = df.parse(goliveDate);
				Date d4 = new Date();
				if (d3.after(d4)) {
					temp = new LinkedList<String>();

					temp.add(listforBusUnit.get(k).getPortfolio());
					// temp.add(listforBusUnit.get(k).getBus_unit());
					temp.add(listforBusUnit.get(k).getProject());
					System.out.println(listforBusUnit.get(k).getProject());
					temp.add(listforBusUnit.get(k).getProject_start());
					// temp.add(listforBusUnit.get(k).getTest_phase());
					temp.add(listforBusUnit.get(k).getGolivedate());
					// temp.add("percentage of completion");
					temp.add(listforBusUnit.get(k).getPerformance());
					System.out.println(temp);
					finalListTobeSent.add(temp);
				}
			} catch (ParseException p) {
				System.out.println(p.getMessage());
			}

		}

		System.out.println(finalListTobeSent);
		t.commit();
		session.close();
		return finalListTobeSent;
	}

	public ArrayList<List<String>> getSelectedReportDataForTestPhase(
			String portfolio/* , String busUnit */) {
		System.out
				.println("************inside getSelectedReportDataForTestPhase*******************");

		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		List<Wowmain> listforBusUnit = new ArrayList<Wowmain>();
		Criteria criteria = null;
		/*
		 * if(busUnit!=null){ if(!busUnit.isEmpty()){ criteria=
		 * session.createCriteria(Wowmain.class);
		 * criteria.add(Restrictions.eq("portfolio", portfolio));
		 * criteria.add(Restrictions.eq("bus_unit", busUnit));
		 * 
		 * } else{
		 */
		criteria = session.createCriteria(Wowmain.class);
		criteria.add(Restrictions.eq("portfolio", portfolio));
		// }

		// }

		listforBusUnit = criteria.list();
		System.out.println("The size is" + listforBusUnit.size());
		List<String> temp;
		ArrayList<List<String>> finalListTobeSent = new ArrayList<List<String>>();

		for (int k = 0; k < listforBusUnit.size(); k++) {

			temp = new LinkedList<String>();
			temp.add(listforBusUnit.get(k).getPortfolio());
			// temp.add(listforBusUnit.get(k).getBus_unit());
			temp.add(listforBusUnit.get(k).getProject());
			System.out.println(listforBusUnit.get(k).getProject());
			temp.add(listforBusUnit.get(k).getProject_phase());
			// temp.add(listforBusUnit.get(k).getTest_phase());
			temp.add(listforBusUnit.get(k).getGolivedate());
			// temp.add("percentage of completion");
			temp.add(listforBusUnit.get(k).getPerformance());
			System.out.println(temp);
			finalListTobeSent.add(temp);
		}

		t.commit();
		session.close();
		return finalListTobeSent;
	}

	public ArrayList<List<String>> getSelectedReportDataForProjectPhase(
			String portfolio/* , String busUnit */, String testPhase) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		List<Wowmain> listforBusUnit = new ArrayList<Wowmain>();
		Criteria criteria = null;
		/*
		 * if(busUnit!=null){ if(!busUnit.isEmpty()){ criteria=
		 * session.createCriteria(Wowmain.class);
		 * criteria.add(Restrictions.eq("portfolio", portfolio));
		 * criteria.add(Restrictions.eq("bus_unit", busUnit));
		 * criteria.add(Restrictions.eq("test_phase", testPhase)); } else{
		 */
		criteria = session.createCriteria(Wowmain.class);
		criteria.add(Restrictions.eq("portfolio", portfolio));
		criteria.add(Restrictions.eq("test_phase", testPhase));
		// }
		// }

		listforBusUnit = criteria.list();
		System.out.println("The size is" + listforBusUnit.size());
		List<String> temp;
		ArrayList<List<String>> finalListTobeSent = new ArrayList<List<String>>();

		for (int k = 0; k < listforBusUnit.size(); k++) {

			temp = new LinkedList<String>();
			temp.add(listforBusUnit.get(k).getPortfolio());
			// temp.add(listforBusUnit.get(k).getBus_unit());
			temp.add(listforBusUnit.get(k).getProject());
			System.out.println(listforBusUnit.get(k).getProject());
			temp.add(listforBusUnit.get(k).getProject_phase());
			// temp.add(listforBusUnit.get(k).getTest_phase());
			temp.add(listforBusUnit.get(k).getGolivedate());
			// temp.add("percentage of completion");
			temp.add(listforBusUnit.get(k).getPerformance());
			System.out.println(temp);
			finalListTobeSent.add(temp);
		}

		t.commit();
		session.close();
		return finalListTobeSent;
	}

	public ArrayList<List<String>> getSelectedReportDataForProject(
			String portfolio/* , String busUnit */, String testPhase,
			String projectPhase) {
		Transaction t;
		List<Wowmain> listforBusUnit = new ArrayList<Wowmain>();
		Criteria criteria = null;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		/*
		 * if(busUnit!=null){ if(!busUnit.isEmpty()){ criteria=
		 * session.createCriteria(Wowmain.class);
		 * criteria.add(Restrictions.eq("portfolio", portfolio));
		 * criteria.add(Restrictions.eq("bus_unit", busUnit));
		 * criteria.add(Restrictions.eq("test_phase", testPhase));
		 * criteria.add(Restrictions.eq("project_phase", projectPhase)); } else{
		 */
		criteria = session.createCriteria(Wowmain.class);
		criteria.add(Restrictions.eq("portfolio", portfolio));
		criteria.add(Restrictions.eq("test_phase", testPhase));
		criteria.add(Restrictions.eq("project_phase", projectPhase));
		// }
		// }

		listforBusUnit = criteria.list();
		System.out.println("The size is" + listforBusUnit.size());
		List<String> temp;
		ArrayList<List<String>> finalListTobeSent = new ArrayList<List<String>>();

		for (int k = 0; k < listforBusUnit.size(); k++) {

			temp = new LinkedList<String>();
			temp.add(listforBusUnit.get(k).getPortfolio());
			// temp.add(listforBusUnit.get(k).getBus_unit());
			temp.add(listforBusUnit.get(k).getProject());
			System.out.println(listforBusUnit.get(k).getProject());
			temp.add(listforBusUnit.get(k).getProject_phase());
			// temp.add(listforBusUnit.get(k).getTest_phase());
			temp.add(listforBusUnit.get(k).getGolivedate());
			// temp.add("percentage of completion");
			temp.add(listforBusUnit.get(k).getPerformance());
			System.out.println(temp);
			finalListTobeSent.add(temp);
		}

		t.commit();
		session.close();
		return finalListTobeSent;
	}

	public String getTestPhaseAlone(String portfolio, String projName,
			String projPhase) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		System.out.println(portfolio + " , " + projPhase + " , " + projName);

		Criteria criteria = session.createCriteria(Wowmain.class)
				.add(Restrictions.eq("portfolio", portfolio))
				// .add(Restrictions.eq("project_phase", projPhase))
				.add(Restrictions.eq("project", projName))
				.setProjection(
						Projections.distinct(Projections.property("unique_id")));
		List<Integer> uidList = criteria.list();
		System.out.println("$$$$$$$$$$$$$" + uidList.size());
		int unique_id = uidList.get(0);
		String testPhase = "";
		System.out.println("%%%%%%%%%%%%%%%%" + unique_id);
		Query queryforTestPhase = session
				.createSQLQuery("select * from Wowmain where unique_id=?");
		queryforTestPhase.setParameter(0, unique_id);
		List<Object[]> listofkeysTestPhase = queryforTestPhase.list();
		for (Object[] obj : listofkeysTestPhase) {

			System.out.println("From WOWWOWWW 1" + obj[4]);
			testPhase = (String) obj[4];
		}
		t.commit();
		session.close();

		return testPhase;
	}

	public void saveCOQdataTable(String tableData) throws Exception {
		ObjectMapper object = new ObjectMapper();
		TableData fooFromJson = object.readValue(tableData, TableData.class);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
				+ fooFromJson.getId());
		Transaction t;
		int id = getCOQId(fooFromJson.getProject(), fooFromJson.getPortfolio());
		try {
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			if (fooFromJson.getId() > 0 || id > 0) {
				if (fooFromJson.getId() == 0) {
					fooFromJson.setId(id);
				}
				session.merge(fooFromJson);
			} else {
				session.save(fooFromJson);
			}
			t.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}

	}

	private int getCOQId(String project, String portfolio) {
		Transaction t;
		int id = 0;
		try {
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			Query query = session
					.createSQLQuery("select uniqueId from coqdatatable where project=? and portfolio=?");
			query.setParameter(0, project);
			query.setParameter(1, portfolio);
			List<Integer> list = query.list();

			t.commit();
			session.close();
			return (list != null) ? list.get(0) : 0;
		} catch (Exception e) {
			e.printStackTrace();
			return id;
		}

	}

	public String getProjectforCOQ(String portfolio) {
		System.out.println("******************getProject");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = null;
		/*
		 * Criteria criteria=session.createCriteria(Wowmain.class)
		 * .add(Restrictions.eq("portfolio", portfolio))
		 * .add(Restrictions.eq("bus_unit", busUnit))
		 * .add(Restrictions.eq("test_phase", testPhase))
		 * .add(Restrictions.eq("project_phase", projectPhase))
		 * .setProjection(Projections
		 * .distinct(Projections.property("project")));
		 */

		System.out.println("inside getting projet");
		Query queryforProject = session
				.createSQLQuery("select project from wowmain where portfolio=?");
		queryforProject.setParameter(0, portfolio);
		/*
		 * System.out.println("Bus unit is empty");
		 * criteria=session.createCriteria(Wowmain.class)
		 * .add(Restrictions.eq("portfolio", portfolio))
		 * 
		 * .setProjection(Projections.distinct(Projections.property("project")));
		 */
		List<String> project = queryforProject.list();
		System.out.println("Bus unit is empty" + "\t" + queryforProject + "\t"
				+ project.size());
		t.commit();
		session.close();
		Gson json = new Gson();
		String jsonStr = json.toJson(project);
		return jsonStr;
	}

	public String getProjectforCOQReport(String portfolio) {
		System.out.println("******************getProject");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria criteria = null;
		/*
		 * Criteria criteria=session.createCriteria(Wowmain.class)
		 * .add(Restrictions.eq("portfolio", portfolio))
		 * .add(Restrictions.eq("bus_unit", busUnit))
		 * .add(Restrictions.eq("test_phase", testPhase))
		 * .add(Restrictions.eq("project_phase", projectPhase))
		 * .setProjection(Projections
		 * .distinct(Projections.property("project")));
		 */

		System.out.println("inside getting projet");
		Query queryforProject = session
				.createSQLQuery("select project from coqdatatable where portfolio=?");
		queryforProject.setParameter(0, portfolio);
		/*
		 * System.out.println("Bus unit is empty");
		 * criteria=session.createCriteria(Wowmain.class)
		 * .add(Restrictions.eq("portfolio", portfolio))
		 * 
		 * .setProjection(Projections.distinct(Projections.property("project")));
		 */
		List<String> project = queryforProject.list();
		System.out.println("Bus unit is empty" + "\t" + queryforProject + "\t"
				+ project.size());
		t.commit();
		session.close();
		Gson json = new Gson();
		String jsonStr = json.toJson(project);
		return jsonStr;
	}

	public String getTableforCOQ(String portfolio, String project) {
		System.out.println("******************getProject");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();

		try {
			Query queryforProject = session
					.createSQLQuery("select uniqueId from coqdatatable where portfolio=? and project=?");
			queryforProject.setParameter(0, portfolio);
			queryforProject.setParameter(1, project);
			int uniqueId = (int) queryforProject.uniqueResult();
			System.out
					.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + uniqueId);
			TableData tableValue = (TableData) session.get(TableData.class,
					uniqueId);
			/*
			 * TableData tableValue=(TableData) queryforProject.uniqueResult();
			 * 
			 * //System.out.println("\nresult is\t"+result);
			 */
			session.close();
			Gson json = new Gson();
			String jsonStr = json.toJson(tableValue);
			System.out.println("$$$$$$$$$$$$$$$$$$$$$" + jsonStr);
			return jsonStr;
		} catch (Exception e) {
			return null;
		}

	}

	public String loadTableData(int year) {
		System.out.println("******************getProject");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Map<String, List<String>> dataMap;
		try {
			dataMap = new HashMap<>();

			// String
			// query="select portfolio ,SUM(tcsQAExternalFailure+othersExternalFailure+tcsQAUATExternalFailure+nonTestingBAExternalFailure+othersUATExternalFailure+nonTestingDevelopmentExternalFailure+nonTestingProjectExternalFailure+nonTestingOthersExternalFailure) as ExternalFailure, SUM(tcsQAPrevention+othersPrevention+othersUATPrevention+tcsQAUATPrevention+nonTestingBAPreventionCost+nonTestingDevelopmentPreventionCost+nonTestingProjectPreventionCost+nonTestingOthersPreventionCost) as PreventionCost,SUM(tcsQAAppraisal+othersAppraisal+tcsQAUATAppraisal+othersUATAppraisal+nonTestingBAAppraisalCost+nonTestingDevelopmentAppraisalCost+nonTestingOthersAppraisalCost+nonTestingProjectAppraisalCost) as TotalAppraisal, SUM(tcsQAInternalFailure+othersInternalFailure+othersUATInternalFailure+tcsQAUATInternalFailure+nonTestingOthersInternalFailure+nonTestingProjectInternalFailure+nonTestingDevelopmentInternalFailure+nonTestingBAInternalFailure) as InternalFailure, SUM(nonTestingOthersPreformanceCost+nonTestingProjectPreformanceCost+nonTestingDevelopmentPreformanceCost+nonTestingBAPreformanceCost) as Performance from coqdatatable GROUP BY portfolio;  ";
			String query = "select portfolio AS portfolio,"
					+

					"SUM(tcsQAPrevention+othersPrevention+othersUATPrevention+tcsQAUATPrevention+nonTestingBAPreventionCost+nonTestingDevelopmentPreventionCost+nonTestingProjectPreventionCost+nonTestingOthersPreventionCost) as PreventionCost,"
					+ "SUM(tcsQAAppraisal+othersAppraisal+tcsQAUATAppraisal+othersUATAppraisal+nonTestingBAAppraisalCost+nonTestingDevelopmentAppraisalCost+nonTestingOthersAppraisalCost+nonTestingProjectAppraisalCost) as TotalAppraisal,"
					+ "SUM(tcsQAInternalFailure+othersInternalFailure+othersUATInternalFailure+tcsQAUATInternalFailure+nonTestingOthersInternalFailure+nonTestingProjectInternalFailure+nonTestingDevelopmentInternalFailure+nonTestingBAInternalFailure) as InternalFailure,"
					+ "SUM(tcsQAExternalFailure+othersExternalFailure+tcsQAUATExternalFailure+nonTestingBAExternalFailure+othersUATExternalFailure+nonTestingDevelopmentExternalFailure+nonTestingProjectExternalFailure+nonTestingOthersExternalFailure) as ExternalFailure,"
					+ "SUM(nonTestingOthersPreformanceCost+nonTestingProjectPreformanceCost+nonTestingDevelopmentPreformanceCost+nonTestingBAPreformanceCost) as Performance,"
					+ "SUM(overAllCost) as OverAllCost,"
					+ " SUM(testingTotal) as COTS,"
					+ "  ROUND((AVG(testingTotal)/AVG(overAllCost))*100,2) as COTper"
					+

					" from coqdatatable where year(projectEndDate)=?"
					+ " GROUP BY portfolio"
					+ " UNION"
					+ " SELECT 'Total' AS portfolio, "
					+

					"SUM(A.PreventionCost) AS PreventionCost,"
					+ "SUM(A.TotalAppraisal) AS TotalAppraisal,"
					+ "SUM(A.InternalFailure) AS InternalFailure,"
					+ "SUM(A.ExternalFailure) AS ExternalFailure, "
					+ "SUM(A.Performance) AS Performance,"
					+ "SUM(A.OverAllCost) AS OverAllCost,"
					+ "SUM(A.COTS) AS COTS,"
					+ "  ROUND((SUM(A.COTS)/SUM(A.OverAllCost))*100,2) AS  COTper"
					+

					" FROM ("
					+ " select portfolio,"
					+

					"SUM(tcsQAPrevention+othersPrevention+othersUATPrevention+tcsQAUATPrevention+nonTestingBAPreventionCost+nonTestingDevelopmentPreventionCost+nonTestingProjectPreventionCost+nonTestingOthersPreventionCost) as PreventionCost,"
					+ "SUM(tcsQAAppraisal+othersAppraisal+tcsQAUATAppraisal+othersUATAppraisal+nonTestingBAAppraisalCost+nonTestingDevelopmentAppraisalCost+nonTestingOthersAppraisalCost+nonTestingProjectAppraisalCost) as TotalAppraisal,"
					+ "SUM(tcsQAInternalFailure+othersInternalFailure+othersUATInternalFailure+tcsQAUATInternalFailure+nonTestingOthersInternalFailure+nonTestingProjectInternalFailure+nonTestingDevelopmentInternalFailure+nonTestingBAInternalFailure) as InternalFailure,"
					+ "SUM(tcsQAExternalFailure+othersExternalFailure+tcsQAUATExternalFailure+nonTestingBAExternalFailure+othersUATExternalFailure+nonTestingDevelopmentExternalFailure+nonTestingProjectExternalFailure+nonTestingOthersExternalFailure) as ExternalFailure,"
					+ "SUM(nonTestingOthersPreformanceCost+nonTestingProjectPreformanceCost+nonTestingDevelopmentPreformanceCost+nonTestingBAPreformanceCost) as Performance,"
					+ "SUM(overAllCost) as OverAllCost,"
					+ "SUM(testingTotal) as COTS,"
					+ " ROUND((AVG(testingTotal)/AVG(overAllCost))*100,2) as COTper"
					+

					" from coqdatatable where year(projectEndDate)=?" + " GROUP BY portfolio) A;";
			System.out.println(query);

			Query queryForTable = session.createSQLQuery(query);
			queryForTable.setParameter(0, year);
			queryForTable.setParameter(1, year);
			List<Object[]> queryResult = queryForTable.list();
			System.out.println(queryResult.size());
			for (Object[] obj : queryResult) {
				System.out.println(obj[0]);
				List<String> tempList = new LinkedList<String>();
				System.out.println(obj[0]);
				// double tempTotal=0;
				System.out.println(obj.length);
				for (int i = 1; i < obj.length; i++) {
					String tempStorage = String.valueOf(obj[i]);
					System.out.println(tempStorage + "*****" + i);
					// tempTotal+=(Double)obj[i];
					if(tempStorage==null || tempStorage.equalsIgnoreCase("null")){
						tempStorage="0";
					}
					tempList.add(tempStorage);

				}
				// tempList.add(String.valueOf(tempTotal));

				dataMap.put((String) obj[0], tempList);
			}
			t.commit();
			session.close();
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out
					.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}

	}

	public String loadTableDataforPortfolio(String portfolio) {
		System.out.println("******************getProject");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Map<String, List<String>> dataMap;
		List tempList = null;
		try {
			dataMap = new HashMap<>();

			String query = "select project , SUM(tcsQAPrevention+othersPrevention+othersUATPrevention+tcsQAUATPrevention+nonTestingBAPreventionCost+nonTestingDevelopmentPreventionCost+nonTestingProjectPreventionCost+nonTestingOthersPreventionCost) as PreventionCost,SUM(tcsQAAppraisal+othersAppraisal+tcsQAUATAppraisal+othersUATAppraisal+nonTestingBAAppraisalCost+nonTestingDevelopmentAppraisalCost+nonTestingOthersAppraisalCost+nonTestingProjectAppraisalCost) as TotalAppraisal, SUM(tcsQAInternalFailure+othersInternalFailure+othersUATInternalFailure+tcsQAUATInternalFailure+nonTestingOthersInternalFailure+nonTestingProjectInternalFailure+nonTestingDevelopmentInternalFailure+nonTestingBAInternalFailure) as InternalFailure,SUM(tcsQAExternalFailure+othersExternalFailure+tcsQAUATExternalFailure+nonTestingBAExternalFailure+othersUATExternalFailure+nonTestingDevelopmentExternalFailure+nonTestingProjectExternalFailure+nonTestingOthersExternalFailure) as ExternalFailure, SUM(nonTestingOthersPreformanceCost+nonTestingProjectPreformanceCost+nonTestingDevelopmentPreformanceCost+nonTestingBAPreformanceCost) as Performance,overAllCost as OverAllCost,SUM(testingTotal) as COQ,SUM(testingTotalPercent+0) as COQPer,coalesce(testingTotalPercent+0) as COTper from coqdatatable where portfolio=? and testingTotal>0 GROUP BY project; ";
			Query queryForTable = session.createSQLQuery(query);
			queryForTable.setParameter(0, portfolio);
			List<Object[]> queryResult = queryForTable.list();
			System.out.println(queryResult.size());
			tempList = new LinkedList();
			for (Object[] obj : queryResult) {
				System.out.println(obj[0]);

				tempList.add(obj[0]);
				tempList.add(obj[1]);
				tempList.add(obj[2]);
				tempList.add(obj[3]);
				tempList.add(obj[4]);
				tempList.add(obj[5]);
				tempList.add(obj[6]);
				tempList.add(obj[7]);
				tempList.add(obj[8]);
				tempList.add(obj[9]);

				System.out.println(obj[1]);
				// double tempTotal=0;
				System.out.println(obj.length);
				/*
				 * for(int i=1;i<obj.length;i++){ if(obj[i]==null){
				 * obj[i]=(double)0; } double tempStorage=(double) obj[i];
				 * System.out.println(tempStorage+"*****"+i);
				 * tempTotal+=(Double)obj[i];
				 * 
				 * 
				 * } tempList.add(tempTotal);
				 */

			}
			t.commit();
			session.close();
			Gson gson = new Gson();
			String json = gson.toJson(tempList);
			System.out.println(json);
			return json;
		}

		catch (Exception e) {
			System.out
					.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e);
			return null;
		}

	}

	public String getTableforReportCOQ(String project) {

		System.out.println("******************getProject");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();

		try {
			Query queryforProject = session
					.createSQLQuery("select uniqueId from coqdatatable where  project=?");
			queryforProject.setParameter(0, project);

			int uniqueId = (int) queryforProject.uniqueResult();
			System.out
					.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + uniqueId);
			TableData tableValue = (TableData) session.get(TableData.class,
					uniqueId);
			/*
			 * TableData tableValue=(TableData) queryforProject.uniqueResult();
			 * 
			 * //System.out.println("\nresult is\t"+result);
			 */
			session.close();
			Gson json = new Gson();
			String jsonStr = json.toJson(tableValue);
			System.out.println("$$$$$$$$$$$$$$$$$$$$$" + jsonStr);
			return jsonStr;
		} catch (Exception e) {
			return null;
		}
	}

	public String loadTileData() {
		System.out.println("******************getProject");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		String queries = "select t1.portfolio, IFNULL(t1.projects,0) as projects, IFNULL(t2.Amber,0) as Amber, IFNULL(t3.Red,0) as Red, IFNULL(t4.Green,0) as Green "
				+ "FROM "
				+ "(select portfolio as portfolio ,count(project) as projects   from wowmain where date(str_to_date(golivedate, '%d/%m/%Y')) > date(curdate()) GROUP BY "
				+ "portfolio) t1 "
				+ "LEFT JOIN "
				+ "(SELECT portfolio as portfolio,count(performance) as Amber from wowmain where LOWER(performance) like LOWER('%Amber%') and date(str_to_date(golivedate, '%d/%m/%Y'))> date(curdate())   GROUP BY "
				+ "portfolio) t2 "
				+ "ON t1.portfolio = t2.portfolio "
				+ "LEFT JOIN "
				+ "(SELECT portfolio as portfolio,count(performance) as Red from wowmain where LOWER(performance) like LOWER('%Red%') and date(str_to_date(golivedate, '%d/%m/%Y'))> date(curdate())   GROUP BY "
				+ "portfolio) t3 "
				+ "ON t1.portfolio = t3.portfolio "
				+ "LEFT JOIN "
				+ "(SELECT portfolio as portfolio,count(performance) as Green from wowmain where LOWER(performance) like LOWER('%Green%') and date(str_to_date(golivedate, '%d/%m/%Y'))> date(curdate())   GROUP BY "
				+ "portfolio) t4 " + "ON t1.portfolio = t4.portfolio; ";
		try {
			Query queryforTiles = session.createSQLQuery(queries)
					.addScalar("portfolio", StandardBasicTypes.STRING)
					.addScalar("projects", StandardBasicTypes.LONG)
					.addScalar("Amber", StandardBasicTypes.LONG)
					.addScalar("Red", StandardBasicTypes.LONG)
					.addScalar("Green", StandardBasicTypes.LONG);
			List<Object[]> queryResult = queryforTiles.list();
			System.out.println(queryResult.size());
			Map tilesMap = new TreeMap();
			int overallRedCount = 0;
			int overallGreenCount = 0;
			int overallYellowCount = 0;
			int overallTotalCount = 0;
			List<String> tempList = new LinkedList<String>();
			;
			for (Object[] obj : queryResult) {
				System.out.println(obj[0]);
				System.out.println(obj[1]);
				System.out.println(obj[2]);
				System.out.println(obj[3]);
				System.out.println(obj[4]);
				overallTotalCount += Integer.parseInt(String.valueOf(obj[1]));
				overallYellowCount += Integer.parseInt(String.valueOf(obj[2]));
				overallRedCount += Integer.parseInt(String.valueOf(obj[3]));
				overallGreenCount += Integer.parseInt(String.valueOf(obj[4]));
				String temp = (String) obj[0];
				if (temp.equalsIgnoreCase("dummyPortfolio")) {

				} else {

					for (int i = 0; i < obj.length; i++) {

						String tempStorage = String.valueOf(obj[i]);
						System.out.println(tempStorage + "*****" + i);
						// tempTotal+=(Double)obj[i];
						tempList.add(tempStorage);

					}
				}
			}
			System.out.println(tilesMap);
			t.commit();
			session.close();
			Gson json = new Gson();
			tempList.add("All");
			tempList.add(String.valueOf(overallTotalCount));
			tempList.add(String.valueOf(overallYellowCount));
			tempList.add(String.valueOf(overallRedCount));
			tempList.add(String.valueOf(overallGreenCount));
			String jsonStr = json.toJson(tempList);
			System.out.println("$$$$$$$$$$$$$$$$$$$$$" + jsonStr);
			return jsonStr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public List<String> getDates(String portfolio, String projName) {
		System.out.println("******************getDates");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		List<String> listOfDates = null;
		try {
			listOfDates = new LinkedList<String>();

			Query queryforDate = session
					.createSQLQuery("select project_start, golivedate from wowmain where  project=?");
			queryforDate.setParameter(0, projName);
			List<Object[]> tempDates = queryforDate.list();
			System.out.println("$$$$$$$$$$" + tempDates.size());
			for (Object[] obj1 : tempDates) {
				listOfDates.add(String.valueOf(obj1[0]));
				listOfDates.add(String.valueOf(obj1[1]));
			}
			System.out.println("@@@@@@@@@@@listOfDates" + listOfDates);
		} catch (Exception e) {

		}
		return listOfDates;

	}

	public String getLastRunDate(String portfolio, String projName) {
		System.out.println("******************getDates");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		String listOfDates = null;
		try {

			Query queryforDate = session
					.createSQLQuery("select batchLast_run from wowmain where  project=?");
			queryforDate.setParameter(0, projName);
			List<String> tempDates = queryforDate.list();
			System.out.println("$$$$$$$$$$" + tempDates.size());
			for (String obj1 : tempDates) {
				listOfDates = (String.valueOf(obj1));
				// listOfDates.add(String.valueOf(obj1[1]));
			}
			System.out.println("@@@@@@@@@@@lastUpdatedOfDate" + listOfDates);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listOfDates;
	}

	public List geDefautersReport() {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Criteria cr = session.createCriteria(Wowmain.class);

		List<Wowmain> wowmain = (List<Wowmain>) cr.list();

		ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
		ArrayList<String> temp = new ArrayList<String>();
		for (Wowmain w : wowmain) {
			temp = new ArrayList<String>();
			temp.add(w.getPortfolio());
			// temp.add(w.getBus_unit());
			temp.add(w.getProject());
			// temp.add(w.getProject_phase());
			temp.add(w.getBatchLast_run());
			// temp.add(w.getTest_phase());
			temp.add(w.getLast_updated());
			// temp.add("percentage of completion");
			String lastRun = w.getBatchLast_run();
			String lastUpdate = w.getLast_updated();
			// System.out.println("Inside Forrrrrrr");
			if (lastUpdate.equalsIgnoreCase("NA") && lastRun != null) {
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:ss");
				DateFormat df2 = new SimpleDateFormat("dd/MM/yyyy");
				// System.out.println("Inside if lastUpdate NA ");
				try {
					Date dateLastRun = df.parse(lastRun);
					Date now = new Date();
					Date liveDate = df2.parse(w.getGolivedate());
					if (liveDate.after(now)) {
						System.out.println("The Project " + w.getProject()
								+ " has Active date " + w.getGolivedate());

						Calendar cal1 = Calendar.getInstance();
						Calendar cal2 = Calendar.getInstance();
						cal1.setTime(dateLastRun);
						cal2.setTime(now);
						int numberOfDays = -2;
						while (cal1.before(cal2)) {
							if ((Calendar.SATURDAY != cal1
									.get(Calendar.DAY_OF_WEEK))
									&& (Calendar.SUNDAY != cal1
											.get(Calendar.DAY_OF_WEEK))) {
								numberOfDays++;
								System.out.println("Project  " + w.getProject()
										+ numberOfDays);
								cal1.add(Calendar.DATE, 1);
							} else {
								cal1.add(Calendar.DATE, 1);
							}
						}
						while (cal2.before(cal1)) {
							if ((Calendar.SATURDAY != cal2
									.get(Calendar.DAY_OF_WEEK))
									&& (Calendar.SUNDAY != cal2
											.get(Calendar.DAY_OF_WEEK))) {
								numberOfDays++;
								System.out.println("Project  " + w.getProject()
										+ numberOfDays);
								cal2.add(Calendar.DATE, 1);
							} else {
								cal2.add(Calendar.DATE, 1);
							}
						}

						temp.add(String.valueOf(numberOfDays));
						if (numberOfDays > 1) {
							// System.out.println("date>1");
							data.add(temp);
						}
					}
				}

				catch (ParseException e) {
					System.out.println("## Project End date" + w.getProject()
							+ " Has Invalid Date format");
				}

			} else {
				// System.out.println("In Else NA"+lastRun+"  "+lastUpdate);
				if (lastUpdate.contains("AM")) {
					lastUpdate = lastUpdate.replace("AM", "");
					// System.out.println(lastUpdate);
				} else if (lastUpdate.contains("PM")) {
					lastUpdate = lastUpdate.replace("PM", "");
					// System.out.println(lastUpdate);
				}

				if (lastRun != null && lastUpdate != null) {
					// System.out.println("####### Both Not Null"+lastRun+"  "+lastUpdate);
					DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:ss");
					DateFormat df1 = new SimpleDateFormat("dd-MM-yyyy HH:ss");
					DateFormat df3 = new SimpleDateFormat("dd/MM/yyyy");
					int numberOfDays = -1;
					Date d1 = null;
					Date d2 = null;
					Date d3 = new Date();
					Date d4 = null;

					try {
						d1 = df.parse(lastRun);
						d2 = df1.parse(lastUpdate);
						d4 = df3.parse(w.getGolivedate());
						if (d4 != null && d4.after(d3)) {
							// System.out.println(w.getProject()+
							// "  ###### is Active  "+d4.after(d3));
							Calendar cal1 = Calendar.getInstance();
							Calendar cal2 = Calendar.getInstance();
							cal1.setTime(d1);
							cal2.setTime(d2);
							while (cal1.before(cal2)) {
								if ((Calendar.SATURDAY != cal1
										.get(Calendar.DAY_OF_WEEK))
										&& (Calendar.SUNDAY != cal1
												.get(Calendar.DAY_OF_WEEK))) {
									numberOfDays++;
									System.out.println("Project  "
											+ w.getProject() + " #######   "
											+ numberOfDays);
									cal1.add(Calendar.DATE, 1);
								} else {
									cal1.add(Calendar.DATE, 1);
								}
							}
							while (cal2.before(cal1)) {
								if ((Calendar.SATURDAY != cal2
										.get(Calendar.DAY_OF_WEEK))
										&& (Calendar.SUNDAY != cal2
												.get(Calendar.DAY_OF_WEEK))) {
									numberOfDays++;
									System.out.println("Project  "
											+ w.getProject() + " #######   "
											+ numberOfDays);
									cal2.add(Calendar.DATE, 1);
								} else {
									cal2.add(Calendar.DATE, 1);
								}
							}

							temp.add(String.valueOf(numberOfDays));
							if (numberOfDays > 1) {
								System.out.println("date>1");
								data.add(temp);
							}
						}
					} catch (ParseException e) {
						System.out.println("## Project End date"
								+ w.getProject() + " Has Invalid Date format"
								+ e.getMessage());
					}

				}
			}

		}

		t.commit();
		session.close();
		return data;

	}

}
