package Ecommerce.Ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Ecommerce.Ecommerce.model.GraficoVendas;
import Ecommerce.Ecommerce.repository.PedidoRepository;

@Controller
@RequestMapping("/administrador")
public class AdministradorController {
	
	@Autowired
	PedidoRepository pedidoRepository;
	
	@GetMapping
	public ModelAndView itensCarrinhoLogin() {
	ModelAndView mv = new ModelAndView("administrador");
	return mv;
	}
	
	@GetMapping("/grafico")
	@ResponseBody
	public List<GraficoVendas> dados(){
 
		return pedidoRepository.maisVendidos();
	}
}
