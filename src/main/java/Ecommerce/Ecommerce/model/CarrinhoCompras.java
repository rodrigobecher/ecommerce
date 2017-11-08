package Ecommerce.Ecommerce.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION,  proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CarrinhoCompras implements Serializable{
	
	private static final long serialVersionUID =1L;
	
	private Map<CarrinhoItem, Integer> itens = new LinkedHashMap<CarrinhoItem, Integer>();
	public void add(CarrinhoItem item, Integer quantidade) {
		itens.put(item, getQuantidade(item)+ quantidade);
	}
	
	public Collection<CarrinhoItem> getItens(){
		return itens.keySet();
	}
	public Integer getQuantidade(CarrinhoItem item) {
		if(!itens.containsKey(item)) {
			itens.put(item, 0);
		}
		return itens.get(item);
	}
	public int getQuantidade() {
		return itens.values().stream().reduce(0, (proximo, acumulador) -> proximo + acumulador);
	}
	
	public double getTotal(CarrinhoItem item){
		return item.getTotal(getQuantidade(item));
	}
	
	public double getTotal() {
		double total = 0;
		for (CarrinhoItem item : itens.keySet()) {
			total = total + getTotal(item);
		}
		return total;
	}

	public void remover(Integer produtoId, Integer quantidade) {
		Produto produto = new Produto();
		produto.setIdProduto(produtoId);
		itens.remove(new CarrinhoItem(produto, quantidade));
		
	}
}
