package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import dao.RootCauseDao;



@Controller
public class RootCauseController {
	
	@Autowired
	RootCauseDao rootCauseDao;
	
	
	//Get RCA values for all  Portfolios
	@RequestMapping(value = "/getallRCA", method = RequestMethod.GET)
	public ResponseEntity<String> getRCAPortfolio()
	{
		System.out.println("In Controller to Get RCA valuesfor all Portfolios");
		
		List rcabyport = rootCauseDao.getRCAValuesPort();
		if (rcabyport != null) {
			Gson gson = new Gson();
			String finalList = gson.toJson(rcabyport);
			//System.out.println(projects);
			return new ResponseEntity<String>(finalList, HttpStatus.OK);
		}
		return null;
		
	}
	
	@RequestMapping(value = "/getRCAProject", method = RequestMethod.GET)
	public ResponseEntity<String> getRCAProjectByPort(@RequestParam(value="portfolio") String portfolio)
	{
		System.out.println("In Controller to Get RCA valuesfor all Project in a Portfolio");
		
		List rcaProjforPort = rootCauseDao.getRCAProjforPort(portfolio);
		if (rcaProjforPort != null) {
			Gson gson = new Gson();
			String finalList = gson.toJson(rcaProjforPort);
			//System.out.println(projects);
			return new ResponseEntity<String>(finalList, HttpStatus.OK);
		}
		return null;
		
	}
	
	
	//Condition changed to Less than current date
	@RequestMapping(value = "/getRCAProjData", method = RequestMethod.GET)
	public ResponseEntity<String> getRCAProjData(@RequestParam(value="project") String project)
	{
		System.out.println("In Controller to Get RCA values for Specific Project");
		
		List rcaProjdata = rootCauseDao.getRCAProjdetails(project);
		if (rcaProjdata != null) {
			Gson gson = new Gson();
			String finalList = gson.toJson(rcaProjdata);
			//System.out.println(projects);
			return new ResponseEntity<String>(finalList, HttpStatus.OK);
		}
		return null;
		
	}

}
