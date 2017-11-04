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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
</head>
<title>Lista Produtos</title>
</head>
<body onclick="limpaModal()">
<div class="jumbotron text-center">
  <h1>Venda de Produtos</h1>
  <p>Compre agora!</p> 
</div>	
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/produto/cadastro"  class="btn btn-primary">Novo</a></li>
      <li class="active"><a href="/carrinho" rel="nofollow">Seu Carrinho (${carrinhoCompras.quantidade})</a></li>
    </ul>
  </div>
</nav>
  
<div class="container">
  	
  <div class="modal fade" id="myModal" role="dialog" >
    <div class="modal-dialog" >
    
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-header" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Detalhes do Produto</h4>
        </div>
        <div class="modal-body" >
        <form method="post" id="form">			
        	<input type="hidden" name="descricao" id="descricao">
        	
        	<div id="descricao1"> </div>
        	<div id="imagem" > </div>
        	<input type="hidden" name="idProduto" id="idProduto">
       	</form>
        </div>
        <div class="modal-footer" >
       	  <a href="#" onclick="adicionarCarrinho()" class="btn btn-primary" data-dismiss="modal" > Adicionar no Carrinho </a>
          <button type="button" onclick="limpaModal()" class="btn btn-default" data-dismiss="modal">Close</button>
          
        </div>
      </div>
      
    </div>
  </div>
  
		
		
		<div class="form-horizontal">
		
		</div>
		<h1>Produtos</h1>
		
		<div class="row">
			<c:forEach items="${imagem}" var="imagem"  >
   		
  			<div class="col-sm-6 col-md-4">
   				<div class="thumbnail">
   				 <a href="#" onclick="editarAjax(${imagem.idImagem})" data-toggle="modal" data-target="#myModal" title="Detalhes">
     				 <c:if test="${imagem.descricao != null }">
     				 	 <img class="img-responsive" src="imagens/${imagem.descricao }" alt="imagem do Produto" width="300px" height="450px" > 	
					</c:if>
					</a>
	     	 <div class="caption">
	     	 	
       				<p>${imagem.produto.descricao}</p>
					<p>${imagem.produto.complemento}</p>
					<c:forEach items="${imagem.produto.restricao1.lista}" var="produto" >
							<p>${produto.descricaoRestricao }</p>
					</c:forEach>
					<p>${imagem.produto.precoVenda }</p>
       			    <p><a href="produto/excluir/${imagem.idImagem}/${imagem.produto.idProduto}/${imagem.descricao}" onclick="return confirm('Exluir?')" class="btn btn-sm" >Excluir</a>
						<a href="produto/${imagem.idImagem}/${imagem.produto.idProduto}" class="btn btn-sm">Alterar</a></p>
				
      		</div>
    			</div>
  			</div>
 	 		</c:forEach>
		</div>
		
			
					
	</div>
	
<ul class="pager">
  <li><a href="#">Previous</a></li>
  <li><a href="#">Next</a></li>
</ul>
	<script src="ajax.js"></script>

</body>
</html>