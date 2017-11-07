package Ecommerce.Ecommerce.repository;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;
import Ecommerce.Ecommerce.model.Imagem;
import Ecommerce.Ecommerce.model.Produto;
import Ecommerce.Ecommerce.model.Restricao;



@Repository
public class ProdutoRepository {
	@Autowired
	private JdbcTemplate jdbc;
	
	public void save(Produto produto) {
		
		if(produto.getIdProduto() == 0) {
			insertProdutos(produto);
		}
		else { 
				
				alterarImagem(produto);
				alterarProduto(produto);
				if(produto.getRestricaoTamanho() == null) {
					
					}else
						alterarRestricaoProduto(produto);
				}
				
		}
	public void excluirImagem(String descricao) throws IOException {
		File f = new File("C:/users/Rodrigo/pictures/imagens/"+ descricao);
		f.delete();
			
	}
	public void excluir(Integer idProduto, Integer idImagem) throws IOException {
		//excluirImagem(descricao);
		
		jdbc.update("delete from imagem where idImagem = ?",
				new Object[]{idImagem});
		jdbc.update("delete from produto where idProduto = ?",
				new Object[] {idProduto});
	}
	
		
	public void alterarProduto(Produto produto) {
		jdbc.update("update produto set produtoDescricao = ?, quantidade = ?, complemento = ?, precoVenda = ? where idProduto = ?",
				produto.getDescricao(),
				produto.getQuantidade(),
				produto.getComplemento(),
				produto.getPrecoVenda(),
				produto.getIdProduto());
	}
	public void alterarImagem(Produto produto) {
		jdbc.update("update imagem set descricao = ? where idImagem = ?",
				produto.getImagem().getDescricao(),
				produto.getImagem().getIdImagem());
	}
	private int insertImagem(Produto produto) {
		int idProduto = insertProduto(produto);
		jdbc.update("insert into imagem (descricao, idProduto) values (?,?)",
				produto.getImagem().getDescricao(),
				idProduto);
		return idProduto;
	}
	public List<Produto> BuscaImgProduto(){
		return jdbc.query("select produto.idProduto, produto.produtoDescricao, produto.complemento, produto.quantidade,  produto.precoVenda, imagem.idImagem,  imagem.descricao from imagem" + 
				" inner join produto " + 
				" on produto.idProduto = imagem.idProduto ", new ProdutoMapper());
		
	}
		
	public List<Produto> buscaPaginas(Integer quantidade){
		return jdbc.query("select produto.idProduto, produto.produtoDescricao, produto.complemento, produto.quantidade,  produto.precoVenda, imagem.idImagem,  imagem.descricao from imagem" + 
				" inner join produto " + 
				" on produto.idProduto = imagem.idProduto " +
				" limit ?,5 ", new Object[] {quantidade}, new ResultSetExtractor<List<Produto>>(){
			@Override
			public List<Produto> extractData(ResultSet rs) throws SQLException,  
            DataAccessException {  
				List<Produto> list = new ArrayList<Produto>();
				while(rs.next()) {
					Imagem img = new Imagem();
					Produto produto = new Produto();
					img.setIdImagem(rs.getInt("idImagem"));
					img.setDescricao(rs.getString("descricao"));
					produto.setDescricao(rs.getString("produtoDescricao"));
					produto.setQuantidade(rs.getInt("quantidade"));
					produto.setIdProduto(rs.getInt("idProduto"));
					produto.setComplemento(rs.getString("complemento"));
					produto.setPrecoVenda(rs.getDouble("precoVenda"));
					produto.setPaginas(quantidadeRegistros());
					produto.setRestricoes(buscaRestricaoProduto(produto.getIdProduto()));	
					produto.setImagem(img); 
		        list.add(produto);  
				}
				 return list; 
			}
		});
		
	}
	public int quantidadeRegistros() {
		int quantidade =0;
			SqlRowSet srs = jdbc.queryForRowSet("select count(*)  from produto");
			while(srs.next()) {
			 quantidade = srs.getInt("count(*)");	
			}

			return quantidade;
	}
	
	public Produto buscaIdProduto(Integer id){
		return jdbc.queryForObject("select produto.idProduto, produto.produtoDescricao, produto.complemento, produto.quantidade,  produto.precoVenda, imagem.idImagem,  imagem.descricao from imagem" + 
				" inner join produto " + 
				" on produto.idProduto = imagem.idProduto "+
				" where produto.idProduto = ?", new Object[] {id}, new ProdutoMapper());
		
	}
	
