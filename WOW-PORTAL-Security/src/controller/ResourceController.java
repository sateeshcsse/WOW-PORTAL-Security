package controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import dao.ResourceDao;
import model.Resources;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class ResourceController {

	@Autowired
	ResourceDao resourceDao;

	@RequestMapping(value = "getResourcePage", method = RequestMethod.GET)
	public String getResourceDataPage() {

		return "addResourcesDashboard";

	}

	@RequestMapping(value = "saveResourceData", method = RequestMethod.POST)
	public @ResponseBody
	ResponseEntity<String> saveResourceData(@RequestBody String requestBody) {

		String success = "Successfully Saved the data";
		String update = "Successfully Updated the data";
		String eror = " CouldNot save the data";
		Gson gson = new Gson();
		update = gson.toJson(update);
		eror = gson.toJson(eror);
		success = gson.toJson(success);
		ObjectMapper object = new ObjectMapper();
		try {
			Resources resource = object.readValue(requestBody, Resources.class);
			resource.setLatestDate(new SimpleDateFormat("dd/MM/yyyy HH:mm")
					.format(new Date()));
			System.out.println(resource.getResourceTableId());
			if (resource.getResourceTableId() > 0) {
				boolean updated = resourceDao.updateResouceDate(resource);
				if (updated) {
					return new ResponseEntity<String>(success, HttpStatus.OK);
				} else {
					return new ResponseEntity<String>(eror,
							HttpStatus.EXPECTATION_FAILED);
				}
			}
			boolean saveData = resourceDao.saveResouceDate(resource);
			if (saveData) {
				return new ResponseEntity<String>(success, HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(eror,
						HttpStatus.EXPECTATION_FAILED);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(),
					HttpStatus.EXPECTATION_FAILED);
		}

	}

	@RequestMapping(value = "loadResourceData", method = RequestMethod.GET)
	public @ResponseBody
	String loadResourceData() {

		Resources resource = resourceDao.loadResourceData();
		if (resource != null) {
			Gson gson = new Gson();
			String resources = gson.toJson(resource);
			return resources;
		}
		return null;

	}

	@RequestMapping(value = "/resourcesGraph", method = RequestMethod.GET)
	public @ResponseBody
	String getDataForGraph() {
		List<Double> data = resourceDao.getRatiosForGraph();
		if (data != null) {
			Gson gson = new Gson();
			String resources = gson.toJson(data);
			return resources;
		}
		return null;
	}

}
