package controller;

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

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import dao.WowmainForCustomProject;

@Controller
public class DailyStatusReportInput {
	@Autowired
	private WowmainForCustomProject wowmainCustom;

	@RequestMapping(value = "/saveProjectData", method = RequestMethod.GET)
	public ResponseEntity<String> addPortfolioAndProjects(
			@RequestParam(value = "portfolio") String portfolio,
			@RequestParam(value = "project") String project) {

		System.out.println("#####  " + project + "  $$$$####$#$#$#$  "
				+ portfolio);

		String result = wowmainCustom.saveProjectAlone(portfolio, project);
		System.out.println("$$$$$$$$$$" + result);
		if ("success".equalsIgnoreCase(result)) {
			System.out.println("succcccccccccccccccccccccccc");
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}

	}

	@RequestMapping(value = "/saveCompleteProjectData", method = RequestMethod.POST)
	public @ResponseBody
	ResponseEntity<String> addCompleteProject(@RequestBody String projectData) {
		System.out.println("projectData+++++" + projectData);

		ObjectMapper object = new ObjectMapper();

		try {
			Wowmain wowmain = object.readValue(projectData, Wowmain.class);
			Defect_Status defect = object.readValue(projectData,
					Defect_Status.class);
			Defect_Status_UAT defect_UAT = object.readValue(projectData,
					Defect_Status_UAT.class);
			PerformanceKeys perKeys = object.readValue(projectData,
					PerformanceKeys.class);
			TestExecution testExe = object.readValue(projectData,
					TestExecution.class);
			TestExecutionUAT testExeUAT = object.readValue(projectData,
					TestExecutionUAT.class);
			TestExecutionMain testMain = object.readValue(projectData,
					TestExecutionMain.class);
			TestExecutionMainUAT testMainUAT = object.readValue(projectData,
					TestExecutionMainUAT.class);
			RootCause rootCause = object
					.readValue(projectData, RootCause.class);
			RootCauseUAT rootCauseUAT = object.readValue(projectData,
					RootCauseUAT.class);

			System.out.println("############## NA"
					+ testMainUAT.getUat_release_iteration_end_date());
			System.out.println("%%%%%%%%%%%%%%%%% NA"
					+ testExeUAT.getUat_not_available());
			System.out.println("$$$$$$$$$$$$$$$$$$$$ Expected Count"
					+ testExe.getExpected_percent());
			System.out.println("$$$$$$$$$$$$$$$$$$$$ Percent Count"
					+ testExe.getPercentage_completion());
			System.out.println("$$$$$$$$$$$$$$$$$$$$ UAT Expected Count"
					+ testExeUAT.getUat_expected_percent());
			System.out.println("$$$$$$$$$$$$$$$$$$$$ Expected Count"
					+ testExeUAT.getUat_percentage_completion());
			if (wowmain != null && wowmain.getUnique_id() > 0) {

				boolean wowmainId = wowmainCustom.updateWowmain(wowmain);
				boolean defectId = wowmainCustom.updateDefects(
						wowmain.getUnique_id(), defect);
				System.out.println("updated************* defect");
				boolean defectIdUAT = wowmainCustom.updateDefectsUAT(
						wowmain.getUnique_id(), perKeys);
				boolean performance = wowmainCustom.updatePerformance(
						wowmain.getUnique_id(), defect_UAT);
				boolean rootcauseid = wowmainCustom.updateRootCause(
						wowmain.getUnique_id(), rootCause);
				boolean rootcauseidUAT = wowmainCustom.updateRootCauseUAT(
						wowmain.getUnique_id(), rootCauseUAT);
				int testExecutionMainIdupdate = wowmainCustom
						.updateTestExeCution(wowmain.getUnique_id(), testMain);
				if (testExecutionMainIdupdate > 0) {
					wowmainCustom.updateTestExeCutionMain(
							testExecutionMainIdupdate, testExe);
				}
				int testExecutionMainIdupdateUAT = wowmainCustom
						.updateTestExeCutionUAT(wowmain.getUnique_id(),
								testMainUAT);
				if (testExecutionMainIdupdateUAT > 0) {
					wowmainCustom.updateTestExeCutionMainUAT(
							testExecutionMainIdupdateUAT, testExeUAT);
				}
				System.out
						.println("%%%%%%%%%%%%%%%%%%%%%% END OF UPDATE %%%%%%%%%%%%%%%%%%%%%%%%%%%");
				return new ResponseEntity<String>(HttpStatus.OK);
			}

			else {

				int uniqueId = wowmainCustom.getTheUniqueId(wowmain);
				int testExecutionMainUATId = 0;
				if (uniqueId <= 0) {
					return new ResponseEntity<String>(
							"Please Provide Project and Portfolio",
							HttpStatus.NOT_FOUND);
				}
				boolean wowMain = wowmainCustom.saveWowmainDetais(wowmain,
						uniqueId);
				System.out.println("######  " + wowMain);
				if (wowMain) {
					int testExecutionMainId = wowmainCustom
							.saveTestExecutionMainDetais(testMain, uniqueId);
					if (testMainUAT.getUat_release_iteration_start_date() != null) {
						testExecutionMainUATId = wowmainCustom
								.saveTestExecutionMainUATDetais(testMainUAT,
										uniqueId);
					}
					System.out.println("%%%%%%%testExecutionMainId    "
							+ testExecutionMainId);
					System.out.println("%%%%%%%testExecutionMainUATId    "
							+ testExecutionMainUATId);
					if (testExecutionMainId > 0) {
						int testExeId = wowmainCustom.savetestExeDetails(
								testExe, testExecutionMainId);
						System.out.println("%%%%%%%testExeId    " + testExeId);
						if (testExeId <= 0) {
							return new ResponseEntity<String>(
									"Please Verify the Data",
									HttpStatus.NOT_FOUND);
						}
					}
					if (testExecutionMainUATId > 0) {
						int testExeUAtId = wowmainCustom.savetestExeUATDetails(
								testExeUAT, testExecutionMainUATId);
						System.out.println("%%%%%%%testExeId    "
								+ testExeUAtId);
						if (testExeUAtId <= 0) {
							return new ResponseEntity<String>(
									"Please Verify the Data",
									HttpStatus.NOT_FOUND);
						}
					}
					boolean performanceSave = wowmainCustom
							.savePerformanceKeys(perKeys, uniqueId);
					boolean rootCauseSaveUAT = wowmainCustom
							.saveRootCauseDetails(rootCauseUAT, uniqueId);
					boolean rootCauseSave = wowmainCustom.saveRootCauseDetails(
							rootCause, uniqueId);
					boolean defectStatusUAT = wowmainCustom
							.saveDefectDetailsUAT(defect_UAT, uniqueId);
					boolean defectStatus = wowmainCustom.saveDefectDetails(
							defect, uniqueId);
					System.out.println("%%%%performanceSave " + performanceSave
							+ "  &&&&&rootCauseSave " + rootCauseSave
							+ "  &&&&defectStatus " + defectStatus);
					if (performanceSave && rootCauseSave && defectStatus) {
						return new ResponseEntity<String>(HttpStatus.OK);
					} else {
						return new ResponseEntity<String>(
								"Please Verify the Data", HttpStatus.NOT_FOUND);
					}
				} else {
					return new ResponseEntity<String>("Please Verify the Data",
							HttpStatus.NOT_FOUND);
				}
			}

		} catch (Exception e) {

			e.printStackTrace();
			return new ResponseEntity<String>("Please Verify the Data",
					HttpStatus.NOT_FOUND);
		}

	}

	@RequestMapping(value = "/getProjectValues", method = RequestMethod.GET)
	public ResponseEntity<String> getProjectValues(
			@RequestParam(value = "portfolio") String portfolio) {
		System.out.println(portfolio);
		List<String> projects = wowmainCustom
				.getProjectsForPortfolio(portfolio);
		if (projects != null) {
			Gson gson = new Gson();
			String finalList = gson.toJson(projects);
			System.out.println(projects);
			return new ResponseEntity<String>(finalList, HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("Sorry Something went Wrong",
					HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/getCompleteProjectValues", method = RequestMethod.GET)
	public ResponseEntity<String> getCompleteProjectValues(
			@RequestParam(value = "portfolio") String portfolio,
			@RequestParam(value = "project") String project) {

		List<String> projects = wowmainCustom.getCompleteProjectData(portfolio,
				project);
		if (projects != null) {
			Gson gson = new Gson();
			String finalList = gson.toJson(projects);
			return new ResponseEntity<String>(finalList, HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("Sorry Something went Wrong",
					HttpStatus.NOT_FOUND);
		}
	}

}
