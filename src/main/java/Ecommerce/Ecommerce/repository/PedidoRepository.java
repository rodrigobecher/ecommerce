package Ecommerce.Ecommerce.repository;

import java.math.BigDecimal;
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
		for (CarrinhoItem carrinhoItem : pedido) {
			jdbc.update("insert into itemPedido (idPedido, idProduto, quantidade) values (?,?,?)",
					idPedido,
					carrinhoItem.getProduto().getIdProduto(),
					carrinhoItem.getQuantidade());
		}
		
	}
}
