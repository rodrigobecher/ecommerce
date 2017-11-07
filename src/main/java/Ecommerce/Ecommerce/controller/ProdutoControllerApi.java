package Ecommerce.Ecommerce.controller;

import java.util.ArrayList;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import Ecommerce.Ecommerce.model.Imagem;
import Ecommerce.Ecommerce.model.Produto;
import Ecommerce.Ecommerce.repository.ProdutoRepository;

@RestController
@RequestMapping("/api/produto")
public class ProdutoControllerApi {
	
	@Autowired
	private ProdutoRepository repository;
	

	@PostMapping
	public ModelAndView buscaPagina(Integer quantidade) {
		ModelAndView mv = new ModelAndView("/listaProdutos");
		List<Produto> list = repository.buscaPaginas(quantidade);
		mv.addObject("imagem", new ArrayList<Produto>(list));
		return mv;
	}
	@GetMapping("/{id}")
	public Produto editar(@PathVariable Integer id){
		
		return repository.buscaIdProduto(id);
	
	}
	
}
