<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="estilos.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
</head>
<title>Lista Produtos</title>
</head>
<body onload="paginacao()">
<div class="jumbotron text-center">
  <h1>Venda de Produtos</h1>
  <p>Compre agora!</p> 
</div>	
<nav class="navbar navbar-inverse bg-inverse">
  <ul class="nav navbar-nav">
      <li class="active"><a href="/produto/cadastro"  class="btn btn-primary">Novo</a><a href="/carrinho"  class="btn btn-primary">Carrinho (${carrinhoCompras.quantidade})</a></li>
    </ul>
</nav>
<div id="listaProduto">
<div class="container">
	<div class="container">	
	  <div class="modal fade" id="myModal" role="dialog" >
	  	<div class="modal-dialog"  >  
	      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header" >
		          <button type="button" class="close" onclick="limpaModal()" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Detalhes do Produto</h4>
		        </div>
		        <div class="modal-body" >
		        <form method="post" id="form">			 
		        	<div id="descricao"> </div>
		        	<div id="imagem" > </div>
		        	<input type="number" id="quantidade"/>
		        	<div id="quantidadeDisponivel"></div>
		        	<input type="hidden" id="quantidadeEstoque" name="quantidadeEstoque">
		        	<input type="hidden" name="idProduto" id="idProduto">
		       	</form>
		        </div>
		        <div class="modal-footer" >
		       	  <a href="#" onclick="validaQuantidade(event)" class="btn btn-primary" data-dismiss="modal" > Adicionar no Carrinho </a>
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>    
	      </div> 
	  </div>
	</div>
		<div class="row">
			<c:forEach items="${listaProduto}" var="produto"  >
   		
  			<div class="col-sm-6 col-md-4">
   				<div class="thumbnail">
   				 <a href="#" onclick="pegaProduto(${produto.imagem.idImagem})" data-toggle="modal" data-target="#myModal" title="Detalhes">
     				 <c:if test="${produto.imagem.descricao != null }">
     				 	 <img class="img-responsive" src="imagens/${produto.imagem.descricao }" alt="imagem do Produto" width="300px" height="450px" > 	
					</c:if>
					</a>
				     	 <div class="caption">
				     	 		<input type="hidden" id="pagina" value="${produto.paginas}">
			       				<p>Descrição: ${produto.descricao}</p>
								<p>Complemento: ${produto.complemento}</p>
								<p>Quantidade Estoque: ${produto.quantidade }</p>
								<h4>Restrições</h4>
								<p>Preço unitário: ${produto.precoVenda }</p>
								<h4>Restrições</h4>
								<ul> 
									<c:forEach items="${produto.restricoes}" var="produtoRest" >
										 <li>${produtoRest.descricaoRestricao }</li>
									</c:forEach>
								</ul>
								<p><a href="produto/${produto.idProduto}" class="btn btn-sm">Alterar</a></p>
								<p><a href="produto/excluir/${produto.imagem.idImagem}/${produto.idProduto}/${produto.imagem.descricao}" onclick="return confirm('Exluir?')" class="btn btn-sm" >Excluir</a></p>
			       			    
			      		</div>
    			</div>
  			</div>
 	 		</c:forEach>
		</div>						
</div>
</div>	
		<!--<form onsubmit="buscaPagina(event)">-->
		<ul class="pager" id="paginas">
			 
		</ul>
		
	<script src="ajax.js"></script>
</body>
</html>