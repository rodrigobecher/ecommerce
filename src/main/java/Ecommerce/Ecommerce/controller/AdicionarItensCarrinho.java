package Ecommerce.Ecommerce.controller;

import java.util.ArrayList;

import Ecommerce.Ecommerce.model.Produto;


public class AdicionarItensCarrinho {
	public ArrayList<Produto> AdicionaItensCarrinho(Produto produto, ArrayList<Produto> lista) {
		// TODO Auto-generated constructor stub
		if (lista == null){
			lista = new ArrayList<Produto>();
		}
		lista.add(produto);
		return lista;
	}
}
