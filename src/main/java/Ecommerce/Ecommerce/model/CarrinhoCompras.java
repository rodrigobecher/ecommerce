package Ecommerce.Ecommerce.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION)
public class CarrinhoCompras implements Serializable{
	
	private static final long serialVersionUID =1L;
	
	private Map<CarrinhoItem, Integer> itens = new LinkedHashMap<CarrinhoItem, Integer>();
	public void add(CarrinhoItem item) {
		itens.put(item, getQuantidade(item)+1);
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
}
