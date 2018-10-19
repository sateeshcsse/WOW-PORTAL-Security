package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "coqdatatable")
@JsonIgnoreProperties(ignoreUnknown = true)
public class TableData {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "uniqueId")
	private int id;

	@Column(name = "portfolio")
	private String portfolio = null;
	@Column(name = "project")
	private String project = null;
	@Column(name = "tcsQAPrevention")
	private String tcsQAPrevention = "0.00";
	@Column(name = "tcsQAAppraisal")
	private String tcsQAAppraisal = "0.00";
	@Column(name = "othersPrevention")
	private String othersPrevention = "0.00";
	@Column(name = "othersAppraisal")
	private String othersAppraisal = "0.00";
	@Column(name = "tcsQAInternalFailure")
	private String tcsQAInternalFailure = "0.00";
	@Column(name = "othersInternalFailure")
	private String othersInternalFailure = "0.00";
	@Column(name = "tcsQAExternalFailure")
	private String tcsQAExternalFailure = "0.00";
	@Column(name = "othersExternalFailure")
	private String othersExternalFailure = "0.00";
	@Column(name = "tcsQAPerformance")
	private String tcsQAPerformance = null;
	@Column(name = "othersUATPrevention")
	private String othersUATPrevention = "0.00";
	@Column(name = "othersUATAppraisal")
	private String othersUATAppraisal = "0.00";
	@Column(name = "othersUATInternalFailure")
	private String othersUATInternalFailure = "0.00";
	@Column(name = "othersUATExternalFailure")
	private String othersUATExternalFailure = "0.00";
	@Column(name = "othersPerformance")
	private String othersPerformance = null;
	@Column(name = "tcsQAUATPrevention")
	private String tcsQAUATPrevention = "0.00";
	@Column(name = "tcsQAUATAppraisal")
	private String tcsQAUATAppraisal = "0.00";
	@Column(name = "tcsQAUATInternalFailure")
	private String tcsQAUATInternalFailure = "0.00";
	@Column(name = "tcsQAUATExternalFailure")
	private String tcsQAUATExternalFailure = "0.00";
	@Column(name = "tcsQAUATPerformance")
	private String tcsQAUATPerformance = null;
	@Column(name = "othersUATPerformance")
	private String othersUATPerformance = null;
	@Column(name = "nonTestingBAPreventionCost")
	private String nonTestingBAPreventionCost = "0.00";
	@Column(name = "nonTestingBAAppraisalCost")
	private String nonTestingBAAppraisalCost = "0.00";
	@Column(name = "nonTestingBAInternalFailure")
	private String nonTestingBAInternalFailure = "0.00";
	@Column(name = "nonTestingBAExternalFailure")
	private String nonTestingBAExternalFailure = "0.00";
	@Column(name = "nonTestingBAPreformanceCost")
	private String nonTestingBAPreformanceCost = "0.00";
	@Column(name = "nonTestingDevelopmentPreventionCost")
	private String nonTestingDevelopmentPreventionCost = "0.00";
	@Column(name = "nonTestingDevelopmentAppraisalCost")
	private String nonTestingDevelopmentAppraisalCost = "0.00";
	@Column(name = "nonTestingDevelopmentInternalFailure")
	private String nonTestingDevelopmentInternalFailure = "0.00";
	@Column(name = "nonTestingDevelopmentExternalFailure")
	private String nonTestingDevelopmentExternalFailure = "0.00";
	@Column(name = "nonTestingDevelopmentPreformanceCost")
	private String nonTestingDevelopmentPreformanceCost = "0.00";
	@Column(name = "nonTestingProjectPreventionCost")
	private String nonTestingProjectPreventionCost = "0.00";
	@Column(name = "nonTestingProjectAppraisalCost")
	private String nonTestingProjectAppraisalCost = "0.00";
	@Column(name = "nonTestingProjectInternalFailure")
	private String nonTestingProjectInternalFailure = "0.00";
	@Column(name = "nonTestingProjectExternalFailure")
	private String nonTestingProjectExternalFailure = "0.00";
	@Column(name = "nonTestingProjectPreformanceCost")
	private String nonTestingProjectPreformanceCost = "0.00";
	@Column(name = "nonTestingOthersPreventionCost")
	private String nonTestingOthersPreventionCost = "0.00";
	@Column(name = "nonTestingOthersAppraisalCost")
	private String nonTestingOthersAppraisalCost = "0.00";
	@Column(name = "nonTestingOthersInternalFailure")
	private String nonTestingOthersInternalFailure = "0.00";
	@Column(name = "nonTestingOthersExternalFailure")
	private String nonTestingOthersExternalFailure = "0.00";
	@Column(name = "nonTestingOthersPreformanceCost")
	private String nonTestingOthersPreformanceCost = "0.00";
	@Column(name = "nonTestingOthersTotalCost")
	private String nonTestingOthersTotalCost = "0.00";
	@Column(name = "nonTestingProjectTotalCost")
	private String nonTestingProjectTotalCost = "0.00";
	@Column(name = "nonTestingDevelopmentTotalCost")
	private String nonTestingDevelopmentTotalCost = "0.00";
	@Column(name = "nonTestingBATotalCost")
	private String nonTestingBATotalCost = "0.00";
	@Column(name = "testingTotal")
	private String testingTotal = "0.00";
	@Column(name = "nontestingTotal")
	private String nontestingTotal = "0.00";
	@Column(name = "tcsQATotal")
	private String tcsQATotal = "0.00";
	@Column(name = "othersTotal")
	private String othersTotal = "0.00";
	@Column(name = "tcsQAUATTotal")
	private String tcsQAUATTotal = "0.00";
	@Column(name = "othersUATTotal")
	private String othersUATTotal = "0.00";
	@Column(name = "lastUpdated")
	private String lastUpdated = "0.00";
	@Column(name = "testRelatedCost")
	private String testRelatedCost = "0.00";
	@Column(name = "testRelatedComments")
	private String testRelatedComments = null;
	@Column(name = "nontestRelatedCost")
	private String nontestRelatedCost = "0.00";
	@Column(name = "nontestRelatedComments")
	private String nontestRelatedComments = null;
	@Column(name = "overAllCost")
	private String overAllCost = "0.00";
	@Column(name = "overAllCostComments")
	private String overAllCostComments = null;
	@Column(name = "qaPercent")
	private String qaPercent = "0.00";
	@Column(name = "othersPercent")
	private String othersPercent = "0.00";
	@Column(name = "qaUATPercent")
	private String qaUATPercent = "0.00";
	@Column(name = "othersUATPercent")
	private String othersUATPercent = "0.00";
	@Column(name = "nonTestBAPercent")
	private String nonTestBAPercent = "0.00";
	@Column(name = "nonTestDevPercent")
	private String nonTestDevPercent = "0.00";
	@Column(name = "nonTestProjPercent")
	private String nonTestProjPercent = "0.00";
	@Column(name = "nonTestOthersPercent")
	private String nonTestOthersPercent = "0.00";
	@Column(name = "nonTestingPercent")
	private String nonTestingPercent = "0.00";
	@Column(name = "testingTotalPercent")
	private String testingTotalPercent = "0.00";

	public String getNonTestingPercent() {
		return nonTestingPercent;
	}

	public void setNonTestingPercent(String nonTestingPercent) {
		this.nonTestingPercent = nonTestingPercent;
	}

	public String getTestingTotalPercent() {
		return testingTotalPercent;
	}

	public void setTestingTotalPercent(String testingTotalPercent) {
		this.testingTotalPercent = testingTotalPercent;
	}

	public String getQaPercent() {
		return qaPercent;
	}

	public void setQaPercent(String qaPercent) {
		this.qaPercent = qaPercent;
	}

	public String getOthersPercent() {
		return othersPercent;
	}

	public void setOthersPercent(String othersPercent) {
		this.othersPercent = othersPercent;
	}

	public String getQaUATPercent() {
		return qaUATPercent;
	}

	public void setQaUATPercent(String qaUATPercent) {
		this.qaUATPercent = qaUATPercent;
	}

	public String getOthersUATPercent() {
		return othersUATPercent;
	}

	public void setOthersUATPercent(String othersUATPercent) {
		this.othersUATPercent = othersUATPercent;
	}

	public String getNonTestBAPercent() {
		return nonTestBAPercent;
	}

	public void setNonTestBAPercent(String nonTestBAPercent) {
		this.nonTestBAPercent = nonTestBAPercent;
	}

	public String getNonTestDevPercent() {
		return nonTestDevPercent;
	}

	public void setNonTestDevPercent(String nonTestDevPercent) {
		this.nonTestDevPercent = nonTestDevPercent;
	}

	public String getNonTestProjPercent() {
		return nonTestProjPercent;
	}

	public void setNonTestProjPercent(String nonTestProjPercent) {
		this.nonTestProjPercent = nonTestProjPercent;
	}

	public String getNonTestOthersPercent() {
		return nonTestOthersPercent;
	}

	public void setNonTestOthersPercent(String nonTestOthersPercent) {
		this.nonTestOthersPercent = nonTestOthersPercent;
	}

	public String getOverAllCost() {
		return overAllCost;
	}

	public void setOverAllCost(String overAllCost) {
		this.overAllCost = overAllCost;
	}

	public String getOverAllCostComments() {
		return overAllCostComments;
	}

	public void setOverAllCostComments(String overAllCostComments) {
		this.overAllCostComments = overAllCostComments;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}

	public String getTestRelatedCost() {
		return testRelatedCost;
	}

	public void setTestRelatedCost(String testRelatedCost) {
		this.testRelatedCost = testRelatedCost;
	}

	public String getTestRelatedComments() {
		return testRelatedComments;
	}

	public void setTestRelatedComments(String testRelatedComments) {
		this.testRelatedComments = testRelatedComments;
	}

	public String getNontestRelatedCost() {
		return nontestRelatedCost;
	}

	public void setNontestRelatedCost(String nontestRelatedCost) {
		this.nontestRelatedCost = nontestRelatedCost;
	}

	public String getNontestRelatedComments() {
		return nontestRelatedComments;
	}

	public void setNontestRelatedComments(String nontestRelatedComments) {
		this.nontestRelatedComments = nontestRelatedComments;
	}

	public String getTcsQATotal() {
		return tcsQATotal;
	}

	public void setTcsQATotal(String tcsQATotal) {
		this.tcsQATotal = tcsQATotal;
	}

	public String getOthersTotal() {
		return othersTotal;
	}

	public void setOthersTotal(String othersTotal) {
		this.othersTotal = othersTotal;
	}

	public String getTcsQAUATTotal() {
		return tcsQAUATTotal;
	}

	public void setTcsQAUATTotal(String tcsQAUATTotal) {
		this.tcsQAUATTotal = tcsQAUATTotal;
	}

	public String getOthersUATTotal() {
		return othersUATTotal;
	}

	public void setOthersUATTotal(String othersUATTotal) {
		this.othersUATTotal = othersUATTotal;
	}

	public String getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(String lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	@Override
	public String toString() {
		return "TableData [portfolio=" + portfolio + ", project=" + project
				+ ", tcsQAPrevention=" + tcsQAPrevention + ", tcsQAAppraisal="
				+ tcsQAAppraisal + ", othersPrevention=" + othersPrevention
				+ ", othersAppraisal=" + othersAppraisal
				+ ", tcsQAInternalFailure=" + tcsQAInternalFailure
				+ ", othersInternalFailure=" + othersInternalFailure
				+ ", tcsQAExternalFailure=" + tcsQAExternalFailure
				+ ", othersExternalFailure=" + othersExternalFailure
				+ ", tcsQAPerformance=" + tcsQAPerformance
				+ ", othersUATPrevention=" + othersUATPrevention
				+ ", othersUATAppraisal=" + othersUATAppraisal
				+ ", othersUATInternalFailure=" + othersUATInternalFailure
				+ ", othersUATExternalFailure=" + othersUATExternalFailure
				+ ", othersPerformance=" + othersPerformance
				+ ", tcsQAUATPrevention=" + tcsQAUATPrevention
				+ ", tcsQAUATAppraisal=" + tcsQAUATAppraisal
				+ ", tcsQAUATInternalFailure=" + tcsQAUATInternalFailure
				+ ", tcsQAUATExternalFailure=" + tcsQAUATExternalFailure
				+ ", tcsQAUATPerformance=" + tcsQAUATPerformance
				+ ", othersUATPerformance=" + othersUATPerformance
				+ ", nonTestingBAPreventionCost=" + nonTestingBAPreventionCost
				+ ", nonTestingBAAppraisalCost=" + nonTestingBAAppraisalCost
				+ ", nonTestingBAInternalFailure="
				+ nonTestingBAInternalFailure
				+ ", nonTestingBAExternalFailure="
				+ nonTestingBAExternalFailure
				+ ", nonTestingBAPreformanceCost="
				+ nonTestingBAPreformanceCost
				+ ", nonTestingDevelopmentPreventionCost="
				+ nonTestingDevelopmentPreventionCost
				+ ", nonTestingDevelopmentAppraisalCost="
				+ nonTestingDevelopmentAppraisalCost
				+ ", nonTestingDevelopmentInternalFailure="
				+ nonTestingDevelopmentInternalFailure
				+ ", nonTestingDevelopmentExternalFailure="
				+ nonTestingDevelopmentExternalFailure
				+ ", nonTestingDevelopmentPreformanceCost="
				+ nonTestingDevelopmentPreformanceCost
				+ ", nonTestingProjectPreventionCost="
				+ nonTestingProjectPreventionCost
				+ ", nonTestingProjectAppraisalCost="
				+ nonTestingProjectAppraisalCost
				+ ", nonTestingProjectInternalFailure="
				+ nonTestingProjectInternalFailure
				+ ", nonTestingProjectExternalFailure="
				+ nonTestingProjectExternalFailure
				+ ", nonTestingProjectPreformanceCost="
				+ nonTestingProjectPreformanceCost
				+ ", nonTestingOthersPreventionCost="
				+ nonTestingOthersPreventionCost
				+ ", nonTestingOthersAppraisalCost="
				+ nonTestingOthersAppraisalCost
				+ ", nonTestingOthersInternalFailure="
				+ nonTestingOthersInternalFailure
				+ ", nonTestingOthersExternalFailure="
				+ nonTestingOthersExternalFailure
				+ ", nonTestingOthersPreformanceCost="
				+ nonTestingOthersPreformanceCost
				+ ", nonTestingOthersTotalCost=" + nonTestingOthersTotalCost
				+ ", nonTestingProjectTotalCost=" + nonTestingProjectTotalCost
				+ ", nonTestingDevelopmentTotalCost="
				+ nonTestingDevelopmentTotalCost + ", nonTestingBATotalCost="
				+ nonTestingBATotalCost + ", testingTotal=" + testingTotal
				+ ", nontestingTotal=" + nontestingTotal + "]";
	}

	public String getNonTestingDevelopmentPreventionCost() {
		return nonTestingDevelopmentPreventionCost;
	}

	public void setNonTestingDevelopmentPreventionCost(
			String nonTestingDevelopmentPreventionCost) {
		this.nonTestingDevelopmentPreventionCost = nonTestingDevelopmentPreventionCost;
	}

	public String getNonTestingDevelopmentAppraisalCost() {
		return nonTestingDevelopmentAppraisalCost;
	}

	public void setNonTestingDevelopmentAppraisalCost(
			String nonTestingDevelopmentAppraisalCost) {
		this.nonTestingDevelopmentAppraisalCost = nonTestingDevelopmentAppraisalCost;
	}

	public String getNonTestingDevelopmentInternalFailure() {
		return nonTestingDevelopmentInternalFailure;
	}

	public void setNonTestingDevelopmentInternalFailure(
			String nonTestingDevelopmentInternalFailure) {
		this.nonTestingDevelopmentInternalFailure = nonTestingDevelopmentInternalFailure;
	}

	public String getNonTestingDevelopmentExternalFailure() {
		return nonTestingDevelopmentExternalFailure;
	}

	public void setNonTestingDevelopmentExternalFailure(
			String nonTestingDevelopmentExternalFailure) {
		this.nonTestingDevelopmentExternalFailure = nonTestingDevelopmentExternalFailure;
	}

	public String getNonTestingDevelopmentPreformanceCost() {
		return nonTestingDevelopmentPreformanceCost;
	}

	public void setNonTestingDevelopmentPreformanceCost(
			String nonTestingDevelopmentPreformanceCost) {
		this.nonTestingDevelopmentPreformanceCost = nonTestingDevelopmentPreformanceCost;
	}

	public String getNonTestingProjectPreventionCost() {
		return nonTestingProjectPreventionCost;
	}

	public void setNonTestingProjectPreventionCost(
			String nonTestingProjectPreventionCost) {
		this.nonTestingProjectPreventionCost = nonTestingProjectPreventionCost;
	}

	public String getNonTestingProjectAppraisalCost() {
		return nonTestingProjectAppraisalCost;
	}

	public void setNonTestingProjectAppraisalCost(
			String nonTestingProjectAppraisalCost) {
		this.nonTestingProjectAppraisalCost = nonTestingProjectAppraisalCost;
	}

	public String getNonTestingProjectInternalFailure() {
		return nonTestingProjectInternalFailure;
	}

	public void setNonTestingProjectInternalFailure(
			String nonTestingProjectInternalFailure) {
		this.nonTestingProjectInternalFailure = nonTestingProjectInternalFailure;
	}

	public String getNonTestingProjectExternalFailure() {
		return nonTestingProjectExternalFailure;
	}

	public void setNonTestingProjectExternalFailure(
			String nonTestingProjectExternalFailure) {
		this.nonTestingProjectExternalFailure = nonTestingProjectExternalFailure;
	}

	public String getNonTestingProjectPreformanceCost() {
		return nonTestingProjectPreformanceCost;
	}

	public void setNonTestingProjectPreformanceCost(
			String nonTestingProjectPreformanceCost) {
		this.nonTestingProjectPreformanceCost = nonTestingProjectPreformanceCost;
	}

	public String getNonTestingOthersPreventionCost() {
		return nonTestingOthersPreventionCost;
	}

	public void setNonTestingOthersPreventionCost(
			String nonTestingOthersPreventionCost) {
		this.nonTestingOthersPreventionCost = nonTestingOthersPreventionCost;
	}

	public String getNonTestingOthersAppraisalCost() {
		return nonTestingOthersAppraisalCost;
	}

	public void setNonTestingOthersAppraisalCost(
			String nonTestingOthersAppraisalCost) {
		this.nonTestingOthersAppraisalCost = nonTestingOthersAppraisalCost;
	}

	public String getNonTestingOthersInternalFailure() {
		return nonTestingOthersInternalFailure;
	}

	public void setNonTestingOthersInternalFailure(
			String nonTestingOthersInternalFailure) {
		this.nonTestingOthersInternalFailure = nonTestingOthersInternalFailure;
	}

	public String getNonTestingOthersExternalFailure() {
		return nonTestingOthersExternalFailure;
	}

	public void setNonTestingOthersExternalFailure(
			String nonTestingOthersExternalFailure) {
		this.nonTestingOthersExternalFailure = nonTestingOthersExternalFailure;
	}

	public String getNonTestingOthersPreformanceCost() {
		return nonTestingOthersPreformanceCost;
	}

	public void setNonTestingOthersPreformanceCost(
			String nonTestingOthersPreformanceCost) {
		this.nonTestingOthersPreformanceCost = nonTestingOthersPreformanceCost;
	}

	public String getNonTestingOthersTotalCost() {
		return nonTestingOthersTotalCost;
	}

	public void setNonTestingOthersTotalCost(String nonTestingOthersTotalCost) {
		this.nonTestingOthersTotalCost = nonTestingOthersTotalCost;
	}

	public String getNonTestingProjectTotalCost() {
		return nonTestingProjectTotalCost;
	}

	public void setNonTestingProjectTotalCost(String nonTestingProjectTotalCost) {
		this.nonTestingProjectTotalCost = nonTestingProjectTotalCost;
	}

	public String getNonTestingDevelopmentTotalCost() {
		return nonTestingDevelopmentTotalCost;
	}

	public void setNonTestingDevelopmentTotalCost(
			String nonTestingDevelopmentTotalCost) {
		this.nonTestingDevelopmentTotalCost = nonTestingDevelopmentTotalCost;
	}

	public String getNonTestingBATotalCost() {
		return nonTestingBATotalCost;
	}

	public void setNonTestingBATotalCost(String nonTestingBATotalCost) {
		this.nonTestingBATotalCost = nonTestingBATotalCost;
	}

	public String getNontestingTotal() {
		return nontestingTotal;
	}

	public void setNontestingTotal(String nontestingTotal) {
		this.nontestingTotal = nontestingTotal;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getNonTestingBAPreventionCost() {
		return nonTestingBAPreventionCost;
	}

	public void setNonTestingBAPreventionCost(String nonTestingBAPreventionCost) {
		this.nonTestingBAPreventionCost = nonTestingBAPreventionCost;
	}

	public String getNonTestingBAAppraisalCost() {
		return nonTestingBAAppraisalCost;
	}

	public void setNonTestingBAAppraisalCost(String nonTestingBAAppraisalCost) {
		this.nonTestingBAAppraisalCost = nonTestingBAAppraisalCost;
	}

	public String getNonTestingBAInternalFailure() {
		return nonTestingBAInternalFailure;
	}

	public void setNonTestingBAInternalFailure(
			String nonTestingBAInternalFailure) {
		this.nonTestingBAInternalFailure = nonTestingBAInternalFailure;
	}

	public String getNonTestingBAExternalFailure() {
		return nonTestingBAExternalFailure;
	}

	public void setNonTestingBAExternalFailure(
			String nonTestingBAExternalFailure) {
		this.nonTestingBAExternalFailure = nonTestingBAExternalFailure;
	}

	public String getNonTestingBAPreformanceCost() {
		return nonTestingBAPreformanceCost;
	}

	public void setNonTestingBAPreformanceCost(
			String nonTestingBAPreformanceCost) {
		this.nonTestingBAPreformanceCost = nonTestingBAPreformanceCost;
	}

	public String getTestingTotal() {
		return testingTotal;
	}

	public void setTestingTotal(String testingTotal) {
		this.testingTotal = testingTotal;
	}

	public String getOthersUATPrevention() {
		return othersUATPrevention;
	}

	public void setOthersUATPrevention(String othersUATPrevention) {
		this.othersUATPrevention = othersUATPrevention;
	}

	public String getOthersUATAppraisal() {
		return othersUATAppraisal;
	}

	public void setOthersUATAppraisal(String othersUATAppraisal) {
		this.othersUATAppraisal = othersUATAppraisal;
	}

	public String getOthersUATInternalFailure() {
		return othersUATInternalFailure;
	}

	public void setOthersUATInternalFailure(String othersUATInternalFailure) {
		this.othersUATInternalFailure = othersUATInternalFailure;
	}

	public String getOthersUATExternalFailure() {
		return othersUATExternalFailure;
	}

	public void setOthersUATExternalFailure(String othersUATExternalFailure) {
		this.othersUATExternalFailure = othersUATExternalFailure;
	}

	public String getTcsQAUATPrevention() {
		return tcsQAUATPrevention;
	}

	public void setTcsQAUATPrevention(String tcsQAUATPrevention) {
		this.tcsQAUATPrevention = tcsQAUATPrevention;
	}

	public String getTcsQAUATAppraisal() {
		return tcsQAUATAppraisal;
	}

	public void setTcsQAUATAppraisal(String tcsQAUATAppraisal) {
		this.tcsQAUATAppraisal = tcsQAUATAppraisal;
	}

	public String getTcsQAUATInternalFailure() {
		return tcsQAUATInternalFailure;
	}

	public void setTcsQAUATInternalFailure(String tcsQAUATInternalFailure) {
		this.tcsQAUATInternalFailure = tcsQAUATInternalFailure;
	}

	public String getTcsQAUATExternalFailure() {
		return tcsQAUATExternalFailure;
	}

	public void setTcsQAUATExternalFailure(String tcsQAUATExternalFailure) {
		this.tcsQAUATExternalFailure = tcsQAUATExternalFailure;
	}

	public String getTcsQAUATPerformance() {
		return tcsQAUATPerformance;
	}

	public void setTcsQAUATPerformance(String tcsQAUATPerformance) {
		this.tcsQAUATPerformance = tcsQAUATPerformance;
	}

	public String getOthersUATPerformance() {
		return othersUATPerformance;
	}

	public void setOthersUATPerformance(String othersUATPerformance) {
		this.othersUATPerformance = othersUATPerformance;
	}

	public String getTcsQAPrevention() {
		return tcsQAPrevention;
	}

	public void setTcsQAPrevention(String tcsQAPrevention) {
		this.tcsQAPrevention = tcsQAPrevention;
	}

	public String getTcsQAAppraisal() {
		return tcsQAAppraisal;
	}

	public void setTcsQAAppraisal(String tcsQAAppraisal) {
		this.tcsQAAppraisal = tcsQAAppraisal;
	}

	public String getTcsQAInternalFailure() {
		return tcsQAInternalFailure;
	}

	public void setTcsQAInternalFailure(String tcsQAInternalFailure) {
		this.tcsQAInternalFailure = tcsQAInternalFailure;
	}

	public String getTcsQAExternalFailure() {
		return tcsQAExternalFailure;
	}

	public void setTcsQAExternalFailure(String tcsQAExternalFailure) {
		this.tcsQAExternalFailure = tcsQAExternalFailure;
	}

	public String getTcsQAPerformance() {
		return tcsQAPerformance;
	}

	public void setTcsQAPerformance(String tcsQAPerformance) {
		this.tcsQAPerformance = tcsQAPerformance;
	}

	public String getOthersPrevention() {
		return othersPrevention;
	}

	public void setOthersPrevention(String othersPrevention) {
		this.othersPrevention = othersPrevention;
	}

	public String getOthersAppraisal() {
		return othersAppraisal;
	}

	public void setOthersAppraisal(String othersAppraisal) {
		this.othersAppraisal = othersAppraisal;
	}

	public String getOthersInternalFailure() {
		return othersInternalFailure;
	}

	public void setOthersInternalFailure(String othersInternalFailure) {
		this.othersInternalFailure = othersInternalFailure;
	}

	public String getOthersExternalFailure() {
		return othersExternalFailure;
	}

	public void setOthersExternalFailure(String othersExternalFailure) {
		this.othersExternalFailure = othersExternalFailure;
	}

	public String getOthersPerformance() {
		return othersPerformance;
	}

	public void setOthersPerformance(String othersPerformance) {
		this.othersPerformance = othersPerformance;
	}

}
