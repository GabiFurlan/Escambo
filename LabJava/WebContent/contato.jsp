<!DOCTYPE html>
<html lang="en">

<head>

<%@ page import="controlador.*"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Escambo - Contato</title>

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
					<li><a href="sobre.jsp">Sobre</a></li>

					<li class="active"><a href="contato.jsp">Contato <span
							class="sr-only">(current)</span></a></li>

				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control"
							placeholder="Ex: Celular, Tablet ...">
					</div>
					<button type="submit" class="btn btn-default">Procurar</button>
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




<section>
			<div class="container">
				<div class="row">
					<div class="col-xs12">
						<h1>Email para contato:       suporte@escambo.com.br</h1>
						<p>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>




<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                <form class="form-horizontal" method="post">
                    <fieldset>
                        <legend class="text-center header">Contact us</legend>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="fname" name="name" type="text" placeholder="First Name" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="lname" name="name" type="text" placeholder="Last Name" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-envelope-o bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="email" name="email" type="text" placeholder="Email Address" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-phone-square bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="phone" name="phone" type="text" placeholder="Phone" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
                            <div class="col-md-8">
                                <textarea class="form-control" id="message" name="message" placeholder="Enter your massage for us here. We will get back to you within 2 business days." rows="7"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary btn-lg">Enviar</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<style>
    .header {
        color: #36A0FF;
        font-size: 27px;
        padding: 10px;
    }

    .bigicon {
        font-size: 35px;
        color: #36A0FF;
    }
</style>




	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>

<%@ include file="foot.jsp" %>