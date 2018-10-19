package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "resources")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Resources {

	@Id
	@Column(name = "resourceTableId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int resourceTableId;

	@Column(name = "onsiteMenSharedService")
	private int onsiteMenSharedService;
	@Column(name = "offshoreMenSharedService")
	private int offshoreMenSharedService;
	@Column(name = "onsiteWomenSharedService")
	private int onsiteWomenSharedService;
	@Column(name = "offshoreWomenSharedService")
	private int offshoreWomenSharedService;

	@Column(name = "onsiteMenSupplyChain")
	private int onsiteMenSupplyChain;
	@Column(name = "offshoreMenSupplyChain")
	private int offshoreMenSupplyChain;
	@Column(name = "onsiteWomenSupplyChain")
	private int onsiteWomenSupplyChain;
	@Column(name = "offshoreWomenSupplyChain")
	private int offshoreWomenSupplyChain;

	@Column(name = "onsiteMenEnterpriseApps")
	private int onsiteMenEnterpriseApps;
	@Column(name = "offshoreMenEnterpriseApps")
	private int offshoreMenEnterpriseApps;
	@Column(name = "onsiteWomenEnterpriseApps")
	private int onsiteWomenEnterpriseApps;
	@Column(name = "offshoreWomenEnterpriseApps")
	private int offshoreWomenEnterpriseApps;

	@Column(name = "onsiteMenGFS")
	private int onsiteMenGFS;
	@Column(name = "offshoreMenGFS")
	private int offshoreMenGFS;
	@Column(name = "onsiteWomenGFS")
	private int onsiteWomenGFS;
	@Column(name = "offshoreWomenGFS")
	private int offshoreWomenGFS;

	@Column(name = "onsiteMenPerformance")
	private int onsiteMenPerformance;
	@Column(name = "offshoreMenPerformance")
	private int offshoreMenPerformance;
	@Column(name = "onsiteWomenPerformance")
	private int onsiteWomenPerformance;
	@Column(name = "offshoreWomenPerformance")
	private int offshoreWomenPerformance;

	@Column(name = "onsiteMenStores")
	private int onsiteMenStores;
	@Column(name = "offshoreMenStores")
	private int offshoreMenStores;
	@Column(name = "onsiteWomenStores")
	private int onsiteWomenStores;
	@Column(name = "offshoreWomenStores")
	private int offshoreWomenStores;

	@Column(name = "onsiteMenSAPAT")
	private int onsiteMenSAPAT;
	@Column(name = "offshoreMenSAPAT")
	private int offshoreMenSAPAT;
	@Column(name = "onsiteWomenSAPAT")
	private int onsiteWomenSAPAT;
	@Column(name = "offshoreWomenSAPAT")
	private int offshoreWomenSAPAT;

	@Column(name = "onsiteMenDigital")
	private int onsiteMenDigital;
	@Column(name = "offshoreMenDigital")
	private int offshoreMenDigital;
	@Column(name = "onsiteWomenDigital")
	private int onsiteWomenDigital;
	@Column(name = "offshoreWomenDigital")
	private int offshoreWomenDigital;

	@Column(name = "onsiteMenNonProdServices")
	private int onsiteMenNonProdServices;
	@Column(name = "offshoreMenNonProdServices")
	private int offshoreMenNonProdServices;
	@Column(name = "onsiteWomenNonProdServices")
	private int onsiteWomenNonProdServices;
	@Column(name = "offshoreWomenNonProdServices")
	private int offshoreWomenNonProdServices;

	@Column(name = "onsiteMenOthers")
	private int onsiteMenOthers;
	@Column(name = "offshoreMenOthers")
	private int offshoreMenOthers;
	@Column(name = "onsiteWomenOthers")
	private int onsiteWomenOthers;
	@Column(name = "offshoreWomenOthers")
	private int offshoreWomenOthers;

	@Column(name = "onsiteMenRunit")
	private int onsiteMenRunit;
	@Column(name = "offshoreMenRunit")
	private int offshoreMenRunit;
	@Column(name = "onsiteWomenRunit")
	private int onsiteWomenRunit;
	@Column(name = "offshoreWomenRunit")
	private int offshoreWomenRunit;

	@Column(name = "latestDate")
	private String latestDate;

	@Column(name = "totalOffshoreLeverage")
	private float totalOffshoreLeverage;

	@Column(name = "totalWomenRatio")
	private float totalWomenRatio;

	@Column(name = "totalOnsite")
	private int totalOnsite;

	@Column(name = "totalOffshore")
	private int totalOffshore;

	@Column(name = "totalWomen")
	private int totalWomen;

	@Column(name = "totalMen")
	private int totalMen;

	public int getOnsiteMenRunit() {
		return onsiteMenRunit;
	}

	public void setOnsiteMenRunit(int onsiteMenRunit) {
		this.onsiteMenRunit = onsiteMenRunit;
	}

	public int getOffshoreMenRunit() {
		return offshoreMenRunit;
	}

	public void setOffshoreMenRunit(int offshoreMenRunit) {
		this.offshoreMenRunit = offshoreMenRunit;
	}

	public int getOnsiteWomenRunit() {
		return onsiteWomenRunit;
	}

	public void setOnsiteWomenRunit(int onsiteWomenRunit) {
		this.onsiteWomenRunit = onsiteWomenRunit;
	}

	public int getOffshoreWomenRunit() {
		return offshoreWomenRunit;
	}

	public void setOffshoreWomenRunit(int offshoreWomenRunit) {
		this.offshoreWomenRunit = offshoreWomenRunit;
	}

	public int getTotalOnsite() {
		return totalOnsite;
	}

	public void setTotalOnsite(int totalOnsite) {
		this.totalOnsite = totalOnsite;
	}

	public int getTotalOffshore() {
		return totalOffshore;
	}

	public void setTotalOffshore(int totalOffshore) {
		this.totalOffshore = totalOffshore;
	}

	public int getTotalWomen() {
		return totalWomen;
	}

	public void setTotalWomen(int totalWomen) {
		this.totalWomen = totalWomen;
	}

	public int getTotalMen() {
		return totalMen;
	}

	public void setTotalMen(int totalMen) {
		this.totalMen = totalMen;
	}

	public float getTotalOffshoreLeverage() {
		return totalOffshoreLeverage;
	}

	public void setTotalOffshoreLeverage(float totalOffshoreLeverage) {
		this.totalOffshoreLeverage = totalOffshoreLeverage;
	}

	public float getTotalWomenRatio() {
		return totalWomenRatio;
	}

	public void setTotalWomenRatio(float totalWomenRatio) {
		this.totalWomenRatio = totalWomenRatio;
	}

	@Override
	public String toString() {
		return "Resources [resourceTableId=" + resourceTableId
				+ ", onsiteMenSharedService=" + onsiteMenSharedService
				+ ", offshoreMenSharedService=" + offshoreMenSharedService
				+ ", onsiteWomenSharedService=" + onsiteWomenSharedService
				+ ", offshoreWomenSharedService=" + offshoreWomenSharedService
				+ ", onsiteMenSupplyChain=" + onsiteMenSupplyChain
				+ ", offshoreMenSupplyChain=" + offshoreMenSupplyChain
				+ ", onsiteWomenSupplyChain=" + onsiteWomenSupplyChain
				+ ", offshoreWomenSupplyChain=" + offshoreWomenSupplyChain
				+ ", onsiteMenEnterpriseApps=" + onsiteMenEnterpriseApps
				+ ", offshoreMenEnterpriseApps=" + offshoreMenEnterpriseApps
				+ ", onsiteWomenEnterpriseApps=" + onsiteWomenEnterpriseApps
				+ ", offshoreWomenEnterpriseApps="
				+ offshoreWomenEnterpriseApps + ", onsiteMenGFS="
				+ onsiteMenGFS + ", offshoreMenGFS=" + offshoreMenGFS
				+ ", onsiteWomenGFS=" + onsiteWomenGFS + ", offshoreWomenGFS="
				+ offshoreWomenGFS + ", onsiteMenPerformance="
				+ onsiteMenPerformance + ", offshoreMenPerformance="
				+ offshoreMenPerformance + ", onsiteWomenPerformance="
				+ onsiteWomenPerformance + ", offshoreWomenPerformance="
				+ offshoreWomenPerformance + ", onsiteMenStores="
				+ onsiteMenStores + ", offshoreMenStores=" + offshoreMenStores
				+ ", onsiteWomenStores=" + onsiteWomenStores
				+ ", offshoreWomenStores=" + offshoreWomenStores
				+ ", onsiteMenSAPAT=" + onsiteMenSAPAT + ", offshoreMenSAPAT="
				+ offshoreMenSAPAT + ", onsiteWomenSAPAT=" + onsiteWomenSAPAT
				+ ", offshoreWomenSAPAT=" + offshoreWomenSAPAT
				+ ", onsiteMenDigital=" + onsiteMenDigital
				+ ", offshoreMenDigital=" + offshoreMenDigital
				+ ", onsiteWomenDigital=" + onsiteWomenDigital
				+ ", offshoreWomenDigital=" + offshoreWomenDigital
				+ ", onsiteMenNonProdServices=" + onsiteMenNonProdServices
				+ ", offshoreMenNonProdServices=" + offshoreMenNonProdServices
				+ ", onsiteWomenNonProdServices=" + onsiteWomenNonProdServices
				+ ", offshoreWomenNonProdServices="
				+ offshoreWomenNonProdServices + ", onsiteMenOthers="
				+ onsiteMenOthers + ", offshoreMenOthers=" + offshoreMenOthers
				+ ", onsiteWomenOthers=" + onsiteWomenOthers
				+ ", offshoreWomenOthers=" + offshoreWomenOthers
				+ ", latestDate=" + latestDate + ", totalOffshoreLeverage="
				+ totalOffshoreLeverage + ", totalWomenRatio="
				+ totalWomenRatio + "]";
	}

	public int getResourceTableId() {
		return resourceTableId;
	}

	public void setResourceTableId(int resourceTableId) {
		this.resourceTableId = resourceTableId;
	}

	public int getOnsiteMenSharedService() {
		return onsiteMenSharedService;
	}

	public void setOnsiteMenSharedService(int onsiteMenSharedService) {
		this.onsiteMenSharedService = onsiteMenSharedService;
	}

	public int getOffshoreMenSharedService() {
		return offshoreMenSharedService;
	}

	public void setOffshoreMenSharedService(int offshoreMenSharedService) {
		this.offshoreMenSharedService = offshoreMenSharedService;
	}

	public int getOnsiteWomenSharedService() {
		return onsiteWomenSharedService;
	}

	public void setOnsiteWomenSharedService(int onsiteWomenSharedService) {
		this.onsiteWomenSharedService = onsiteWomenSharedService;
	}

	public int getOffshoreWomenSharedService() {
		return offshoreWomenSharedService;
	}

	public void setOffshoreWomenSharedService(int offshoreWomenSharedService) {
		this.offshoreWomenSharedService = offshoreWomenSharedService;
	}

	public int getOnsiteMenSupplyChain() {
		return onsiteMenSupplyChain;
	}

	public void setOnsiteMenSupplyChain(int onsiteMenSupplyChain) {
		this.onsiteMenSupplyChain = onsiteMenSupplyChain;
	}

	public int getOffshoreMenSupplyChain() {
		return offshoreMenSupplyChain;
	}

	public void setOffshoreMenSupplyChain(int offshoreMenSupplyChain) {
		this.offshoreMenSupplyChain = offshoreMenSupplyChain;
	}

	public int getOnsiteWomenSupplyChain() {
		return onsiteWomenSupplyChain;
	}

	public void setOnsiteWomenSupplyChain(int onsiteWomenSupplyChain) {
		this.onsiteWomenSupplyChain = onsiteWomenSupplyChain;
	}

	public int getOffshoreWomenSupplyChain() {
		return offshoreWomenSupplyChain;
	}

	public void setOffshoreWomenSupplyChain(int offshoreWomenSupplyChain) {
		this.offshoreWomenSupplyChain = offshoreWomenSupplyChain;
	}

	public int getOnsiteMenEnterpriseApps() {
		return onsiteMenEnterpriseApps;
	}

	public void setOnsiteMenEnterpriseApps(int onsiteMenEnterpriseApps) {
		this.onsiteMenEnterpriseApps = onsiteMenEnterpriseApps;
	}

	public int getOffshoreMenEnterpriseApps() {
		return offshoreMenEnterpriseApps;
	}

	public void setOffshoreMenEnterpriseApps(int offshoreMenEnterpriseApps) {
		this.offshoreMenEnterpriseApps = offshoreMenEnterpriseApps;
	}

	public int getOnsiteWomenEnterpriseApps() {
		return onsiteWomenEnterpriseApps;
	}

	public void setOnsiteWomenEnterpriseApps(int onsiteWomenEnterpriseApps) {
		this.onsiteWomenEnterpriseApps = onsiteWomenEnterpriseApps;
	}

	public int getOffshoreWomenEnterpriseApps() {
		return offshoreWomenEnterpriseApps;
	}

	public void setOffshoreWomenEnterpriseApps(int offshoreWomenEnterpriseApps) {
		this.offshoreWomenEnterpriseApps = offshoreWomenEnterpriseApps;
	}

	public int getOnsiteMenGFS() {
		return onsiteMenGFS;
	}

	public void setOnsiteMenGFS(int onsiteMenGFS) {
		this.onsiteMenGFS = onsiteMenGFS;
	}

	public int getOffshoreMenGFS() {
		return offshoreMenGFS;
	}

	public void setOffshoreMenGFS(int offshoreMenGFS) {
		this.offshoreMenGFS = offshoreMenGFS;
	}

	public int getOnsiteWomenGFS() {
		return onsiteWomenGFS;
	}

	public void setOnsiteWomenGFS(int onsiteWomenGFS) {
		this.onsiteWomenGFS = onsiteWomenGFS;
	}

	public int getOffshoreWomenGFS() {
		return offshoreWomenGFS;
	}

	public void setOffshoreWomenGFS(int offshoreWomenGFS) {
		this.offshoreWomenGFS = offshoreWomenGFS;
	}

	public int getOnsiteMenPerformance() {
		return onsiteMenPerformance;
	}

	public void setOnsiteMenPerformance(int onsiteMenPerformance) {
		this.onsiteMenPerformance = onsiteMenPerformance;
	}

	public int getOffshoreMenPerformance() {
		return offshoreMenPerformance;
	}

	public void setOffshoreMenPerformance(int offshoreMenPerformance) {
		this.offshoreMenPerformance = offshoreMenPerformance;
	}

	public int getOnsiteWomenPerformance() {
		return onsiteWomenPerformance;
	}

	public void setOnsiteWomenPerformance(int onsiteWomenPerformance) {
		this.onsiteWomenPerformance = onsiteWomenPerformance;
	}

	public int getOffshoreWomenPerformance() {
		return offshoreWomenPerformance;
	}

	public void setOffshoreWomenPerformance(int offshoreWomenPerformance) {
		this.offshoreWomenPerformance = offshoreWomenPerformance;
	}

	public int getOnsiteMenStores() {
		return onsiteMenStores;
	}

	public void setOnsiteMenStores(int onsiteMenStores) {
		this.onsiteMenStores = onsiteMenStores;
	}

	public int getOffshoreMenStores() {
		return offshoreMenStores;
	}

	public void setOffshoreMenStores(int offshoreMenStores) {
		this.offshoreMenStores = offshoreMenStores;
	}

	public int getOnsiteWomenStores() {
		return onsiteWomenStores;
	}

	public void setOnsiteWomenStores(int onsiteWomenStores) {
		this.onsiteWomenStores = onsiteWomenStores;
	}

	public int getOffshoreWomenStores() {
		return offshoreWomenStores;
	}

	public void setOffshoreWomenStores(int offshoreWomenStores) {
		this.offshoreWomenStores = offshoreWomenStores;
	}

	public int getOnsiteMenSAPAT() {
		return onsiteMenSAPAT;
	}

	public void setOnsiteMenSAPAT(int onsiteMenSAPAT) {
		this.onsiteMenSAPAT = onsiteMenSAPAT;
	}

	public int getOffshoreMenSAPAT() {
		return offshoreMenSAPAT;
	}

	public void setOffshoreMenSAPAT(int offshoreMenSAPAT) {
		this.offshoreMenSAPAT = offshoreMenSAPAT;
	}

	public int getOnsiteWomenSAPAT() {
		return onsiteWomenSAPAT;
	}

	public void setOnsiteWomenSAPAT(int onsiteWomenSAPAT) {
		this.onsiteWomenSAPAT = onsiteWomenSAPAT;
	}

	public int getOffshoreWomenSAPAT() {
		return offshoreWomenSAPAT;
	}

	public void setOffshoreWomenSAPAT(int offshoreWomenSAPAT) {
		this.offshoreWomenSAPAT = offshoreWomenSAPAT;
	}

	public int getOnsiteMenDigital() {
		return onsiteMenDigital;
	}

	public void setOnsiteMenDigital(int onsiteMenDigital) {
		this.onsiteMenDigital = onsiteMenDigital;
	}

	public int getOffshoreMenDigital() {
		return offshoreMenDigital;
	}

	public void setOffshoreMenDigital(int offshoreMenDigital) {
		this.offshoreMenDigital = offshoreMenDigital;
	}

	public int getOnsiteWomenDigital() {
		return onsiteWomenDigital;
	}

	public void setOnsiteWomenDigital(int onsiteWomenDigital) {
		this.onsiteWomenDigital = onsiteWomenDigital;
	}

	public int getOffshoreWomenDigital() {
		return offshoreWomenDigital;
	}

	public void setOffshoreWomenDigital(int offshoreWomenDigital) {
		this.offshoreWomenDigital = offshoreWomenDigital;
	}

	public int getOnsiteMenNonProdServices() {
		return onsiteMenNonProdServices;
	}

	public void setOnsiteMenNonProdServices(int onsiteMenNonProdServices) {
		this.onsiteMenNonProdServices = onsiteMenNonProdServices;
	}

	public int getOffshoreMenNonProdServices() {
		return offshoreMenNonProdServices;
	}

	public void setOffshoreMenNonProdServices(int offshoreMenNonProdServices) {
		this.offshoreMenNonProdServices = offshoreMenNonProdServices;
	}

	public int getOnsiteWomenNonProdServices() {
		return onsiteWomenNonProdServices;
	}

	public void setOnsiteWomenNonProdServices(int onsiteWomenNonProdServices) {
		this.onsiteWomenNonProdServices = onsiteWomenNonProdServices;
	}

	public int getOffshoreWomenNonProdServices() {
		return offshoreWomenNonProdServices;
	}

	public void setOffshoreWomenNonProdServices(int offshoreWomenNonProdServices) {
		this.offshoreWomenNonProdServices = offshoreWomenNonProdServices;
	}

	public int getOnsiteMenOthers() {
		return onsiteMenOthers;
	}

	public void setOnsiteMenOthers(int onsiteMenOthers) {
		this.onsiteMenOthers = onsiteMenOthers;
	}

	public int getOffshoreMenOthers() {
		return offshoreMenOthers;
	}

	public void setOffshoreMenOthers(int offshoreMenOthers) {
		this.offshoreMenOthers = offshoreMenOthers;
	}

	public int getOnsiteWomenOthers() {
		return onsiteWomenOthers;
	}

	public void setOnsiteWomenOthers(int onsiteWomenOthers) {
		this.onsiteWomenOthers = onsiteWomenOthers;
	}

	public int getOffshoreWomenOthers() {
		return offshoreWomenOthers;
	}

	public void setOffshoreWomenOthers(int offshoreWomenOthers) {
		this.offshoreWomenOthers = offshoreWomenOthers;
	}

	public String getLatestDate() {
		return latestDate;
	}

	public void setLatestDate(String latestDate) {
		this.latestDate = latestDate;
	}

}
