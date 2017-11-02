package Ecommerce.Ecommerce.repository;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.stereotype.Repository;
import Ecommerce.Ecommerce.model.Imagem;
import Ecommerce.Ecommerce.model.Produto;
import Ecommerce.Ecommerce.model.Restricao;



@Repository
public class ProdutoRepository {
	@Autowired
	private JdbcTemplate jdbc;
	
	public void save(Imagem imagem, Produto produto) {
		if(produto.getIdProduto() == 0) {
			insertProdutos(imagem, produto);
		}
		else { 
				
				alterarImagem(imagem);
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
	public void excluir(Integer id, Integer id2, String descricao) throws IOException {
		excluirImagem(descricao);
		
		jdbc.update("delete from imagem where idImagem = ?",
				new Object[]{id});
		jdbc.update("delete from produto where idProduto = ?",
				new Object[] {id2});
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
		
	public void alterarProduto(Produto produto) {
		jdbc.update("update produto set produtoDescricao = ?, quantidade = ?, complemento = ?, precoVenda = ? where idProduto = ?",
				produto.getDescricao(),
				produto.getQuantidade(),
				produto.getComplemento(),
				produto.getPrecoVenda(),
				produto.getIdProduto());
	}
	public void alterarImagem(Imagem imagem) {
		jdbc.update("update imagem set descricao = ? where idImagem = ?",
				imagem.getDescricao(),
				imagem.getIdImagem());
	}
	private int insertImagem(Imagem imagem, Produto produto) {
		int idProduto = insertProduto(produto);
		jdbc.update("insert into imagem (descricao, idProduto) values (?,?)",
				imagem.getDescricao(),
				idProduto);
		return idProduto;
	}
	public List<Imagem> BuscaImgProduto(){
		return jdbc.query("select produto.idProduto, produto.produtoDescricao, produto.complemento, produto.quantidade,  produto.precoVenda, imagem.idImagem,  imagem.descricao from imagem" + 
				" inner join produto " + 
				" on produto.idProduto = imagem.idProduto ", new ImagemMapper());
	}
	/*
	public List<Imagem> busca(){
		return jdbc.query("select produto.idProduto, produto.produtoDescricao, produto.complemento, produto.quantidade,  produto.precoVenda, imagem.idImagem,  imagem.descricao from imagem" + 
				" inner join produto " + 
				" on produto.idProduto = imagem.idProduto ", new ResultSetExtractor<List<Imagem>>(){
			@Override
			public List<Imagem> extractData(ResultSet rs) throws SQLException,  
            DataAccessException {  
				List<Imagem> list = new ArrayList<Imagem>();
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
					produto.setLista(buscaRestricaoProduto(produto.getIdProduto()));		
					img.setProduto(produto); 
		        list.add(img);  
				}
				 return list; 
			}
		});
		
	}
	*/
	public Imagem findbyId(Integer id) {
		return jdbc.queryForObject("select produto.idProduto, produto.produtoDescricao, produto.complemento, produto.quantidade,  produto.precoVenda, imagem.idImagem,  imagem.descricao from imagem" + 
				" inner join produto " + 
				" on imagem.idProduto = produto.idProduto "
	+ " where imagem.idImagem = ?", new Object[]{id}, new ImagemMapper());

	}
	public List<Restricao> buscaRestricao(){
		return jdbc.query("select idRestricao, descricaoRestricao from restricao", new RestricaoMapper());
	}
	
	public List<Restricao> buscaRestricaoProduto(){
		return jdbc.query("select produto.idProduto, restricao.idRestricao, restricao.descricaoRestricao from restricaoProduto " + 
				" inner join produto " + 
				" on produto.idProduto = restricaoProduto.idProduto " + 
				" inner join restricao " + 
				" on restricao.idRestricao = restricaoProduto.idRestricao ",  new RestricaoProdutoMapper());
	}
	/*
	public List<Restricao> buscaRestricaoProduto(int id){
		return jdbc.query("select restricao.idRestricao, restricao.descricaoRestricao from restricaoProduto " +
				" inner join restricao "+
				" on restricao.idRestricao = restricaoProduto.idRestricao" +
				" where idProduto = ?", new Object[] {id}, new RestricaoProdutoMapper());
	}
	 */
	private void insertProdutos(Imagem imagem, Produto produto) {
			int idProduto = insertImagem(imagem, produto);
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
		
	
	
	class ImagemMapper implements org.springframework.jdbc.core.RowMapper<Imagem>{
		@Override
		public Imagem mapRow(ResultSet rs, int rowNumber) throws SQLException{
			Imagem img = new Imagem();
			Produto produto = new Produto();
			img.setIdImagem(rs.getInt("idImagem"));
			img.setDescricao(rs.getString("descricao"));
			produto.setDescricao(rs.getString("produtoDescricao"));
			produto.setQuantidade(rs.getInt("quantidade"));
			produto.setIdProduto(rs.getInt("idProduto"));
			produto.setComplemento(rs.getString("complemento"));
			produto.setPrecoVenda(rs.getDouble("precoVenda"));
			img.setProduto(produto);
			return img;
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
	public List<Imagem> buscaCarrinhoProdutos() {
		return jdbc.query("select produto.idProduto, produto.produtoDescricao, produto.restricao, produto.complemento, produto.precoVenda, imagem.idImagem, imagem.descricao from carrinho" + 
				" inner join produto " + 
				" on carrinho.idProduto = produto.idProduto " + 
				" inner join imagem " + 
				" on carrinho.idProduto = imagem.idProduto ", new ImagemMapper());
	}
}
