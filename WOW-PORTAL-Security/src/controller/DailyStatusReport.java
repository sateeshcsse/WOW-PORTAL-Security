package controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import dao.WowmainHibernate;

@SuppressWarnings("rawtypes")
@Controller
public class DailyStatusReport {

	@Autowired
	private WowmainHibernate wowmainHibernate;

	@RequestMapping(value = "dailyStatusReportOverall", method = RequestMethod.GET)
	public ModelAndView listWowmain(@RequestParam(value = "portfolio", required = false) String portfolioParam,
			@RequestParam(value = "status", required = false) String status) {
		String jsonStr = "";

		try {
			if (portfolioParam == null && status == null) {
				ArrayList<ArrayList<String>> data = wowmainHibernate.listWowMain();
				List<String> portfolio = wowmainHibernate.getAllPortfolios();
				HashMap<String, List> map = new HashMap<String, List>();
				map.put("listWowmain", data);
				map.put("portfolio", portfolio);
				Gson json = new Gson();
				jsonStr = json.toJson(map);
			} else if (portfolioParam != null && status == null) {
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% else if");
				ArrayList<ArrayList<String>> data = wowmainHibernate.listWowMainWithParams(portfolioParam, status);
				List<String> portfolio = wowmainHibernate.getAllPortfolios();
				HashMap<String, List> map = new HashMap<String, List>();
				map.put("listWowmain", data);
				map.put("portfolio", portfolio);
				Gson json = new Gson();
				jsonStr = json.toJson(map);
			}

			else {
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% else");
				ArrayList<ArrayList<String>> data = wowmainHibernate.listWowMainWithParams(portfolioParam, status);
				List<String> portfolio = wowmainHibernate.getAllPortfolios();
				HashMap<String, List> map = new HashMap<String, List>();
				map.put("listWowmain", data);
				map.put("portfolio", portfolio);
				Gson json = new Gson();
				jsonStr = json.toJson(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("projectDashboardDailyStatusReport", "listWowmain", jsonStr);
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getHomeScreen() {
		return "home";
	}

	@RequestMapping(value = "addCoq", method = RequestMethod.GET)
	public String getAddCOQScreen() {
		return "projectCOQ";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogincreen() {
		return "login";
	}

	@RequestMapping(value = "/getCoq", method = RequestMethod.GET)
	public String getAddCOQReportScreen() {
		return "COQReport";
	}

	@RequestMapping(value = "/getBusUnitToDailyStatusReport", method = RequestMethod.POST)
	public @ResponseBody String getBusUnit(@RequestParam(value = "portfolio") String portfolio) {
		System.out.println("entered");
		String jsonStr = "";
		try {
			List<String> busUnit = wowmainHibernate.getBusUnit(portfolio);
			HashMap<String, List> map = new HashMap<String, List>();
			map.put("busUnit", busUnit);
			Gson json = new Gson();
			jsonStr = json.toJson(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonStr;
	}

	@RequestMapping(value = "/getTestPhaseToDailyStatusReport", method = RequestMethod.POST)
	public @ResponseBody String getTestPhase(
			@RequestParam(value = "portfolio") String portfolio/*
																 * ,
																 * 
																 * @
																 * RequestParam
																 * ( value =
																 * "busUnit" )
																 * String
																 * busUnit
																 */) {
		System.out.println("entered");
		String jsonStr = "";
		try {
			// System.out.println(portfolio+"*****************"+busUnit);
			// busUnit="";
			List<String> testPhase = wowmainHibernate.getTestPhase(portfolio/* ,busUnit */);
			HashMap<String, List> map = new HashMap<String, List>();
			map.put("testPhase", testPhase);
			Gson json = new Gson();
			jsonStr = json.toJson(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonStr;
	}

	@RequestMapping(value = "/getProjectPhaseToDailyStatusReport", method = RequestMethod.POST)
	public @ResponseBody String getProjectPhase(@RequestParam(value = "portfolio") String portfolio,
			@RequestParam(value = "busUnit") String busUnit, @RequestParam(value = "testPhase") String testPhase) {
		System.out.println("entered");
		String jsonStr = "";
		try {
			List<String> projectPhase = wowmainHibernate.getProjectPhase(portfolio, busUnit, testPhase);
			HashMap<String, List> map = new HashMap<String, List>();
			map.put("projectPhase", projectPhase);
			Gson json = new Gson();
			jsonStr = json.toJson(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonStr;
	}

	@RequestMapping(value = "/getProjectToDailyStatusReport", method = RequestMethod.POST)
	public @ResponseBody String getProject(@RequestParam(value = "portfolio") String portfolio,
			@RequestParam(value = "busUnit") String busUnit, @RequestParam(value = "testPhase") String testPhase,
			@RequestParam(value = "projectPhase") String projectPhase) {
		busUnit = null;
		testPhase = null;
		System.out.println("entered");
		String jsonStr = "";
		try {
			List<String> project = wowmainHibernate.getProject(portfolio, busUnit, testPhase, projectPhase);
			HashMap<String, List> map = new HashMap<String, List>();
			map.put("project", project);
			Gson json = new Gson();
			jsonStr = json.toJson(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonStr;
	}

	@RequestMapping(value = "/dailyStatusReportSelected", method = RequestMethod.POST)
	public @ResponseBody String dailyStatusReportSelected(@RequestParam(value = "portfolio") String portfolio,
			/* @RequestParam(value="busUnit") String busUnit, */
			@RequestParam(value = "testPhase") String testPhase,
			@RequestParam(value = "projectPhase") String projectPhase,
			@RequestParam(value = "project") String project) {

		System.out.println("entered");
		String jsonStr = "";
		ArrayList<List<String>> data = new ArrayList<List<String>>();
		try {
			// System.out.println( "**************"+busUnit);
			if ("all".equalsIgnoreCase(portfolio)) {
				data = wowmainHibernate.getSelectedReportDataForAll();
			}

			else if (!"all".equalsIgnoreCase(
					portfolio)/*
								 * && "all".equalsIgnoreCase (busUnit)
								 */) {
				data = wowmainHibernate.getSelectedReportDataForBusUnit(portfolio);

			} else if (!"all".equalsIgnoreCase(
					portfolio)/*
								 * && !"all".equalsIgnoreCase (busUnit)
								 */
					&& "all".equalsIgnoreCase(testPhase)) {
				data = wowmainHibernate.getSelectedReportDataForTestPhase(portfolio/* ,busUnit */);

			} else if (!"all".equalsIgnoreCase(
					portfolio) /*
								 * && !"all".equalsIgnoreCase (busUnit)
								 */
					&& !"all".equalsIgnoreCase(testPhase) && "all".equalsIgnoreCase(projectPhase)) {
				data = wowmainHibernate.getSelectedReportDataForProjectPhase(portfolio/* ,busUnit */, testPhase);

			}

			else if (!"all".equalsIgnoreCase(
					portfolio) /*
								 * && !"all".equalsIgnoreCase (busUnit)
								 */
					&& !"all".equalsIgnoreCase(testPhase) && !"all".equalsIgnoreCase(projectPhase)
					&& "all".equalsIgnoreCase(project)) {
				data = wowmainHibernate.getSelectedReportDataForProject(portfolio/* ,busUnit */, testPhase,
						projectPhase);

			}

			else if (!"all".equalsIgnoreCase(
					portfolio) /*
								 * && !"all".equalsIgnoreCase (busUnit)
								 */
					&& !"all".equalsIgnoreCase(testPhase) && !"all".equalsIgnoreCase(projectPhase)
					&& !"all".equalsIgnoreCase(project)) {
				data = wowmainHibernate.getSelectedReportData(portfolio/*
																		 * ,busUnit
																		 */, testPhase, projectPhase, project);

			}
			HashMap<String, List> map = new HashMap<String, List>();
			map.put("reportData", data);
			Gson json = new Gson();
			jsonStr = json.toJson(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonStr;
	}

	@RequestMapping(value = "/projectDashboardProjectDetails", method = RequestMethod.GET)
	public ModelAndView projectDashboardProjectDetails() {
		System.out.println("entered");
		List<String> projectsList = wowmainHibernate.getAllProjects();
		HashMap<String, List> map = new HashMap<String, List>();
		map.put("projectsList", projectsList);
		System.out.println("projectsList size :" + projectsList.size());
		System.out.println("projectsList :" + projectsList);
		Gson json = new Gson();
		String jsonStr = json.toJson(map);
		return new ModelAndView("projectDashboardProjectDetails", "projectsList", jsonStr);

	}

	@RequestMapping(value = "/getProjectDetails", method = RequestMethod.POST)
	public @ResponseBody String getProjectDetails(@RequestParam(value = "project") String project) {
		String jsonStr = "";
		try {
			HashMap<String, String> projMap = new HashMap<String, String>();
			projMap = wowmainHibernate.getProjectDetails(project);
			HashMap<String, HashMap<String, String>> map = new HashMap<String, HashMap<String, String>>();
			map.put("projMap", projMap);
			Gson json = new Gson();
			jsonStr = json.toJson(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonStr;
	}

	@RequestMapping(value = "/saveProjectDetails", method = RequestMethod.POST)
	public @ResponseBody String saveProjectDetails(@RequestParam(value = "portfolio") String portfolio,
			@RequestParam(value = "busUnit") String busUnit, @RequestParam(value = "testPhase") String testPhase,
			@RequestParam(value = "projectPhase") String projectPhase, @RequestParam(value = "project") String project,
			@RequestParam(value = "goLiveDate") String goLiveDate,
			@RequestParam(value = "resultColor") String resultColor, @RequestParam(value = "colors") String color,
			@RequestParam(value = "summary") String summary) {
		System.out.println("****************entered saveProjectDetails****************");
		String jsonStr = "";
		try {
			System.out.println("summary :" + summary);
			wowmainHibernate.saveProjectDetails(portfolio, busUnit, testPhase, projectPhase, project, goLiveDate,
					resultColor, color, summary);
			wowmainHibernate.savePerformanceKeys(project, color);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("successState", "success");
			Gson json = new Gson();
			jsonStr = json.toJson(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonStr;
	}

	@RequestMapping(value = "dailyStatusDetailedReportSelected", method = RequestMethod.POST)
	public @ResponseBody String dailyStatusDetailedReportSelected(@RequestParam(value = "portfolio") String portfolio,
			@RequestParam(value = "busUnit") String busUnit, @RequestParam(value = "projName") String projName,
			@RequestParam(value = "projPhase") String projPhase, @RequestParam(value = "testPhase") String testPhase,
			@RequestParam(value = "goLiveDate") String goLiveDate, @RequestParam(value = "poc") String poc,
			@RequestParam(value = "status") String status) throws SQLException {
		System.out.println("entered");
		System.out.println("Proj NAme\t" + projName);
		System.out.println("\nProj Phase\t" + projPhase);
		System.out.println("\nPortfolio\t" + portfolio);
		System.out.println("\ntestPhase\t" + testPhase);
		System.out.println("\ngoLiveDateo\t" + goLiveDate);

		String jsonStr = QueryUtils.computeQueriesForTables(portfolio, busUnit, testPhase, projPhase, projName,
				goLiveDate, poc, status);
		System.out.println("json will be************" + jsonStr);
		return jsonStr;

	}

	// @RequestMapping(value = "/updateCompleteTable", method =
	// RequestMethod.GET)
	// public @ResponseBody
	// String UpdateTableForSelectedProject(
	// @RequestParam(value = "projName") String projName,
	// @RequestParam(value = "portfolio") String portfolio,
	// @RequestParam(value = "projPhase") String projPhase,
	// @RequestParam(value = "testPhase") String testPhase,
	// @RequestParam(value = "goLiveDate") String goLiveDate)
	// throws InterruptedException {
	//
	// System.out.println("ProjName\t" + projName);
	// System.out.println("portfolio\t" + portfolio);
	// System.out.println("projPhase\t" + projPhase);
	// System.out.println("testPhase\t" + testPhase);
	//
	// String busUnit = "";
	// // String goLiveDate="";
	// String poc = "";
	// String status = "";
	// String jsonStr = "";
	// boolean statusOfexe = testReport.computeForProjName(projName,
	// portfolio, projPhase);
	// if (statusOfexe) {
	// try {
	// String newValuesForQuery = ExcelToDb.newVauesForQuery;
	// if (newValuesForQuery != null) {
	// String[] newvals = newValuesForQuery.split("%");
	// System.out.println(newvals);
	// portfolio = newvals[0];
	// projName = newvals[1];
	// projPhase = newvals[2];
	// }
	// jsonStr = QueryUtils.computeQueriesForTables(portfolio,
	// busUnit, testPhase, projPhase, projName, goLiveDate,
	// poc, status);
	// } catch (SQLException e) {
	//
	// e.printStackTrace();
	// jsonStr = e.getMessage();
	// }
	//
	// } else {
	// jsonStr = testReport.error;
	// }
	// System.out.println("Proje neamen" + projName);
	// // Thread.sleep(4000);
	//
	// return jsonStr;
	//
	// }

	@RequestMapping(value = "/saveTableData", method = RequestMethod.POST)
	public ResponseEntity<String> saveTableDataToDb(@RequestBody String tableData) {
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + tableData);
		try {

			wowmainHibernate.saveCOQdataTable(tableData);
			return new ResponseEntity<String>(HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return new ResponseEntity<String>(HttpStatus.UNSUPPORTED_MEDIA_TYPE);
		}

	}

	@RequestMapping(value = "/getProjectforCOQ", method = RequestMethod.GET)
	public @ResponseBody String getProjectList(@RequestParam(value = "portfolio") String portfoilo) {
		System.out.println("***********getProjectPhaseToDailyStatusReport***********" + portfoilo);
		String withoutQuotes_line1 = portfoilo.replace("\"", "");
		System.out.println(withoutQuotes_line1);
		String projects = wowmainHibernate.loadTableDataforPortfolio(withoutQuotes_line1);
		System.out.println(projects);
		return projects;
	}

	@RequestMapping(value = "/getProjectforCOQInput", method = RequestMethod.GET)
	public @ResponseBody String getProjectListforTableInput(@RequestParam(value = "portfolio") String portfoilo) {
		System.out.println("***********getProjectPhaseToDailyStatusReport***********" + portfoilo);
		String withoutQuotes_line1 = portfoilo.replace("\"", "");
		System.out.println(withoutQuotes_line1);
		String projects = wowmainHibernate.getProjectforCOQ(withoutQuotes_line1);
		System.out.println(projects);
		return projects;
	}

	@RequestMapping(value = "/getProjectforCOQReport", method = RequestMethod.GET)
	public @ResponseBody String getProjectListforTableReport(@RequestParam(value = "portfolio") String portfoilo) {
		System.out.println("***********getProjectPhaseToDailyStatusReport***********" + portfoilo);
		String withoutQuotes_line1 = portfoilo.replace("\"", "");
		System.out.println(withoutQuotes_line1);
		String projects = wowmainHibernate.getProjectforCOQReport(withoutQuotes_line1);
		System.out.println(projects);
		return projects;
	}

	@RequestMapping(value = "/getTableDataForPrject", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<String> getTableDataForPrject(
			@RequestParam(value = "portfolio") String portfolio, @RequestParam(value = "project") String project) {
		System.out.println("***********getProjectsforCOQ***********" + portfolio + "\t" + project);
		portfolio = portfolio.replace("\"", "");
		project = project.replace("\"", "");

		String projects = wowmainHibernate.getTableforCOQ(portfolio, project);

		if (projects != null && !projects.isEmpty()) {
			System.out.println(projects);
			return new ResponseEntity<String>(projects, HttpStatus.OK);
		} else {
			// String errorMessage="nothing found";
			// Errors errorInfo = new Errors( errorMessage);
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/getDataForTable", method = RequestMethod.GET)
	public @ResponseBody String getDataforReportTable(@RequestParam(value = "year") int year) {
		String mainTable = wowmainHibernate.loadTableData(year);
		System.out.println(mainTable);
		return mainTable;

	}

	@RequestMapping(value = "/getTableDataForPrjectReport", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<String> getTableDataForPrjectReport(
			@RequestParam(value = "project") String project) {
		System.out.println("***********getProjectsforCOQ***********" + "\t" + project);

		project = project.replace("\"", "");

		String projects = wowmainHibernate.getTableforReportCOQ(project);

		if (projects != null && !projects.isEmpty()) {
			System.out.println(projects);
			return new ResponseEntity<String>(projects, HttpStatus.OK);
		} else {
			String errorMessage = "nothing found";
			// Errors errorInfo = new Errors( errorMessage);
			return new ResponseEntity<String>(errorMessage, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/getTilesDataForPrjectReport", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<String> getTilesDataForPrjectReport() {
		String mainTile = wowmainHibernate.loadTileData();
		System.out.println(mainTile);
		return new ResponseEntity<String>(mainTile, HttpStatus.OK);

	}
}
