package Ecommerce.Ecommerce.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.sasl.AuthenticationException;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import Ecommerce.Ecommerce.model.Imagem;
import Ecommerce.Ecommerce.model.Produto;
import Ecommerce.Ecommerce.model.Role;
import Ecommerce.Ecommerce.model.Usuario;

@Repository
public class UsuarioRepository implements UserDetailsService{
	@Autowired
	private JdbcTemplate jdbc;
	
	
		
	
	public Usuario loadUserByUsername(String login){
	return jdbc.queryForObject("select login, senha from usuario "+
			" where login = ? ", new Object[] {login}, new UsuarioMapper()); 
	}		
	class UsuarioMapper implements org.springframework.jdbc.core.RowMapper<Usuario>{
		@Override
		public Usuario mapRow(ResultSet rs, int rowNumber) throws SQLException {
			Usuario usuario = new Usuario();
			usuario.setLogin(rs.getString("login"));
			usuario.setSenha(rs.getString("senha"));
			usuario.setPermissoes(buscaPermissoes(usuario.getLogin()));
			
			if (usuario.equals(null)) {
				
			}
			return usuario;
		
		}
	}
	public List<Role> buscaPermissoes(String login){
		return jdbc.query("select permissoes from permissoes " +
				" where login = ? ", new Object[] {login}, new PermissoesMapper());
	}
	
	class PermissoesMapper implements org.springframework.jdbc.core.RowMapper<Role>{
		@Override
		public Role mapRow(ResultSet rs, int rowNumber) throws SQLException{
			Role role = new Role();
			role.setNome(rs.getString("permissoes"));
			return role;
			
		}
	}
}
