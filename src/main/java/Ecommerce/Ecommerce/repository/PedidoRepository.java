package Ecommerce.Ecommerce.repository;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import Ecommerce.Ecommerce.model.CarrinhoItem;

@Repository
public class PedidoRepository {
	@Autowired
	private JdbcTemplate jdbc;

	public int inserirPedido(Double totalPedido) {
			String sql ="insert into pedido (valorTotal) values (?)";
			PreparedStatementCreator psc = new PreparedStatementCreator() {
				public java.sql.PreparedStatement createPreparedStatement(java.sql.Connection con) throws SQLException {
					java.sql.PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setDouble(1, totalPedido);
					return ps;
				}
						
			};
			KeyHolder holder = new GeneratedKeyHolder();
		    jdbc.update(psc, holder);
		    int pedidoId = holder.getKey().intValue();
		    return pedidoId;
	}
	public void inserirItemPedido(Collection<CarrinhoItem> pedido, Double totalPedido) {
		int idPedido = inserirPedido(totalPedido);
		for (CarrinhoItem carrinhoItem : pedido) {
			jdbc.update("insert into itemPedido (idPedido, idProduto, quantidade) values (?,?,?)",
					idPedido,
					carrinhoItem.getProduto().getIdProduto(),
					carrinhoItem.getQuantidade());
		}
		
	}
}
