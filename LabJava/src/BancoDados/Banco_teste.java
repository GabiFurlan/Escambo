package BancoDados;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.Part;
import javax.swing.ImageIcon;



import controlador.Anuncio;
import controlador.Usuario;

public class Banco_teste {

	String driver = "com.mysql.jdbc.Driver";
	String myUrl = "Jdbc:mysql://localhost:3306/Escambo";
	String usuario = "root";
	String senha = "vinicius";
	public static Connection con;
	
	public void conexao() {
		try {
			System.setProperty("jdbc.Drivers", driver);
			con = DriverManager.getConnection(myUrl, usuario, senha);
			System.out.println("Conexao Efetuada com sucesso");
		} catch (SQLException ex) {
			System.err.println(ex.getMessage());
		}
	}

	public void desconecta() {
		try {
			con.close();
			System.out.println("Bd desconectado com sucesso");

		} catch (SQLException ex) {
			System.out.println("Erro ao fechar a conexao \n	" + ex.getMessage());
		}

	}
	public static Usuario searchUser(String usuario, String senha) {
		Usuario meuUsuario = new Usuario();
		int idUsuario = 0;
		String loginUsuario = null;
		String nomeCompleto = null;
		Boolean nivelAcesso = false;
		String emailUsuario = null;
		try {
			// MUDAR O NOME PARA O NOME Q ESTA NA TABELA
			String query = "SELECT idUsuario, loginUsuario, nomeUsuario, nivelAcesso, emailUsuario FROM Usuario where loginUsuario ='" + usuario + "' AND senhaUsuario = '" + senha
					+ "'";
			// create the java statement
			Statement st = con.createStatement();
			// execute the query, and get a java resultset
			ResultSet rs = st.executeQuery(query);
			// iterate through the java resultset
			while (rs.next()) {
				idUsuario = rs.getInt("idUsuario");
				System.out.println(idUsuario);
				loginUsuario = rs.getString("loginUsuario");
				nomeCompleto = rs.getString("nomeUsuario");
				nivelAcesso = rs.getBoolean("nivelAcesso");
				emailUsuario = rs.getString("emailUsuario");
				System.out.println(emailUsuario);
				meuUsuario.setIdUsuario(idUsuario);
				//	nascimentoUsuario = rs.getString("nascimentoUsuario");
				meuUsuario.setEmail(emailUsuario);
				//	meuUsuario.setNascimentoUsuario(nascimentoUsuario);
				meuUsuario.setLogin(loginUsuario);
				meuUsuario.setNomeCom(nomeCompleto);
				meuUsuario.setNivelAces(nivelAcesso);
				// print the results
			}
			st.close();
		} catch (Exception e) {
			System.err.println("Houve uma excecao no Escambo associada ao banco de dados! ");
			System.err.println(e.getMessage());
		}
		if(idUsuario !=0){
			return meuUsuario;
		}else{
			return null;
		}
	}
}