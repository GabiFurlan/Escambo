package controlador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;




//import jdk.nashorn.internal.ir.RuntimeNode.Request;
import BancoDados.Banco_teste;

public class Usuario {

	private int idUsuario;
	private boolean nivelAces;
	private String login = new String();
	private String nomeCom = new String();
	private String email = new String();
	private String senha = new String();
	private String nascimento = new String();
	private Banco_teste meuBD = new Banco_teste();
	public static Connection con; 
	
	public boolean isNivelAces() {
	return nivelAces;
	}

	public void setNivelAces(boolean nivelAces) {
		this.nivelAces = nivelAces;
	}
	public String getLogin() {
		return login;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getNomeCom() {
		return nomeCom;
	}

	public void setNomeCom(String nomeCom) {
		this.nomeCom = nomeCom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public void setNascimentoUsuario(String nascimento){
		this.nascimento = nascimento;
	}
	public String getNascimentoUsuario() {
		return nascimento;
	}	
	
	public int getIdUsuario() {
		return idUsuario;
	}

	public Usuario() {
	}
	
	public void apagarUsuario(int idAnuncio) throws SQLException{
		meuBD.conexao();
		 String sql = "DELETE FROM Usuario WHERE idUsuario = ?";
		 PreparedStatement statement = (PreparedStatement) Banco_teste.con.prepareStatement(sql);
         statement.setInt(1, idUsuario);  
         statement.executeUpdate();
         meuBD.desconecta();
	}

	public boolean inserir(Usuario cliente){

		//chamar a funcao de login e email
		if(searchLogin(cliente) == true){

			System.out.println("voltou true para login");

			if(searchEmail(cliente) == true){

				String sql = "insert into Usuario "+ "(nomeUsuario, loginUsuario, senhaUsuario, emailUsuario, nascimentoUsuario)" + "values (?,?,?,?,?)";

				try{
					System.out.println("entrou no try");
					PreparedStatement stmt = (PreparedStatement) Banco_teste.con.prepareStatement(sql);
					stmt.setString(1,cliente.getNomeCom());
					stmt.setString(2,cliente.getLogin());
					stmt.setString(3,cliente.getSenha());
					stmt.setString(4,cliente.getEmail());
					stmt.setString(5,cliente.getNascimentoUsuario());

					stmt.execute();
					stmt.close();

				}catch(SQLException e){
					throw new RuntimeException(e);
				}

				return true;
			}

		}else{
			return false;
		}
		return false;
	}
	
	public boolean update(Usuario usuario){

		try {
			
			if(usuario.getSenha() != null){
				String sql = "UPDATE Usuario SET nomeUsuario = ?, senhaUsuario = ?, emailUsuario = ?, nascimentoUsuario = ? WHERE idUsuario = ?";
		         PreparedStatement statement = (PreparedStatement) Banco_teste.con.prepareStatement(sql);
		       
		         statement.setString(1, usuario.getNomeCom());
		         statement.setString(2, usuario.getSenha());
		         statement.setString(3, usuario.getEmail());
		         statement.setString(4, usuario.getNascimentoUsuario());
		         statement.setInt(5, usuario.getIdUsuario());
		         
		
				statement.executeUpdate();
				
			}else{
				String sql = "UPDATE Usuario SET nomeUsuario = ?, emailUsuario = ?, nascimentoUsuario = ? WHERE idUsuario = ?";

		         PreparedStatement statement = (PreparedStatement) Banco_teste.con.prepareStatement(sql);
			       
		         statement.setString(1, usuario.getNomeCom());
		         statement.setString(2, usuario.getEmail());
		         statement.setString(3, usuario.getNascimentoUsuario());
		         statement.setInt(4, usuario.getIdUsuario());
		
				statement.executeUpdate();
			}

		} catch (Exception e) {
			System.err.println("Houve uma excecao no Escambo associada ao banco de dados! ");
			System.err.println(e.getMessage());
			return false;
		}
		
		return true;

	}

	public boolean searchEmail(Usuario cliente){
		String email;
		email = cliente.getEmail();
		String emailUsuario = null;

		try {
			String query = "SELECT emailUsuario FROM Usuario where emailUsuario ='" + email + "'";

			Statement st = Banco_teste.con.createStatement();

			ResultSet rs = st.executeQuery(query);
			
			while (rs.next()) {
				emailUsuario = rs.getString("emailUsuario");
			}

			st.close();

		} catch (Exception e) {
			System.err.println("Houve uma excecao no Escambo associada ao banco de dados! ");
			System.err.println(e.getMessage());
		}

		if(emailUsuario == null){
			System.out.println("true");
			return true;
		}else{
			System.out.println("false");
			return false;
		}
	}

	public boolean searchEmailUsuarioCadastrado(Usuario cliente){
		String email;
		email = cliente.getEmail();
		String emailUsuario = null;

		try {
			String query = "SELECT emailUsuario FROM Usuario where emailUsuario ='" + email + "' and idUsuario <>" + cliente.getIdUsuario() ;

			Statement st = Banco_teste.con.createStatement();

			ResultSet rs = st.executeQuery(query);
			
			while (rs.next()) {
				emailUsuario = rs.getString("emailUsuario");
			}

			st.close();

		} catch (Exception e) {
			System.err.println("Houve uma excecao no Escambo associada ao banco de dados! ");
			System.err.println(e.getMessage());
		}

		if(emailUsuario == null){
			System.out.println("true");
			return true;
		}else{
			System.out.println("false");
			return false;
		}
	}

	
	public boolean searchLogin(Usuario cliente){
		String login = null;
		login = cliente.getLogin();
		String loginUsuario = null;

		try {
			String query = "SELECT loginUsuario FROM Usuario where loginUsuario ='" + login + "'";
			
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(query);

			// iterar pelo resultset
			while (rs.next()) {

				loginUsuario = rs.getString("loginUsuario");
			}
		
			st.close();

		} catch (Exception e) {
			System.err.println("Houve uma excecao no Escambo associada ao banco de dados! ");
			System.err.println(e.getMessage());
		}

		if(loginUsuario == null){
			System.out.println("true");
			return true;
		}else{
			System.out.println("false");
			return false;
		}
		
	}

	public Usuario searchUser(String usuario, String senha) {

		meuBD.conexao();
		Usuario meuUsuario = new Usuario();
		int idUsuario = 0;
		String loginUsuario = null;
		String nomeCompleto = null;
		int nivelAcesso = 0;
		String emailUsuario = null;
		String nascimentoUsuario = null;
		

		try {

			String query = "SELECT idUsuario, loginUsuario, nomeUsuario, nivelAcesso, emailUsuario FROM Usuario where loginUsuario ='" + usuario + "' AND senhaUsuario = '" + senha

					+ "'";

			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {

				idUsuario = rs.getInt("idUsuario");
				System.out.println(idUsuario);
				loginUsuario = rs.getString("loginUsuario");
				nomeCompleto = rs.getString("nomeUsuario");
				nivelAcesso = rs.getInt("nivelAcesso");
				emailUsuario = rs.getString("emailUsuario");
				nascimentoUsuario = rs.getString("nascimentoUsuario");
				System.out.println(emailUsuario);
				meuUsuario.setIdUsuario(idUsuario);
				meuUsuario.setEmail(emailUsuario);
				meuUsuario.setNascimentoUsuario(nascimentoUsuario);
				meuUsuario.setLogin(loginUsuario);
				meuUsuario.setNomeCom(nomeCompleto);
				

			}
			st.close();

		} catch (Exception e) {
			System.err.println("Houve uma excecao no Escambo associada ao banco de dados! ");
			System.err.println(e.getMessage());
		}
		if(idUsuario !=0){
			meuBD.desconecta();
			return meuUsuario;
		}else{
			meuBD.desconecta();
			return null;
		}
	}
}