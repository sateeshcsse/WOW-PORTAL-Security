package repositories;

import model.User;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AutoUserRepository extends JpaRepository<User, Long>  {

	public User findByUserName(String username);
	
	
}
