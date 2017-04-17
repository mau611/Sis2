package buscarpaises;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

/**
 * FXML Controller class
 *
 * @author Maurisio
 */
public class VentanaBuscarController implements Initializable {
    @FXML private Label labBuscador;
    @FXML private Label labNombrePais;
    @FXML private Label labNombre;
    @FXML private Label labCosto;
    @FXML private TextField txtFNomp;
    @FXML private TextField txtfNom;
    @FXML private TextField txtFCosto;
    @FXML private Button bttnBuscar;
    @FXML private Button bttnAceptar;
    /**
     * Initializes the controller class.
     */
    //@Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    @FXML public void buscar(ActionEvent e){
        System.out.println("entro");
    }
    
}
