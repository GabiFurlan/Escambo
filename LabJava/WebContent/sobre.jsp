<!DOCTYPE html>
<html lang="en">
<head>

<%@ page import="controlador.*"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Escambo - Sobre</title>

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
					<li>
											<%
							if (session.getAttribute("user") != null) {

								out.println("<a href= 'profile.jsp' >Perfil</a>");

							}
						%>
					</li>

					<li class="active"><a href="sobre.jsp">Sobre <span
							class="sr-only">(current)</span></a></li>
					<li><a href="contato.jsp">Contato</a></li>

				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" 
							placeholder="Ex: Celular, Tablet ..." id="procurarAnun">
					</div>
				<button type="button" class="btn btn-primary" id="procurar" >Procurar</button>
				</form>
			
<%
					if (session.getAttribute("user") != null) {
						Usuario abc = (Usuario) session.getAttribute("user");

						out.println("<form class='navbar-form navbar-right' action='logout' method='post'>");
						out.println("<label><a href='profile.jsp'>" + abc.getLogin() + "</a></label>");
						out.println("<button type='submit' class='btn btn-default'>Logout</button>");
					} else {
						
						out.println("<form class='navbar-form navbar-right' action='checkemail' method='post' >");
						out.println("<div class='form-group'>");
						
						out.println(
								"<label class='sr-only' for='exampleInputEmail3'>Email</label> <input type='text' class='form-control' name='indexemail'id='exampleInputEmail3'placeholder='Email - Usuário'>");
						out.println("</div>");
						out.println("<div class='form-group'>");
						out.println("<label class='sr-only' for='exampleInputPassword3'>Password</label>");
						out.println(
								"<input type='password' class='form-control'id='exampleInputPassword3' name='indexsenha'placeholder='Senha'>");
						out.println("</div>");
						out.println("<button type='submit' class='btn btn-default'>Entrar</button>");

						out.println("<label> <a href='cadastro.jsp'>Cadastrar</a></label>");
						out.println("</form>");

					}
				%>
			
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>



<!-- <section>
<div style="background-color:none !important" class="jumbotron text-center">
		
		 <div class="container">
				<div class="row">
					<div class="col-xs12">
						<h1>Escambo</h1>
					</div>
				</div>
		</div>
	</div>	
	</section>

 -->
<div class="container text-center">
<div class="row">
  <div class="col-md-12"></div>
   <h1>Grupo DC</h1>
  
				<h3>Sobre Nós</h3>
				<hr>
				<p>A Escambo-FT LTDA é um site que faz a intermediação entre
					pessoas que procuram vender ou trocar seus bens.</p>
				<p>A ideia é que após visto o anúncio no site, os interessados
					entrem em contato com o anúnciante.</p>
				<p>Obs: Nós não nos responsabilizamos por qualquer negociação
					feita apartir daqui.</p>
			</div>
</div>
</div>




 <div class="container text-center">
		<div class="row">
			<div class="col-lg-9 col-md-12">
			
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
						<div class="thumbnail">
							<h3>Gabriela Furlan</h3>
								<p>
									Prefiro Apple!<br>
								</p>
							<img src="img/Gabriela.jpg" alt="Gabriela" class="img-thumbnail">
							<div class="caption">		
							</div>
						</div>
					</div>

			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
						<div class="thumbnail">
							<h3>Henrrique Ramos</h3>
								<p>
									13 anos de Steam!!!<br>
								</p>
							<img src="img/Bicudo.jpg" alt="Hemrrique" class="img-thumbnail">
							<div class="caption">
							
								
							</div>
						</div>
					</div>

			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
						<div class="thumbnail">
							<h3>Pedro Antunes</h3>
								<p>
									Dota??<br>
								</p>
							<img src="img/Pedro Antunes.jpg" alt="PedroAntunes" class="img-thumbnail">
							<div class="caption">
							
								
							</div>
						</div>
					</div>
					
						</div>
						</div>
					</div>
					
 <div class="container text-center">
		<div class="row">
			<div class="col-lg-9 col-md-12">
					
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
						<div class="thumbnail">
							<h3>Pedro Maniero</h3>
								<p>
									Pokemon > Digimon<br>
								</p>
							<img src="img/Pedro Maniero.jpg" alt="PedroManiero" class="img-thumbnail">
							<div class="caption">
							
								
							</div>
						</div>
					</div>
					
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
						<div class="thumbnail">
							<h3>Vinicius Souza</h3>
								<p>
									Voce não tem fé!<br>
								</p>
							<img src="img/Vinicius.jpg" alt="ViniciusSouza" class="img-thumbnail">
							<div class="caption">
							
								
							</div>
						</div>
					</div>
 				</div>
			</div>
		</div>






	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<script>
$( "#procurar" ).click(function() {
	
	var tags = $( "#procurarAnun" ).val();
	
	window.location="anunciosTag.jsp?tag='"+ tags + "'";
});
</script>
</body>
</html>

<%@ include file="foot.jsp" %>