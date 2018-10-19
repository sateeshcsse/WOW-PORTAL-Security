package controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import dao.WowmainHibernate;
import model.Wowmain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class DailyStausDefaultReport {

	@Autowired
	private WowmainHibernate wowmainHibernate;

	@RequestMapping(value = "/defaultersReportSreen", method = RequestMethod.GET)
	public String getDefaultScreen() {
		return "defaultProjectDashboardDailyStatusReport";
	}

	@RequestMapping(value = "/defaultersReport", method = RequestMethod.GET)
	public @ResponseBody
	String getDefaulterReoprt() {

		List<Wowmain> reports = wowmainHibernate.geDefautersReport();
		HashMap<String, List> map = new HashMap<String, List>();

		map.put("listWowmain", reports);
		Gson json = new Gson();
		String jsonStr = json.toJson(map);
		return jsonStr;

	}

}
