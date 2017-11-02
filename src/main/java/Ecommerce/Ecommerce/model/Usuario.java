package Ecommerce.Ecommerce.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import Ecommerce.Ecommerce.repository.ClienteRepository;

public class Usuario {
	@Autowired
	ClienteRepository repository;
	private String login;
	private String senha;
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
}
