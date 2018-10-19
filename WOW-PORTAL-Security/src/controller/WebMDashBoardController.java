package controller;

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
import dao.WebMDashBoardDao;
import model.Maintenance;

@Controller
public class WebMDashBoardController {

	@Autowired
	WebMDashBoardDao wmDao;

	@RequestMapping(value = "/getWMStoresStatus", method = RequestMethod.GET)
	public @ResponseBody Double[] getWMStoresStatus() {
		Double[] status = wmDao.getStoresStaus();
		System.out.println("$$$$$$$$$$$" + status);
		return status;
	}

	@RequestMapping(value = "/getWMStoresOutBoundOverview", method = RequestMethod.GET)
	public @ResponseBody Double[] getWMStoresOutBoundOverview() {
		Double[] status = wmDao.getWMStoresOutBoundOverview();
		System.out.println("$$$$$$$$$$$" + status);
		return status;
	}

	@RequestMapping(value = "/getWMStoresInBoundOverview", method = RequestMethod.GET)
	public @ResponseBody Double[] getWMStoresInBoundOverview() {
		Double[] status = wmDao.getWMStoresInBoundOverview();
		System.out.println("$$$$$$$$$$$" + status);
		return status;
	}

	@RequestMapping(value = "/getR8SODetails", method = RequestMethod.GET)
	public @ResponseBody String getR8SODetails() {
		String mainTable = wmDao.getR8SODetails();
		System.out.println(mainTable);
		return mainTable;
	}

	@RequestMapping(value = "/getR8SIDetails", method = RequestMethod.GET)
	public @ResponseBody String getR8SIDetails() {
		String mainTable = wmDao.getR8SIDetails();
		System.out.println(mainTable);
		return mainTable;
	}

	@RequestMapping(value = "/getWMEnvStatus", method = RequestMethod.GET)
	public @ResponseBody double getWMEnvStatus(@RequestParam(value = "environment") String env) {
		double status = wmDao.getWMEnvStatus(env);
		System.out.println(status);
		return status;
	}

	@RequestMapping(value = "/getWMTypeByEnv", method = RequestMethod.GET)
	public @ResponseBody double getWMTypeByEnv(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType) {
		double status = wmDao.getWMTypeByEnv(env, wmType);
		System.out.println(status);
		return status;
	}

	@RequestMapping(value = "/getWMDivByType", method = RequestMethod.GET)
	public @ResponseBody double getWMDivByType(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType, @RequestParam(value = "division") String div) {
		double status = wmDao.getWMDivByType(env, wmType, div);
		System.out.println(status);
		return status;
	}

	@RequestMapping(value = "/getInListByDiv", method = RequestMethod.GET)
	public @ResponseBody String getInListByDiv(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType, @RequestParam(value = "division") String div) {
		String inList = wmDao.getInOutListByDiv(env, wmType, div, "IN");
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getOutListByDiv", method = RequestMethod.GET)
	public @ResponseBody String getOutListByDiv(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType, @RequestParam(value = "division") String div) {
		String inList = wmDao.getInOutListByDiv(env, wmType, div, "OUT");
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getStoreStatusByDiv", method = RequestMethod.GET)
	public @ResponseBody String getStoreStatusByDiv(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType, @RequestParam(value = "division") String div) {
		String inList = wmDao.getStoreStatusByDiv(env, wmType, div);
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getISStatusByStore", method = RequestMethod.GET)
	public @ResponseBody String getISStatusByStore(@RequestParam(value = "store") String store,
			@RequestParam(value = "environment") String environment) {
		String inList = wmDao.getISStatusByStore(store, environment);
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getOutMsgDetailByDiv", method = RequestMethod.GET)
	public @ResponseBody String getOutMsgDetailByDiv(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType, @RequestParam(value = "division") String div) {
		String inList = wmDao.getDetailByDiv(env, wmType, div, "OUT", "MSG");
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getOutFileDetailByDiv", method = RequestMethod.GET)
	public @ResponseBody String getOutFileDetailByDiv(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType, @RequestParam(value = "division") String div) {
		String inList = wmDao.getDetailByDiv(env, wmType, div, "OUT", "FILE");
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getInMsgDetailByDiv", method = RequestMethod.GET)
	public @ResponseBody String getInMsgDetailByDiv(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType, @RequestParam(value = "division") String div) {
		String inList = wmDao.getDetailByDiv(env, wmType, div, "IN", "MSG");
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getInFileDetailByDiv", method = RequestMethod.GET)
	public @ResponseBody String getInFileDetailByDiv(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType, @RequestParam(value = "division") String div) {
		String inList = wmDao.getDetailByDiv(env, wmType, div, "IN", "FILE");
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getInMasterDetailByDiv", method = RequestMethod.GET)
	public @ResponseBody String getInMasterDetailByDiv(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType, @RequestParam(value = "division") String div) {
		String inList = wmDao.getDetailByDiv(env, wmType, div, "IN", "MAS");
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getAllStoreStatus", method = RequestMethod.GET)
	public @ResponseBody String getAllStoreStatus() {
		String inList = wmDao.getAllStoreStatus();
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getOverallStoreStatus", method = RequestMethod.GET)
	public @ResponseBody String getOverallStoreStatus(@RequestParam(value = "store") String store) {
		String inList = wmDao.getOverallStoreStatus(store);
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getStoreDetails", method = RequestMethod.GET)
	public @ResponseBody String getStoreDetails(@RequestParam(value = "store") String store) {
		String inList = wmDao.getStoreDetails(store);
		System.out.println(inList);
		return inList;
	}

	@RequestMapping(value = "/getWMEnvOveralStatus", method = RequestMethod.GET, params = { "environment" })
	public @ResponseBody Double[] getWMEnvOveralStatus(@RequestParam(value = "environment") String env) {
		Double[] status = wmDao.getWMEnvOveralStatus(env,null,null);
		System.out.println(status);
		System.out.println("Venkat Test");
		return status;
	}

	@RequestMapping(value = "/getWMEnvOveralStatus", method = RequestMethod.GET, params = { "environment", "wmType" })
	public @ResponseBody Double[] getWMEnvOveralStatus(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType) {
		Double[] status = wmDao.getWMEnvOveralStatus(env,wmType,null);
		System.out.println(status);
		return status;
	}

	@RequestMapping(value = "/getWMEnvOveralStatus", method = RequestMethod.GET, params = { "environment", "wmType",
			"division" })
	public @ResponseBody Double[] getWMEnvOveralStatus(@RequestParam(value = "environment") String env,
			@RequestParam(value = "wmType") String wmType, @RequestParam(value = "division") String div) {
		Double[] status = wmDao.getWMEnvOveralStatus(env,wmType,div);
		System.out.println(status);
		return status;
	}
	@RequestMapping(value = "/planMaintenance", method = RequestMethod.POST)
	public ResponseEntity<String> saveStore(@RequestBody String plan_input)
	{
		System.out.println(plan_input);
		ObjectMapper plan_object = new ObjectMapper();
		boolean result = false;
		try{
			Maintenance planModel = plan_object.readValue(plan_input, Maintenance.class);
			result = wmDao.addOnStore(planModel);
		   if(result)
			{
			return new ResponseEntity<String>(HttpStatus.OK);
			}
			else
			{
				return new ResponseEntity<String>(HttpStatus.FAILED_DEPENDENCY);
			}
		}
		catch (Exception e)
		{
			return new ResponseEntity<String>(HttpStatus.FAILED_DEPENDENCY);
		}
	}
}
