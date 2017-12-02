<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/estilos.css"/>
<link rel="stylesheet" type="text/css" href="/resources/css/clientes.css"/>
<script src="/resources/ajax.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<title>Cadastro Cliente</title>
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
		<li><a class="nav-link" href="/logout">Sair</a></li>
	</ul>
	</div>
</nav>
</div>

<form action="/cliente"  method="post">
<div class="card">
	<div class="card-body">
			<div class="form-group">
					<label for="nome">Nome</label>
					<input type="text"  name="nome" id="nome" class="form-control" required autofocus>
				</div>
				<div class="form-group">
					<label for="sobrenome">Sobrenome</label>
					<input type="text" name="sobreNome" id="sobreNome" class="form-control" required>
				</div>
				<div class="form-group">			
						<c:forEach items="${restricao}" var="restricao">
							<c:set var="contains" value="false" />
							<c:forEach items="${cliente.restricoes}" var="restricaoProduto">
								<c:if test="${restricao.idRestricao eq restricaoProduto.idRestricao}">
									<c:set var="contains" value="true"/>
								</c:if>
							</c:forEach>	
							
							<div class="checkbox">
								<input name="restricao"  type="checkbox" value="${restricao.idRestricao}"
									<c:if test="${contains eq true}">
										checked
									</c:if>
								>${restricao.descricaoRestricao}</input>	
							</div>			
						</c:forEach>
				</div>
				<div class="form-group">
					<label for="telefone">Telefone</label>
					<input type="tel" name="telefone" id="telefone" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="cpf">CPF</label>
					<input type="text" name="cpf"  id="cpf" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="cep">CEP</label>
					<input type="text" name="cep" onblur="buscaCep()" id ="cep" class="form-control"/> 
				</div>
				
					<table class="table-bordered">
						<tr>
							<th> Cidade</th>
							<th> Estado</th>
							<th> Logradouro</th>
						</tr>	
						<tr>
							<td>
								<div class="form-group">
									<input type="text" readonly="true" name="cidade" id ="cidade" class="form-control"/> 	
								</div>
							</td>
							<td>
								<div class="form-group">
									<input type="text" readonly="true" name="estado" id ="estado" class="form-control"/> 
								</div>
							</td>
							<td>
								<div class="form-group">
									<input type="text" readonly="true" name="logradouro" id ="logradouro" class="form-control"/> 
								</div>
							</td>			
						</tr>					 
						</table>
			
					<div class="form-group">
					<label for="numero">Numero da casa</label>
					<input type="text" name="numero" id ="numero" class="form-control"/> 
				</div>
				<div class="form-group">
					<label for="login">Login</label>
					<input type="text" name="login" id ="login" class="form-control"/> 
				</div>
				<div class="form-group">
					<label for="senha">senha</label>
					<input type="password" name="senha" id="senha" class="form-control"/>	
				 </div>
				<div class="form-group">	
					<button type="submit" class="btn btn-custom">Salvar</button>
				</div>
	</div>
</div>
</form>
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

</body>
</html>