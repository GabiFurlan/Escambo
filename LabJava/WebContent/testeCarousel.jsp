<!DOCTYPE html>
<html lang="en">
<head>

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


	<div class="container">
		<h2>Categoria</h2>
		<p>Para facilitar sua busca.</p>
		<p>Selecione a categoria desejada.</p>
		<div class="dropdown">
			<button class="btn btn-default dropdown-toggle" type="button"
				id="menu1" data-toggle="dropdown">
				Categoria <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">

				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">Eletronicos</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">Eletrodomesticos</a></li>

				<li role="presentation" class="divider"></li>

				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">Mesas</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">Camas</a></li>

			</ul>
		</div>
	</div>



                                   <!-- cria os cointaners de venda -->



	<hr>

	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-12">
				<div class="row">
				
									<!-- cria um container de venda individual -->
				
				
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
							<div class="thumbnail">
							
						
  <br>
  
                                   <!--   cria o carousel de imagens  -->
  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img class="img-responsive" src="img/Gabriela.jpg" alt="Chania" >
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>

      <div class="item">
        <img  class="img-responsive" src="img/Bicudo.jpg" alt="Chania" >
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>
    
      <div class="item">
        <img  class="img-responsive" src="img/motog.jpg" alt="Flower" >
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img  class="img-responsive" src="img/iphone.jpg" alt="Flower" >
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

						                  <!-- 	acaba o carousel de imagens -->
							
							
						<!-- 	<img src="img/iphone.jpg" alt="Iphone 4" class="img-responsive"> -->
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
					
										<!-- acaba um conteiner individual -->
					
					
					<!-- cria um container de venda individual -->
				
				
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
							<div class="thumbnail">
							
						
  <br>
  
                                   <!--   cria o carousel de imagens  -->
  
  <div id="myCarousel-2" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img class="img-responsive" src="img/Gabriela.jpg" alt="Chania" >
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>

      <div class="item">
        <img  class="img-responsive" src="img/Bicudo.jpg" alt="Chania" >
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>
    
      <div class="item">
        <img  class="img-responsive" src="img/motog.jpg" alt="Flower" >
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img  class="img-responsive" src="img/iphone.jpg" alt="Flower" >
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel-2" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel-2" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

						                  <!-- 	acaba o carousel de imagens -->
							
							
						<!-- 	<img src="img/iphone.jpg" alt="Iphone 4" class="img-responsive"> -->
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
					
										<!-- acaba um conteiner individual -->
					
					
	<!-- cria um container de venda individual -->
				
				
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
							<div class="thumbnail">
							
						
  <br>
  
                                   <!--   cria o carousel de imagens  -->
  
  <div id="myCarousel-3" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img class="img-responsive" src="img/Pedro Antunes.jpg" alt="Chania" >
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>

      <div class="item">
        <img  class="img-responsive" src="img/Bicudo.jpg" alt="Chania" >
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>
    
      <div class="item">
        <img  class="img-responsive" src="img/motog.jpg" alt="Flower" >
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img  class="img-responsive" src="img/iphone.jpg" alt="Flower" >
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel-3" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel-3" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

						                  <!-- 	acaba o carousel de imagens -->
							
							
						<!-- 	<img src="img/iphone.jpg" alt="Iphone 4" class="img-responsive"> -->
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
					
										<!-- acaba um conteiner individual -->
					
					
					
				<!-- 	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
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
	</div> -->
	
								<!-- encerra os containers -->
	
	
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