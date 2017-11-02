<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
	
		<form action="cliente/logar"  method="post">
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
				<button type="submit" class="btn btn-primary">Logar</button>
			</div>
		</form>
		</div>	
				
	

</body>
</html>