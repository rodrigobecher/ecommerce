function paginacao(){
	var paginas = parseInt($("#pagina").val());
	var pagina = 1;
	var valores = 0;
	$('#paginas').append('<li class="lista"><button type="submit" onclick="buscaPagina(event)" class="btn btn-default" value='+valores+' > Pagina('+ pagina +')</button></li>');
	for (i = 1; i < paginas; i++) {
	    if (i % 5==0){
	    	pagina = pagina +1;
	    	valores = valores +5;
	    	 $('#paginas').append('<li class="lista"><button type="submit" onclick="buscaPagina(event)" class="btn btn-default" value='+valores+' > Pagina('+ pagina +')</button></li>');
	    	 
	    }
	}
}     
function buscaPagina(event){
	var valor = event.currentTarget.value;
	$.ajax({
		url:'/produto/pagina',
		data: "valor="+valor,
		success: function(result){
			$("#listaProduto").html(result);
	},
	error: function(result){
		$("#mensagem").html(result.responseText);
	}
	})
	
}


function buscaProdutorestricao(event){
	var elemento = document.getElementsByName('restricao');
	var a = [];
	for(i=0;i<elemento.length;i++){
		if(elemento[i].checked == true){
			a[i] = elemento[i];
			
		}
		else{
			
		}
	}
		
}
function buscaProduto(){
	var pesquisa = $("#produto").val();
	if (isNaN(pesquisa) || pesquisa != "") {
		if (pesquisa != null) {
			
		$.ajax({
			url:'/produto/pesquisa',
			data: "pesquisa="+pesquisa,
			success: function(result){
				$("#listaProduto").html(result);
		},
		error: function(result){
			$("#mensagem").html(result.responseText);
		}
		})
	}else{
		alert("Digite alguma informação");
		event.preventDefault();
	}
	
}else{
	alert("Digite uma letra ou palavra");
	event.preventDefault();
}	
}
function pegaProduto(id){
	limpaModal()
		$.ajax({
			url: '/api/produto/' + id,
			success: function(result){
			$("#descricao").html(result.descricao);
			$("#idProduto").val(result.idProduto);
			$("#quantidadeDisponivel").html(result.quantidade);
			$("#quantidadeEstoque").val(result.quantidade);
			$("#quantidade").append('<input type="number" min="0" max='+result.quantidade +'">');
			$("#imagem").append('<img width="250" height="136" src="imagens/'+ result.imagem.descricao +'">');
			}
		})
	}


function adicionarCarrinho(quantidade){
	var produtoId = $("#idProduto").val();
	$.ajax({
		url : '/carrinho/' +produtoId +'/'+ quantidade,
		//method: 'post',
		//data: produtoId, 
		success: function(result){
			$("#mensagem").html("Registro gravado");
			limpaModal();
			window.location.href = "/carrinho";
		},
		error: function(result){
			$("#mensagem").html(result.responseText);
		}
	})
}
function buscaCep(){
	var cep = $('#cep').val();
	$.ajax({
		url : '//viacep.com.br/ws/'+ cep +'/json/',
		success: function(result) {
			$("#cidade").val(result.localidade);
			$("#estado").val(result.uf);
			$("#logradouro").val(result.logradouro);		
		}
	});
}
function validaChecked() {
	var elemento = document.getElementsByName('restricao');
	var a = [];
	for(i=0;i<elemento.length;i++){
		if(elemento[i].checked == true){
			a[i] = elemento[i];
			
		}	
	}
	if (a.length == 0){
		alert("Escolha uma opcao");
		event.preventDefault();
	}
}

function validaQuantidade(event){
	var quantidade = parseInt($("#quantidade").val());
	var quantidadeEstoque = parseInt($("#quantidadeEstoque").val());
	if (!isNaN(quantidade)) {
		if(quantidade <= quantidadeEstoque){
			adicionarCarrinho(quantidade);
		}else{
			alert("Quantidade insuficiente em estoque");
			event.preventDefault();
		}
	}else{
		alert("Isso não é um número");
		event.preventDefault();
	}
}
function limpaModal(){
	$("#nome").html("");
	$("#imagem").html("");
	$("#quantidade").html("");
}

