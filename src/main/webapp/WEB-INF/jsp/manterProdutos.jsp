<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<title>Cadastro de Produtos</title>
</head>
<body>
<div class="jumbotron text-center">
  <h1>Cadastro de Produtos</h1> 
</div>
<div class="container">
	
		<form action="/produto"  method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="descricao">Descrição</label>
				<input type="text" value="${imagem.produto.descricao }"  name="descricao" id="descricao" class="form-control" required autofocus>
			</div>
			<div class="form-group">
				<p>Complemento</p>
				<textarea name="complemento"   id="complemento" rows="4" cols="50" class="form-control">${imagem.produto.complemento }</textarea>
			</div>
			<div class="form-group">
					<c:forEach items="${restricao}" var="restricao"  >	
						<div class="checkbox">		
							<input name="restricao"  type="checkbox"value="${restricao.idRestricao}">${restricao.descricaoRestricao}	
						</div>			
					</c:forEach>
			</div>
			<div class="form-group">
				<label for="quantidade">Quantidade</label>
				<input type="number" value="${imagem.produto.quantidade }" name="quantidade" id ="quantidade" class="form-control"/> 
			</div>
			<div class="form-group">
				<label for="precoVenda">Preço de Venda</label>
				<input type="number" value="${imagem.produto.precoVenda }" name="precoVenda" id ="precoVenda" class="form-control"/> 
			</div>
			<div class="form-group">
				<label for="foto">Imagem</label>
				<input type="file" name="foto"id ="foto"/> 
			</div>
			<c:if test="${imagem.idImagem > 0 }">
				<input type="hidden" name="codigo" value="${imagem.idImagem}"/>
				<input type="hidden" name="idProduto" value="${imagem.produto.idProduto }"/>
			</c:if>
			<input type="hidden" name="codigo" value="0"/>
			<div class="form-group">	
				<button type="submit" onclick="tamanho(event)" class="btn btn-primary">Salvar</button>
				<a href="/produto" class="btn btn-default">Listar Produtos</a>
			</div>
		</form>
</div>	
</body>
</html>