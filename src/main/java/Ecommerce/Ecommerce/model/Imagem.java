package Ecommerce.Ecommerce.model;

public class Imagem {
	private int idImagem;
	private String descricao;
	private Produto produto;
	private Restricao restricao;
	public int getIdImagem() {
		return idImagem;
	}
	public void setIdImagem(int idImagem) {
		this.idImagem = idImagem;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	public Restricao getRestricao() {
		return restricao;
	}
	public void setRestricao(Restricao restricao) {
		this.restricao = restricao;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + idImagem;
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
		Imagem other = (Imagem) obj;
		if (idImagem != other.idImagem)
			return false;
		return true;
	}
	
	
}
