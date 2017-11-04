function editarAjax(id){
		$.ajax({
			url: '/api/produto/' + id,
			success: function(result){
			
			$("#descricao").val(result.produto.descricao);
			$("#descricao1").html(result.produto.descricao);
			$("#idProduto").val(result.produto.idProduto);
			$("#imagem").append('<img width="250" height="136" src="imagens/'+ result.descricao +'">');
			}
		})
	}

function adicionarCarrinho(){
	var produtoId = $("#idProduto").val();
	$.ajax({
		url : '/carrinho/' +produtoId,
		//method: 'post',
		//data: produtoId, 
		success: function(result){
			$("#mensagem").html("Registro gravado");
			limpaModal();
		//	window.location.href = "/api/produto";
		},
		error: function(result){
			$("#mensagem").html(result.responseText);
		}
	})
}


function CarregaCarrinho(){
	$.ajax*{
		url:'/api/produto',
		success:function(result){
			result.forEach(load);
		}
	}
}
function carregarContato(){
	$.ajax({
		url: '/api/contato',
		success: function(result){
			result.forEach(load);
		}
	})	
	
}
function load(contato){
	var option = new Option(contato.nome, contato.id);
	$("#opcoesContato").append(option);
}		
function limpaModal(){
	$("#nome").html("");
	$("#imagem").html("");
}