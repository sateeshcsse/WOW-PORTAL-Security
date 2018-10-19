package dao;

import model.User;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	 public User getUser(String login);
	
	
}
