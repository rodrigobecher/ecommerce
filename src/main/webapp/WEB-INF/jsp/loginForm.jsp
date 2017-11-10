<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css" />
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
		<H1>Login</H1>
			<form action="/login" method="post">
			<div class="form-group">
				<label for="login">Entre</label>
				<input type="text" name="username" /> 
			</div>
			<div class="form-group">
				<label for="senha">Senha</label>
				<input type="password" name="password" />
 			</div>
			<div class="form-group">	
				<button type="submit"  class="btn btn-primary">Entrar</button>
				<a href="/cliente" class="btn btn-sucess">Cadastre-se</a>
				
			</div>
		</form>
		</div>	
				
	
 <script src="resources/ajax.js"></script>
</body>
</html>