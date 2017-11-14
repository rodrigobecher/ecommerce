package Ecommerce.Ecommerce.controller;




import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Ecommerce.Ecommerce.model.Cliente;
import Ecommerce.Ecommerce.model.Restricao;
import Ecommerce.Ecommerce.model.Usuario;
import Ecommerce.Ecommerce.repository.ClienteRepository;
import Ecommerce.Ecommerce.repository.ProdutoRepository;
@Controller
@RequestMapping("/cliente")
public class ClienteController {
	
	@Autowired
	ProdutoRepository repository;
	@Autowired
	ClienteRepository clienteRepository;
	@GetMapping
	public ModelAndView Apresenta(Model modelo){
		ModelAndView mv = new ModelAndView("/cliente");
		List<Restricao> list = repository.buscaRestricao();
		mv.addObject("restricao", new ArrayList<Restricao>(list));
		return mv;
	}
	
	@PostMapping
	public ModelAndView cadastrarCliente(Cliente cliente, Usuario usuario) {
		ModelAndView mv = new ModelAndView("redirect:/produto");
		String permissoes = "ROLE_CLIENTE";
		cliente.setUsuario(usuario);
		clienteRepository.save(cliente, permissoes);
		return mv;
	}
}

