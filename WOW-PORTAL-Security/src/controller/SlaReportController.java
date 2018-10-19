package controller;

import java.util.List;

import model.SlaMain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import dao.SlaReportDAO;


@Controller
public class SlaReportController {
	
	@Autowired
	SlaReportDAO slaReportDao;
	
	@RequestMapping(value = "/getSlaReportData", method = RequestMethod.GET)
	public ResponseEntity<String> slaProjectsReport(@RequestParam(value="year")String year)
	{
		System.out.println("!!!!!!!!!!!!!!!!!!In controller to get report of all projects By Protfolio!!!!!!!!!!!!!!!");

		//slaReportDao.getSlaReport();
		//System.out.println("@@@@@@@@@@@@In controller to get report of all projects@@@@@@@@@@@");
		String projects = slaReportDao.getSlaReport(year);
		if (projects != null) 
		{
			//Gson gson = new Gson();
			//String finalList = gson.toJson(projects);
			System.out.println("((((((((((((((((((((((In controller)))))))))))))))))))   :"+projects);
			return new ResponseEntity<String>(projects, HttpStatus.OK);
		}
		return null;
	}

	
	@RequestMapping(value = "/getProjectReport", method = RequestMethod.GET)
	public ResponseEntity<String> slaReportProject(@RequestParam(value="portfolio")String portfolio, @RequestParam(value="year")String year)
	{
		System.out.println("$$$$$$$$$$$$$$$ ");
		System.out.println("!!!!!!!!!!!!!!!!!!In controller to get report of project!!!!!!!!!!!!!!!");

		//slaReportDao.getProjectReport(portfolio,year);
		System.out.println("@@@@@@@@@@@@In controller to get report of all projects@@@@@@@@@@@");
		List<String> projects = slaReportDao.getProjectReport(portfolio,year);
		if (projects != null) 
		{
			
			Gson gson = new Gson();
			String finalList = gson.toJson(projects);
			System.out.println("((((((((((((((((((((((In controller)))))))))))))))))))"+finalList);
			return new ResponseEntity<String>(finalList, HttpStatus.OK);
		
		}
		return null;
	}
	
}
