<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="estilos.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
</head>
<title>Lista Produtos</title>
</head>
<body onclick="limpaModal()">

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
        	<div id="nome"> </div> 
        	<div id="imagem" > </div>
        	<input type="hidden" id="idProduto">
       		
        </div>
        <div class="modal-footer" >
       	  <a href="#" onclick="adicionarCarrinho($('#idProduto').val())" class="btn btn-primary" data-dismiss="modal" > Adicionar no Carrinho </a>
          <button type="button" onclick="limpaModal()" class="btn btn-default" data-dismiss="modal">Close</button>
          
        </div>
      </div>
      
    </div>
  </div>
  
		
		<div class="form-group">
				<form action="/imovel/pesquisa">
				<label for="parametro">Pesquisa</label>
				<input type="text" value="${param.parametro}" id="param" name="para"/>
				<button type="submit" class="btn btn-primary">Pesquisar</button>
				
			</form>
		</div>
		<div class="form-horizontal">
		<a href="/produto/cadastro"  class="btn btn-primary">Novo</a>
		</div>
		<h1>Produtos</h1>
		
		<div class="row">
			<c:forEach items="${produto}" var="imagem"  >
  
  			<div class="col-sm-6 col-md-4">
   				 <div class="thumbnail">
   				 <a href="#" onclick="editarAjax(${imagem.idImagem})" data-toggle="modal" data-target="#myModal" title="Detalhes">
     				 <c:if test="${imagem.descricao != null }">
						<img alt="imagem do Produto" src="imagens/${imagem.descricao }" class="img-responsive" width="304" height="236"/>
					</c:if>
					</a>
	     	 <div class="caption">
	     	 	
       				<p>${imagem.produto.descricao}</p>
					<p>${imagem.produto.complemento}</p>
					<c:forEach items="${restricao}" var="restricao" >
						<c:if test="${imagem.produto.idProduto == restricao.produto.idProduto }">
							<p>${restricao.descricaoRestricao }</p>
						</c:if>
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
	

	<script src="ajax.js"></script>
	
</body>
</html>