package Ecommerce.Ecommerce.model;

public class Restricao {
	private int idRestricao;
	private String descricaoRestricao;
	private Produto produto;
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	
	public int getIdRestricao() {
		return idRestricao;
	}
	public void setIdRestricao(int idRestricao) {
		this.idRestricao = idRestricao;
	}
	public String getDescricaoRestricao() {
		return descricaoRestricao;
	}
	public void setDescricaoRestricao(String descricaoRestricao) {
		this.descricaoRestricao = descricaoRestricao;
	}
	
	
}
