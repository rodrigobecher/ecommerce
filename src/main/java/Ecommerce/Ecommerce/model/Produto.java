package Ecommerce.Ecommerce.model;

import java.util.List;

public class Produto {
	private int idProduto;
	private String descricao;
	private String complemento;
	private double precoVenda;
	private int[] restricao;
	private int quantidade;
	private List<Restricao> lista;
	
	
	
	public List<Restricao> getLista() {
		return lista;
	}
	public void setLista(List<Restricao> lista) {
		this.lista = lista;
	}
	public int[] getRestricao() {
		return restricao;
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
	
	public int getRestricao(int id) {
		return restricao[id];
	}
	
	public int[] getRestricaoTamanho() {
		return restricao;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public void setRestricao(int[] restricao) {
		this.restricao = restricao;
	}
	public double getPrecoVenda() {
		return precoVenda;
	}
	public void setPrecoVenda(double precoVenda) {
		this.precoVenda = precoVenda;
	}
	

}
