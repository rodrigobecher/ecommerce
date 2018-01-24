<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
