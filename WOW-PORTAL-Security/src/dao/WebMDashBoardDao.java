package dao;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.google.gson.Gson;

import model.Maintenance;
public class WebMDashBoardDao {

	/*
	 * public Integer[] getStoresStaus() { Transaction t; try { Session session
	 * = HibernateConnection.openConnection() .openSession(); t =
	 * session.beginTransaction(); Query query = session .createSQLQuery(
	 * "select count(*) as Green from wowmain  WHERE performance <>'' and performance <>'-' and date(str_to_date(golivedate, '%d/%m/%Y'))> date(curdate())  group by (performance)"
	 * ) .addScalar("Green", StandardBasicTypes.INTEGER); List<Integer> list =
	 * query.list(); Integer[] countries = list.toArray(new
	 * Integer[list.size()]); t.commit(); session.close(); return countries; }
	 * catch (Exception e) { e.printStackTrace(); return null; } }
	 */

	public Double[] getStoresStaus() {
		BufferedReader br = null;
		Double[] status = new Double[2];
		try {
			String sCurrentLine;
			// String path="C:\\QA Portal\\Sample Files\\Stores
			// Outbound\\Files\\";
			String path = "\\\\nnorsogfde056\\share\\xcomxfer\\StoreReports\\";
			String extn = ".txt";
			String delimeter = ",";
			String fValues[];
			double smktCnt = 0.0;
			double smktTotal = 0.0;
			double nonSmktCnt = 0.0;
			double nonSmktTotal = 0.0;
			double bigWCnt = 0.0;
			double bigWTotal = 0.0;
			double dcCnt = 0.0;
			double dcTotal = 0.0;

			br = new BufferedReader(new FileReader(path.concat("SUPERS").concat(extn)));
			if (br != null) {
				br.readLine();
				while ((sCurrentLine = br.readLine()) != null) {
					smktTotal++;
					fValues = sCurrentLine.split(delimeter);
					if (fValues[1].equals("FINE"))
						smktCnt++;
				}
				br.close();
			}

			br = new BufferedReader(new FileReader(path.concat("NON_SMKT").concat(extn)));
			if (br != null) {
				br.readLine();
				while ((sCurrentLine = br.readLine()) != null) {
					nonSmktTotal++;
					fValues = sCurrentLine.split(delimeter);
					if (fValues[1].equals("FINE"))
						nonSmktCnt++;
				}
				br.close();
			}

			br = new BufferedReader(new FileReader(path.concat("DC").concat(extn)));
			if (br != null) {
				br.readLine();
				while ((sCurrentLine = br.readLine()) != null) {
					dcTotal++;
					fValues = sCurrentLine.split(delimeter);
					if (fValues[2].equals("FINE"))
						dcCnt++;
				}
				br.close();
			}

			br = new BufferedReader(new FileReader(path.concat("BIGW").concat(extn)));
			if (br != null) {
				br.readLine();
				while ((sCurrentLine = br.readLine()) != null) {
					bigWTotal++;
					fValues = sCurrentLine.split(delimeter);
					if (fValues[1].equals("OK") && fValues[2].equals("OK") && fValues[3].equals("OK")
							&& fValues[4].equals("OK"))
						bigWCnt++;
				}
				br.close();
			}

			status[0] = ((smktCnt + bigWCnt + nonSmktCnt + dcCnt) / (smktTotal + bigWTotal + nonSmktTotal + dcTotal))
					* 100;
			status[1] = 100 - status[0];
			return status;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (br != null)
					br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
				return null;
			}
		}
	}

	public Double[] getWMStoresOutBoundOverview() {
		Transaction t;
		Double[] status = new Double[2];
		boolean msgStatus = false;
		boolean filesStatus = false;
		double msgStatusCnt = 0.0;
		double msgTotal = 0.0;
		double filesStatusCnt = 0.0;
		double filesTotal = 0.0;
		try {
			Session session = HibernateConnection.openConnection().openSession();
			t = session.beginTransaction();
			Query query = session.createSQLQuery(
					"select broker,integration_server,broker_utilization,jms_broker_utilization,triggers,jms_broker,jms_queue_length from webmdashboard where status_5='LATEST' and file_message_name in ('DSOR','DPOR','WREC','DREC','SEOD','SLSY')");
			// .addScalar("Green", StandardBasicTypes.INTEGER);
			List<Object[]> list = query.list();
			msgTotal = list.size();
			// Integer[] countries = list.toArray(new Integer[list.size()]);

			for (Object[] io : list) {
				if ((!((String) io[0]).equals("FINE") && !((String) io[0]).equals("NOT APPLICABLE"))
						|| (!((String) io[1]).equals("FINE") && !((String) io[1]).equals("NOT APPLICABLE"))) {
					msgStatus = true;
					break;
				} else if (((String) io[2]).equals("ERROR")) {
					msgStatus = true;
					break;
				} else if ((Double.parseDouble((String) io[2])) > 85) {
					msgStatus = true;
					break;
				}
			}

			if (msgStatus == false) {
				for (Object[] io : list) {
					if ((!((String) io[4]).equals("FINE") && !((String) io[4]).equals("NOT APPLICABLE"))
							|| (!((String) io[5]).equals("FINE") && !((String) io[5]).equals("NOT APPLICABLE")))
						msgStatusCnt++;
					else if (((String) io[3]).equals("ERROR") || ((String) io[6]).equals("ERROR"))
						msgStatusCnt++;
					else if ((Double.parseDouble((String) io[3])) > 85 || (Double.parseDouble((String) io[6])) > 1)
						msgStatusCnt++;
				}
			}
			t.commit();

			t = session.beginTransaction();
			query = session.createSQLQuery(
					"SELECT broker,integration_server,broker_utilization,TRIGGERS,schedular,disk_space FROM webmdashboard WHERE status_5='LATEST' AND file_message_name IN ('TRANTEXT','CEFT','POSDM','PRCE','RST','DLY_SLS','DLY_CUST')");
			// .addScalar("Green", StandardBasicTypes.INTEGER);
			list = query.list();
			filesTotal = list.size();
			// Integer[] countries = list.toArray(new Integer[list.size()]);

			for (Object[] io : list) {
				if ((!((String) io[0]).equals("FINE") && !((String) io[0]).equals("NOT APPLICABLE"))
						|| (!((String) io[1]).equals("FINE") && !((String) io[1]).equals("NOT APPLICABLE"))) {
					filesStatus = true;
					break;
				} else if (((String) io[2]).equals("ERROR")) {
					filesStatus = true;
					break;
				} else if ((Double.parseDouble((String) io[2])) > 85) {
					filesStatus = true;
					break;
				}
			}

			if (filesStatus == false) {
				for (Object[] io : list) {
					if ((!((String) io[3]).equals("FINE") && !((String) io[3]).equals("NOT APPLICABLE"))
							|| (!((String) io[4]).equals("FINE") && !((String) io[4]).equals("NOT APPLICABLE")))
						filesStatusCnt++;
					else if (((String) io[5]).equals("ERROR"))
						filesStatusCnt++;
					else if ((Double.parseDouble((String) io[5])) > 90)
						filesStatusCnt++;
				}
			}
			t.commit();
			session.close();

			status[0] = 0.0;
			status[1] = 0.0;

			if (msgStatus == true)
				status[1] = status[1] + 50.0;
			else
				status[1] = status[1] + (msgStatusCnt * 50) / msgTotal;

			if (filesStatus == true)
				status[1] = status[1] + 50.0;
			else
				status[1] = status[1] + (filesStatusCnt * 50) / filesTotal;

			status[0] = 100 - status[1];

			return status;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String getR8SODetails() {
		System.out.println("******************getProject");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Map<String, List<String>> dataMap;
		try {
			dataMap = new HashMap<>();
			String query = "SELECT FILE_MESSAGE_NAME,BROKER,INTEGRATION_SERVER,BROKER_UTILIZATION,JMS_BROKER_UTILIZATION,TRIGGERS,JMS_BROKER,JMS_QUEUE_LENGTH,SCHEDULAR,DISK_SPACE,TIMESTAMP FROM webmdashboard WHERE status_5='LATEST'";
			System.out.println(query);

			Query queryForTable = session.createSQLQuery(query);
			List<Object[]> queryResult = queryForTable.list();
			System.out.println(queryResult.size());
			for (Object[] obj : queryResult) {
				System.out.println(obj[0]);
				List<String> tempList = new LinkedList<String>();
				System.out.println(obj[0]);
				// double tempTotal=0;
				System.out.println(obj.length);
				for (int i = 1; i < obj.length; i++) {
					String tempStorage = String.valueOf(obj[i]);
					System.out.println(tempStorage + "*****" + i);
					// tempTotal+=(Double)obj[i];
					if (tempStorage == null || tempStorage.equalsIgnoreCase("null")) {
						tempStorage = "NOT APPLICABLE";
					}
					if (!tempStorage.equals("NOT APPLICABLE") && !tempStorage.equals("ERROR")
							&& (i == 3 || i == 4 || i == 9)) {
						tempStorage = tempStorage.concat("%");
					}

					tempList.add(tempStorage);

				}
				// tempList.add(String.valueOf(tempTotal));

				dataMap.put((String) obj[0], tempList);
			}
			t.commit();
			session.close();
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}

	public String getR8SIDetails() {
		System.out.println("******************getProject");
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		t = session.beginTransaction();
		Map<String, List<String>> dataMap;
		try {
			dataMap = new HashMap<>();
			String query = "SELECT FILE_MESSAGE_NAME,INTEGRATION_SERVER,BROKER,BROKER_UTILIZATION,SCHEDULAR,JMS_TRIGGERS,JMS_BROKER_UTILIZATION,JDBC_CONNECTION,DISK_SPACE,STATUS_1,STATUS_2,STATUS_3,TIMESTAMP FROM webmdashboard WHERE status_5='LATEST' and file_message_name in ('SONO','PONO','SLSQ','IPCF','RPromo','Tranites','SIN','TFSF','LT_PR')";
			System.out.println(query);

			Query queryForTable = session.createSQLQuery(query);
			List<Object[]> queryResult = queryForTable.list();
			System.out.println(queryResult.size());
			for (Object[] obj : queryResult) {
				System.out.println(obj[0]);
				List<String> tempList = new LinkedList<String>();
				System.out.println(obj[0]);
				// double tempTotal=0;
				System.out.println(obj.length);
				for (int i = 1; i < obj.length; i++) {
					String tempStorage = String.valueOf(obj[i]);
					System.out.println(tempStorage + "*****" + i);
					// tempTotal+=(Double)obj[i];
					if (tempStorage == null || tempStorage.equalsIgnoreCase("null")) {
						tempStorage = "NOT APPLICABLE";
					}
					if (!tempStorage.equals("NOT APPLICABLE") && !tempStorage.equals("ERROR")
							&& (i == 3 || i == 6 || i == 8 || i == 11)) {
						tempStorage = tempStorage.concat("%");
					}

					tempList.add(tempStorage);

				}
				// tempList.add(String.valueOf(tempTotal));

				dataMap.put((String) obj[0], tempList);
			}
			t.commit();
			session.close();
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}

	public Double[] getWMStoresInBoundOverview() {
		Transaction t;
		Double[] status = new Double[2];
		boolean msgStatus = false;
		boolean filesStatus = false;
		double msgStatusCnt = 0.0;
		double msgTotal = 0.0;
		double filesStatusCnt = 0.0;
		double filesTotal = 0.0;
		try {
			Session session = HibernateConnection.openConnection().openSession();
			t = session.beginTransaction();
			Query query = session.createSQLQuery(
					// "select
					// INTEGRATION_SERVER,BROKER,BROKER_UTILIZATION,JMS_TRIGGERS,JMS_BROKER_UTILIZATION,JDBC_CONNECTION
					// from webmdashboard where status_5='LATEST' and
					// file_message_name in
					// ('SONO','PONO','SLSQ','IPCF','R10Promo')");
					"select INTEGRATION_SERVER,BROKER,BROKER_UTILIZATION,JMS_TRIGGERS,JMS_BROKER_UTILIZATION,JDBC_CONNECTION from webmdashboard where status_5='LATEST' and file_message_name in ('SONO','PONO','SLSQ')");
			// .addScalar("Green", StandardBasicTypes.INTEGER);
			List<Object[]> list = query.list();
			msgTotal = list.size();
			// Integer[] countries = list.toArray(new Integer[list.size()]);

			for (Object[] io : list) {
				if ((!((String) io[0]).equals("FINE") && !((String) io[0]).equals("NOT APPLICABLE"))
						|| (!((String) io[1]).equals("FINE") && !((String) io[1]).equals("NOT APPLICABLE"))) {
					msgStatus = true;
					break;
				} else if (((String) io[2]).equals("ERROR")) {
					msgStatus = true;
					break;
				} else if ((Double.parseDouble((String) io[2])) > 85) {
					msgStatus = true;
					break;
				}
			}

			if (msgStatus == false) {
				for (Object[] io : list) {
					if ((!((String) io[3]).equals("FINE") && !((String) io[3]).equals("NOT APPLICABLE"))
							|| (!((String) io[5]).equals("FINE") && !((String) io[5]).equals("NOT APPLICABLE")))
						msgStatusCnt++;
					else if (((String) io[4]).equals("ERROR"))
						msgStatusCnt++;
					else if ((Double.parseDouble((String) io[4])) > 85)
						msgStatusCnt++;
				}
			}
			t.commit();

			t = session.beginTransaction();
			query = session.createSQLQuery(
					"SELECT INTEGRATION_SERVER,BROKER,BROKER_UTILIZATION,SCHEDULAR,JDBC_CONNECTION,DISK_SPACE,STATUS_1,STATUS_2,STATUS_3,TIMESTAMP FROM webmdashboard WHERE status_5='LATEST' AND file_message_name IN ('Tranites','SIN','TFSF','LT_PR')");
			// .addScalar("Green", StandardBasicTypes.INTEGER);
			list = query.list();
			filesTotal = list.size();
			// Integer[] countries = list.toArray(new Integer[list.size()]);

			for (Object[] io : list) {
				if ((!((String) io[0]).equals("FINE") && !((String) io[0]).equals("NOT APPLICABLE"))
						|| (!((String) io[1]).equals("FINE") && !((String) io[1]).equals("NOT APPLICABLE"))) {
					filesStatus = true;
					break;
				} else if (((String) io[2]).equals("ERROR")) {
					filesStatus = true;
					break;
				} else if ((Double.parseDouble((String) io[2])) > 85) {
					filesStatus = true;
					break;
				}
			}

			if (filesStatus == false) {
				for (Object[] io : list) {
					if ((!((String) io[3]).equals("FINE") && !((String) io[3]).equals("NOT APPLICABLE"))
							|| (!((String) io[4]).equals("FINE") && !((String) io[4]).equals("NOT APPLICABLE"))
							|| (!((String) io[6]).equals("FINE") && !((String) io[6]).equals("NOT APPLICABLE"))
							|| (!((String) io[7]).equals("FINE") && !((String) io[7]).equals("NOT APPLICABLE")))
						filesStatusCnt++;
					else if (((String) io[5]).equals("ERROR"))
						filesStatusCnt++;
					else if ((Double.parseDouble((String) io[5])) > 90)
						filesStatusCnt++;
					else if (((String) io[8]).equals("ERROR"))
						filesStatusCnt++;
					else if (!((String) io[8]).equals("NOT APPLICABLE")) {
						if ((Double.parseDouble((String) io[8])) > 90 && !((String) io[8]).equals("NOT APPLICABLE"))
							filesStatusCnt++;
					}
				}
			}
			t.commit();
			session.close();

			status[0] = 0.0;
			status[1] = 0.0;

			if (msgStatus == true)
				status[1] = status[1] + 50.0;
			else
				status[1] = status[1] + (msgStatusCnt * 50) / msgTotal;

			if (filesStatus == true)
				status[1] = status[1] + 50.0;
			else
				status[1] = status[1] + (filesStatusCnt * 50) / filesTotal;

			status[0] = 100 - status[1];

			return status;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String getInOutListByDiv(String env, String wmType, String div, String in_out) {
		System.out.println("********getInOutListByDiv**********");
		Session session = HibernateConnection.openConnection().openSession();
		List<List<String>> dataMap;
		boolean msgStatus = false, fileStatus = false;
		try {
			dataMap = new ArrayList<List<String>>();
			String query = "select file_message_name,data_type,overall_status from webmdashboard where status_5='LATEST' and environment='"
					+ env + "' and store_version='" + wmType + "' and division='" + div + "' and in_out='" + in_out
					+ "'";
			System.out.println(query);

			Query queryForTable = session.createSQLQuery(query);
			List<Object[]> queryResult = queryForTable.list();
			System.out.println(queryResult.size());
			for (Object[] obj : queryResult) {
				List<String> tempList = new ArrayList<String>();

				String fName = String.valueOf(obj[0]);
				String type = String.valueOf(obj[1]);
				String status = String.valueOf(obj[2]);

				if (status.equals("ERRORALL")) {
					if (type.equals("MSG"))
						msgStatus = true;
					if (type.equals("FILE"))
						fileStatus = true;
				}

				tempList.add(fName);
				tempList.add(type);
				if (msgStatus && type.equals("MSG"))
					tempList.add("ERROR");
				else if (fileStatus && type.equals("FILE"))
					tempList.add("ERROR");
				else
					tempList.add(status);
				dataMap.add(tempList);
			}
			session.close();
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}

	public String getStoreStatusByDiv(String env, String wmType, String div) {
		System.out.println("********getStoreStatusByDiv**********");
		Session session = HibernateConnection.openConnection().openSession();
		List<List<String>> dataMap;
		try {
			dataMap = new ArrayList<List<String>>();
			String query = "select a.store_no,a.overall_status from wmstorestatus a,wmstoremaster b where a.status_5='LATEST' and a.store_no=b.store_no and b.division='"
					+ div + "' and b.environment='" + env + "' and b.STORE_VERSION='" + wmType + "';";
			System.out.println(query);

			Query queryForTable = session.createSQLQuery(query);
			List<Object[]> queryResult = queryForTable.list();
			System.out.println(queryResult.size());
			for (Object[] obj : queryResult) {
				List<String> tempList = new ArrayList<String>();
				tempList.add(String.valueOf(obj[0]));
				tempList.add(String.valueOf(obj[1]));
				dataMap.add(tempList);
			}
			session.close();
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}

	public String getISStatusByStore(String store, String env) {
		System.out.println("********getStoreStatusByDiv**********");
		Session session = HibernateConnection.openConnection().openSession();
		List<List<String>> dataMap;
		try {
			dataMap = new ArrayList<List<String>>();
			String query = "select a.store_no,a.overall_status from wmstorestatus a,wmstoremaster b where a.status_5='LATEST' and a.store_no=b.store_no and a.store_no='"
					+ store + "' and b.environment='" + env + "';";
			System.out.println(query);

			Query queryForTable = session.createSQLQuery(query);
			List<Object[]> queryResult = queryForTable.list();
			System.out.println(queryResult.size());
			for (Object[] obj : queryResult) {
				List<String> tempList = new ArrayList<String>();
				tempList.add(String.valueOf(obj[0]));
				tempList.add(String.valueOf(obj[1]));
				dataMap.add(tempList);
			}
			session.close();
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}

	public String getDetailByDiv(String env, String wmType, String div, String in_out, String data_type) {
		System.out.println("********getStoreStatusByDiv**********");
		Session session = HibernateConnection.openConnection().openSession();
		List<List<String>> dataMap;
		String query = new String();
		String header = new String();
		List<String> tempList;
		try {
			dataMap = new ArrayList<List<String>>();
			if (wmType.equals("R8") && in_out.equals("OUT") && data_type.equals("MSG")) {
				query = "select file_message_name,broker,integration_server,broker_utilization,jms_broker_utilization,triggers,jms_broker,timestamp from webmdashboard where status_5='LATEST' and environment='"
						+ env + "' and store_version='R8' and in_out='OUT' and data_type='MSG' and division='" + div
						+ "'";
				header = "Message Name,Broker Status,Integration Server Status,Broker Utilization,JMS Broker Utilization,Trigger Status,JMS Broker Status,Timestamp";
			}

			else if (wmType.equals("R8") && in_out.equals("OUT") && data_type.equals("FILE")) {
				query = "select file_message_name,broker,integration_server,broker_utilization,triggers,schedular,disk_space,timestamp from webmdashboard where status_5='LATEST' and environment='"
						+ env + "' and store_version='R8' and in_out='OUT' and data_type='FILE' and division='" + div
						+ "'";
				header = "File Name,Broker Status,Integration Server Status,Broker Utilization,Trigger Status,Schedular Status,Disk Space,Timestamp";
			}

			else if (wmType.equals("R8") && in_out.equals("IN") && data_type.equals("MSG")) {
				query = "select file_message_name,integration_server,broker,broker_utilization,jms_triggers,jms_broker_utilization,jdbc_connection,timestamp from webmdashboard where status_5='LATEST' and environment='"
						+ env + "' and store_version='R8' and in_out='IN' and data_type='MSG' and division='" + div
						+ "'";
				header = "Message Name,Integration Server Status,Broker Status,Broker Utilization,JMS Trigger Status,JMS Broker Utilization,JDBC Connection,Timestamp";

			} else if (wmType.equals("R8") && in_out.equals("IN") && data_type.equals("FILE")) {
				query = "select file_message_name,integration_server,broker,schedular,jdbc_connection,disk_space,status_1,status_2,status_3,timestamp from webmdashboard where status_5='LATEST' and environment='"
						+ env + "' and store_version='R8' and in_out='IN' and data_type='FILE' and division='" + div
						+ "'";
				header = "File Name,Integration Server Status,Broker Status,Schedular Status,JDBC Connection,Disk Space,RTP IS Status,RTP Schedular Status,RTP Disk Space,Timestamp";

			} else if (env.equals("UAT") && wmType.equals("R10") && in_out.equals("IN") && data_type.equals("MSG")) {
				query = "select file_message_name,integration_server,jms_triggers,JMS_BROKER_UTILIZATION,BROKER,BROKER_UTILIZATION,JDBC_CONNECTION,status_1,status_2,status_3,timestamp from webmdashboard where status_5='LATEST' and environment='UAT' and store_version='R10' and in_out='IN' and data_type='MSG' and division='"
						+ div + "'";
				header = "Message Name,Integration Server Status,JMS Trigger Status,JMS Broker Utilisation,Broker Status,Broker Utilization,JDBC Status,1POS Node1 Status,1POS Node2 Status,1POS Node3 Status,Timestamp";

			} else if (env.equals("SIT") && wmType.equals("R10") && in_out.equals("IN") && data_type.equals("MSG")) {
				query = "select file_message_name,integration_server,jms_triggers,JMS_BROKER_UTILIZATION,BROKER,BROKER_UTILIZATION,JDBC_CONNECTION,status_1,timestamp from webmdashboard where status_5='LATEST' and environment='SIT' and store_version='R10' and in_out='IN' and data_type='MSG' and division='"
						+ div + "'";
				header = "Message Name,Integration Server Status,JMS Trigger Status,JMS Broker Utilisation,Broker Status,Broker Utilization,JDBC Status,1POS Node1 Status,Timestamp";

			} else if (env.equals("UAT") && wmType.equals("R10") && in_out.equals("OUT") && data_type.equals("MSG")) {
				query = "select file_message_name,broker,integration_server,BROKER_UTILIZATION,JMS_BROKER_UTILIZATION,TRIGGERS,JMS_BROKER,status_1,status_2,status_3,timestamp from webmdashboard where status_5='LATEST' and environment='UAT' and store_version='R10' and in_out='OUT' and data_type='MSG' and division='"
						+ div + "'";
				header = "Message Name,Broker Status,Integration Server Status,Broker Utilization,JMS Broker Utilisation,Trigger Status,JMS Broker Status,1POS Node1 Status,1POS Node2 Status,1POS Node3 Status,Timestamp";

			} else if (env.equals("SIT") && wmType.equals("R10") && in_out.equals("OUT") && data_type.equals("MSG")) {
				query = "select file_message_name,broker,integration_server,BROKER_UTILIZATION,JMS_BROKER_UTILIZATION,TRIGGERS,JMS_BROKER,status_1,timestamp from webmdashboard where status_5='LATEST' and environment='SIT' and store_version='R10' and in_out='OUT' and data_type='MSG' and division='"
						+ div + "'";
				header = "Message Name,Broker Status,Integration Server Status,Broker Utilization,JMS Broker Utilisation,Trigger Status,JMS Broker Status,1POS Node1 Status,Timestamp";

			} else if (env.equals("UAT") && wmType.equals("R10") && in_out.equals("IN") && data_type.equals("MAS")) {
				query = "select file_message_name,BROKER_UTILIZATION,status_1,status_2,status_3,timestamp from webmdashboard where status_5='LATEST' and environment='UAT' and store_version='R10' and in_out='IN' and data_type='MAS' and division='"
						+ div + "'";
				header = "Master Data Name,Broker Utilization,1POS Node1 Status,1POS Node2 Status,1POS Node3 Status,Timestamp";

			} else if (env.equals("SIT") && wmType.equals("R10") && in_out.equals("IN") && data_type.equals("MAS")) {
				query = "select file_message_name,BROKER_UTILIZATION,integration_server,jms_broker,timestamp from webmdashboard where status_5='LATEST' and environment='SIT' and store_version='R10' and in_out='IN' and data_type='MAS' and division='"
						+ div + "'";
				header = "Master Data Name,Broker Utilization,Integration Server Status,JMS Broker,Timestamp";

			}

			System.out.println(query);

			tempList = new ArrayList<String>();
			for (String h : header.split(",")) {
				tempList.add(h);
			}
			dataMap.add(tempList);

			Query queryForTable = session.createSQLQuery(query);
			List<Object[]> queryResult = queryForTable.list();
			System.out.println(queryResult.size());
			for (Object[] obj : queryResult) {
				tempList = new ArrayList<String>();
				for (int i = 0; i < obj.length; i++)
					tempList.add(String.valueOf(obj[i]));
				dataMap.add(tempList);
			}
			session.close();
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}

	public double getWMEnvStatus(String env) {
		System.out.println("In controller getWMEnvStatus");
		double r8Status = 0, r10Status = 0;
		r8Status = getWMTypeByEnv(env, "R8");
		r10Status = getWMTypeByEnv(env, "R10");
		return (r8Status / 2) + (r10Status / 2);
	}

	public double getWMTypeByEnv(String env, String wmType) {
		System.out.println("In controller getWMDivByType");
		double smktStatus = 0, pelStatus = 0, petStatus = 0, liqStatus = 0;
		smktStatus = getWMDivByType(env, wmType, "SMKT");
		pelStatus = getWMDivByType(env, wmType, "PEL");
		petStatus = getWMDivByType(env, wmType, "PET");
		liqStatus = getWMDivByType(env, wmType, "LIQ");
		return (smktStatus / 4) + (pelStatus / 4) + (petStatus / 4) + (liqStatus / 4);
	}

	public double getWMDivByType(String env, String wmType, String div) {
		System.out.println("In controller getWMDivByType");
		double inMsg = 0, inFile = 0, outMsg = 0, outFile = 0, inMas = 0;
		if (wmType.equals("R8")) {
			inMsg = getWMDivByType1(env, wmType, div, "IN", "MSG");
			inFile = getWMDivByType1(env, wmType, div, "IN", "FILE");
			outMsg = getWMDivByType1(env, wmType, div, "OUT", "MSG");
			outFile = getWMDivByType1(env, wmType, div, "OUT", "FILE");
			return (inMsg / 4) + (inFile / 4) + (outMsg / 4) + (outFile / 4);
		} else if (wmType.equals("R10")) {
			inMsg = getWMDivByType1(env, wmType, div, "IN", "MSG");
			outMsg = getWMDivByType1(env, wmType, div, "OUT", "MSG");
			inMas = getWMDivByType1(env, wmType, div, "IN", "MAS");
			return (inMsg / 3) + (outMsg / 3) + (inMas / 3);
		} else
			return 0.0;

	}

	public double getWMDivByType1(String env, String wmType, String div, String in_out, String data_type) {
		System.out.println("********getStoreStatusByDiv**********");
		Session session = HibernateConnection.openConnection().openSession();
		String query = new String();
		double fineCounter = 0.0, total = 0.0;
		double finalStatus = 0.0;
		try {
			query = "select overall_status,timestamp from webmdashboard where status_5='LATEST' and environment='" + env
					+ "' and store_version='" + wmType + "' and division='" + div + "' and in_out='" + in_out
					+ "' and data_type='" + data_type + "'";
			System.out.println(query);

			Query queryForTable = session.createSQLQuery(query);
			List<Object[]> queryResult = queryForTable.list();
			total = queryResult.size();
			System.out.println(queryResult.size());
			if (total != 0) {
				for (Object[] obj : queryResult) {
					if (String.valueOf(obj[0]).equals("ERRORALL")) {
						return 0.0;
					} else if (String.valueOf(obj[0]).equals("FINE")) {
						fineCounter++;
					}
				}
				session.close();
				finalStatus = fineCounter * 100 / total;
				return finalStatus;
			} else {
				return 0.0;
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return 0.0;
		}
	}

	public String getAllStoreStatus() {
		System.out.println("********getAllStoreStatus**********");
		Session session = HibernateConnection.openConnection().openSession();
		List<List<String>> dataMap;
		try {
			dataMap = new ArrayList<List<String>>();
			String query = "select store_no,environment,store_version,division from wmstoremaster where store_no in (select store_no from wmstorestatus) and division<>'NA' group by store_no order by store_no;";
			System.out.println(query);

			Query queryForTable = session.createSQLQuery(query);
			List<Object[]> queryResult = queryForTable.list();
			session.close();
			Map<String, String> isStatusMap = getAllISStatus();
			Map<String, String> maintenanceList = getMaintainanceList();
			List<Object[]> wmDetails = getWMDetails();
			System.out.println(queryResult.size());

			for (Object[] obj : queryResult) {
				List<String> tempList = new ArrayList<String>();
				tempList.add(String.valueOf(obj[0]));
				tempList.add(String.valueOf(obj[1]));
				tempList.add(String.valueOf(obj[2]));
				tempList.add(String.valueOf(obj[3]));
				tempList.add(getOverallStoreStatus1(String.valueOf(obj[0]), isStatusMap, maintenanceList, wmDetails));
				dataMap.add(tempList);
			}			
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}

	public String getOverallStoreStatus(String store) {
		System.out.println("********getStoreStatusByDiv**********");
		List<List<String>> dataMap;
		try {
			dataMap = new ArrayList<List<String>>();
			List<String> tempList = new ArrayList<String>();
			Map<String, String> isStatusMap = getAllISStatus();
			Map<String, String> maintenanceList = getMaintainanceList();
			List<Object[]> wmDetails = getWMDetails();
			tempList.add(store);
			tempList.add(getOverallStoreStatus1(store, isStatusMap, maintenanceList, wmDetails));
			dataMap.add(tempList);
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}

	public String getOverallStoreStatus1(String store, Map<String, String> isStatusMap,
			Map<String, String> maintenanceList, List<Object[]> wmDetails) {
		System.out.println("********getStoreStatusByDiv**********");
		boolean fineStatus = false, errorStatus = false, errorAllStatus = false;
		try {
			if (maintenanceList.containsKey(store)) {
				String text = "Planned maintenance";
				if (!maintenanceList.get(store).equals(""))
					text=text+" - "+maintenanceList.get(store);
				return text;

			}

			else if (isStatusMap.get(store).equals("ERROR"))
				return "Not Available";
			else {
				for (Object[] obj1 : wmDetails) {
					if (String.valueOf(obj1[0]).equals(store)) {
						if (String.valueOf(obj1[1]).equals("FINE"))
							fineStatus = true;
						if (String.valueOf(obj1[1]).equals("ERROR"))
							errorStatus = true;
						if (String.valueOf(obj1[1]).equals("ERRORALL"))
							errorAllStatus = true;
					}
				}
				if (!fineStatus)
					return "Not Available";
				else {
					if (!errorAllStatus && !errorStatus)
						return "Available";
					else
						return "Partially Available";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}

	public String getStoreDetails(String store) {
		System.out.println("********getStoreStatusByDiv**********");
		Session session = HibernateConnection.openConnection().openSession();
		List<List<String>> dataMap;
		try {
			dataMap = new ArrayList<List<String>>();
			String query = "select environment,store_version,division from wmstoremaster where store_no='" + store
					+ "';";
			System.out.println(query);

			Query queryForTable = session.createSQLQuery(query);
			List<Object[]> queryResult = queryForTable.list();
			System.out.println(queryResult.size());
			for (Object[] obj : queryResult) {
				List<String> tempList = new ArrayList<String>();
				tempList.add("environment");
				tempList.add(String.valueOf(obj[0]));
				dataMap.add(tempList);

				tempList = new ArrayList<String>();
				tempList.add("wmType");
				tempList.add(String.valueOf(obj[1]));
				dataMap.add(tempList);

				tempList = new ArrayList<String>();
				tempList.add("division");
				tempList.add(String.valueOf(obj[2]));
				dataMap.add(tempList);
			}
			session.close();
			Gson gson = new Gson();
			String json = gson.toJson(dataMap);
			System.out.println(json);
			return json;
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}

	public Double[] getWMEnvOveralStatus(String env, String wmType, String div) {
		System.out.println("********getWMEnvOveralStatus**********");
		Session session = HibernateConnection.openConnection().openSession();
		List<List<String>> dataMap;
		try {
			dataMap = new ArrayList<List<String>>();
			String query = "select store_no,environment,store_version,division from wmstoremaster where store_no in (select store_no from wmstorestatus) and division<>'NA'";
			if (env != null)
				query = query + " and environment='" + env + "'";
			if (wmType != null)
				query = query + " and store_version='" + wmType + "'";
			if (div != null)
				query = query + " and division='" + div + "'";
			query = query + " group by store_no order by store_no;";
			System.out.println(query);

			Query queryForTable = session.createSQLQuery(query);
			List<Object[]> queryResult = queryForTable.list();
			System.out.println(queryResult.size());
			double totalStores = queryResult.size();
			double fineStores = 0.0, partialStores = 0.0, errorStores = 0.0, maintainStores = 0.0;
			session.close();
			Map<String, String> isStatusMap = getAllISStatus();
			Map<String, String> maintenanceList = getMaintainanceList();
			List<Object[]> wmDetails = getWMDetails();
			for (Object[] obj : queryResult) {
				String storeStatus = getOverallStoreStatus1(String.valueOf(obj[0]), isStatusMap, maintenanceList,
						wmDetails);
				if (storeStatus.equals("Available"))
					fineStores++;
				if (storeStatus.equals("Partially Available"))
					partialStores++;
				if (storeStatus.equals("Not Available"))
					errorStores++;
				if (storeStatus.contains("Planned maintenance"))
					maintainStores++;
			}
			System.out.println(queryResult.size());

			
			Double[] overallStatus = new Double[4];
			overallStatus[0] = 0.0;
			overallStatus[1] = 0.0;
			overallStatus[0] = (fineStores * 100) / totalStores;
			overallStatus[1] = (partialStores * 100) / totalStores;
			overallStatus[2] = (maintainStores * 100) / totalStores;
			overallStatus[3] = 100 - overallStatus[0] - overallStatus[1] - overallStatus[2];

			System.out.println(overallStatus);
			return overallStatus;
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}

	public Map<String, String> getAllISStatus() {
		Session session = HibernateConnection.openConnection().openSession();
		Map<String, String> myMap = new LinkedHashMap<String, String>();
		String query = "select a.store_no,b.overall_status from wmstoremaster a, wmstorestatus b where a.STORE_NO=b.STORE_NO and a.division<>'NA' and b.STATUS_5='LATEST' order by a.store_no;";
		Query queryForTable = session.createSQLQuery(query);
		List<Object[]> queryResult = queryForTable.list();
		for (Object[] obj : queryResult) {
			myMap.put(obj[0].toString(), obj[1].toString());
		}
		session.close();
		return myMap;
	}

	public Map<String, String> getMaintainanceList() {
		Transaction t;
		Session session = HibernateConnection.openConnection().openSession();
		//session.flush();
		session.clear();
		t = session.beginTransaction();
		Map<String, String> myList = new LinkedHashMap<String, String>();
		String query = "select a.store_no,a.COMMENTS from wm_maintenance a,wmstoremaster b where a.store_no=b.store_no and CURRENT_TIMESTAMP() between a.FROMTIME and a.totime;";
		Query queryForTable = session.createSQLQuery(query);
		List<Object[]> queryResult = queryForTable.list();
		for (Object[] obj : queryResult) {
			String comments = new String();
			if (obj[1]==null)
				comments = "";
			else
				comments = obj[1].toString();
			myList.put(obj[0].toString(), comments);
		}
		t.commit();
		session.close();
		return myList;
	}

	/*
	 * public List<String> getMaintainanceList() { Session session =
	 * HibernateConnection.openConnection().openSession(); List<String> myList =
	 * new LinkedList<String>(); String query =
	 * "select a.store_no,a.fromtime,a.totime from wm_maintenance a,wmstoremaster b where a.store_no=b.store_no and CURRENT_TIMESTAMP() between a.FROMTIME and a.totime;"
	 * ; Query queryForTable = session.createSQLQuery(query); List<Object[]>
	 * queryResult = queryForTable.list(); for (Object[] obj : queryResult) {
	 * myList.add(obj[0].toString()); } session.close(); return myList; }
	 */

	public List<Object[]> getWMDetails() {
		Session session = HibernateConnection.openConnection().openSession();
		String query = "select a.store_no,b.OVERALL_STATUS,count(*) from wmstoremaster a,webmdashboard b where b.environment=a.environment and b.store_version=a.store_version and b.division=a.division and b.STATUS_5='LATEST' group by a.store_no,b.OVERALL_STATUS;";
		System.out.println(query);
		Query queryForTable = session.createSQLQuery(query);
		List<Object[]> queryResult = queryForTable.list();
		session.close();
		return queryResult;
	}
	public boolean addOnStore(Maintenance planStore) {
		boolean flag=false;
		Transaction t, t1;
		try {
			System.out.println("$$$$$$$$$$$$");
			Session session = HibernateConnection.openConnection()
					.openSession();
			Session session1 = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			List<String> maintainList = getMaintainanceListAll();
			List<Maintenance> storeDet=planStoreDetails(planStore.getStore_no(),planStore.getEnvironment(),planStore.getStore_version());
			if(storeDet!=null){
			for(Maintenance planDetail: storeDet){
				if(maintainList.contains(planDetail.getStore_no())){
					t1 = session1.beginTransaction();
					Object obj=session1.load(Maintenance.class, new String(planDetail.getStore_no()));
					Maintenance oldStore = (Maintenance) obj;
					oldStore.setFromtime(planStore.getFromtime());
					oldStore.setTotime(planStore.getTotime());
					oldStore.setUpdatedate(planDetail.getUpdatedate());
					System.out.println("here!!!!!!!-----"+oldStore.getStore_no());
					session1.update(oldStore);
					t1.commit();
				}
				else{
				planDetail.setFromtime(planStore.getFromtime());
				planDetail.setTotime(planStore.getTotime());
            session.save(planDetail);
				}
			}
			t.commit();
			session1.close();
			session.close();
     			flag=true;
		return flag;
		} 
			else return flag;
		}
			catch (Exception e) {
			e.printStackTrace();
			return flag;
		}	
	}
	public List<Maintenance> planStoreDetails(String store,String env,String store_ver) {
		System.out.println("********getStoreStatusByDiv**********");
		Session session = HibernateConnection.openConnection().openSession();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		try {
			List<Maintenance> tempList = new ArrayList<Maintenance>();
			String query = "select store_version,environment,store_no from wmstoremaster where"; 
			if (store !="" && store !=null)
				query = query + " store_no='" + store + "'";
			if((store !="" && env != "") && (store !=null && env != null))
				query = query + " and";
			if (env != ""&&env != null)
				query = query + " environment='" + env + "'";
			if (store_ver !="" && store_ver !=null)
				query = query + " and store_version='" +store_ver + "'";
			query = query + " order by store_no;";
			System.out.println(query);
			Query queryForTable = session.createSQLQuery(query);
			List<Object[]> queryResult = queryForTable.list();
			System.out.println(queryResult.size());
			if(queryResult.size()>0){
			for (Object[] obj : queryResult) {
				Maintenance pStore=new Maintenance();
				pStore.setStore_version(String.valueOf(obj[0]));
				pStore.setEnvironment(String.valueOf(obj[1]));
				pStore.setStore_no(String.valueOf(obj[2]));	
				pStore.setCreatedate(timestamp);
			    pStore.setUpdatedate(timestamp);
				tempList.add(pStore);
			}
			session.close();
			return tempList;
		}
			else
				return null;
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + e.getMessage());
			return null;
		}
	}
	public List<String> getMaintainanceListAll() {
		Session session = HibernateConnection.openConnection().openSession();
		List<String> myList = new LinkedList<String>();
		String query = "select a.store_no,a.store_version,a.environment from wm_maintenance a,wmstoremaster b where a.store_no=b.store_no;";
		Query queryForTable = session.createSQLQuery(query);
		List<Object[]> queryResult = queryForTable.list();
		for (Object[] obj : queryResult) {
			myList.add(obj[0].toString());
		}
		session.close();
		return myList;
	}
}
