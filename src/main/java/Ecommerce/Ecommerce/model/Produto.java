package Ecommerce.Ecommerce.model;

public class Produto {
	private int idProduto;
	private String descricao;
	private String complemento;
	private double precoVenda;
	private int[] restricao;
	private int quantidade;
	private Restricao restricao1;
	
	
	public Restricao getRestricao1() {
		return restricao1;
	}
	public void setRestricao1(Restricao restricao1) {
		this.restricao1 = restricao1;
	}
	public int getIdProduto() {
		return idProduto;
	}
	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	
	public int[] getRestricao() {
		return restricao;
	}
	public int getRestricao(int id) {
		return restricao[id];
	}
	
	public int[] getRestricaoTamanho() {
		return restricao;
	}
	public void setRestricao(int[] restricao) {
		this.restricao = restricao;
	}
	
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	
	public double getPrecoVenda() {
		return precoVenda;
	}
	public void setPrecoVenda(double precoVenda) {
		this.precoVenda = precoVenda;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + idProduto;
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
		Produto other = (Produto) obj;
		if (idProduto != other.idProduto)
			return false;
		return true;
	}
	

}
