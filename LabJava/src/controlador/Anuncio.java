package controlador;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.Part;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import BancoDados.Banco_teste;



public class Anuncio {
	
	private int idAnuncio;
	private String tituloAnuncio = null;
	private String descricaoAnuncio = null;
	private String tagAnuncio = null;
	private int tempoAnuncio;
	private String dataAnuncio = null;
	private int idUsuario;
	private int idGrupo;
    private byte[] image;
    private Banco_teste meuBD = new Banco_teste();

	public String getTituloAnuncio() {
		return tituloAnuncio;
	}
	public void setTituloAnuncio(String tituloAnuncio) {
		this.tituloAnuncio = tituloAnuncio;
	}
	public String getDescricaoAnuncio() {
		return descricaoAnuncio;
	}
	public void setDescricaoAnuncio(String descricaoAnuncio) {
		this.descricaoAnuncio = descricaoAnuncio;
	}
	public String getTagAnuncio() {
		return tagAnuncio;
	}
	public void setTagAnuncio(String tagAnuncio) {
		this.tagAnuncio = tagAnuncio;
	}
	public void setIdAnuncio(int idAnuncio) {
		this.idAnuncio = idAnuncio;
	}
	public int getTempoAnuncio() {
		return tempoAnuncio;
	}
	public void setTempoAnuncio(int tempoAnuncio) {
		this.tempoAnuncio = tempoAnuncio;
	}
	public String getDataAnuncio() {
		return dataAnuncio;
	}
	public void setDataAnuncio(String dataAnuncio) {
		this.dataAnuncio = dataAnuncio;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public int getIdAnuncio() {
		return idAnuncio;
	}
	public byte[] getImage() {
	        return image;
	}
	     
	public void setImage(byte[] image) {
	        this.image = image;
	}
	
	public String getByteArrayString()
	{
	   return new String(this.image);
	}
	
	public void apagarAnuncio(int idAnuncio) throws SQLException{
		meuBD.conexao();
		 String sql = "DELETE FROM Anuncio WHERE idAnuncio = ?";
		 PreparedStatement statement = (PreparedStatement) Banco_teste.con.prepareStatement(sql);
         statement.setInt(1, idAnuncio);  
         statement.executeUpdate();
         meuBD.desconecta();
	}
	
	 public int inserirAnuncio(Anuncio anuncio, Part filePart, InputStream inputStream) throws SQLException
	    {
		 meuBD.conexao();
		 String sql = "INSERT INTO Anuncio (tituloAnuncio, descricaoAnuncio, tagAnuncio, idUsuario, dataCadastroAnuncio, fotoAnuncio) values ( ?, ?, ?, ?, ?, ?)";
         PreparedStatement statement = (PreparedStatement) Banco_teste.con.prepareStatement(sql);
       
         statement.setString(1, anuncio.getTituloAnuncio());
         statement.setString(2, anuncio.getDescricaoAnuncio());
         statement.setString(3, anuncio.getTagAnuncio());
         statement.setInt(4, anuncio.getIdUsuario());
         statement.setDate(5, new java.sql.Date(System.currentTimeMillis()));
         
         
         try{
        	 if (inputStream != null) {
            	 //statement.setBlob(6, inputStream);
            	 
            	 statement.setBinaryStream(6, inputStream, (int) filePart.getSize());
                 
             }
             
         }catch(SQLException e){
        	 System.out.println("Erro inesperado ao salvar imagem");
        	 System.out.println(e.getLocalizedMessage());
         }
        
         int row = statement.executeUpdate();
         meuBD.desconecta();
         return row;
	    }
	  
	 
	 public ArrayList<Anuncio> listaAnuncios(int idUsu)
		{
			ArrayList<Anuncio> anunciosUsu = new ArrayList<Anuncio>();
			ResultSet rs = null;
			meuBD.conexao();
			
			try{
				PreparedStatement sql = (PreparedStatement)Banco_teste.con.prepareStatement("SELECT * FROM Anuncio WHERE idUsuario = " + idUsu);
				rs = sql.executeQuery();
				
				while(rs.next())
				{
					Anuncio a = new Anuncio();
					a.setTituloAnuncio(rs.getString("tituloAnuncio"));
					a.setDescricaoAnuncio(rs.getString("descricaoAnuncio"));
					a.setTagAnuncio(rs.getString("tagAnuncio"));
					a.setIdAnuncio(rs.getInt("idAnuncio"));
					a.setTempoAnuncio(rs.getInt("tempoAnuncio"));
					a.setDataAnuncio(rs.getString("dataCadastroAnuncio"));
					a.setIdGrupo(rs.getInt("idGrupo"));
					
//					Blob blob = rs.getBlob("fotoAnuncio");
//				    ImageIcon imageIcon = new ImageIcon(blob.getBytes(1, (int)blob.length())); 
//				    a.setImage(blob.getBytes(1, (int)blob.length()));
					
					anunciosUsu.add(a);
					
				}
				meuBD.desconecta();
				return anunciosUsu;
			}
			catch(Exception e)
			{
				
			}
			meuBD.desconecta();
			return null;		
		}
	 
	 public ArrayList<Anuncio> listaAnuncios()
	    {
		 ArrayList<Anuncio> todosOsAnuncios = new ArrayList<Anuncio>();
			ResultSet rs = null;
			meuBD.conexao();
			
			try{
				PreparedStatement sql = (PreparedStatement)Banco_teste.con.prepareStatement("SELECT * FROM Anuncio");
				rs = sql.executeQuery();
				while(rs.next())
				{
					Anuncio a = new Anuncio();
					
					a.setTituloAnuncio(rs.getString("tituloAnuncio"));
					a.setDescricaoAnuncio(rs.getString("descricaoAnuncio"));
					a.setTagAnuncio(rs.getString("tagAnuncio"));
					a.setIdAnuncio(rs.getInt("idAnuncio"));
					a.setTempoAnuncio(rs.getInt("tempoAnuncio"));
					a.setDataAnuncio(rs.getString("dataCadastroAnuncio"));
					a.setIdGrupo(rs.getInt("idGrupo"));
					
//					Blob blob = rs.getBlob("fotoAnuncio");
//				    ImageIcon imageIcon = new ImageIcon(blob.getBytes(1, (int)blob.length())); 
//					a.setImage(blob.getBytes(1, (int)blob.length()));
					
					todosOsAnuncios.add(a);
					
				}
				meuBD.desconecta();
				return todosOsAnuncios;
			}
			catch(Exception e)
			{
				
			}
			meuBD.desconecta();
			return null;
	    }
	 
	 public byte[] recuperaImagem(int idAnun)throws Exception{
		    meuBD.conexao();
	        PreparedStatement ps = (PreparedStatement) Banco_teste.con.prepareStatement("SELECT * FROM Anuncio WHERE idAnuncio = " + idAnun);
	        try {  
	            ResultSet resultado = ps.executeQuery();
	            if (resultado.next()) {
	            	Blob blob = resultado.getBlob("fotoAnuncio");
	            	meuBD.desconecta();
	            	return blob.getBytes(1, (int)blob.length());
	            }
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	        meuBD.desconecta();
	        return null;
	    }
	 public ArrayList<Anuncio> listaAnuncios(String tags){
		   String[] tagsDividadas = tags.split(",");
		   
		   //COLEÇÃO PARA NÃO TER ANUNCIOS DUPLICADOS
		   Set<Anuncio> anuncios = new HashSet<Anuncio>();
		   
		   ResultSet rs = null;
		   meuBD.conexao();
		   for (String tag : tagsDividadas) {
			   tag = tag.replace("'","");
		    
		    try{
		    
		     PreparedStatement sql = (PreparedStatement)Banco_teste.con.prepareStatement("SELECT * FROM Anuncio WHERE tagAnuncio like '%" + tag + "%'" );
		     rs = sql.executeQuery();
		     
		     while(rs.next())
		     {
		      Anuncio a = new Anuncio();
		      a.setTituloAnuncio(rs.getString("tituloAnuncio"));
		      a.setDescricaoAnuncio(rs.getString("descricaoAnuncio"));
		      a.setTagAnuncio(rs.getString("tagAnuncio"));
		      a.setIdAnuncio(rs.getInt("idAnuncio"));
		      a.setTempoAnuncio(rs.getInt("tempoAnuncio"));
		      a.setDataAnuncio(rs.getString("dataCadastroAnuncio"));
		      a.setIdGrupo(rs.getInt("idGrupo"));
		      
		      anuncios.add(a);
		      
		     }
		    }
		    catch(Exception e)
		    {
		     System.out.println("Erro ao listar anuncios no buscar" + System.lineSeparator() + e.getMessage());
		    }
		    
		   }
		   
		   meuBD.desconecta();
		   //converte para arrayList e retorna
		   System.out.println(anuncios.toString());
		   for (Anuncio anuncio : anuncios) {
			System.out.println(anuncio.getTituloAnuncio());
		}
		   return new ArrayList<Anuncio>(anuncios);  
		  }

}
