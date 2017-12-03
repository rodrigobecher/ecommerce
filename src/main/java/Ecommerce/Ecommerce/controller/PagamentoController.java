package Ecommerce.Ecommerce.controller;



import java.io.IOException;

import java.math.BigDecimal;

import java.util.Collection;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Ecommerce.Ecommerce.model.CarrinhoCompras;
import Ecommerce.Ecommerce.model.CarrinhoItem;
import Ecommerce.Ecommerce.model.Cliente;
import Ecommerce.Ecommerce.repository.ClienteRepository;
import Ecommerce.Ecommerce.repository.PedidoRepository;
import br.com.uol.pagseguro.domain.AccountCredentials;
import br.com.uol.pagseguro.domain.Credentials;
import br.com.uol.pagseguro.domain.Item;
import br.com.uol.pagseguro.domain.PaymentRequest;
import br.com.uol.pagseguro.domain.Phone;
import br.com.uol.pagseguro.domain.Sender;
import br.com.uol.pagseguro.domain.Transaction;
import br.com.uol.pagseguro.enums.Currency;
import br.com.uol.pagseguro.exception.PagSeguroServiceException;
import br.com.uol.pagseguro.service.NotificationService;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController {
	
	@Autowired
	CarrinhoCompras carrinho;
	@Autowired
	PedidoRepository repository;
	
	@Autowired
	ClienteRepository clienteRepository;
	
	private final String email = "rodrigofbecher@gmail.com";
	private final String token = "E4C362D8E2C04366B1335CE3F4741F28";
	
	@GetMapping()
	public ModelAndView pago(RedirectAttributes model,HttpSession session, HttpServletRequest request) {
		ModelAndView mv= new ModelAndView("/compraFinalizada");
		BigDecimal totalPedido = carrinho.getTotal();
		Collection<CarrinhoItem> pedido = carrinho.getItens();
		String usuario = request.getUserPrincipal().getName();
		Cliente cli = clienteRepository.buscaCliente(usuario);	
		repository.inserirItemPedido(pedido, totalPedido, cli.getIdCliente());	
		session.invalidate();
		return mv;
	}
	
	@RequestMapping(value = "/finalizar", method = RequestMethod.GET)
	@ResponseBody
	public void finalizar(RedirectAttributes model,  HttpServletRequest request, HttpServletResponse response) throws PagSeguroServiceException, IOException {
		ModelAndView mv = new ModelAndView();
		String usuario = request.getUserPrincipal().getName();
		Collection<CarrinhoItem> pedido = carrinho.getItens();
		Cliente cli = clienteRepository.buscaCliente(usuario);
		try {
		PaymentRequest req = new PaymentRequest();	
		req.setReference("VND001");
		req.setCurrency(Currency.BRL);
		req.setSender(getSender(usuario));
		
		for (CarrinhoItem carrinho : pedido) {
		req.addItem(getItem(carrinho));
		}
		req.setNotificationURL("localhost:8080/pagamento/notificacao");
		req.setRedirectURL("localhost:8080/pagamento");
		
		
		response.sendRedirect(req.register(getCredencial()));
		
		}
		catch (PagSeguroServiceException ex) {
			System.out.println(ex.getMessage());
			response.sendRedirect("/carrinho");
			
		}	
		
	}
	
	private Credentials getCredencial() throws PagSeguroServiceException {
			return new AccountCredentials(email, token);
		
	}

	private Item getItem(CarrinhoItem carrinhoItens) {
		Item item = new Item();
		item.setId(Integer.toString(carrinhoItens.getProduto().getIdProduto()));
		item.setDescription(carrinhoItens.getProduto().getDescricao());
		item.setQuantity(carrinhoItens.getQuantidade());
		item.setAmount(formataDecimal(carrinhoItens.getProduto().getPrecoVenda()));
		return item;
	}
	public BigDecimal formataDecimal(BigDecimal vlrFator){  
		BigDecimal numFormatado  = vlrFator.setScale(2, BigDecimal.ROUND_UP); 
		return numFormatado;		
	}
	

	private Sender getSender(String usuario) {
		Sender sender = new Sender();
		Cliente cli = clienteRepository.buscaCliente(usuario);
		sender.setName(cli.getNome()+" " + cli.getSobreNome());
		sender.setPhone(new Phone("47", cli.getTelefone()));
		return sender;
	}
	@RequestMapping(value = "/notificacao", method = RequestMethod.POST)
	public @ResponseBody
	ModelAndView registrarNotificacao(@RequestParam(value= "notificationCode") String nCode,
			@RequestParam(value = "notificationType") String ntype) {
	ModelAndView mv = new ModelAndView("compraFinalizada");
	
		try {
			Transaction transaction = NotificationService.checkTransaction(getCredencial(), nCode);
			
			switch (transaction.getStatus()) {
			case PAID:
				
				mv.addObject("situacao", "PagamentoEfetuado");
				return mv;
				
			case CANCELLED:
				mv.addObject("situacao", "Pagamento Cancelado");
				return mv;
				
			case WAITING_PAYMENT:
				mv.addObject("situacao", "Aguardando Pagamento");
				return mv;
				
			case IN_ANALYSIS:
				mv.addObject("situacao", "Pagamento Em Analise");
				return mv;
		
			}
		}catch (PagSeguroServiceException ex) {
			mv.addObject("erro", ex.getMessage());
			return mv;
		}
		return mv;
	}
}
