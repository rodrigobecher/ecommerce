package Ecommerce.Ecommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import Ecommerce.Ecommerce.model.CarrinhoItem;
import Ecommerce.Ecommerce.model.CarrinhoCompras;
import Ecommerce.Ecommerce.model.Imagem;
import Ecommerce.Ecommerce.model.Produto;
import Ecommerce.Ecommerce.repository.ProdutoRepository;

@Controller
@RequestMapping("/carrinho")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoComprasController {
	
	@Autowired
	private ProdutoRepository repository;
	
	@Autowired
	private CarrinhoCompras carrinho;
	
	@GetMapping("/{produtoId}/{quantidade}")
	public ModelAndView itensCarrinho(@PathVariable Integer produtoId, @PathVariable Integer quantidade) {
	
	ModelAndView mv = new ModelAndView("redirect:/carrinho");
	CarrinhoItem carrinhoItem = criaItem(produtoId, quantidade);
	carrinho.add(carrinhoItem, quantidade);
	return mv;
	}
	@GetMapping("/carrinhoLogin")
	public ModelAndView itensCarrinhoLogin() {
	ModelAndView mv = new ModelAndView("redirect:/carrinho");
	return mv;
	}
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView itens() {
		return new ModelAndView("itens");
	}
	
	@RequestMapping(value = "/excluir/{produtoId}/{quantidade}", method = RequestMethod.POST)
	public ModelAndView excluir(@PathVariable int produtoId, @PathVariable int quantidade) {
		ModelAndView mv = new ModelAndView("redirect:/carrinho");
		carrinho.remover(produtoId,quantidade);
		return mv;
	}

	private CarrinhoItem criaItem(Integer produtoID, Integer quantidade) {
		Produto produto = repository.buscaIdProduto(produtoID);
		CarrinhoItem carrinho = new CarrinhoItem(produto, quantidade);
		return carrinho;
	}

}
