package Ecommerce.Ecommerce.model;

import java.util.List;

	public class Restricao {
	private int idRestricao;
	private String descricaoRestricao;
	private Produto produto;
	private List<Restricao> lista;
	
	
	
	public List<Restricao> getLista() {
		return lista;
	}
	public void setLista(List<Restricao> lista) {
		this.lista = lista;
	}
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
