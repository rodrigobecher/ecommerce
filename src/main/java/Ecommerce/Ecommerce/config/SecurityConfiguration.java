package Ecommerce.Ecommerce.config;


import java.net.HttpURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.HttpRequestHandler;

import Ecommerce.Ecommerce.repository.UsuarioRepository;



@Configuration
@EnableWebMvcSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	@Autowired
	private UsuarioRepository repository;
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.authorizeRequests().antMatchers("/produto/cadastro").hasRole("ADMIN")	
		.antMatchers("pagamento/finalizar").hasRole("CLIENTE")
		.antMatchers("/carrinho/carrinhoLogin").hasAnyRole("CLIENTE")
		.antMatchers("/produto/buscaRestricao/**").permitAll()
		.antMatchers("/pagamento").permitAll()
		.antMatchers("/produto").permitAll()
		.antMatchers("/produto/pagina").permitAll()
		.antMatchers("/resources/**").permitAll()
		.antMatchers("/cliente/**").permitAll()
		.antMatchers("/imagens/**").permitAll()
		.antMatchers("/api/produto/**").permitAll()
		.antMatchers("/carrinho/**").permitAll()
		.antMatchers("/pag").permitAll()
		.antMatchers("/login/**").permitAll()
		.anyRequest().authenticated()
		.and().formLogin().loginPage("/login").permitAll()
		.and().logout().logoutSuccessUrl("/produto");
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {	
			auth.userDetailsService(repository).passwordEncoder(new BCryptPasswordEncoder());
	}
}
