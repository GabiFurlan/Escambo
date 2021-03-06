package controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
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

					request.getRequestDispatcher("jaexiste.jsp").forward(
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
				RequestDispatcher rs = request.getRequestDispatcher("jaexiste.jsp");
	            rs.include(request, response);
			}else{
				usuarioEditar.setNomeCom(request.getParameter("novoNome"));
				usuarioEditar.setEmail(request.getParameter("novoEmail"));
				usuarioEditar.setSenha(request.getParameter("novaSenha"));
				System.out.println((request.getParameter("novaSenha")));
				usuarioEditar.setNascimentoUsuario(request.getParameter("novoNascimento"));
				if (usuarioNovo.update(usuarioEditar)){
					System.out.println("Cadastro atualizado com sucesso!");
					RequestDispatcher rs = request.getRequestDispatcher("profile.jsp");
		            rs.include(request, response);
				}else{
					System.out.println("Erro ao atualizar o cadastro!");
					RequestDispatcher rs = request.getRequestDispatcher("editarperfil.jsp");
		            rs.include(request, response);
				}
			}
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("nomeusu");
		Usuario usuarioApagar = new Usuario();
		try {
			usuarioApagar.apagarUsuario(login);
			RequestDispatcher rs = request.getRequestDispatcher("profile.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("nao excluiu");
			e.printStackTrace();
		}
	}
}
