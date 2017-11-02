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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">

		
		<h1>Carrinho de compra</h1>
		<a href="/produto" class="btn btn-primary">Continuar comprando</a>
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
					<p>${imagem.produto.restricao}</p>
					<p>${imagem.produto.precoVenda }</p>
       			    <p><a href="produto/excluir/${imagem.idImagem}/${imagem.produto.idProduto}" onclick="return confirm('Exluir?')" class="btn btn-sm" >Excluir</a>
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