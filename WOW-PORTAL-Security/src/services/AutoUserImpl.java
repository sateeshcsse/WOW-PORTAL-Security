package services;

import java.util.List;

import model.User;
import model.Wowmain;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import dao.HibernateConnection;
import repositories.AutoUserRepository;


@Repository
public class AutoUserImpl implements AutoUserRepository {



	@Override
	public User findByUserName(String username) {
		Transaction t;
		try {
			System.out.println("$$$$$$$$$$$$$$$"+username);
			
			Session session = HibernateConnection.openConnection()
					.openSession();
			t = session.beginTransaction();
			Criteria criteria = session
					.createCriteria(User.class);
		
			User user = (User) criteria.list().get(0);
			System.out.println(user.getEmail());
			/*for(Object[] obj:list){
				System.out.println(String.valueOf(obj[0]));
				System.out.println(String.valueOf(obj[1]));
				user.setEmail(String.valueOf(obj[2]));
				user.setPassword(String.valueOf(obj[6]));
				user.setRole(String.valueOf(obj[7]));
			}*/
			t.commit();
			session.close();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public void deleteAllInBatch() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteInBatch(Iterable<User> arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findAll(Sort arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findAll(Iterable<Long> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void flush() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User getOne(Long arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends User> List<S> save(Iterable<S> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends User> S saveAndFlush(S arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<User> findAll(Pageable arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void delete(Long arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(User arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Iterable<? extends User> arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean exists(Long arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User findOne(Long arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends User> S save(S arg0) {
		// TODO Auto-generated method stub
		return null;
	}

}
