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
	public ModelAndView Apresenta(Model modelo){
		ModelAndView mv = new ModelAndView("/listaProdutos");
		List<Imagem> list = repository.BuscaImgProduto();
		//List<Imagem> list = repository.busca();
		List<Restricao> rest = repository.buscaRestricaoProduto();
		mv.addObject("restricao", new ArrayList<Restricao>(rest));
		mv.addObject("produto", new ArrayList<Imagem>(list));
		return mv;
	}
	@PostMapping
	public String salvar(Produto produto, @RequestParam(name="codigo") int codigo , @RequestParam("foto") MultipartFile imagem) {
		ModelAndView mv = new ModelAndView("manterProdutos");
		if(!imagem.isEmpty()) {
			String diretorio ="C:\\Users\\bruli\\Pictures\\imagens\\";
			String nome = UUID.randomUUID().toString() + ".jpg";
			Path caminho = Paths.get(diretorio + nome);
			File file = new File(diretorio, nome);
			try {
				Files.write(caminho, imagem.getBytes());
				File thumbnailDirectory = new File("C:\\Users\\bruli\\Pictures\\imagens\\");
				File thumbnail = new File(thumbnailDirectory, nome);
				Thumbnails.of(file).size(600, 300).toFile(thumbnail);
		}catch (IOException e) {
			//result.addError(new ObjectError("imagem", "Problema ao gravar imagem"));;
			e.printStackTrace();
		}
			Imagem img = new Imagem();
			img.setIdImagem(codigo);
			img.setDescricao(nome);
			mv.addObject("produto", imagem);
			repository.save(img, produto);	
		}
		else if(imagem.isEmpty() && produto.getIdProduto() > 0) {
			Imagem img = new Imagem();
			img.setIdImagem(0);
			repository.save(img,produto);	
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
	@GetMapping("/{id}/{id}")
	public ModelAndView editar(Restricao restricao, @PathVariable Integer id){
		Imagem imagem = repository.findbyId(id);
		ModelAndView mv = new ModelAndView("/manterProdutos");	
		List<Restricao> rest = repository.buscaRestricao();
		//List<Restricao> restProduto = repository.buscaRestricaoProduto();
		//mv.addObject("restricaoProduto", new ArrayList<Restricao>(restProduto));
		mv.addObject("restricao", new ArrayList<Restricao>(rest));
		mv.addObject("imagem", imagem);
		return mv;
	}
	@GetMapping("/excluir/{id}/{id2}/{descricao}")
	public String excluir(@PathVariable String descricao,@PathVariable Integer id, @PathVariable Integer id2) throws IOException {
		try {
		repository.excluir(id, id2, descricao);
		return "redirect:/produto";
		}
		catch (IOException e) {
			return "redirect:/produto";
		}
	}
}

