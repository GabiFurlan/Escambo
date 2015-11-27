<!DOCTYPE html>
<html lang="en">
<head>

<%
	if (session.getAttribute("user") != null) {

	} else {
		response.sendRedirect("index.jsp");

	}
%>
<%@ page import="controlador.*"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<!--   <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 50%;
      max-height: 50px !important;
      margin: auto;
  }
  </style> -->

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	display: block;
	/*    max-width: 100%; 
      max-height: 100%;  */
	height: 200px !important;
	width: 300px !important;
}
</style>



<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Escambo</title>

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




	<!BARRA DE MENU>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">Escambo</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">

					<li><a href="index.jsp">Início</a></li>
					<li class="active"><a href="profile.jsp">Perfil <span
							class="sr-only">(current)</span></a></li>
					<li><a href="sobre.jsp">Sobre</a></li>
					<li><a href="contato.jsp">Contato</a></li>

				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control"
							placeholder="Ex: Celular, Tablet ...">
					</div>
					<button type="submit" class="btn btn-default">Procurar</button>
				</form>


				<form class="navbar-form navbar-right" action="logout" method="post">
					<label> <a href="profile.jsp"> <%
 					Usuario abc = (Usuario) session.getAttribute("user");
 					out.println(abc.getLogin());
 %>
					</a>
					</label>
					<button type="submit" class="btn btn-default">Logout</button>

				</form>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->

	</nav>
	<!FIM DA BARRA DE MENU>




	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="well well-sm">
					<form class="form-horizontal" action="cadastrar" method="post">
						<fieldset>
							<legend class="text-center header">Editar Perfil</legend>

							<div class="form-group">
								<span class="col-md-1 col-md-offset-2 text-center"><i
									class="fa fa-user bigicon"></i></span>
								<div class="col-md-8">
									
										<label>Digite seu nome novo:</label> <input required id="fname"
											name="novoNome" type="text" placeholder="Digite seu nome completo"
											value="<%out.println(abc.getNomeCom());%>"
											class="form-control">
									
								</div>
							</div>
							<div class="form-group">
								<span class="col-md-1 col-md-offset-2 text-center"><i
									class="fa fa-user bigicon"></i></span>
								<div class="col-md-8">
									<label>Digite seu email novo:</label> <input required id="fname"
										type="email" class="form-control" name="novoEmail" placeholder="Digite seu novo email"
										value="<%out.println(abc.getEmail()); %>">
								</div>
							</div>

							<div class="form-group">
								<span class="col-md-1 col-md-offset-2 text-center"><i
									class="fa fa-user bigicon"></i></span>
								<div class="col-md-8">
									<label>Data de nascimento:</label> <input required id="fname"
										name="novoNascimento" type="text" placeholder="dd/mm/aaaa"
										value="<%out.println(abc.getNascimentoUsuario()); %>"
										class="form-control">

								</div>
							</div>



							<div class="form-group">
								<span class="col-md-1 col-md-offset-2 text-center"><i
									class="fa fa-user bigicon"></i></span>
								<div class="col-md-8">
									<label>Senha:</label> <input id="fname" name="novaSenha" value=""
										type="password" placeholder="Digite sua nova senha" class="form-control">

								</div>
							</div>
							<div class="form-group">
								<span class="col-md-1 col-md-offset-2 text-center"><i
									class="fa fa-user bigicon"></i></span>
								<div class="col-md-8">
								<input type="hidden"  name="idUsuario" value=<% abc.getIdUsuario(); %>/>
								<button type="submit">Salvar</button>
								<button type= "button" class="btn btn-default" onClick="history.go(-1);return true">Voltar</button>
	</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>



	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>

<%@ include file="foot.jsp"%>