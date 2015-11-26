<!DOCTYPE html>
<%@page import="controlador.Usuario"%>
<%@page import="javax.swing.text.Document"%>
<html lang="en">
<head>
<%
	if (session.getAttribute("user") == null) {

	} else {
		response.sendRedirect("index.jsp");

	}
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Escambo - Cadastro</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	</br>

	<div>


		<label>Cadastro de Usuário</label>
		<hr>


	</div>
	<div>
		<form class="form-horizontal" action="cadastrar" method="post">

			<div class="form-group form-group-sm">
				<label class="col-sm-1"> Nome de Usuário:</label>
				<div class="col-sm-2">
					<input type="text" id="nomeusu" class="form-control"
						name="usunomeusu" placeholder="Nome de Usuário">

					<script>		
function tamanho()
{
				Usuario usuario = new Usuario();
				var dota = document.getElementById("nomeusu").value;
				if(dota.length<5)
				{
					alert("Tamanho insuficiente");
				}
				else if(!usuario.searchEmail(document.getElementByName("usuemail").value))
				{
					
					alert("Email já cadastrado. Digite outro email")
				}
				else
				{
					var x = document.getElementById("mybtn").type = "submit";
					alert("Cadastrado");				
				}
}
</script>
				</div>
			</div>


			<div class="form-group form-group-sm">
				<label class="col-sm-1"> Nome Completo:</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name=usunomecomp
						" placeholder="Nome Completo">
				</div>
			</div>



			<div class="form-group form-group-sm">
				<label class="col-sm-1">Endereço de email:</label>
				
				<div class="col-sm-2">
					<input type="email" class="form-control" name="usuemail"
						placeholder="Email">
				</div>
			</div>



			<div class="form-group form-group-sm">
				<label class="col-sm-1">Senha:</label>
				<div class="col-sm-2">
					<input type="password" class="form-control" name="usupwd"
						placeholder="Password">
				</div>
			</div>



			<div class="form-group form-group-sm">
				<label class="col-sm-1"> Data de Nascimento:</label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="usunascimento">
				</div>
			</div>
			<div>
				<button type="button" class="btn btn-success" id="mybtn"
					onClick="tamanho()">Cadastrar</button>
				<button type="reset" class="btn btn-warning">Limpar</button>
				<button type="button" class="btn btn-danger"
					onClick="history.go(-1);return true">Voltar</button>


			</div>


		</form>
	</div>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>

<%@ include file="foot.jsp"%>