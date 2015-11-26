package Main;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.Box;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import Main.Login;



public class Login extends JFrame implements ActionListener {

	JPanel panelFields, panelButtons, panelLogin, panelAlterPassword,
			panelLoginFields, panelLoginLabel, panelAlterFields,
			panelAlterLabel;
	JLabel label1, label2, labelUsuario, labelSenha, labelNovaSe,
			labelConSenha;
	JTextField textUsuario;
	static JPasswordField textSenha;
	JPasswordField textNovaSe;
	JPasswordField textConSenha;
	JButton buttonCancelar, buttonLimpar, buttonEntrar;
	
	String usuario;
	String senha;
		public Login() {

			Color azulClaro = new Color(198, 226, 255);
			Color amareloClaro = new Color(255, 255, 160);

			label1 = new JLabel("Login");
			label2 = new JLabel("Alteracao de Senha");

			labelUsuario = new JLabel("Usuario: ");
			labelSenha = new JLabel("Senha: ");
			labelNovaSe = new JLabel("Nova Senha: ");
			labelConSenha = new JLabel("Confirme a senha: ");

			textUsuario = new JTextField();
			textSenha = new JPasswordField();
			textNovaSe = new JPasswordField();
			textConSenha = new JPasswordField();

			buttonCancelar = new JButton("Cancelar");
			buttonLimpar = new JButton("Limpar");
			buttonEntrar = new JButton("Entrar");

			buttonCancelar.addActionListener(this);
			buttonLimpar.addActionListener(this);
			buttonEntrar.addActionListener(this);

			panelFields = new JPanel();
			panelButtons = new JPanel();
			panelLogin = new JPanel();
			panelAlterPassword = new JPanel();
			panelLoginFields = new JPanel();
			panelLoginLabel = new JPanel();
			panelAlterFields = new JPanel();
			panelAlterLabel = new JPanel();

			/*panelLoginFields.setBorder(javax.swing.BorderFactory
					.createEtchedBorder());
			panelAlterFields.setBorder(javax.swing.BorderFactory
					.createEtchedBorder());*/

			panelLoginLabel.setLayout(new FlowLayout(FlowLayout.CENTER, 5, 5));
			panelLoginLabel.setBackground(amareloClaro);
			panelLoginLabel.add(label1);

			panelLoginFields.setLayout(new GridLayout(2, 2, 10, 10));
			panelLoginFields.setBackground(Color.WHITE);
			panelLoginFields.add(labelUsuario);
			panelLoginFields.add(textUsuario);
			panelLoginFields.add(labelSenha);
			panelLoginFields.add(textSenha);

			panelLogin.setLayout(new BorderLayout(5, 5));
			panelLogin.setBackground(Color.WHITE);
			panelLogin.add(panelLoginLabel, BorderLayout.NORTH);
			panelLogin.add(panelLoginFields, BorderLayout.CENTER);
			panelLogin.add(Box.createRigidArea(new Dimension(50, 0)), BorderLayout.EAST);
			panelLogin.add(Box.createRigidArea(new Dimension(50, 0)), BorderLayout.WEST);

			panelAlterLabel.setLayout(new FlowLayout(FlowLayout.CENTER, 5, 5));
			panelAlterLabel.setBackground(amareloClaro);
			panelAlterLabel.add(label2);

			panelAlterFields.setLayout(new GridLayout(2, 2, 10, 10));
			panelAlterFields.setBackground(Color.WHITE);
			panelAlterFields.add(labelNovaSe);
			panelAlterFields.add(textNovaSe);
			panelAlterFields.add(labelConSenha);
			panelAlterFields.add(textConSenha);

			panelAlterPassword.setLayout(new BorderLayout(5, 5));
			panelAlterPassword.setBackground(Color.WHITE);
			panelAlterPassword.add(panelAlterLabel, BorderLayout.NORTH);
			panelAlterPassword.add(panelAlterFields, BorderLayout.CENTER);
			panelAlterPassword.add(Box.createRigidArea(new Dimension(50, 0)), BorderLayout.EAST);
			panelAlterPassword.add(Box.createRigidArea(new Dimension(50, 0)), BorderLayout.WEST);

			panelFields.setLayout(new GridLayout(2, 1, 5, 5));
			panelFields.setBackground(Color.WHITE);
			panelFields.add(panelLogin);
			panelFields.add(panelAlterPassword);

			panelButtons.setLayout(new FlowLayout(FlowLayout.CENTER, 10, 5));
			panelButtons.setBackground(amareloClaro);
			panelButtons.add(buttonCancelar);
			panelButtons.add(buttonLimpar);
			panelButtons.add(buttonEntrar);

			this.setSize(480, 250);
			this.setLocationRelativeTo(null);
			this.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE) ;
			this.setLayout(new BorderLayout(5, 5));
			this.add(panelFields, BorderLayout.CENTER);
			this.add(panelButtons, BorderLayout.SOUTH);
			this.getContentPane().setBackground(Color.WHITE);
			

		}

		@Override
		public void actionPerformed(ActionEvent e) {
			int result1;
			int result2;
			
			if (e.getSource() == buttonEntrar) {
				
				
				
				
				
				if(textUsuario.getText().trim().equals("") || String.valueOf(textSenha.getPassword()).trim().equals(""))
				{
					JOptionPane.showMessageDialog(null, "Digite usuario e senha.");
				}	
				else
				{
					usuario = textUsuario.getText();

					System.out.println("vai procurar o medico no banco...");
					result1=searchUser(usuario);
					System.out.println("achou o medico no banco... " + result1);
					if(result1==0)
					{
						JOptionPane.showMessageDialog(null, "xO usuario informado nao existe.");
					}
					else
					{
						System.out.println("vai procurar a senha no banco...");
						result2=searchPassword(result1);
						System.out.println("achou a senha no banco...");
						if(result2==0)
						{
							JOptionPane.showMessageDialog(null, "Senha incorreta.");
						}
						if(result2==1)
						{
	
							this.setVisible(false);
						}
					}
				}
				
			}
			if (e.getSource() == buttonCancelar) {
				System.exit(0);
			}

		}

		public  int searchUser(String usuario_)
		  {
			int id=0;
		    try
		    {
		      // create our mysql database connection
		    	
				String servidor = "Jdbc:mysql://localhost:3306/Escambo";
				String usuario = "root";
				String senha = "vinicius";
				String driver = "com.mysql.jdbc.Driver";

		    	
		      String myDriver = "com.mysql.jdbc.Driver";
		      String myUrl = "Jdbc:mysql://localhost:3306/Escambo";
		      Class.forName(myDriver);
		      Connection conn = DriverManager.getConnection(myUrl, "root", "vinicius");
		       
		      System.out.println(usuario_);
		      
		      // our SQL SELECT query. 
		      // if you only need a few columns, specify them by name instead of using "*"
		      String query = "SELECT id_Adm FROM Adm where usuario='"+usuario_+"'";
		 
		      // create the java statement
		      Statement st = conn.createStatement();
		       
		      // execute the query, and get a java resultset
		      ResultSet rs = st.executeQuery(query);
		 
		      System.out.println("Query:: " + query);
		      
		      // iterate through the java resultset
		      while (rs.next())
		      {
		    	  System.out.println("loop");
		        id = rs.getInt("id_Adm");
		         
		        // print the results
		         
		      }
		      
		      
		      st.close();
		    }
		    catch (Exception e)
		    {
		      System.err.println("Houve uma excecao no Escambo associada ao banco de dados! ");
		      System.err.println(e.getMessage());
		    }
		    return id;
		  }

		
		public int searchPassword(int idUsuario)
		  {
			String senhaBanco="";
			int acesso=0;
			
		    try
		    {
		      // create our mysql database connection
			      String myDriver = "com.mysql.jdbc.Driver";
			      String myUrl = "Jdbc:mysql://localhost:3306/Escambo";
	          Class.forName(myDriver);
		      Connection conn = DriverManager.getConnection(myUrl, "root", "vinicius");
		       
		      // our SQL SELECT query. 
		      // if you only need a few columns, specify them by name instead of using "*"
		      String query = "SELECT senha FROM Adm where id_Adm='"+idUsuario+"'";
		 
		      // create the java statement
		      Statement st = conn.createStatement();
		       
		      // execute the query, and get a java resultset
		      ResultSet rs = st.executeQuery(query);
		       
		      // iterate through the java resultset
		      while (rs.next())
		      {
		        senhaBanco = rs.getString("senha");
		       
		        // print the results
		         
		      }
		     
		      st.close();
		    }
		    catch (Exception e)
		    {
		      System.err.println("Houve uma excecao no Escambo associada ao banco de dados! ");
		      System.err.println(e.getMessage());
		    }
		    
		    if (senhaBanco.equals(String.copyValueOf(textSenha.getPassword())))
		    {
		    	acesso=1;
		    }
		  
		    return acesso;
		  }

	}
	

