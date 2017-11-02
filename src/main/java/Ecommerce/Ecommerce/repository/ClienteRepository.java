package Ecommerce.Ecommerce.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import Ecommerce.Ecommerce.model.Cliente;
import Ecommerce.Ecommerce.model.Usuario;

@Repository
public class ClienteRepository {
	@Autowired
	private JdbcTemplate jdbc;
	
	public void save (Cliente cliente, Usuario usuario){
		if(cliente.getIdCliente() == 0)
			insertCliente(cliente, usuario);
		//else
			//alterar(imovel);
	}
	
	private void insertCliente(Cliente cliente, Usuario usuario) {
		jdbc.update("insert into cliente (nome, sobreNome, telefone, cpf, endereco, idUsuario) values (?,?,?,?,?,?)",
				cliente.getNome(),
				cliente.getSobreNome(),
				cliente.getTelefone(),
				cliente.getCpf(),
				cliente.getEndereco(),
				insertUsuario(usuario));
		
	}

	private int insertUsuario(Usuario usuario) {
		String sql ="insert into usuario (login, senha) values (?,?)";
		PreparedStatementCreator psc = new PreparedStatementCreator() {
			public java.sql.PreparedStatement createPreparedStatement(java.sql.Connection con) throws SQLException {
				java.sql.PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, usuario.getLogin());
				ps.setString(2, usuario.getSenha());
				return ps;
			}
					
		};
		    KeyHolder holder = new GeneratedKeyHolder();
		    jdbc.update(psc, holder);
		    int usuarioId = holder.getKey().intValue();
		    return usuarioId;
	}
	public List<Usuario> allUsuario(){
		return jdbc.query("select login, senha from usuario", new UsuarioMapper());
	}
		/*
	public Usuario buscaUsuario() {
		return jdbc.query("select login, senha from usuario", new ResultSetExtractor<Usuario>() {

			@Override
			public Usuario extractData(ResultSet rs) throws SQLException, DataAccessException {
				Usuario usuario = new Usuario();
				while(rs.next()) {
				usuario.setLogin(rs.getString("login"));
				usuario.setSenha(rs.getString("senha"));
				
				}
				return usuario;
			}
		});
	*/
	class UsuarioMapper implements org.springframework.jdbc.core.RowMapper<Usuario>{
		@Override
		public Usuario mapRow(ResultSet rs, int rowNumber) throws SQLException{
			Usuario usuario = new Usuario();
			usuario.setLogin(rs.getString("login"));
			usuario.setSenha(rs.getString("senha"));
			return usuario;
		}
	}
	public boolean validaUsuario(Usuario usuario) {
		boolean retorno = false;
		List<Usuario> lista = allUsuario();
		for (Usuario usuario2 : lista) {
			if(usuario.getLogin().equals(usuario2.getLogin()) && usuario.getSenha().equals(usuario2.getSenha())) {
				retorno = true;
				}
			else {
				retorno = false;
			}
		}
		return retorno;
		
	}
}



	

