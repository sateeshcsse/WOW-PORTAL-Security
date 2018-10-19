package controller;

import model.VMData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.List;
import java.util.Map;

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








import dao.SlaDAO;
import dao.VMDao;

@Controller
public class VMController {
	
	@Autowired
	VMDao vmDao;

	@RequestMapping(value = "/saveVMdata", method = RequestMethod.POST)
	public ResponseEntity<String> vmcontrol(@RequestBody String vm_data)
	{
		System.out.println(vm_data);
		ObjectMapper vm_object = new ObjectMapper();
		try{
			VMData vmdata = vm_object.readValue(vm_data, VMData.class);
			if(vmdata.getId() > 0)
			{
			vmDao.updateVMData(vmdata);
			}
			else
			{
				vmDao.saveVMData(vmdata);
			}
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		catch (Exception e)
		{
			return new ResponseEntity<String>(HttpStatus.FAILED_DEPENDENCY);
		}
	
		
		
	}
	
	@RequestMapping(value = "/getVMData", method = RequestMethod.GET)
	public ResponseEntity<String> vmdataMain()
	{
		List rcaData  =   vmDao.getvmValues();
		if (rcaData != null) 
		{
			
			Gson gson = new Gson();
			String finalList = gson.toJson(rcaData);
			System.out.println("Data sent from Controller to Front    :::"+finalList);
			return new ResponseEntity<String>(finalList, HttpStatus.OK);
		
		}
		return null;
		
		
		
	}
}


