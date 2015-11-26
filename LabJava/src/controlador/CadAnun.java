package controlador;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import BancoDados.Banco_teste;


/**
 * Servlet implementation class CadAnun
 */

@WebServlet("/CadAnun")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB

public class CadAnun extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("ac").equals("publicar")){
			
			Usuario abc = (Usuario) request.getSession().getAttribute("user");
			
			int idUsuario = abc.getIdUsuario();
			System.out.println(idUsuario);
			Banco_teste banco = new Banco_teste(); 
			Anuncio anuncio = new Anuncio();
			
			String titAnun = request.getParameter("titAnun");
			String descAnun = request.getParameter("descAnun");
			String tagAnun = request.getParameter("tagAnun");
			
			anuncio.setTituloAnuncio(titAnun);
			anuncio.setDescricaoAnuncio(descAnun);
			anuncio.setTagAnuncio(tagAnun);
			anuncio.setIdUsuario(idUsuario);
			
			InputStream inputStream = null;   // input stream of the upload file
			
			 Part filePart = request.getPart("fotoAnun");
		        if (filePart != null) {
		             
		            inputStream = filePart.getInputStream();
		        }
			
		        int row =0;
		        try {
					row = anuncio.inserirAnuncio(anuncio, filePart, inputStream);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}
		        if (row > 0) 
		        {
		       	 System.out.println("File uploaded!!!");
		            
		            banco.desconecta();
		            
		            RequestDispatcher rs = request.getRequestDispatcher("profile.jsp");
		            rs.include(request, response);
		        }
		        else
		        {
		       	 System.out.println("Couldn't upload your file!!!");
		            
		       	    banco.desconecta();
		            
		            RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
		            rs.include(request, response);
		        } 
		}
		   
	}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // recupera a imagem do banco em um Array de Bytes  
    	if(request.getParameter("ac").equals("mostrarFoto")){
    		Anuncio meuAnuncio = new Anuncio(); 
            byte[] imagemStream = null;
    		try {
    			imagemStream = meuAnuncio.recuperaImagem(Integer.parseInt(request.getParameter("anun_Id")) );
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		if(imagemStream != null){
    			response.setContentType( "image/jpeg" );  
    	        OutputStream out = response.getOutputStream();  
    	        out.write( imagemStream );  
    	        out.flush(); 
    		}
    	}else if(request.getParameter("ac").equals("apagar")){
			System.out.println("apagar");
			Anuncio meuAnuncio = new Anuncio(); 
			try {
				meuAnuncio.apagarAnuncio(Integer.parseInt(request.getParameter("anun_Id")));
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
         
    }                 
}
