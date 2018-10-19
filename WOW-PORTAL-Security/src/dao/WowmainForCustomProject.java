package dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import model.Defect_Status;
import model.Defect_Status_UAT;
import model.PerformanceKeys;
import model.RootCause;
import model.RootCauseUAT;
import model.TestExecution;
import model.TestExecutionMain;
import model.TestExecutionMainUAT;
import model.TestExecutionUAT;
import model.Wowmain;
import dao.HibernateConnection;
import dao.WowmainHibernate;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

public class WowmainForCustomProject {

	public static Logger logger;
	static {
		logger = LoggerFactory.getLogger(WowmainHibernate.class);
	}

	public WowmainForCustomProject() {
	}

	public String saveProjectAlone(String portfolio, String project) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		String result = null;
		DateFormat dateFor = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		Calendar cal = Calendar.getInstance();

		Wowmain wow = new Wowmain();
		wow.setPortfolio(portfolio);
		wow.setProject(project);
		wow.setBus_unit("dummy");
		wow.setGolivedate("");
		wow.setLast_updated("");
		wow.setPerformance("");
		wow.setProject_phase("");
		wow.setProject_start("");
		wow.setRisks_issues("");
		wow.setSummary("");
		wow.setTest_phase("");
		wow.setCustom_project("1");
		wow.setBatchLast_run(dateFor.format(cal.getTime()));
		try {
			int id = (Integer) session.save(wow);
			t.commit();

			result = "Success";

		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		session.close();
		return result;
	}

