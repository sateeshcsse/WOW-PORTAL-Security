package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.gson.annotations.Expose;

@Entity
@Table(name = "vmdata")
@JsonIgnoreProperties(ignoreUnknown = true)
public class VMData {

	@Id
	@GenericGenerator(name="increment", strategy = "identity")
    @Column(name = "id")
	private int id;
	
	@Column(name = "machine_name" , unique=true)
	private String machine_name;
	
	@Column(name = "machine_type")
	private String machine_type;
	
	@Column(name = "project_owner")
	private String project_owner;
	
	@Column(name = "portfolio")
	private String portfolio;
	
	@Column(name = "project_name")
	private String project_name;
	
	@Column(name = "owner")
	private String owner;
	
	@Column(name = "citrix_id")
	private String citrix_id;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "ram")
	private String ram;
	
	@Column(name = "os")
	private String os;
	
	@Column(name = "processor")
	private String processor;
	
	@Column(name = "storage_size")
	private String storage_size;
	
	@Column(name = "java_version")
	private String java_version;
	
	@Column(name = "applications")
	private String applications;
	
	@Column(name = "current_status")
	private String current_status;
	
	@Column(name = "assigned_from")
	private String assigned_from;
	
	@Column(name = "assigned_till")
	private String assigned_till;

	public String getStorage_size() {
		return storage_size;
	}

	public void setStorage_size(String storage_size) {
		this.storage_size = storage_size;
	}

	public String getCurrent_status() {
		return current_status;
	}

	public void setCurrent_status(String current_status) {
		this.current_status = current_status;
	}

	public String getAssigned_from() {
		return assigned_from;
	}

	public void setAssigned_from(String assigned_from) {
		this.assigned_from = assigned_from;
	}

	public String getAssigned_till() {
		return assigned_till;
	}

	public void setAssigned_till(String assigned_till) {
		this.assigned_till = assigned_till;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMachine_name() {
		return machine_name;
	}

	public void setMachine_name(String machine_name) {
		this.machine_name = machine_name;
	}

	public String getMachine_type() {
		return machine_type;
	}

	public void setMachine_type(String machine_type) {
		this.machine_type = machine_type;
	}

	public String getProject_owner() {
		return project_owner;
	}

	public void setProject_owner(String project_owner) {
		this.project_owner = project_owner;
	}

	public String getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getCitrix_id() {
		return citrix_id;
	}

	public void setCitrix_id(String citrix_id) {
		this.citrix_id = citrix_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getProcessor() {
		return processor;
	}

	public void setProcessor(String processor) {
		this.processor = processor;
	}

	public String getJava_version() {
		return java_version;
	}

	public void setJava_version(String java_version) {
		this.java_version = java_version;
	}

	public String getApplications() {
		return applications;
	}

	public void setApplications(String applications) {
		this.applications = applications;
	}

	@Override
	public String toString() {
		return "VMData [id=" + id + ", machine_name=" + machine_name + ", machine_type=" + machine_type
				+ ", project_owner=" + project_owner + ", portfolio=" + portfolio + ", project_name=" + project_name
				+ ", owner=" + owner + ", citrix_id=" + citrix_id + ", email=" + email + ", ram=" + ram + ", os=" + os
				+ ", processor=" + processor + ", storage_size=" + storage_size + ", java_version=" + java_version
				+ ", applications=" + applications + ", current_status=" + current_status + ", assigned_from="
				+ assigned_from + ", assigned_till=" + assigned_till + "]";
	}
	
		
}
