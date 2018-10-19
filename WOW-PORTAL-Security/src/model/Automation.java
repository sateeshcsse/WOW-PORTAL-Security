package model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "automation")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Automation {
	
	

	@Id
	@GenericGenerator(name="increment", strategy = "identity")
    @Column(name = "id")
	private int id;
	
	@Column(name = "portfolio")
	private String portfolio;
	
	@Column(name = "project")
	private String project;
	
	@Column(name = "regression_pack")
	private String regression_pack;
	
	@Column(name = "scope")
	private int scope;
	
	@Column(name = "feasiblity")
	private int feasiblity;
	
	@Column(name = "pos_completed")
	private int pos_completed;
	
	@Column(name = "inprogress")
	private int inprogress;
	
}
