package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class esquecer
 */
@WebServlet("/esquecer")
public class Esquecer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String usuario = request.getParameter("esqusu");
		String email = request.getParameter("esqemail");
	
	
	}

}
