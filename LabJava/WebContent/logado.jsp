<!DOCTYPE html>
<%-- <%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%> --%>
<html lang="en">
<%@ page import="BancoDados.Banco_teste"%>
<%@ page import="controlador.*"%>
<%@ page import="java.util.ArrayList" %>

<head>



<%
	if (session.getAttribute("user") == null) {

		response.sendRedirect("index.jsp");
	}
%>


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
					<li><a href="profile.jsp">Perfil</a></li>

					<li><a href="sobre.jsp">Sobre</a></li>
					<li><a href="contato.jsp">Contato</a></li>

				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" 
							placeholder="Ex: Celular, Tablet ..." id="procurarAnun">
					</div>
				<button type="button" class="btn btn-primary" id="procurar" >Procurar</button>
				</form>


				<form class="navbar-form navbar-right" action="logout" method="post">
					<label> <a href="profile.jsp">
							<%
								Usuario abc = (Usuario) session.getAttribute("user");
							%> <%out.println(abc.getLogin()); %>
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
	
	

<section>
		<div class="jumbotron text-center">
			<div class="container">
				<div class="row">
					<div class="col-xs12">
						<h1>Escambo</h1>
						<p>Anuncie aqui seus produtos usados.</p>
						<!-- 			<p>
							<a class="btn btn-primary btn-lg" href="sobre.jsp" role="button">Saiba
								Mais »</a>
						</p> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	<% 	
	Anuncio esteAnuncio = new Anuncio();
	Banco_teste meuBD = new Banco_teste();
	ArrayList<Anuncio> listaDeAnuncios = esteAnuncio.listaAnuncios();
	String url = null;
	int n = listaDeAnuncios.size();
	
		%>
	<div class="container well">
	<% 
		for(int i=0;i<n;i++){
			out.println("<div class='col-sm-6 col-md-3'>");
			out.println("<div class='thumbnail'>");
			esteAnuncio = listaDeAnuncios.get(i);
			int anun_Id  = esteAnuncio.getIdAnuncio();
			%><img src="CadAnun?anun_Id=<%=anun_Id%>&ac=mostrarFoto" width="200" height="190"/> <%
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

<!-- 

	<section>
		<div class="jumbotron text-center">
			<div class="container">
				<div class="row">
					<div class="col-xs12">
						<h1>Escambo</h1>
						<p>Anuncie aqui seus produtos usados.</p>
						<p>
							<a class="btn btn-primary btn-lg" href="sobre.jsp" role="button">Saiba
								Mais »</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<hr>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-12">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="thumbnail">
							<img src="img/iphone.jpg" alt="Iphone 4" class="img-responsive">
							<div class="caption">
								<h3>Iphone 4S</h3>
								<p>
									Troco/Vendo<br>R$ 450
								</p>
								<hr>
								<p class="text-center">
									<a href="#" class="btn btn-success" role="button">Detalhes</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="thumbnail">
							<img src="img/motog.jpg" alt="Thumbnail Image 1"
								class="img-responsive">
							<div class="caption">
								<h3>Moto G</h3>
								<p>
									Novo. Em ótimo estado <br> Vendo - R$ 550
								</p>
								<hr>
								<p class="text-center">
									<a href="#" class="btn btn-success" role="button">Detalhes</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6 hidden-sm hidden-xs">
						<div class="thumbnail">
							<img src="img/400X200.gif" alt="Thumbnail Image 1"
								class="img-responsive">
							<div class="caption">
								<h3>Heading</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<hr>
								<p class="text-center">
									<a href="#" class="btn btn-success" role="button">For Sale</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="thumbnail">
							<img src="img/400X200.gif" alt="Thumbnail Image 1"
								class="img-responsive">
							<div class="caption">
								<h3>Heading</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<hr>
								<p class="text-center">
									<a href="#" class="btn btn-success" role="button">For Rent</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="thumbnail">
							<img src="img/400X200.gif" alt="Thumbnail Image 1"
								class="img-responsive">
							<div class="caption">
								<h3>Heading</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<hr>
								<p class="text-center">
									<a href="#" class="btn btn-primary btn-success" role="button">For
										Sale</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 hidden-sm hidden-xs">
						<div class="thumbnail">
							<img src="img/400X200.gif" alt="Thumbnail Image 1"
								class="img-responsive">
							<div class="caption">
								<h3>Heading</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<hr>
								<p class="text-center">
									<a href="#" class="btn btn-success" role="button">For Rent</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
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
 -->





	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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

<%@ include file="foot.jsp"%>