package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import repositories.AutoUserRepository;


@Component("customUserDetailService")
public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	private AutoUserRepository repo ;
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		model.User user= repo.findByUserName(username);
		
		return new User(user.getEmail(), user.getPassword(), AuthorityUtils.createAuthorityList(user.getRole()));
	}

}
