function editarAjax(id){
		$.ajax({
			url: '/api/produto/' + id,
			success: function(result){
			
			$("#nome").html(result.produto.descricao);
			$("#idProduto").val(result.produto.idProduto);
			$("#imagem").append('<img width="250" height="136" src="imagens/'+ result.descricao +'">');
			}
		})
	}

function adicionarCarrinho(idProduto){
	$.ajax({
		url : '/api/produto',
		method: 'post',
		data: {codigo:idProduto},
		success: function(result){
			$("#mensagem").html("Registro gravado");
			limpaModal();
			window.location.href = "/api/produto";
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