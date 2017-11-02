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
	
	
}
