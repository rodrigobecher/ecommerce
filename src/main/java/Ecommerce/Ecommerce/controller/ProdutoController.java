package Ecommerce.Ecommerce.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import Ecommerce.Ecommerce.model.Imagem;
import Ecommerce.Ecommerce.model.Produto;
import Ecommerce.Ecommerce.model.Restricao;
import Ecommerce.Ecommerce.repository.ProdutoRepository;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/produto")
public class ProdutoController {
	@Autowired
	ProdutoRepository repository;
	@GetMapping
	public ModelAndView apresenta(Model modelo){
		int valor = 0;
		ModelAndView mv = new ModelAndView("/listaProdutos");
		List<Produto> list = repository.buscaPaginas(valor);
		mv.addObject("listaProduto", new ArrayList<Produto>(list));
		List<Restricao> restricao = repository.buscaRestricao();
		mv.addObject("restricao", new ArrayList<Restricao>(restricao));
		return mv;
	}
	@RequestMapping(value ="/itens", method=RequestMethod.GET)
	public ModelAndView buscaProduto(Model modelo){
		int valor = 0;
		ModelAndView mv = new ModelAndView("/listaProdutos");
		List<Produto> list = repository.buscaPaginas(valor);
		mv.addObject("listaProduto", new ArrayList<Produto>(list));
		return mv;
	}
	@GetMapping("/pagina")
	public ModelAndView apresentaPagina(@RequestParam(name="valor", required=false) Integer  valor,Model modelo){
		if(valor == null) {
		valor = 0;
		}
		ModelAndView mv = new ModelAndView("ajaxProduto");
		List<Produto> list = repository.buscaPaginas(valor);
		mv.addObject("listaProduto", new ArrayList<Produto>(list));
		return mv;
	}
	
	
	@PostMapping
	public String salvar(Produto produto, @RequestParam(name="codigo") int codigo , @RequestParam("foto") MultipartFile imagem) {
		ModelAndView mv = new ModelAndView("manterProdutos");
		if(!imagem.isEmpty()) {
			String diretorio ="C:\\Users\\rodrigo\\Pictures\\imagens\\";
			String nome = UUID.randomUUID().toString() + ".jpg";
			Path caminho = Paths.get(diretorio + nome);
			File file = new File(diretorio, nome);
			file.canRead();
			try {
				Files.write(caminho, imagem.getBytes());
				File thumbnailDirectory = new File("C:\\Users\\rodrigo\\Pictures\\imagens\\");
				File thumbnail = new File(thumbnailDirectory, nome);			
				Thumbnails.of(file).size(500, 200).toFile(thumbnail);
		}catch (IOException e) {
			//result.addError(new ObjectError("imagem", "Problema ao gravar imagem"));;
			e.printStackTrace();
		}
		
			Imagem img = new Imagem();
			img.setIdImagem(codigo);
			img.setDescricao(nome);
			produto.setImagem(img);
			mv.addObject("produto", produto);
			repository.save(produto);	
		}
		else if(imagem.isEmpty() && produto.getIdProduto() > 0) {
			Imagem img = new Imagem();
			img.setIdImagem(0);
			repository.save(produto);	
		}
		return "redirect:/produto";
	}
	@GetMapping("/cadastro")
	public ModelAndView cadastrar(Model modelo) {
		ModelAndView mv = new ModelAndView("/manterProdutos");
		List<Restricao> list = repository.buscaRestricao();
		mv.addObject("restricao", new ArrayList<Restricao>(list));
		return mv;
	}
	@GetMapping("/{id}")
	public ModelAndView editar(@PathVariable int id){
		Produto produto = repository.buscaIdProduto(id);
		ModelAndView mv = new ModelAndView("/manterProdutos");	
		//List<Restricao> rest = repository.buscaRestricao();
		//mv.addObject("restricao", new ArrayList<Restricao>(rest));
		mv.addObject("produto", produto);
		return mv;
	}
	@GetMapping("/excluir/{idProduto}/{idImagem}/{descricao}")
	public String excluir(@PathVariable int idProduto,@PathVariable int idImagem, @PathVariable String descricao ) throws IOException {
		try {
			repository.excluir(idProduto, idImagem);
		return "redirect:/produto";
		}
		catch (IOException e) {
			return "redirect:/produto";
		}
		
	}
}

