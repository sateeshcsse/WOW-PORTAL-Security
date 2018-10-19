package controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import dao.ResourceDao;
import dao.SlaDAO;
import model.Resources;
import model.SlaMain;
import model.SlaProject;
import model.SlaRootCause;
import model.SlaDefect;

@Controller
public class SlaController {
	
	@Autowired
	SlaDAO slaDao;

	@RequestMapping(value = "/postSlaDetails", method = RequestMethod.POST)
	public ResponseEntity<String> slacontrol(@RequestBody String sla_Text)
	{
		System.out.println(sla_Text);
		
		ObjectMapper sla_object = new ObjectMapper();
		try{
			SlaMain slaMainObject = sla_object.readValue(sla_Text, SlaMain.class);
			System.out.println("Project:" +slaMainObject.getProject());
			System.out.println("fghdgfhdsiuyfiudyfuiydsuifyuidsf" +slaMainObject.getId());
			SlaProject slaProjObject = sla_object.readValue(sla_Text, SlaProject.class);
			System.out.println("Bronze : "+slaProjObject.getBronze());
			System.out.println("Gold :"+slaProjObject.getGold());
			
			SlaDefect slaDefectObject = sla_object.readValue(sla_Text, SlaDefect.class);
			System.out.println("Def Comments : "+slaDefectObject.getDef_comments());
			System.out.println("Def Prod_close : "+slaDefectObject.getProd_close());
			System.out.println("Def Prod_open : "+slaDefectObject.getProd_open());
			
			SlaRootCause slaRootCauseObject = sla_object.readValue(sla_Text, SlaRootCause.class);
			System.out.println("Prod_code : "+slaRootCauseObject.getProd_code());
			System.out.println("Prod_design : "+slaRootCauseObject.getProd_design());
			
			slaMainObject.setSladefect(slaDefectObject);
			//laDefectObject.setSlamain(slaMainObject);
			slaMainObject.setSlaproject(slaProjObject);
			//slaRootCauseObject.setSlamain(slaMainObject);
			slaMainObject.setSlarootcause(slaRootCauseObject);
			//slaProjObject.setSlamain(slaMainObject);
			System.out.println("fghdgfhdsiuyfiudyfuiydsuifyuidsf" +slaMainObject.getId());
			
			if(slaMainObject.getId() > 0)
			{
			slaDao.updateSlaData(slaMainObject,slaDefectObject,slaProjObject,slaRootCauseObject);
			}
		else
			{
			slaDao.saveSlaData(slaMainObject);
			}
			
			return new ResponseEntity<String>(HttpStatus.OK);
		}
	catch(com.fasterxml.jackson.databind.exc.InvalidFormatException e)
		{
		System.out.println("Enter only numbers " +e);
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		return new ResponseEntity<String>(HttpStatus.FAILED_DEPENDENCY);
		
	}
	
	@RequestMapping(value = "/getSla", method = RequestMethod.GET)
	public ResponseEntity<String> slaget(@RequestParam(value="portfolio")String portfolio, @RequestParam(value="project")String project)
	{
		
		System.out.println("$$$$$$$$$$$$$$$ Hello $$$$$$$$$$$$$$$$$$$$$$$$$$$");
		SlaMain sla=slaDao.getSlaData(portfolio,project);
		
     //    System.out.println(sla);
	     System.out.println(sla.getSlarootcause());
	     System.out.println(sla.getSlarootcause());
	     System.out.println(sla.getSladefect());
	     if (sla != null) {
	    	 
	 		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();;
	 		String finalList = gson.toJson(sla);
	 		//String finalList1 = gson.toJson(sla.getSlaproject());
	 		//String finalList2 = gson.toJson(sla.getSlarootcause());
	 		System.out.println("$$$$$$$$$$$$$$$$$$   "+finalList+"  %%%%%%%%%%%%%%%%%%%%%%%");
	 		//System.out.println("$$$$$$$$$$$$$$$$$$   "+finalList1+"  %%%%%%%%%%%%%%%%%%%%%%%");
	 		//System.out.println("$$$$$$$$$$$$$$$$$$   "+finalList2+"  %%%%%%%%%%%%%%%%%%%%%%%");
	 		return new ResponseEntity<String>(finalList,HttpStatus.OK);
	 	}

		return null;
	}
	
	@RequestMapping(value = "/getProjects", method = RequestMethod.GET)
	public ResponseEntity<String> slaProjects(@RequestParam(value="portfolio") String project_text)
	{
		System.out.println("In controller to display all projects according to portfolio   " +project_text);
	List projects = slaDao.getProjectsSla(project_text);
	if (projects != null) {
		Gson gson = new Gson();
		String finalList = gson.toJson(projects);
		//System.out.println(projects);
		return new ResponseEntity<String>(finalList, HttpStatus.OK);
	}
	return null;
	}

}

