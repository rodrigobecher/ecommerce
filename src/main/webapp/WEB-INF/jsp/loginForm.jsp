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
<link rel="stylesheet" type="text/css" href="resources/css/estilos.css"/>
<!-- <link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css" /> -->
<title>Login</title>
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

<div class="card">
    <div class="card-body">
        <section id="login">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="form-wrap">
                            <h1>Faça login  ou cadastre-se</h1>
                            <form action="/login" method="post" id="login-form" autocomplete="off">
                                <div class="form-group">
                                    <label for="username" class="sr-only">Usuario</label>
                                    <input  type="text" name="username" id="username" class="form-control" placeholder="Usuario">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="sr-only">Password</label>
                                    <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                                </div>
                                <input type="submit" id="btn-login" class="btn btn-custom btn-lg btn-block" value="Entrar">
                            </form>
                            <a href="/cliente" id="btn-login" class="btn btn-custom btn-lg btn-block" >Cadastre-se </a>
                            <hr>
                        </div>
                    </div> <!-- /.col-xs-12 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
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
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>