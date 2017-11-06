<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<div class="container">
	<div class="container">	
	  <div class="modal fade" id="myModal" role="dialog" >
	  	<div class="modal-dialog"  >  
	      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header" >
		          <button type="button" class="close" onclick="limpaModal()" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Detalhes do Produto</h4>
		        </div>
		        <div class="modal-body" >
		        <form method="post" id="form">			 
		        	<div id="descricao"> </div>
		        	<div id="imagem" > </div>
		        	<input type="number" id="quantidade"/>
		        	<div id="quantidadeDisponivel"></div>
		        	<input type="hidden" id="quantidadeEstoque" name="quantidadeEstoque">
		        	<input type="hidden" name="idProduto" id="idProduto">
		       	</form>
		        </div>
		        <div class="modal-footer" >
		       	  <a href="#" onclick="validaQuantidade(event)" class="btn btn-primary" data-dismiss="modal" > Adicionar no Carrinho </a>
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>    
	      </div> 
	  </div>
	</div>
		<div class="row">
			<c:forEach items="${imagem}" var="imagem"  >
   		
  			<div class="col-sm-6 col-md-4">
   				<div class="thumbnail">
   				 <a href="#" onclick="pegaProduto(${imagem.idImagem})" data-toggle="modal" data-target="#myModal" title="Detalhes">
     				 <c:if test="${imagem.descricao != null }">
     				 	 <img class="img-responsive" src="imagens/${imagem.descricao }" alt="imagem do Produto" width="300px" height="450px" > 	
					</c:if>
					</a>
				     	 <div class="caption">
				     	 		<input type="hidden" id="pagina" value="${imagem.paginas}">
			       				<p>Descri��o: ${imagem.produto.descricao}</p>
								<p>Complemento: ${imagem.produto.complemento}</p>
								<p>Quantidade Estoque: ${imagem.produto.quantidade }</p>
								<h4>Restri��es</h4>
								<p>Pre�o unit�rio: ${imagem.produto.precoVenda }</p>
								<ul> 
									<c:forEach items="${imagem.produto.restricao1.lista}" var="produto" >
										 <li>${produto.descricaoRestricao }</li>
									</c:forEach>
								</ul>
			       			    <p><a href="produto/${imagem.idImagem}/${imagem.produto.idProduto}" class="btn btn-sm">Alterar</a>
			       			    <a href="produto/excluir/${imagem.idImagem}/${imagem.produto.idProduto}/${imagem.descricao}" onclick="return confirm('Exluir?')" class="btn btn-sm" >Excluir</a></p>
									
							
			      		</div>
    			</div>
  			</div>
 	 		</c:forEach>
		</div>						
</div>