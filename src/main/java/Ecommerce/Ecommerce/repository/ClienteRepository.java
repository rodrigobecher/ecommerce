package Ecommerce.Ecommerce.repository;



import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;
import Ecommerce.Ecommerce.model.Cliente;
import Ecommerce.Ecommerce.model.Produto;

@Repository
public class ClienteRepository {
	@Autowired
	private JdbcTemplate jdbc;
	
	public void save (Cliente cliente, String permissoes){
		if(cliente.getIdCliente() == 0)
			insertRestricoesCliente(cliente, permissoes);
		//else
			//alterar(imovel);
	}
	private int insertCliente(Cliente cliente, String permissoes) {
		insertUsuario(cliente);
		insertPermissoes(cliente, permissoes);
		String sql ="insert into cliente (nome, sobreNome, telefone, cpf, cep, cidade, estado, logradouro, numero, login) values (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatementCreator psc = new PreparedStatementCreator() {
			public java.sql.PreparedStatement createPreparedStatement(java.sql.Connection con) throws SQLException {
				java.sql.PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, cliente.getNome());
				ps.setString(2, cliente.getSobreNome());
				ps.setString(3, cliente.getTelefone());
				ps.setString(4, cliente.getCpf());
				ps.setString(5, cliente.getCep());
				ps.setString(6, cliente.getCidade());
				ps.setString(7, cliente.getEstado());
				ps.setString(8, cliente.getLogradouro());
				ps.setInt(9, cliente.getNumero());
				ps.setString(10, cliente.getUsuario().getLogin());
				return ps;
			}
					
		};
		    KeyHolder holder = new GeneratedKeyHolder();
		    jdbc.update(psc, holder);
		    int clienteId = holder.getKey().intValue();
		    return clienteId;
	}
	
	private void insertRestricoesCliente(Cliente cliente, String permissoes) {
		int idCliente = insertCliente(cliente, permissoes);
			 for(int i = 0; i < cliente.getRestricaoTamanho().length; i++) {
				 jdbc.update("insert into restricaocliente (idRestricao, idCliente) values (?, ?)",
						cliente.getRestricao(i),
						idCliente);
			 }				 
}
	
	private void insertUsuario(Cliente cliente) {
		jdbc.update("insert into usuario (login, senha) values (?,?)",
				cliente.getUsuario().getLogin(),
				BCrypt.hashpw(cliente.getUsuario().getSenha(), BCrypt.gensalt()));		
			}		
	private void  insertPermissoes(Cliente cliente, String permissoes) {
		jdbc.update("insert into permissoes(permissoes, login) values (?,?)",
				permissoes,
				cliente.getUsuario().getLogin());
	}
	
	
}



	

