package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import dao.RplnDashBoardDao;

@Controller
public class RplnDashBoardController {

	@Autowired
	RplnDashBoardDao rplnDao;

	@RequestMapping(value = "/getSmktUatOverview", method = RequestMethod.GET)
	public @ResponseBody Double[] getSmktUatOverview() {
		Double[] status = rplnDao.getSmktOverview("ACPT");
		System.out.println("$$$$$$$$$$$" + status);
		return status;
	}

	@RequestMapping(value = "/getSmktSitOverview", method = RequestMethod.GET)
	public @ResponseBody Double[] getSmktSitOverview() {
		Double[] status = rplnDao.getSmktOverview("TEST");
		System.out.println("$$$$$$$$$$$" + status);
		return status;
	}

	@RequestMapping(value = "/getBigwUatOverview", method = RequestMethod.GET)
	public @ResponseBody Double[] getBigwUatOverview() {
		Double[] status = rplnDao.getBigwOverview("ACPT");
		System.out.println("$$$$$$$$$$$" + status);
		return status;
	}

	@RequestMapping(value = "/getBigwSitOverview", method = RequestMethod.GET)
	public @ResponseBody Double[] getBigwSitOverview() {
		Double[] status = rplnDao.getBigwOverview("TEST");
		System.out.println("$$$$$$$$$$$" + status);
		return status;
	}

	@RequestMapping(value = "/getSmktUatDetails", method = RequestMethod.GET)
	public @ResponseBody String getSmktUatDetails() {
		String details = rplnDao.getRplnDetails("ACPT", "SMKT");
		System.out.println("$$$$$$$$$$$" + details);
		return details;
	}

	@RequestMapping(value = "/getSmktSitDetails", method = RequestMethod.GET)
	public @ResponseBody String getSmktSitDetails() {
		String details = rplnDao.getRplnDetails("TEST", "SMKT");
		System.out.println("$$$$$$$$$$$" + details);
		return details;
	}

	@RequestMapping(value = "/getBigwUatDetails", method = RequestMethod.GET)
	public @ResponseBody String getBigwUatDetails() {
		String details = rplnDao.getRplnDetails("ACPT", "BIGW");
		System.out.println("$$$$$$$$$$$" + details);
		return details;
	}

	@RequestMapping(value = "/getBigwSitDetails", method = RequestMethod.GET)
	public @ResponseBody String getBigwSitDetails() {
		String details = rplnDao.getRplnDetails("TEST", "BIGW");
		System.out.println("$$$$$$$$$$$" + details);
		return details;
	}

	@RequestMapping(value = "/getJavaAppDetails", method = RequestMethod.GET)
	public @ResponseBody String getJavaAppDetails(@RequestParam(value = "environment") String env,
			@RequestParam(value = "portfolio") String port) {
		String details = rplnDao.getJavaAppDetails(env, port);
		System.out.println("$$$$$$$$$$$" + details);
		return details;
	}

	@RequestMapping(value = "/getJavaStatus", method = RequestMethod.GET)
	public ResponseEntity<String> getJavaStatus(@RequestParam(value = "environment") String env) {
		List javaStatus = rplnDao.getJavaStatus(env);
		if (javaStatus != null) {
			Gson gson = new Gson();
			String finalList = gson.toJson(javaStatus);
			return new ResponseEntity<String>(finalList, HttpStatus.OK);
		}
		return null;
	}
	
	@RequestMapping(value = "/getJavaUatDetails", method = RequestMethod.GET)
	public @ResponseBody String getJavaUatDetails() {
		String details = rplnDao.getJavaUatDetails();
		System.out.println("$$$$$$$$$$$" + details);
		return details;
	}

	@RequestMapping(value = "/getNonProdCountsByStream", method = RequestMethod.GET, params = { "stream" })
	public @ResponseBody List<String> getNonProdCountsByStream(@RequestParam(value = "stream") String stream) {
		List<String> status = rplnDao.getNonProdCountsByStream(stream, null);
		System.out.println(status);
		return status;
	}

	@RequestMapping(value = "/getNonProdCountsByStream", method = RequestMethod.GET, params = { "stream",
			"environment" })
	public @ResponseBody List<String> getNonProdCountsByStream(@RequestParam(value = "stream") String stream,
			@RequestParam(value = "environment") String environment) {
		List<String> status = rplnDao.getNonProdCountsByStream(stream, environment);
		System.out.println(status);
		return status;
	}

	@RequestMapping(value = "/getNonProdCounts", method = RequestMethod.GET, params = { "team" })
	public @ResponseBody List<String> getNonProdCounts(@RequestParam(value = "team") String team) {
		List<String> status = rplnDao.getNonProdCounts(team, null, null);
		System.out.println(status);
		return status;
	}

	@RequestMapping(value = "/getNonProdCounts", method = RequestMethod.GET, params = { "team", "environment" })
	public @ResponseBody List<String> getNonProdCounts(@RequestParam(value = "team") String team,
			@RequestParam(value = "environment") String environment) {
		List<String> status = rplnDao.getNonProdCounts(team, environment, null);
		System.out.println(status);
		return status;
	}

	@RequestMapping(value = "/getNonProdCounts", method = RequestMethod.GET, params = { "team", "environment", "sub1" })
	public @ResponseBody List<String> getNonProdCounts(@RequestParam(value = "team") String team,
			@RequestParam(value = "environment") String environment, @RequestParam(value = "sub1") String sub1) {
		List<String> status = rplnDao.getNonProdCounts(team, environment, sub1);
		System.out.println(status);
		return status;
	}
}