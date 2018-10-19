package controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;

import dao.WowmainHibernate;

public class QueryUtils {

	@Autowired
	private static WowmainHibernate wowmainHibernate;

	public static String computeQueriesForTables(String portfolio,
			String busUnit, String testPhase, String projPhase,
			String projName, String goLiveDate, String poc, String status)
			throws SQLException {
		System.out.println("%%%%%%%%%%%%%%%%" + portfolio + projName
				+ projPhase);
		wowmainHibernate = new WowmainHibernate();
		String testPhase2 = wowmainHibernate.getTestPhaseAlone(portfolio,
				projName, projPhase);
		LinkedList<String> temp = new LinkedList<String>();
		ArrayList<LinkedList<String>> detailsTable = new ArrayList<LinkedList<String>>();
		if (projPhase == null || projPhase.isEmpty() || projPhase.length() <= 0) {
			List<String> dates = wowmainHibernate.getDates(portfolio, projName);
			projPhase = dates.get(0);
			goLiveDate = dates.get(1);
		}
		String dates = wowmainHibernate.getLastRunDate(portfolio, projName);
		temp.add(portfolio);
		// temp.add(busUnit);
		temp.add(projName);
		temp.add(testPhase2);
		temp.add(projPhase);
		temp.add(goLiveDate);
		temp.add(dates);

		// temp.add(poc);
		temp.add(status);
		// System.out.println("temppppppppppppppp"+temp);
		detailsTable.add(temp);
		ArrayList<ArrayList> executionStatus = wowmainHibernate
				.getExecutionStatusDetails(portfolio, projName, projPhase,
						goLiveDate, poc, status);
		System.out.println("executionStatus : *** " + executionStatus);
		ArrayList defectStatus = wowmainHibernate.getDefectStatusDetails(
				portfolio, busUnit, testPhase, projPhase, projName, goLiveDate,
				poc, status);
		LinkedList pieChartStatus = wowmainHibernate.getStatusForPieChart(
				portfolio, busUnit, testPhase, projPhase, projName, goLiveDate,
				poc, status);
		LinkedList peformanceKeys = wowmainHibernate.populateDailyStatusTables(
				portfolio, busUnit, testPhase, projPhase, projName, goLiveDate,
				poc, status);
		/*
		 * System.out.println(peformanceKeys);
		 * System.out.println(pieChartStatus); System.out.println(defectStatus);
		 */
		System.out.println("executionStatus : *** " + detailsTable);
		HashMap<String, List> map = new LinkedHashMap<String, List>();
		map.put("reportData", executionStatus);
		map.put("detailsTable", detailsTable);
		map.put("defectStatus", defectStatus);
		map.put("pieStatus", pieChartStatus);
		map.put("peformanceKeys", peformanceKeys);
		Gson json = new Gson();
		String jsonStr = json.toJson(map);

		return jsonStr;

	}

}
