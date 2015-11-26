package BancoDados;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import controlador.Usuario;
/**
 * Servlet implementation class checkemail
 */
@WebServlet("/checkemail")
public class checkemail extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//System.out.println("aa");
		String nome = request.getParameter("indexemail"); 
		String senha = request.getParameter("indexsenha");
		Banco_teste L = new Banco_teste();

		//System.out.println("oi");
		try{
			L.conexao();	
		}catch(Exception e){
			System.out.println(e.getMessage());
		}

		Usuario abc = new Usuario();
		
		abc = L.searchUser(nome, senha);

		//System.out.println("teste"+ idusu);

		if(abc!=null)
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("user", abc);
			
			System.out.println("achou o usuario");
			getServletContext().getRequestDispatcher("/logado.jsp").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("esqueceu.jsp").forward(request, response);

		}
		L.desconecta();

	}

}
