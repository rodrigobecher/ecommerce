<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/estilos.css"/>
<link rel="stylesheet" type="text/css" href="/resources/css/produtos.css"/>
<script src="/resources/ajax.js"></script>
<script src="/resources/grafico.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<title>Lista Produtos</title>
</head>
<body onload="paginacao()">

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
				<div class="carousel-item active">
						<img class="d-block w-100" src="/resources/imagens/Topo.jpg" alt="First slide">
				</div>
				<div class="carousel-item">
						<img class="d-block w-100" src="/resources/imagens/paozinhos.jpg" alt="Second slide">
				</div>
				<div class="carousel-item">
						<img class="d-block w-100" src="/resources/imagens/bolo.jpg" alt="Third slide">
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
                	<a class="nav-link" href="/produto/itens">Início <span class="sr-only">(current)</span></a>
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
							<li class="nav-item dropdown">
               	 	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Área administrativa
                </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="/administrador">Area do administrador</a>
						<a class="dropdown-item" href="/produto/cadastro">Cadastro Produto</a>
						
					</div>
				</li>	
				</security:authorize>
				<security:authorize access="isAuthenticated()" var="autenticado">
						<security:authentication property="principal" var="usuario"/>
						<li><a class="nav-link" href="#">Olá ${usuario.username }</a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()" var="autenticado">
				<li><a class="nav-link" href="/logout">Sair</a></li>
				</security:authorize>
				<li id="pesquisa">
					<form  class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="search" id="produto" placeholder="Pesquisa" aria-label="Pesquisa">
						<a href="#" class="btn btn-outline-success my-2 my-sm-0" id="btnpesquisa" onclick="buscaProduto()">Pesquisa</a>
						
					</form>
				</li>
			</ul>
	    </div>
	</nav>
</div>
<div class="box" id="checkboxrestricao">
	<div class="card">
		<div class="card-body">
				<div class="list-group">
				<form id="teste" onsubmit="validaChecked()" action="/produto/buscaRestricao">
					<c:forEach items="${restricao}" var="restricao">
						<c:set var="contains" value="false" />
							<c:forEach items="${cliente.restricoes}" var="restricaoProduto">										
								<c:if test="${restricao.idRestricao eq restricaoProduto.idRestricao}">
									<c:set var="contains" value="true"/>
									</c:if>
									
							</c:forEach>	
								<div class="checkbox">
								
									<input  name="restricao"  type="checkbox" value="${restricao.idRestricao}"
										<c:if test="${contains eq true}">
											checked
										</c:if>
											>${restricao.descricaoRestricao}</input>	
								</div>			
						</c:forEach>	
						<button type="submit" class="btn btn-sm" >Busca Restricao</button>
					</form>
					</div>
					
				
			</div>
		</div>
</div>
		<div> ${mensagem}</div>
<div id="listaProduto">
<div class="box">
		<div class="card lista">
			<div class="card-body" id="exibicaoprodutos" >
				<c:forEach items="${listaProduto}" var="produto"  >
					<div class="card" style="width: 11rem;" >
						<a href="#" onclick="pegaProduto(${produto.imagem.idImagem})" data-toggle="modal" data-target="#myModal" title="Detalhes">
							<c:if test="${produto.imagem.descricao != null }">
									<img class="card-img-top" src="imagens/${produto.imagem.descricao }" alt="imagem do Produto">					
							</c:if>
						</a>
						<div class="card-body" id="cardbodyproduto">
							<input type="hidden" id="pagina" value="${produto.paginas}">
							<h4 class="card-title"> ${produto.descricao}</h4>
							<p class="card-text"> ${produto.complemento}</p>
							<h2><span class="badge badge-success">
								<fmt:setLocale value="pt_br"/>
       								  <fmt:formatNumber value = "${produto.precoVenda }" type = "currency"/>
									</span></h2>
							<h4>Restrições</h4>
							<ul> 
							<c:forEach items="${produto.restricoes}" var="produtoRest" >
								<li>${produtoRest.descricaoRestricao }</li>
							</c:forEach>
							</ul>
							<p class="card-text">Quantidade Estoque: ${produto.quantidade }</p>
							<security:authorize access="hasRole('ROLE_ADMIN')">
								<p><a href="/produto/${produto.idProduto}" class="btn btn-sm">Alterar</a></p>
								<p><a href="/produto/excluir/${produto.imagem.idImagem}/${produto.idProduto}/${produto.imagem.descricao}" onclick="return confirm('Exluir?')" class="btn btn-sm" >Excluir</a></p>
							</security:authorize>
						</div>
					</div>
				</c:forEach>		
				</div>
		</div>
</div>		
</div>
<div>

	<footer id="footer">
			<div class="container">
					<div class="row">
							<div class="col-xs-12">
									<p>Page © - 2017</p>
									<p>Powered by <strong>Sem Restrição</strong></p>
							</div>
					</div>
			</div>
			<ul class="pager" id="paginas">
					
			</ul>
	</footer>
</div>


	
<div id="listaProduto">
	<div class="container">
		<div class="container">	
			<div class="modal fade" id="myModal" role="dialog" >
				<div class="modal-dialog"  >  
					<div class="modal-content" >
						<div class="modal-header" >
							<button type="button" class="close" onclick="limpaModal()" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Detalhes do Produto</h4>
						</div>
						<div class="modal-body" >
							<form method="post" id="form">			 
								<div id="descricao"> </div>
								<div id="imagem" > </div>
								<div class="card produto">
									Quantidade:
									<div class="card-body">
										<input type="number" id="quantidade"/>
										</br>
										Disponível:
										<div id="quantidadeDisponivel"></div>
									</div>
								</div>
								<input type="hidden" id="quantidadeEstoque" name="quantidadeEstoque">
								<input type="hidden" name="idProduto" id="idProduto">
							</form>
						</div>
						<div class="modal-footer" >
							<a href="#" onclick="validaQuantidade(event)" class="btn btn-custom btn-lg btn-block" data-dismiss="modal" > Adicionar no Carrinho </a>
							<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
						</div>
					</div>    
				</div> 
			</div>
		</div>
	</div>
</div>

	
</body>
</html>