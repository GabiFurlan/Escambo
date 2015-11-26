package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BancoDados.Banco_teste;

//import javafx.scene.layout.Background;

/**
 * Servlet implementation class cadastrar
 */
@WebServlet("/cadastrar")
public class cadastrar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//para cadastro
		Usuario usuarioNovo = new Usuario();
		//para update
		Usuario usuarioEditar = new Usuario();
		
		usuarioEditar = (Usuario) request.getSession().getAttribute("user");

		usuarioNovo.setLogin(request.getParameter("usunomeusu"));
		usuarioNovo.setNomeCom(request.getParameter("usunomecomp"));
		usuarioNovo.setEmail(request.getParameter("usuemail"));
		usuarioNovo.setSenha(request.getParameter("usupwd"));
		usuarioNovo.setNascimentoUsuario(request.getParameter("usunascimento"));

		Banco_teste dao = new Banco_teste();

		dao.conexao();

		if (usuarioNovo.getLogin() != null && usuarioNovo.getLogin().length() >= 5) {

				if (usuarioNovo.inserir(usuarioNovo) == false) {

					request.getRequestDispatcher("cadastro.jsp").forward(
							request, response);

					System.out.println("usuario ja existe");

				} else {

					request.getRequestDispatcher("index.jsp").forward(request,
							response);

					System.out.println("usuario cadastrado");

				}

		} else {

			request.getRequestDispatcher("cadastro.jsp").forward(request,
					response);

			System.out.println("usuario <5 letras");

		}

		if (usuarioEditar != null) {
			if(!usuarioNovo.searchEmailUsuarioCadastrado(usuarioNovo)){
				System.out.println("Email já existe no cadastro");
				request.getRequestDispatcher("editarperfil.jsp").forward(
						request, response);
			}else{
				usuarioEditar.setNomeCom(request.getParameter("novoNome"));
				usuarioEditar.setEmail(request.getParameter("novoEmail"));
				usuarioEditar.setSenha(request.getParameter("novaSenha"));
				usuarioEditar.setNascimentoUsuario(request.getParameter("novoNascimento"));
				if (usuarioNovo.update(usuarioEditar)){
					System.out.println("Cadastro atualizado com sucesso!");
					response.sendRedirect("profile.jsp");
				}else{
					System.out.println("Erro ao atualizar o cadastro!");
					response.sendRedirect("editarperfil.jsp");
				}
			}
		}
	}
}
