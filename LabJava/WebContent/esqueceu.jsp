<!DOCTYPE html>
<html lang="en">
<head>
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
					<li class="active"><a href="index.jsp">Início <span
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

				<form class="navbar-form navbar-right" action="checkemail"
					method="post">
					<div class="form-group">
						<label class="sr-only" for="exampleInputEmail3">Email</label> <input
							type="text" class="form-control" name="indexemail"
							placeholder="Email">
					</div>
					<div class="form-group">
						<label class="sr-only" for="exampleInputPassword3">Password</label>
						<input type="password" class="form-control"
							name="indexsenha" placeholder="Password">
					</div>
					<button type="submit" class="btn btn-default">Entrar</button>
					<label> <a href="cadastro.jsp">Cadastrar</a></label>
				
				</form>
					

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
		
	</nav>
	<!FIM DA BARRA DE MENU>

	<div>
		<center>
			Opss :: Esqueceu senha?<br> Digite seu usuário e email
				para recuperar.<br>
				Ou clique
			
			<label><a href="cadastro.jsp" >aqui</a></label>
			para cadastrar.
		</center>

	</div>

	<form class="form-horizontal" action="esquecer" method="post">

		<div class="form-group form-group-sm">
			<label class="col-sm-1"> Nome de Usuário:</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name=esqusu
					" placeholder="Nome de Usuário">
			</div>
		</div>


		<div class="form-group form-group-sm">
			<label class="col-sm-1"> Email:</label>
			<div class="col-sm-2">
				<input type="email" class="form-control" name=esqemail
					" placeholder="Email">
			</div>
		</div>
		
		<button type="submit" class="btn btn-default">Enviar</button>
</form>
	</body>



</html>
<%@ include file="foot.jsp"%>