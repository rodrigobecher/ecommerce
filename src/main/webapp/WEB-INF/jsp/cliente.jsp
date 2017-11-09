<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
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
				<input type="text" name="cep" id ="cep" class="form-control"/> 
			</div>
			<div class="form-group">
				<label for="cidade">Cidade</label>
				<input type="text" name="cidade" id ="cidade" class="form-control"/> 
			</div>
			<div class="form-group">
				<label for="estado">Estado</label>
				<input type="text" name="estado" id ="estado" class="form-control"/> 
			</div>
			<div class="form-group">
				<label for="logradouro">Logradouro</label>
				<input type="text" name="logradouro" id ="logradouro" class="form-control"/> 
			</div>
 			 <div class="form-group">
				<label for="numero">Numero da casa</label>
				<input type="text" name="numero" id ="numero" class="form-control"/> 
			</div>
			<div class="form-group">
				<label for="login">Login</label>
				<input type="text" name="login" id ="login" class="form-control"/> 
				<label for="senha">senha</label>
				<input type="password" name="senha" id="senha" class="form-control"/>
				<c:if test="${usuario.login != null}">
			    	<h4>Usuario ou senha inválidos</h4>
			    </c:if>
 			</div>
			<div class="form-group">	
				<button type="submit" class="btn btn-primary">Salvar</button>
			</div>
		</form>
		</div>	
</body>
</html>