	public List<Restricao> buscaRestricao(){
		return jdbc.query("select idRestricao, descricaoRestricao from restricao", new RestricaoMapper());
	}
	
	  public void alterarRestricaoProduto(Produto produto) {
		jdbc.update("delete from restricaoProduto where idProduto = ?",
				produto.getIdProduto());
		for(int i = 0; i < produto.getRestricaoTamanho().length; i++) {
			 jdbc.update("insert into restricaoProduto (idRestricao, idProduto) values (?, ?)",
					produto.getRestricao(i),
					produto.getIdProduto());
		 }	
	}
	public List<Restricao> buscaRestricaoProduto(){
		return jdbc.query("select produto.idProduto, restricao.idRestricao, restricao.descricaoRestricao from restricaoProduto " + 
				" inner join produto " + 
				" on produto.idProduto = restricaoProduto.idProduto " + 
				" inner join restricao " + 
				" on restricao.idRestricao = restricaoProduto.idRestricao ",  new RestricaoProdutoMapper());
	}
	
	public List<Restricao> buscaRestricaoProduto(int id){
		return jdbc.query("select restricaoProduto.idProduto, restricao.idRestricao, restricao.descricaoRestricao from restricaoProduto " +
				" inner join restricao "+
				" on restricao.idRestricao = restricaoProduto.idRestricao" +
				" where idProduto = ?", new Object[] {id}, new RestricaoProdutoMapper());
	}
	
	private void insertProdutos(Produto produto) {
			int idProduto = insertImagem(produto);
				 for(int i = 0; i < produto.getRestricaoTamanho().length; i++) {
					 jdbc.update("insert into restricaoProduto (idRestricao, idProduto) values (?, ?)",
							produto.getRestricao(i),
							idProduto);
				 }				 
	}
	
	private int insertProduto(Produto produto) {
		String sql ="insert into produto (produtoDescricao, quantidade, complemento, precoVenda) values (?,?,?,?)";
		PreparedStatementCreator psc = new PreparedStatementCreator() {
			public java.sql.PreparedStatement createPreparedStatement(java.sql.Connection con) throws SQLException {
				java.sql.PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, produto.getDescricao());
				ps.setInt(2, produto.getQuantidade());
				ps.setString(3, produto.getComplemento());
				ps.setDouble(4, produto.getPrecoVenda());
				return ps;
			}
					
		};
		    KeyHolder holder = new GeneratedKeyHolder();
		    jdbc.update(psc, holder);
		    int produtoId = holder.getKey().intValue();
		    return produtoId;
	}
		
	
	
	class ProdutoMapper implements org.springframework.jdbc.core.RowMapper<Produto>{
		@Override
		public Produto mapRow(ResultSet rs, int rowNumber) throws SQLException{
			Imagem img = new Imagem();
			Produto produto = new Produto();
			img.setIdImagem(rs.getInt("idImagem"));
			img.setDescricao(rs.getString("descricao"));
			produto.setDescricao(rs.getString("produtoDescricao"));
			produto.setQuantidade(rs.getInt("quantidade"));
			produto.setIdProduto(rs.getInt("idProduto"));
			produto.setComplemento(rs.getString("complemento"));
			produto.setPrecoVenda(rs.getDouble("precoVenda"));
			produto.setRestricoes(buscaRestricaoProduto(produto.getIdProduto()));
			produto.setImagem(img);
			return produto;
		}
	}
	class RestricaoMapper implements org.springframework.jdbc.core.RowMapper<Restricao>{
		@Override
		public Restricao mapRow(ResultSet rs, int rowNumber) throws SQLException{
			Restricao rest = new Restricao();
			rest.setIdRestricao(rs.getInt("idRestricao"));
			rest.setDescricaoRestricao(rs.getString("descricaoRestricao"));
			return rest;
		}
	}
	class RestricaoProdutoMapper implements org.springframework.jdbc.core.RowMapper<Restricao>{
		@Override
		public Restricao mapRow(ResultSet rs, int rowNumber) throws SQLException{
			Restricao rest = new Restricao();
			Produto prod = new Produto();
			prod.setIdProduto(rs.getInt("idProduto"));
			rest.setIdRestricao(rs.getInt("idRestricao"));
			rest.setDescricaoRestricao(rs.getString("descricaoRestricao"));
			rest.setProduto(prod);
			return rest;
		}
	}
	public void adicionaCarrinho(long idProduto) {
		jdbc.update("insert into carrinho (idProduto) values (?)",
				new Object[] {idProduto});
	}
	
}
