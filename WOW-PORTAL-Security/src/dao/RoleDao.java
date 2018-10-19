package dao;

import model.Role;

import org.springframework.stereotype.Repository;

@Repository
public interface RoleDao {

	 public Role getRole(int id);
	
	
}
