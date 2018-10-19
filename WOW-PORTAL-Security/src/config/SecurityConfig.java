package config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
@ImportResource({"\\WEB-INF\\security.xml"})

public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    @Autowired
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .inMemoryAuthentication()
                    .withUser("user").password("password").roles("USER")
                    .and()
                    .withUser("admin").password("password").roles("USER", "FOO");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .formLogin()
                    .loginPage("/login.do")
                    .loginProcessingUrl("/login.do")
                    .defaultSuccessUrl("/")
                    .usernameParameter("custom_username")
                    .passwordParameter("custom_password")
                    .failureUrl("/login.do?error=true")
                    
                .and()
                .logout().logoutUrl("/logout.do").logoutSuccessUrl("/login.do?logout=true")
                .and()
                .csrf()
                    .disable()
                .authorizeRequests()
                    .antMatchers("/reports/**").hasAnyAuthority("USER")
                    .antMatchers("/**").hasAnyAuthority("ANONYMOUS");
                    
      
    }
}