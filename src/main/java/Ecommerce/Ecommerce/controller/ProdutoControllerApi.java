package Ecommerce.Ecommerce.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.validation.BindingResult;

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
	
	@GetMapping
	public ModelAndView findCarrinho(){
			ModelAndView mv = new ModelAndView("carrinho");
			List<Imagem> lista = repository.buscaCarrinhoProdutos();		
			mv.addObject("produto", new ArrayList<Imagem>(lista));
		return mv;
				
	}
	@GetMapping("/{id}")
	public Imagem editar(@PathVariable Integer id){
		
		return repository.findbyId(id);
		
		
	}
	@SuppressWarnings("unchecked")
	@PostMapping
	public String save(Produto produto, BindingResult result, HttpServletRequest req){
		//ModelAndView mv = new ModelAndView("listaProdutos");
		
		
		ArrayList<Produto> retornoLista = (ArrayList<Produto>) req.getSession().getAttribute("carrinho");  
		retornoLista = new AdicionarItensCarrinho().AdicionaItensCarrinho(produto, retornoLista); 
		//HttpSession session = request.getSession(true);  
		req.getSession().setAttribute("carrinho", retornoLista);
		
		
		
		//if(result.hasErrors()){
		//	StringJoiner join = new StringJoiner(",");
		//		join.add(erro.getDefaultMessage());
		//	}
		//	return ResponseEntity.badRequest().body("erro");
		//}
		//mv.addObject("produto", new ArrayList<Imagem>(lista));
		return "redirect:/produto";
	}
}
