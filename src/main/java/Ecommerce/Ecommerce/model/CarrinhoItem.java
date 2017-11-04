package Ecommerce.Ecommerce.model;

import java.math.BigDecimal;

public class CarrinhoItem {

	private Imagem imagem;

	public CarrinhoItem(Imagem imagem) {
		this.imagem = imagem;
	
		// TODO Auto-generated constructor stub
	}

	public Imagem getImagem() {
		return imagem;
	}

	public void setImagem(Imagem imagem) {
		this.imagem = imagem;
	}

	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((imagem == null) ? 0 : imagem.hashCode());
		
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
		if (imagem == null) {
			if (other.imagem != null)
				return false;
		} else if (!imagem.equals(other.imagem))
			return false;
		
		return true;
	}

	public double getTotal(int quantidade) {
		return this.getImagem().getProduto().getPrecoVenda() * quantidade;
		
	}

	
}
