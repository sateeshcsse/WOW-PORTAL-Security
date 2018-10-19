package dao;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateConnection {

	private static SessionFactory sessionfactory;

	public static SessionFactory openConnection() {
		if (sessionfactory == null) {
			System.out
					.println("Session Factory not initialised.Initialising now.");
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");// populates the data of the
												// configuration file

			ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
					.applySettings(cfg.getProperties()).build();
			sessionfactory = cfg.buildSessionFactory(serviceRegistry);
		}
		return sessionfactory;

	}

}
