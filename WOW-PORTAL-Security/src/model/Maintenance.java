package model;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "wm_maintenance")
//@Table(name="wm_maintenance")
@JsonIgnoreProperties(ignoreUnknown = true)

public class Maintenance {
	 @Id
    // @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name = "store_no")
	 private String store_no;
	 
	 @Column(name = "store_version")
		private String store_version;
		
		@Column(name = "environment")
		private String environment;
				
		@Column(name = "fromtime")
		private Date fromtime;
		
		@Column(name = "totime")
		private Date totime;
		
		@Column(name = "createby")
		private Date createby;
		
		@Column(name = "createdate")
		private Date createdate;
		
		@Column(name = "updateby")
		private Date updateby;
		
		@Column(name = "updatedate")
		private Date updatedate;

		public String getStore_version() {
			return store_version;
		}

		public void setStore_version(String store_version) {
			this.store_version = store_version;
		}

		public String getEnvironment() {
			return environment;
		}

		public void setEnvironment(String environment) {
			this.environment = environment;
		}

		public String getStore_no() {
			return store_no;
		}

		public void setStore_no(String store_no) {
			this.store_no = store_no;
		}

		public Date getFromtime() {
			return fromtime;
		}

		public void setFromtime(Date fromtime) {
			this.fromtime = fromtime;
		}

		public Date getTotime() {
			return totime;
		}

		public void setTotime(Date totime) {
			this.totime = totime;
		}

		
		public Date getCreateby() {
			return createby;
		}

		public void setCreateby(Date createby) {
			this.createby = createby;
		}

		public Date getCreatedate() {
			return createdate;
		}

		public void setCreatedate(Date createdate) {
			this.createdate = createdate;
		}

		public Date getUpdateby() {
			return updateby;
		}

		public void setUpdateby(Date updateby) {
			this.updateby = updateby;
		}

		public Date getUpdatedate() {
			return updatedate;
		}

		public void setUpdatedate(Date updatedate) {
			this.updatedate = updatedate;
		}

		@Override
		public String toString() {
			return "Maintenance [store_version=" + store_version + ", environment=" + environment + ", store_no="
					+ store_no + ", fromtime=" + fromtime + ", totime=" + totime + "]";
		}

	
}
