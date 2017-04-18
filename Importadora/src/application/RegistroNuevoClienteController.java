package application;


import java.net.URL;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javax.swing.JOptionPane;
import pkgControlador.ConectaDB;

public class RegistroNuevoClienteController implements Initializable{
        ConectaDB conector=new ConectaDB();
	LocalDate fecha1;
	@FXML
	DatePicker fecha;
        @FXML private TextField txtNomcCliente;
        @FXML private TextField txtApeCliente;
        @FXML private TextField txtNitCi;
        @FXML private TextField txtNomProducto;
        @FXML private TextField txtCantPoducto;
        @FXML private TextField txtCstProducto;
        @FXML private DatePicker datePedido;
        @FXML private DatePicker dateLLegada;
        @FXML private TextField txtCstPedido;
        @FXML private ComboBox comboProveedor=new ComboBox(llenarComboProveedor());
	@FXML public void btnRegistroPedidoAction(ActionEvent ev){
            verificacion verificador=new verificacion();
            boolean verificar=false;
            if(verificador.validarTexto(txtApeCliente.getText()) && verificador.validarTexto(txtNomcCliente.getText()) 
               && verificador.validarNumero(txtNitCi.getText()) && verificador.validarTextoyNumeros(txtNomProducto.getText())
               && verificador.validarNumero(txtCantPoducto.getText()) && verificador.validarNumero(txtCstProducto.getText())
               && verificador.validarTexto(txtCstPedido.getText())){
                String apellidoCli = txtApeCliente.getText();
            String nombreCli = txtNomcCliente.getText();
            int carnetCli = Integer.parseInt(txtNitCi.getText());
            String nombreProducto=txtNomProducto.getText();
            String cantidadProducto=txtCantPoducto.getText();
            int productoCantidad=Integer.parseInt(cantidadProducto);
            String costoProducto=txtCstProducto.getText();
            int productoCosto=Integer.parseInt(costoProducto);
            String nombreProveedor=comboProveedor.getValue().toString();
            String fechaPedido=datePedido.getValue().toString();
            String fechaLlegada=dateLLegada.getValue().toString();  
            String costoPedido=txtCstPedido.getText();
            int pedidoCosto=Integer.parseInt(costoPedido);
            ResultSet res;
            
            try {
                res=conector.consultar("select registrarPedido('"+nombreCli+"','"+apellidoCli+"',"+carnetCli+",'"+nombreProducto+"',"+productoCantidad+","+productoCosto+",'"+nombreProveedor+"','"+fechaPedido+"','"+fechaLlegada+"',"+pedidoCosto+");");
                if (res.next()) {
                    String retorno=res.getString("registrarcliente");
                    if (retorno.equals("registrado")) {
 
                        JOptionPane.showMessageDialog(null, " REGISTRADO ");
                                            
                    } else{
                        System.out.println(retorno);
                    }
                
                } else {
                    System.err.println("Error");
                }
            } catch (Exception e) {
                System.err.println("Error : "+e);
            }
            }else{
                JOptionPane.showMessageDialog(null, "NO REGISTRADO REVISE SI TIENE ERRORES");
            }
            
            
		
	}
        private ObservableList<String> llenarComboProveedor() { 

            ObservableList<String> items=FXCollections.observableArrayList();
            try {    
                ResultSet rs=null; 
                rs = conector.consultar("SELECT proveedor.nombre_prov FROM proveedor");
                System.out.println("104");
                while (rs.next()) {
                    items.add(rs.getString(1));
                    System.err.println(rs.getString(1) +"**");
                }
        
            } catch(Exception err){err.printStackTrace();} 
            return items;
        }
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
        comboProveedor.setItems(llenarComboProveedor());
    } 
}
