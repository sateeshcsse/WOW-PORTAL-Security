package dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import model.Resources;

import dao.HibernateConnection;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ResourceDao {

	public boolean saveResouceDate(Resources resource) {
		Transaction t;
		try {
			System.out.println("$$$$$$$$$$$$");
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			session.save(resource);
			System.out.println("RRRRRRRRRRRRRR");
			t.commit();
			session.close();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Resources loadResourceData() {

		try {

			Session session = HibernateConnection.openConnection()
					.openSession();
			Resources resource = (Resources) session
					.createQuery("from resources ORDER BY resourceTableId DESC")
					.setMaxResults(1).uniqueResult();
			if (resource != null) {
				String lastDate = resource.getLatestDate();
				session.close();
				System.out.println("EEEEEEEEE" + lastDate);
				boolean withInThisMonth = checkForCurrentMonth(lastDate);
				if (withInThisMonth) {
					return resource;
				} else {
					return new Resources();
				}
			} else {
				return new Resources();
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return null;
	}

	private boolean checkForCurrentMonth(String lastDate) {

		try {
			Date today = new Date();

			Calendar calendar = Calendar.getInstance();
			Calendar calendar2 = Calendar.getInstance();
			calendar.setTime(today);

			calendar.add(Calendar.MONTH, 1);
			calendar.set(Calendar.DAY_OF_MONTH, 1);
			calendar.add(Calendar.DATE, -1);

			Date lastDayOfMonth = calendar.getTime();

			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			DateFormat sdf1 = new SimpleDateFormat("dd/MM/yyy");
			Date d3 = sdf1.parse(lastDate);
			calendar2.setTime(d3);
			// System.out.println("Today            : " + sdf.format(today));
			// System.out.println("Last Day of Month: " +
			// sdf.format(lastDayOfMonth));
			boolean firstCondition = lastDayOfMonth.after(today);
			boolean secondCondition = calendar.get(Calendar.YEAR) == calendar2
					.get(Calendar.YEAR)
					&& calendar.get(Calendar.MONTH) == calendar2
							.get(Calendar.MONTH);
			if (firstCondition && secondCondition) {
				return true;
			} else {
				return false;
			}
		} catch (ParseException e) {

			e.printStackTrace();
			return false;
		}

	}

	public boolean updateResouceDate(Resources resource) {
		Transaction t;
		try {
			System.out.println("$$$$$$$$$$$$");
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			session.merge(resource);
			System.out.println("RRRRRRRRRRRRRR");
			t.commit();
			session.close();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public List<Double> getRatiosForGraph() {
		Transaction t;
		try {
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			Double[] resources = {};
			Query query = session
					.createSQLQuery("select totalWomenRatio,totalOffshoreLeverage from resources order by resourceTableId asc");
			List<Object[]> list = query.list();
			List<Double> listin = new LinkedList<>();
			for (Object[] io : list) {

				for (int i = 0; i < io.length; i++)
					listin.add((double) io[i]);
			}
			// System.out.println("$$$$$$$$$$$$$$"+listin.toArray().toString());
			t.commit();
			session.close();
			System.out.println(Arrays.toString(listin.toArray()));
			return listin;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
