package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Transaction;

import model.Resources;
import model.SlaDefect;
import model.SlaMain;
import model.SlaProject;
import model.SlaRootCause;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

@Repository
public class SlaDAO {
	
	
	public boolean saveSlaData(SlaMain slaObj)
	{
		Transaction t;
		try {
			System.out.println("$$$$$$$$$$$$");
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			session.save(slaObj);
			System.out.println("RRRRRRRRRRRRRR");
			t.commit();
			session.close();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public SlaMain getSlaData(String slaPortfolio, String slaProject)
	{
		Transaction t;
		int id=0;
		try {
			System.out.println("$$$$$$$$$$$$");
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			Query getIdSla = session.createSQLQuery("select id from sla where project=? and portfolio=? ");
			getIdSla.setParameter(0, slaProject);
			getIdSla.setParameter(1, slaPortfolio);
			//String temp=portfolioName;
			System.out.println("GetIdSla"+getIdSla);
			List ids=getIdSla.list();
			if(ids!=null){
				id=(int) ids.get(0);
			}
			SlaMain obj= (SlaMain) session.get(SlaMain.class,id);
			if(id==0){
				obj= new SlaMain();
			}
			System.out.println("RRRRRRRRRRRRRR");
			t.commit();
			session.close();

			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	public List<String> getProjectsSla(String portfolioName)
	{
		System.out.println("in dao" +portfolioName);
		Session session = HibernateConnection.openConnection()
				.openSession();

		
		Query getProjects = session.createSQLQuery("select project from wowmain where portfolio=?");
		String temp=portfolioName;
		//temp.toString(portfolioName)
		
		getProjects.setParameter(0, portfolioName);
		List<String> list = getProjects.list();
		System.out.println(list);
				
		return list;
		
	}

	public boolean updateSlaData(SlaMain slaMainObject, SlaDefect slaDefectObject, SlaProject slaProjObject, SlaRootCause slaRootCauseObject) {
		
		System.out.println("!!!!!!!!  Inside SLA Update Method !!!!!!!!!");
		//System.out.println("Inside sla update id" + slaDefectObject.getSlamain().getId() );
		Transaction t;
		try {
			System.out.println("$$$$$$$$$$$$");
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();

			//session.refresh(slaMainObject);
			session.update(slaMainObject);
			
			System.out.println("RRRRRRRRRRRRRR");
			t.commit();
			session.close();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
	}
	
	public boolean saveSlaProj(SlaProject slaProjObject)
	{
		Transaction t;
		try {
			System.out.println("$$$$$$$$$$$$");
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();

			//session.refresh(slaMainObject);
			session.save(slaProjObject);
			
			System.out.println("RRRRRRRRRRRRRR");
			t.commit();
			session.close();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
	}

}
