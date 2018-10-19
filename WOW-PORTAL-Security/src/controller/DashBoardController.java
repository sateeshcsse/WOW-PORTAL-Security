package controller;

import java.util.ArrayList;
import java.util.List;

import dao.DashBoardDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DashBoardController {

	@Autowired
	DashBoardDAO dashDao;

	@RequestMapping(value = "/getCurrentEngageMent", method = RequestMethod.GET)
	public @ResponseBody
	Integer[] currentEngagement() {

		Integer[] totalProj = dashDao.getProjectPerformance();
		System.out.println("$$$$$$$$$$$" + totalProj);
		return totalProj;

	}

	@RequestMapping(value = "/getResourceRatios", method = RequestMethod.GET)
	public @ResponseBody
	List<Double> resourceRatios() {
		System.out.println("########### resourceRatios %%%%%%%%%%%%%%%");
		List<Double> resources = (List<Double>) dashDao.getResorceRatio();
		System.out.println("$$$$$$$$$$$" + resources.size());
		for (Double dof : resources) {
			System.out.println(dof);
		}
		return resources;

	}

	@RequestMapping(value = "/getCOTRatios", method = RequestMethod.GET)
	public @ResponseBody
	Double cotRatios() {
		System.out.println("########### cotRatios %%%%%%%%%%%%%%%");
		Double resources = dashDao.getCotRatios();
		return resources;

	}
	
	@RequestMapping(value={"/getSLAMetricsDashboard"}, method={RequestMethod.GET})
    @ResponseBody
    public List<Float> getSLAMetrics() {
        List<Float> totalProj = this.dashDao.getSLAData();
        System.out.println("$$$$$$$$$$$" + totalProj);
        return totalProj;
    }
	
	@RequestMapping(value={"/getRCADashboard"}, method={RequestMethod.GET})
    @ResponseBody
    public List<Integer> getRCAValues() {
        List<Integer> result = dashDao.getRCAValues(); 
        System.out.println("$$$$$$$$$$$" + result );
        return result;
    }
	
	@RequestMapping(value={"/getVMDashboard"}, method={RequestMethod.GET})
    @ResponseBody
    public List<Integer> getVMValues() {
        List<Integer> result = dashDao.getVMValues(); 
        System.out.println("$$$$$$$$$$$" + result );
        return result;
    }
	
	@RequestMapping(value={"/getMcalmDashboard"}, method={RequestMethod.GET})
    @ResponseBody
    public List<Integer> getMcalmValues() {
        List<Integer> result = dashDao.getMcalmValues(); 
        System.out.println("$$$$$$$$$$$" + result );
        return result;
    }
	
	@RequestMapping(value={"/getMcalmLicenseDashboard"}, method={RequestMethod.GET})
    @ResponseBody
    public List<Integer> getMcalmLicenseValues() {
		List<Integer> result = new ArrayList<>();
		result.add(160); //Others
		result.add(20);	//1POS
		result.add(5);  //Galaxy
		result.add(15);  //HCM
		
		
        
        System.out.println("$$$$$$$$$$$" + result );
        return result;
    }
	
//	@RequestMapping(value={"/getPerformanceDashboard"}, method={RequestMethod.GET})
//    @ResponseBody
//    public List<Integer> getPerformanceValues() {
//        List<Integer> result = dashDao.getPerfValues(); 
//        System.out.println("$$$$$$$$$$$" + result );
//        return result;
//    }
//	
//	@RequestMapping(value={"/getAutomationDashboard"}, method={RequestMethod.GET})
//    @ResponseBody
//    public List<Integer> getAutomationValues() {
//		List  result = dashDao.getAutoValues(); 
//        System.out.println("$$$$$$$$$$$" + result );
//       
//        return result;
//    }
//	
	

}
