package application;


import java.sql.ResultSet;
import java.time.LocalDate;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import pkgControlador.ConectaDB;

public class RegistroNuevoClienteController {
        ConectaDB conector=new ConectaDB();
	LocalDate fecha1;
	@FXML
	DatePicker fecha;
        @FXML private TextField tfNombreCli;
        @FXML private TextField tfApellidoCli;
        @FXML private TextField tfCarnetCli;
	@FXML public void a(ActionEvent ev){
		String apellidoCli = tfApellidoCli.getText();
                String nombreCli = tfNombreCli.getText();
                String carnetCli = tfCarnetCli.getText();
                ResultSet res;
        
        try {
            res=conector.consultar("Select registrarcliente("+carnetCli+",'"+apellidoCli+"','"+nombreCli+"' );");
            if (res.next()) {
                String retorno=res.getString("registrarcliente");
                if (retorno.equals("registrado")) {
 
                    //registrar pedido
                                            
                } else{
                    System.out.println(retorno);
                }
                
            } else {
                System.err.println("Error");
            }
        } catch (Exception e) {
            System.err.println("Error : "+e);
        }
		
	}
}
