<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
	 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<title>Cadastro Cliente</title>
</head>
<body>
<div class="jumbotron text-center">
  <h1>Cadastro de Clientes</h1>
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
      	</ul>
      	
    </div><!-- /.navbar-collapse -->
  </div>
</nav>
	<div class="container">
	
		<form action="/cliente"  method="post">
			<div class="form-group">
				<label for="nome">Nome</label>
				<input type="text"  name="nome" id="nome" class="form-control" required autofocus>
			</div>
			<div class="form-group">
				<label for="sobrenome">Sobrenome</label>
				<input type="text" name="sobreNome" id="sobreNome" class="form-control" required>
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
				<button type="submit" class="btn btn-primary">Salvar</button>
			</div>
		</form>
		</div>	
</body>
</html>