	public int getTheUniqueId(Wowmain wowmain) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		// t=session.beginTransaction();
		int uniqueId = 0;
		try {
			if (wowmain.getPortfolio() != null && wowmain.getProject() != null) {
				Criteria criteria = session
						.createCriteria(Wowmain.class)
						.add(Restrictions.eq("portfolio",
								wowmain.getPortfolio()))
						// .add(Restrictions.eq("project_phase", projPhase))
						.add(Restrictions.eq("project", wowmain.getProject()))
						.setProjection(
								Projections.distinct(Projections
										.property("unique_id")));
				List<Integer> uidList = criteria.list();
				System.out.println("$$$$$$$$$$$$$" + uidList.get(0));
				uniqueId = uidList.get(0);
			}
			return uniqueId;
		} catch (Exception e) {
			e.printStackTrace();

			return uniqueId;
		} finally {
			session.close();
		}

	}

	public boolean saveWowmainDetais(Wowmain wowmain, int uniqueId) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		DateFormat dateFor = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		Calendar cal = Calendar.getInstance();

		try {
			Wowmain wowmainToSave = (Wowmain) session.get(Wowmain.class,
					uniqueId);
			if (wowmainToSave != null) {

				wowmainToSave.setPerformance(wowmain.getPerformance());
				wowmainToSave.setTest_phase("SIT");
				wowmainToSave.setSummary(wowmain.getSummary());
				wowmainToSave.setRisks_issues(wowmain.getRisks_issues());
				wowmainToSave.setLast_updated("");
				wowmainToSave.setBatchLast_run("");
				wowmainToSave.setProject_start(wowmain.getProject_start());
				wowmainToSave.setGolivedate(wowmain.getGolivedate());
				wowmainToSave.setBatchLast_run(dateFor.format(cal.getTime()));
				// wowmainToSave.setCustom_project("1");
				session.merge(wowmainToSave);
				t.commit();

				return true;
			} else {
				return false;
			}

		} catch (Exception E) {
			return false;
		} finally {
			session.close();
		}

	}

	public int saveTestExecutionMainDetais(TestExecutionMain testMain,
			int uniqueId) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		int saveId = 0;
		try {
			TestExecutionMain testMainToSave = new TestExecutionMain();
			testMainToSave.setUnique_id(uniqueId);
			testMainToSave.setRelease_iteration_name("SIT");
			testMainToSave.setCycle_name("CYCLE1");
			testMainToSave.setSuite_name("SUITE1");
			testMainToSave.setRelease_iteration_start_date(testMain
					.getRelease_iteration_start_date());
			testMainToSave.setRelease_iteration_end_date(testMain
					.getRelease_iteration_end_date());
			testMainToSave.setRelease_name("Release1");
			Integer id = (Integer) session.save(testMainToSave);
			System.out.println(session.save(testMainToSave).getClass()
					.getName());
			t.commit();

			System.out.println("###############saveId" + id);
			System.out.println("$$$$$$$$$$$$$Id "
					+ testMainToSave.getUnique_id() + " ######  "
					+ testMainToSave.getTest_execution_id());
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return saveId;
		} finally {
			session.close();
		}
	}

	public int savetestExeDetails(TestExecution testExe, int testExecutionMainId) {

		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		int saveId = 0;
		try {
			TestExecution testExeToSave = new TestExecution();
			testExeToSave.setTest_execution_id(testExecutionMainId);
			testExeToSave.setPass(testExe.getPass());
			testExeToSave.setFail(testExe.getFail());
			testExeToSave.setIn_progress(testExe.getIn_progress());
			testExeToSave.setNo_run(testExe.getNo_run());
			testExeToSave.setNot_available(testExe.getNot_available());
			testExeToSave.setTotal(testExe.getTotal());
			testExeToSave.setPercentage_completion(testExe
					.getPercentage_completion());
			testExeToSave.setExpected_percent(testExe.getExpected_percent());
			testExeToSave.setBlocked(testExe.getBlocked());
			saveId = (Integer) session.save(testExeToSave);
			t.commit();

			return saveId;

		} catch (Exception e) {
			return 0;
		} finally {
			session.close();
		}

	}

	public boolean savePerformanceKeys(PerformanceKeys perKeys, int uniqueId) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			PerformanceKeys perKeysToSave = new PerformanceKeys();
			perKeysToSave.setUnique_id(uniqueId);
			perKeysToSave.setCost(perKeys.getCost());
			perKeysToSave.setBenefits_realization("");
			perKeysToSave.setStakeholders("");
			perKeysToSave.setIssues(perKeys.getIssues());
			perKeysToSave.setSchedule(perKeys.getSchedule());
			perKeysToSave.setScope(perKeys.getScope());
			perKeysToSave.setRisks(perKeys.getRisks());
			perKeysToSave.setResources(perKeys.getResources());
			session.save(perKeysToSave);
			t.commit();

			return true;
		} catch (Exception e) {
			return false;
		} finally {
			session.close();
		}

	}

	public boolean saveRootCauseDetails(RootCause rootCause, int uniqueId) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			rootCause.setUnique_id(uniqueId);
			session.save(rootCause);
			t.commit();

			return true;
		} catch (Exception e) {

			return false;

		} finally {
			session.close();
		}

	}

	public boolean saveDefectDetails(Defect_Status defect, int uniqueId) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			defect.setUnique_id(uniqueId);
			session.save(defect);
			t.commit();
			return true;
		} catch (Exception e) {

			return false;

		} finally {
			session.close();
		}
	}

	public List<String> getProjectsForPortfolio(String portfolio) {

		Session session = HibernateConnection.openConnection().openSession();
		List<String> projects = null;
		// boolean saveId;
		try {
			projects = new ArrayList<>();
			Criteria criteria = session
					.createCriteria(Wowmain.class)
					.add(Restrictions.eq("portfolio", portfolio))
					.add(Restrictions.eq("custom_project", "1"))
					.setProjection(
							Projections.distinct(Projections
									.property("project")));
			projects = criteria.list();
			return projects;

		} catch (Exception e) {

			return null;

		} finally {
			session.close();
		}
	}

	public List<String> getCompleteProjectData(String portfolio, String project) {
		Session session = HibernateConnection.openConnection().openSession();
		List<String> projects = null;
		int sitId = 0;
		int uatId = 0;
		TestExecutionMain testMain = null;
		TestExecutionMainUAT testMainUAT = null;
		TestExecution testExe = null;
		TestExecutionUAT testExeUAT = null;
		RootCause root = null;
		RootCauseUAT rootUAT = null;
		PerformanceKeys perKeys = null;
		Defect_Status defStatus = null;
		Defect_Status_UAT defStatusUAT = null;
		Wowmain wowmain = null;
		try {
			projects = new ArrayList<>();
			Criteria criteria = session
					.createCriteria(Wowmain.class)
					.add(Restrictions.eq("portfolio", portfolio))
					.add(Restrictions.eq("project", project))
					.setProjection(
							Projections.distinct(Projections
									.property("unique_id")));

			int uniqueId = (int) criteria.list().get(0);
			wowmain = (Wowmain) session.get(Wowmain.class, uniqueId);
			root = (RootCause) session.get(RootCause.class, uniqueId);
			rootUAT = (RootCauseUAT) session.get(RootCauseUAT.class, uniqueId);
			perKeys = (PerformanceKeys) session.get(PerformanceKeys.class,
					uniqueId);
			defStatus = (Defect_Status) session.get(Defect_Status.class,
					uniqueId);
			defStatusUAT = (Defect_Status_UAT) session.get(
					Defect_Status_UAT.class, uniqueId);
			Criteria criteriaForTestMain = session
					.createCriteria(TestExecutionMain.class)
					.add(Restrictions.eq("unique_id", uniqueId))
					// .add(Restrictions.eq("project", project))
					.setProjection(
							Projections.distinct(Projections
									.property("test_execution_id")));
			List testExeId = criteriaForTestMain.list();
			System.out.println("$$$$$$$$$testExeId size  " + testExeId.size());

			if (testExeId.size() == 0) {

				testMain = new TestExecutionMain();
				testExe = new TestExecution();
			}

			if (testExeId.size() > 1) {
				sitId = (int) testExeId.get(0);
				uatId = (int) testExeId.get(1);
				testMain = (TestExecutionMain) session.get(
						TestExecutionMain.class, sitId);
				if (testMain.getRelease_iteration_name()
						.equalsIgnoreCase("UAT")) {
					int temp = sitId;
					sitId = uatId;
					uatId = temp;

				}
			} else if (testExeId.size() == 1) {
				System.out.println("$$$$$$$$$testExeId.get(0)  "
						+ testExeId.get(0));
				sitId = (int) testExeId.get(0);
				testMain = (TestExecutionMain) session.get(
						TestExecutionMain.class, sitId);
				if (testMain.getRelease_iteration_name()
						.equalsIgnoreCase("UAT")) {
					System.out
							.println("$$$$$$$$$$$$$ VVVVVVVVVV 1 ****************");
					testMainUAT = (TestExecutionMainUAT) session.get(
							TestExecutionMainUAT.class, sitId);
					testExeUAT = (TestExecutionUAT) session.get(
							TestExecutionUAT.class, sitId);
					uatId = sitId;
					sitId = 0;
				}
			}

			System.out.println("$$$$$$$$$$$$$ VVVVVVVVVV 2****************");
			if (uatId > 0) {
				System.out
						.println("$$$$$$$$$$$$$ VVVVVVVVVV 3****************");
				testMainUAT = (TestExecutionMainUAT) session.get(
						TestExecutionMainUAT.class, uatId);
				testExeUAT = (TestExecutionUAT) session.get(
						TestExecutionUAT.class, uatId);
				if (sitId > 0) {
					System.out
							.println("$$$$$$$$$$$$$ VVVVVVVVVV 4****************");
					testMain = (TestExecutionMain) session.get(
							TestExecutionMain.class, sitId);
					testExe = (TestExecution) session.get(TestExecution.class,
							sitId);
				}

			} else {
				if (sitId > 0) {
					testMain = (TestExecutionMain) session.get(
							TestExecutionMain.class, sitId);
					testExe = (TestExecution) session.get(TestExecution.class,
							sitId);

					if (testMain.getRelease_iteration_name().equalsIgnoreCase(
							"UAT")) {
						System.out
								.println("%%%%%%%%% Only UAT IS THERE  &&&&&&&&&&&&&&&");
						testMainUAT = (TestExecutionMainUAT) session.get(
								TestExecutionMainUAT.class, sitId);
						testExeUAT = (TestExecutionUAT) session.get(
								TestExecutionUAT.class, sitId);
						testMain = new TestExecutionMain();
						testExe = new TestExecution();
					} else {
						testMainUAT = new TestExecutionMainUAT();
						testExeUAT = new TestExecutionUAT();
					}
				}

			}

			System.out.println("$$$$$$$$$$$$$ VVVVVVVVVV 5 ****************");

			Gson gson = new Gson();

			if (testMain == null || testExe == null) {
				testExe = new TestExecution();
				testMain = new TestExecutionMain();
			}
			if (testMainUAT == null || testExeUAT == null) {
				testMainUAT = new TestExecutionMainUAT();
				testExeUAT = new TestExecutionUAT();
			}

			if (wowmain != null && root != null && perKeys != null
					&& defStatus != null) {

				String wowmainTemp = gson.toJson(wowmain);
				String testExemainTemp = gson.toJson(testMain);
				String testExemainTempUAT = gson.toJson(testMainUAT);
				System.out
						.println("testExemainTempUAT   " + testExemainTempUAT);
				String testExeTemp = gson.toJson(testExe);
				String testExeTempUAT = gson.toJson(testExeUAT);
				System.out.println("testExeUAT   " + testExeUAT);
				String rootTemp = gson.toJson(root);
				String rootTempUAT = gson.toJson(rootUAT);
				String perKeysTemp = gson.toJson(perKeys);
				String defStatusTemp = gson.toJson(defStatus);
				String defStatusTempUAT = gson.toJson(defStatusUAT);
				// String
				// collection=wowmainTemp+testExemainTemp+testExeTemp+rootTemp+perKeysTemp+defStatusTemp;
				if (testExeTempUAT == null) {
					testExeTempUAT = "";
				}
				if (testExemainTempUAT == null) {
					testExemainTempUAT = "";
				}
				if (testExemainTemp == null) {
					testExemainTemp = "";
				}
				if (testExeTemp == null) {
					testExeTemp = "";
				}
				projects.add(wowmainTemp);
				projects.add(testExeTempUAT);
				projects.add(testExemainTempUAT);
				projects.add(testExemainTemp);
				projects.add(testExeTemp);
				projects.add(rootTemp);
				projects.add(perKeysTemp);
				projects.add(defStatusTemp);
				projects.add(defStatusTempUAT);
				projects.add(rootTempUAT);
				System.out.println("######projects" + projects);
				// projects.add(collection);

			}

			else {
				System.out
						.println("$$$$$$$$$$ ELSE SOMETHING IS MISSING ^^^^^^^^^^^^^^^^^");
			}

			return projects;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return null;

		} finally {
			session.close();
		}
	}

	public int saveTestExecutionMainUATDetais(TestExecutionMainUAT testMainUAT,
			int uniqueId) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		int saveId = 0;
		try {
			TestExecutionMain testMainToSave = new TestExecutionMain();
			testMainToSave.setUnique_id(uniqueId);
			testMainToSave.setRelease_iteration_name("UAT");
			testMainToSave.setCycle_name("CYCLE1");
			testMainToSave.setSuite_name("SUITE1");
			testMainToSave.setRelease_iteration_start_date(testMainUAT
					.getUat_release_iteration_start_date());
			testMainToSave.setRelease_iteration_end_date(testMainUAT
					.getUat_release_iteration_end_date());
			testMainToSave.setRelease_name("Release1");
			Integer id = (Integer) session.save(testMainToSave);
			System.out.println(session.save(testMainToSave).getClass()
					.getName());
			t.commit();

			System.out.println("###############saveId" + id);
			System.out.println("$$$$$$$$$$$$$Id "
					+ testMainToSave.getUnique_id() + " ######  "
					+ testMainToSave.getTest_execution_id());
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return saveId;
		} finally {
			session.close();
		}
	}

	public int savetestExeUATDetails(TestExecutionUAT testExeUAT,
			int testExecutionMainId) {

		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		int saveId = 0;
		try {
			TestExecution testExeToSave = new TestExecution();
			testExeToSave.setTest_execution_id(testExecutionMainId);
			testExeToSave.setPass(testExeUAT.getUat_pass());
			testExeToSave.setFail(testExeUAT.getUat_fail());
			testExeToSave.setIn_progress(testExeUAT.getUat_in_progress());
			testExeToSave.setNo_run(testExeUAT.getUat_no_run());
			testExeToSave.setTotal(testExeUAT.getUat_total());
			testExeToSave.setNot_available(testExeUAT.getUat_not_available());
			testExeToSave.setPercentage_completion(testExeUAT
					.getUat_percentage_completion());
			testExeToSave.setExpected_percent(testExeUAT
					.getUat_expected_percent());
			testExeToSave.setBlocked(testExeUAT.getUat_blocked());
			saveId = (Integer) session.save(testExeToSave);
			t.commit();

			return saveId;

		} catch (Exception e) {
			return 0;
		} finally {
			session.close();
		}

	}

	public boolean saveRootCauseDetails(RootCauseUAT rootCauseUAT, int uniqueId) {

		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			rootCauseUAT.setUnique_id(uniqueId);
			session.save(rootCauseUAT);
			t.commit();

			return true;
		} catch (Exception e) {

			return false;

		} finally {
			session.close();
		}

	}

	public boolean saveDefectDetailsUAT(Defect_Status_UAT defect_UAT,
			int uniqueId) {

		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			defect_UAT.setUnique_id(uniqueId);
			session.save(defect_UAT);
			t.commit();
			return true;
		} catch (Exception e) {

			return false;

		} finally {
			session.close();
		}

	}

	public boolean updateWowmain(Wowmain wowmain) {

		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			session.merge(wowmain);

			t.commit();
			return true;
		} catch (Exception e) {

			return false;

		} finally {
			session.close();
		}
	}

	public boolean updateDefects(int i, Defect_Status defect) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			defect.setUnique_id(i);
			session.update(defect);

			t.commit();
			return true;
		} catch (Exception e) {

			return false;

		} finally {
			session.close();
		}
	}

	public boolean updateDefectsUAT(int unique_id, PerformanceKeys perKeys) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			perKeys.setUnique_id(unique_id);
			session.update(perKeys);

			t.commit();
			return true;
		} catch (Exception e) {

			return false;

		} finally {
			session.close();
		}
	}

	public boolean updatePerformance(int unique_id, Defect_Status_UAT defect_UAT) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			defect_UAT.setUnique_id(unique_id);
			session.merge(defect_UAT);

			t.commit();
			return true;
		} catch (Exception e) {

			return false;

		} finally {
			session.close();
		}
	}

	public boolean updateRootCause(int unique_id, RootCause rootCause) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			rootCause.setUnique_id(unique_id);
			session.update(rootCause);

			t.commit();
			return true;
		} catch (Exception e) {

			return false;

		} finally {
			session.close();
		}
	}

	public boolean updateRootCauseUAT(int unique_id, RootCauseUAT rootCauseUAT) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			rootCauseUAT.setUnique_id(unique_id);
			session.update(rootCauseUAT);

			t.commit();
			return true;
		} catch (Exception e) {

			return false;

		} finally {
			session.close();
		}
	}

	public int updateTestExeCution(int unique_id, TestExecutionMain testMain) {

		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {

			if (testMain.getTest_execution_id() > 0) {
				System.out.println("############# Setting to Zero");
				testMain.setTest_execution_id(0);
			}
			TestExecutionMain testMainUpdate = new TestExecutionMain();
			testMainUpdate.setRelease_iteration_name("SIT");
			testMainUpdate.setCycle_name("CYCLE1");
			testMainUpdate.setSuite_name("SUITE1");
			testMainUpdate.setRelease_name("Release1");
			testMainUpdate.setRelease_iteration_end_date(testMain
					.getRelease_iteration_end_date());
			testMainUpdate.setRelease_iteration_start_date(testMain
					.getRelease_iteration_start_date());
			System.out.println("^^^^^^^^^^^ cleanTablesBeforeUpdate");
			/*
			 * System.out.println("listofElem[0] "+listofElem[0]+"unique_id"+
			 * unique_id); System.out.println("listofElem[3]  "+listofElem[3]);
			 */
			Query query = session
					.createSQLQuery("select test_execution_id from test_execution_main where unique_id=? ");
			query.setParameter(0, unique_id);
			/*
			 * query.setParameter(1, listofElem[3]); query.setParameter(2,
			 * listofElem[0]);
			 */
			int idToDelete = 0;
			List<Integer> list = query.list();
			System.out.println("$$$$$$$$$$$$$$$ size of list" + list.size());
			if (list != null && list.size() > 0) {
				for (Integer o : list) {
					idToDelete = o;
					if (idToDelete != 0) {
						System.out
								.println("####################################### obj present  "
										+ idToDelete);

						Query query2 = session
								.createSQLQuery("delete  from test_execution_main where test_execution_id=? ");
						query2.setParameter(0, idToDelete);
						query2.executeUpdate();
						Query query3 = session
								.createSQLQuery("delete  from testexecution where test_execution_id=? ");
						query3.setParameter(0, idToDelete);
						query3.executeUpdate();
					}
				}
			}

			session.flush();
			testMainUpdate.setUnique_id(unique_id);
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$ saving testMain"
					+ testMainUpdate.getTest_execution_id());
			int testmainId = (Integer) session.save(testMainUpdate);
			t.commit();

			return testmainId;

		}

		catch (Exception e) {

			return 0;

		} finally {
			session.close();
		}

	}

	public void updateTestExeCutionMain(int testExecutionMainIdupdate,
			TestExecution testExe) {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			testExe.setTest_execution_id(testExecutionMainIdupdate);
			session.save(testExe);

			t.commit();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public int updateTestExeCutionUAT(int unique_id,
			TestExecutionMainUAT testMainUAT) {

		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			TestExecutionMainUAT testUat = new TestExecutionMainUAT();
			testUat.setUat_release_iteration_name("UAT");
			testUat.setCycle_name("CYCLE1");
			testUat.setSuite_name("SUITE1");
			testUat.setRelease_name("Release1");
			testUat.setUat_release_iteration_start_date(testMainUAT
					.getUat_release_iteration_start_date());
			testUat.setUat_release_iteration_end_date(testMainUAT
					.getUat_release_iteration_end_date());
			if (testMainUAT.getTest_execution_id() > 0) {
				System.out.println("############# Setting to Zero");
				testMainUAT.setTest_execution_id(0);
			}
			testUat.setUnique_id(unique_id);
			int testmainUAt = (Integer) session.save(testUat);

			t.commit();
			return testmainUAt;
		} catch (Exception e) {

			return 0;

		} finally {
			session.close();
		}

	}

	public void updateTestExeCutionMainUAT(int testExecutionMainIdupdateUAT,
			TestExecutionUAT testExeUAT) {

		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		// boolean saveId;
		try {
			testExeUAT.setTest_execution_id(testExecutionMainIdupdateUAT);
			session.save(testExeUAT);

			t.commit();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

}
