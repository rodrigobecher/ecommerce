package Ecommerce.Ecommerce.repository;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import Ecommerce.Ecommerce.model.CarrinhoItem;
import Ecommerce.Ecommerce.model.GraficoVendas;
import Ecommerce.Ecommerce.model.Imagem;
import Ecommerce.Ecommerce.model.Produto;

@Repository
public class PedidoRepository {
	@Autowired
	private JdbcTemplate jdbc;

	public int inserirPedido(BigDecimal totalPedido, int idCliente) {
			String sql ="insert into pedido (valorTotal, idCliente) values (?,?)";
			PreparedStatementCreator psc = new PreparedStatementCreator() {
				public java.sql.PreparedStatement createPreparedStatement(java.sql.Connection con) throws SQLException {
					java.sql.PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setBigDecimal(1, totalPedido);
					ps.setInt(2, idCliente);
					return ps;
				}
						
			};
			KeyHolder holder = new GeneratedKeyHolder();
		    jdbc.update(psc, holder);
		    int pedidoId = holder.getKey().intValue();
		    return pedidoId;
	}
	public void inserirItemPedido(Collection<CarrinhoItem> pedido, BigDecimal totalPedido, int idCliente) {
		int idPedido = inserirPedido(totalPedido, idCliente);
		java.util.Date data;
		for (CarrinhoItem carrinhoItem : pedido) {
			
			jdbc.update("insert into itemPedido (idPedido, idProduto, quantidade, dataPedido) values (?,?,?,?)",
					idPedido,
					carrinhoItem.getProduto().getIdProduto(),
					carrinhoItem.getQuantidade(),
					data = new java.util.Date());
		}
		
	}
	public List<GraficoVendas> maisVendidos() {
		
				return jdbc.query("select produto.idProduto, produto.produtoDescricao, sum(itempedido.quantidade) as quantidade, itempedido.dataPedido  from itempedido " + 
						" inner join produto " + 
						" on produto.idProduto = itempedido.idProduto " + 
						" group by (itempedido.idProduto) " + 
						" HAVING COUNT(itempedido.quantidade) " + 
						" order by quantidade desc " + 
						" limit 3 ", new ResultSetExtractor<List<GraficoVendas>>(){
			@Override
			public List<GraficoVendas> extractData(ResultSet rs) throws SQLException,  
            DataAccessException {  
				List<GraficoVendas> list = new ArrayList<GraficoVendas>();
				while(rs.next()) {
					GraficoVendas dados = new GraficoVendas();
					dados.setName(rs.getString("produtoDescricao"));
					dados.setY(rs.getInt("quantidade"));
		        list.add(dados);
				}
				 return list; 
			}
		});
				
	}
	
}
