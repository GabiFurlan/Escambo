<!DOCTYPE html>
<html lang="en">
<head>

<%
	if (session.getAttribute("user") != null) {

	}
	else
	{
		response.sendRedirect("index.jsp");
		
	}
%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@ page import="controlador.*"%>
<%@ page import="BancoDados.Banco_teste"%>
<%@ page import="java.util.ArrayList" %>
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
 .carousel-inner > .item > img,
 .carousel-inner > .item > a > img {
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

<% 	Usuario user = (Usuario) session.getAttribute("user"); 
	int userID = user.getIdUsuario();
	Anuncio esteAnuncio = new Anuncio();
	Banco_teste meuBD = new Banco_teste();
	ArrayList<Anuncio> listaDeAnuncios = esteAnuncio.listaAnuncios(userID);
	String url = null;
	int n = listaDeAnuncios.size();
	out.println(n);
	
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
			%>
			<a href="CadAnun?anun_Id=<%=anun_Id%>&ac=apagar" class="btn btn-primary" > DELETE</a>  <%
			//out.println("<a href='#' class='btn btn-primary' role='button'> DELETE </a>");
			out.println("</div>");
			out.println("</div>");
			}%>	
</div>



	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>

<%@ include file="foot.jsp"%>