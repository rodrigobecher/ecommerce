<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
	<c:url value="/" var="contextPath" />
<meta charset="utf-8"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/estilos.css"/>
<link rel="stylesheet" type="text/css" href="/resources/css/carrinho.css"/>
<script src="/resources/ajax.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<script src="/resources/ajax.js"></script>

<title>Carrinho</title>
</head>
<body>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
				<div class="carousel-item active">
						<img class="d-block w-100" src="resources/imagens/Topo.jpg" alt="First slide">
				</div>
				<div class="carousel-item">
						<img class="d-block w-100" src="resources/imagens/paozinhos.jpg" alt="Second slide">
				</div>
				<div class="carousel-item">
						<img class="d-block w-100" src="resources/imagens/bolo.jpg" alt="Third slide">
				</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Anterior</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Próximo</span>
		</a>
</div>
<div>
		<nav class="navbar navbar-expand-lg navbar-light" id="navbar">
		<img src="/resources/imagens/logo.png" href="#" alt="Sem restrição">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
						<ul class="navbar-nav">
								<li class="nav-item">
									<a class="nav-link" href="/produto">Início <span class="sr-only">(current)</span></a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/produto">Produtos</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/carrinho">Carrinho</a>    
								</li>
								<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										Conta
								</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="/cliente">Criar</a>
						<a class="dropdown-item" href="/produto/itens">Entrar</a>
						
					</div>
				</li>
				<security:authorize access="hasRole('ROLE_ADMIN')">
								<li><a class="nav-link" href="/administrador">Área administrativa</a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()" var="autenticado">
						<security:authentication property="principal" var="usuario"/>
						<li><a class="nav-link" href="#">Olá ${usuario.username }</a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()" var="autenticado">
				<li><a class="nav-link" href="/logout">Sair</a></li>
				</security:authorize>
			</ul>
			</div>
	</nav>
</div>

<div class="card">
		<div class="card-body">
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
												
												<td class="money">
												<fmt:setLocale value="pt_br"/>
																 <fmt:formatNumber value = "${item.produto.precoVenda}" type = "currency"/>
													 </td>
												<td class="quantity-input-cell">
												<input type="number" min="0" style="width: 35px" readonly="readonly" id="quantidade" name="quantidade" value="${carrinhoCompras.getQuantidade(item) }"/></td>
												<td class="numeric-cell">
												<fmt:setLocale value="pt_br"/>
																 <fmt:formatNumber value = "${carrinhoCompras.getTotal(item)}" type = "currency"/>
												 </td>
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
											<td class="numeric-cell"><fmt:setLocale value="pt_br"/>
												 <fmt:formatNumber value = "${carrinhoCompras.total}" type = "currency"/></td>
											<td></td>
										</tr>
									</tfoot>
						</table>	
					 </section>	
		</div>
</div>
<footer id="footer">
				<div class="container">
						<div class="row">
								<div class="col-xs-12">
										<p>Page © - 2017</p>
										<p>Powered by <strong>Sem Restrição</strong></p>
								</div>
						</div>
				</div>
		</footer>

	 <script src="resources/ajax.js"></script>
</html>