<!DOCTYPE html>
<html lang="en">
<head>
<%@ page import="BancoDados.Banco_teste"%>
<%@ page import="controlador.*"%>
<%@ page import="java.util.ArrayList" %>
<%
	if (session.getAttribute("user") != null) {

		response.sendRedirect("logado.jsp");
	}
%>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

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
							placeholder="Email - Usuário">
					</div>
					<div class="form-group">
						<label class="sr-only" for="exampleInputPassword3">Password</label>
						<input type="password" class="form-control" name="indexsenha"
							placeholder="Password">
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

<% 	
	String tags=request.getParameter("tag");  
	out.println(tags);
	Anuncio esteAnuncio = new Anuncio();
	Banco_teste meuBD = new Banco_teste();
	ArrayList<Anuncio> listaDeAnuncios = esteAnuncio.listaAnuncios(tags);
	String url = null;
	int n = listaDeAnuncios.size();
	
		%>
	<div class="container well">
	<% 
		for(int i=0;i<n;i++){
			out.print(esteAnuncio.getImage());
			out.println("<div class='col-sm-6 col-md-3'>");
			out.println("<div class='thumbnail'>");
			esteAnuncio = listaDeAnuncios.get(i);
			int anun_Id  = esteAnuncio.getIdAnuncio();
			%><img src="CadAnun?anun_Id=<%=anun_Id%>&ac=mostrarFoto" width="118" height="106"/> <%
			out.println("</div>");
			out.println("<div class='caption'>");
			out.println("<h3>" + listaDeAnuncios.get(i).getTituloAnuncio() + "</h3>");
			out.println("<p>" + listaDeAnuncios.get(i).getDescricaoAnuncio()+ "</p>");
			out.println("</div>");
			out.println("</div>");
			}%>	
</div>


	<script type="text/javascript">
		var limeira = 25;
	</script>

	<div class="container well">
		<div class="row">
			<div class="col-xs-6 col-sm-6 col-lg-4 col-md-4">
				<span class="text-right"> </span>
				<h3>Sobre Nós</h3>
				<hr>
				<p>A Escambo-FT LTDA é um site que faz a intermediação entre
					pessoas que procuram vender ou trocar seus bens.</p>
				<p>A ideia é que após visto o anúncio no site, os interessados
					entrem em contato com o anúnciante.</p>
				<p>Obs: Nós não nos responsabilizamos por qualquer negociação
					feita apartir daqui.</p>
			</div>
			<div class="col-xs-6 col-sm-6 col-lg-4 col-md-4 hidden-sm hidden-xs">
				<span class="text-right"> </span>
				<h3>Últimas Notícias</h3>
				<hr>
				<div class="media-object-default">
					<div class="media">
						<div class="media-body">
							<h4 class="media-heading">Site Atualizado</h4>
							Removemos alguns defeitos com a barra superior,
							<p>Também foi introduzido novos links.</p>
						</div>
					</div>
					<div class="media">
						<div class="media-body">
							<h4 class="media-heading">Site Fora do Ar</h4>
							Estivesmo fora do ar por alguns momentos essa semana devido a
							falhas com o servidor local.
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-sm-6 col-lg-4 col-md-4">
				<span class="text-right"> </span>
				<h3>Fale Conosco</h3>
				<hr>

				<address>
					<strong>Escambo LTDA</strong><br> Pascoal Marmo 1888,<br>
					Limeira, SP, CEP: 13484-332 <br> <abbr title="Phone">Tel:</abbr>
					(19) 9456-7890
				</address>

				<address>
					<strong>Henrique Bicudo</strong><br> <a href="mailto:#">escambo@example.com</a>
				</address>
			</div>
		</div>
	</div>






	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>

<%@ include file="foot.jsp"%>