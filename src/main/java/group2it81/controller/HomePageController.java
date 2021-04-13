package group2it81.controller;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Stage;
import javafx.scene.Node;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import group2it81.service.DangNhapService;



public class HomePageController implements Initializable {

    @FXML
    private Label lblTenNv;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        lblTenNv.setText(" ");
    }

    public void logout(ActionEvent event) throws IOException{
        Parent home_page_parent = FXMLLoader.load(getClass().getResource("../../DangNhap.fxml"));
        Scene scene = new Scene(home_page_parent);
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        stage.hide();
        stage.setScene(scene);
        stage.show();
    }

}
