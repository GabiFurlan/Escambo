package BancoDados;


	
	import java.sql.*;
	import java.util.ArrayList;

	import BancoDados.Banco_teste;


	public class Consulta{
	

		public int getId_consulta() {
			return id_consulta;
		}

		public void setId_consulta(int id_consulta) {
			this.id_consulta = id_consulta;
		}


		public int getId_Adm() {
			return id_Adm;
		}

		public void setId_Adm(int id_Adm) {
			this.id_Adm = id_Adm;
		}


		private int id_consulta;
	    private int id_Adm;


		public void salvar() {
			try {
				Connection conn = Banco_teste.getConexao();
				conn.setAutoCommit(true);
				PreparedStatement st = conn
						.prepareStatement("Insert into consulta (id_Adm,) "
								+ "values (?, ?, ?, ?, ?)");
				
				st.setInt(2, this.id_Adm);
				
				

				st.execute();

				conn.close();
			} catch (Exception e) {
			}
		}

		 public static ArrayList<Consulta> selecionar() {
			try {
				Connection conn = Banco_teste.getConexao();
				Statement st = conn.createStatement();
				ResultSet rs = st
						.executeQuery("select * from Consulta order by dataConsulta desc");

				ArrayList<Consulta> cons = new ArrayList<Consulta>();

				while (rs.next()) {
					Consulta c = new Consulta();
					
					c.id_Adm = rs.getInt("id_Adm");
					
		

					cons.add(c);

				}
				return cons;

			} catch (Exception e) {
			}

			return null;
		}

	}
		
		



