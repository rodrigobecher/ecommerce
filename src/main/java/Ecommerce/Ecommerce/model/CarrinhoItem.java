package Ecommerce.Ecommerce.model;

import java.io.Serializable;

public class CarrinhoItem implements Serializable{

	
	private static final long serialVersionUID = 1L;
	private Produto produto;
	private Integer quantidade;

	public CarrinhoItem(Produto produto, Integer quantidade) {
		this.produto = produto;
		this.quantidade = quantidade;
	
		// TODO Auto-generated constructor stub
	}

	
	public Produto getProduto() {
		return produto;
	}


	public void setProduto(Produto produto) {
		this.produto = produto;
	}


	public Integer getQuantidade() {
		return quantidade;
	}


	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((produto == null) ? 0 : produto.hashCode());
		
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CarrinhoItem other = (CarrinhoItem) obj;
		if (produto == null) {
			if (other.produto != null)
				return false;
		} else if (!produto.equals(other.produto))
			return false;
		
		return true;
	}

	public double getTotal(int quantidade) {
		return this.getProduto().getPrecoVenda() * quantidade;
		
	}

	
}
