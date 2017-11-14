<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
	<c:url value="/" var="contextPath" />
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css/bootstrap.css" />
<link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css" />
<script src="/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/estilos.css"/>
<script src="/resources/ajax.js"></script>

<title>Carrinho</title>
</head>
<body>
<div class="jumbotron text-center">
  <h1>Carrinho de Compras</h1> 
</div>	
<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/produto">Sem Restricao</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<security:authorize access="hasRole('ROLE_ADMIN')">
        <li><a href="/produto/cadastro">Cadastro de Produtos</a></li>
        </security:authorize>
        </ul>
        <ul class="nav navbar-nav navbar-right">  
        	<security:authorize access="isAuthenticated()" var="autenticado">
        		<security:authentication property="principal" var="usuario"/>
        		<li><a href="#">Olá ${usuario.username }</a></li>
        	</security:authorize>
        	<c:if test="${usuario == null}">				
        	<li><a href="/carrinho/carrinhoLogin">Login ou cadastre-se</a></li>	
        	</c:if>
        	
        	<li><a href="/logout">Sair</a></li>
      	</ul>
      	
    </div><!-- /.navbar-collapse -->
  </div>
</nav>
	 
	<section class="container">
		<table class="table table-bordered" id="cart-table">
	   	 <thead class="thead-dark">
		   <tr>
		     <th class="cart-img-col"></th>
		     <th width="65%">Item</th>
			 <th width="10%">Preço</th>
		     <th width="10%">Quantidade</th>
		     <th width="10%">Total</th>
		     <th width="5%"></th>
		   </tr>
		 </thead>
		    <tbody>
		    	<c:forEach items="${carrinhoCompras.itens }" var="item">		    	
			     <tr>     	
			          <td class="card"><img src="imagens/${item.produto.imagem.descricao }" width="130px" height="100px"/></td>
			          <td class="item-title">${item.produto.descricao }</td>
			          <td class="money">${item.produto.precoVenda }</td>
			          <td class="quantity-input-cell">
			          <input type="number" min="0" readonly="readonly" id="quantidade" name="quantidade" value="${carrinhoCompras.getQuantidade(item) }"/></td>
			          <td class="numeric-cell">${carrinhoCompras.getTotal(item) }</td>
			          <td class="remove-item">
			          	<form action="carrinho/excluir/${item.produto.idProduto}/${carrinhoCompras.getQuantidade(item)}" method="post">
			          		<input type="submit" class="btn btn-danger" value="Excluir" title="Excluir" />
			         	</form>				         	
			          </td>   
			     </tr>
			    </c:forEach>			       
		    </tbody>
		      <tfoot>
		      	<tr>
		      	<td>
		      	
		      	<form action="/pagamento/finalizar" method="get">
				<button type="submit"  class="btn btn-success" >Finalizar Compra</button>
				</form>
				
		      	</td>  
		      		<td></td>
		      		<td></td>
		      		<td></td>
		      		<td class="numeric-cell">${carrinhoCompras.total}</td>
		      		<td></td>
		      	</tr>
		      </tfoot>
		</table>
		  
	 </section>
	 <script src="resources/ajax.js"></script>
</html>