package dao;

import java.util.List;



import java.util.Map;

import model.VMData;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

@Repository
public class VMDao {
	
	public boolean saveVMData(VMData vmdata)
	{
		Transaction t;
		try {
			System.out.println("$$$$$$$$$$$$");
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			session.save(vmdata);
			System.out.println("RRRRRRRRRRRRRR");
			t.commit();
			session.close();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	public boolean updateVMData(VMData vmdata) {
		Transaction t;
		try {
			System.out.println("$$$$$$$$$$$$");
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			session.update(vmdata);
			System.out.println("RRRRRRRRRRRRRR");
			t.commit();
			session.close();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	public List<String> getvmValues() {
		System.out.println("In Dao to get all VM Datas" );
		Session session = HibernateConnection.openConnection()
				.openSession();
		
		
	
		
		Query q = session.createSQLQuery("select v.id, v.machine_name, v.machine_type, "
				+ "v.current_status, v.assigned_from, v.assigned_till, owner, v.citrix_id, v.email, "
				+ "v.portfolio, v.project_name, v.os, v.ram, v.storage_size, v.processor from VMData v").setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);;//.setResultTransformer(Transformers.aliasToBean(VMData.class));
				List<String> resultList=q.list();
        System.out.println(resultList); //desire output 
     

//		Query getQueryVMData = session.createSQLQuery("select v.id, v.machine_name, v.machine_type, "
//				+ "v.current_status, v.assigned_from, v.assigned_till, owner, v.citrix_id, v.email, "
//				+ "v.portfolio, v.project_name, v.os, v.ram, v.storage_size, v.processor from vmdata v");
	
		//List<String> vmlist = getQueryVMData.list();
		//System.out.println(vmlist);
				
		return resultList;
	
	}

}
