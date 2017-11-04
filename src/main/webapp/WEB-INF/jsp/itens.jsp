<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
	<c:url value="/" var="contextPath" />
	  <meta charset="utf-8"/>
		  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="icon"
			href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/favicon.ico?11981592617154272979"
			type="image/ico" />
		<link href="https://plus.googlecom/108540024862647200608"
			rel="publisher"/>
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>Carrinho</title>
		
</head>
<body>

  <header id="layout-header">
		<div class="clearfix container">
			<a href="/" id="logo">
			</a>
			<div id="header-content">
				<nav id="main-nav">
					
					<ul class="clearfix">
						
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<div class="container">
	<ul class="nav nav-pills">
	  <li class="active"><a href="/produto">Home</a></li>
	  <li class="active"><a href="/carrinho" rel="nofollow">Seu Carrinho (${carrinhoCompras.quantidade})</a></li>
	
	</ul>
	</div>
	<section class="container">
		  <h2 id="cart-title">Seu carrinho de compras</h2>
		  
		  
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
			          <td class="card"><img src="imagens/${item.imagem.descricao }" width="130px" height="100px"/></td>
			          <td class="item-title">${item.imagem.produto.descricao }</td>
			          <td class="money">${item.imagem.produto.precoVenda }</td>
			          <td class="quantity-input-cell">
			          	<input type="number" min="0" readonly="readonly" id="quantidade" name="quantidade" value="${carrinhoCompras.getQuantidade(item) }"/></td>
			          <td class="numeric-cell">${carrinhoCompras.getTotal(item) }</td>
			          <td class="remove-item">
			          	<form action="" method="post">
			         		<input type="image" src="imagens/${imagem.descricao }" alt="Excluir" title="Excluir" />
			         			
			         	</form>
			         </td>
			      </tr>
			      </c:forEach>
		      </tbody>
		      <tfoot>
		      	<tr>
		      		<td><input type="submit" class="btn btn-success" name="checkout" value="FinalizarCompra"></td>
		      		<td></td>
		      		<td></td>
		      		<td></td>
		      		<td class="numeric-cell">${carrinhoCompras.total}</td>
		      		<td></td>
		      	</tr>
		      </tfoot>
		    </table>
		  
		  </section>

		
		
	
</body>
</html>