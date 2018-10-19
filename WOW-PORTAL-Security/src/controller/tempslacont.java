package controller;

import model.SlaProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.SlaDAO;

@Controller
public class tempslacont {
	
	@Autowired
	SlaDAO slaDao;
	
	@RequestMapping(value = "/postSlaProj", method = RequestMethod.POST)
	public ResponseEntity<String> slacontrol(@RequestBody String sla_Text)
	{
		System.out.println("$$$$$$$$$$$$$$$$$$$ Inside new method  jsjfdifjdsjfo");
		System.out.println(sla_Text);
		
		ObjectMapper slaproj_object = new ObjectMapper();
		
		try{
			
			SlaProject slaProjObject = slaproj_object.readValue(sla_Text, SlaProject.class);
			slaDao.saveSlaProj(slaProjObject);
		
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return null;
		
	}
}
