package dao;

import java.util.ArrayList;
import java.util.List;

import model.User;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDAO {

	@Override
	public User getUser(String login) {
		Session session= HibernateConnection.openConnection().openSession();
		List<User> userList = new ArrayList<User>();
        Query query =  session.createQuery("from User u where u.login = :login");
        query.setParameter("login", login);
        userList = query.list();
        if (userList.size() > 0)
            return userList.get(0);
        else
            return null; 
	}

}
