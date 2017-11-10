package Ecommerce.Ecommerce.repository;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;
import Ecommerce.Ecommerce.model.Cliente;

@Repository
public class ClienteRepository {
	@Autowired
	private JdbcTemplate jdbc;
	
	public void save (Cliente cliente, String permissoes){
		if(cliente.getIdCliente() == 0)
			insertCliente(cliente, permissoes);
		//else
			//alterar(imovel);
	}
	
	private void insertCliente(Cliente cliente, String permissoes) {
		insertUsuario(cliente);
		insertPermissoes(cliente, permissoes);
		jdbc.update("insert into cliente (nome, sobreNome, telefone, cpf, cep, cidade, estado, logradouro, numero, login) values (?,?,?,?,?,?,?,?,?,?)",
				cliente.getNome(),
				cliente.getSobreNome(),
				cliente.getTelefone(),
				cliente.getCpf(),
				cliente.getCep(),
				cliente.getCidade(),
				cliente.getEstado(),
				cliente.getLogradouro(),
				cliente.getNumero(),
				cliente.getUsuario().getLogin());
				
				
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



	

