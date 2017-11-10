package Ecommerce.Ecommerce.controller;

import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Ecommerce.Ecommerce.model.CarrinhoCompras;
import Ecommerce.Ecommerce.model.DadosPagamento;
import Ecommerce.Ecommerce.repository.PedidoRepository;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController {
	
	@Autowired
	CarrinhoCompras carrinho;
	@Autowired
	PedidoRepository repository;
	@Autowired
	private RestTemplate restTemplate;
		
	@RequestMapping(value = "/finalizar", method = RequestMethod.GET)
	public ModelAndView finalizar(RedirectAttributes model) {
		
		//String uri = "https://ws.sandbox.pagseguro.uol.com.br/v2/sessions?email=rodrigofbecher@gmail.com&token=3EB9ABF9E7CC4EA28057AC3A15ED522E";
		//String response = restTemplate.postForObject(uri, new DadosPagamento(), String.class);
		/*Gravar no banco.
		Collection<CarrinhoItem> pedido = carrinho.getItens();
		Double totalPedido = carrinho.getTotal();
		repository.inserirItemPedido(pedido, totalPedido);
		*/
		//System.out.println(response);
		model.addFlashAttribute("mensagem", "Compra finalizada");
		return new ModelAndView("redirect:/produto");
	
	}

}
