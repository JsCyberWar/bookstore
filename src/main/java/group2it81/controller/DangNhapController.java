package group2it81.controller;

import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;

import group2it81.pojo.User;
import group2it81.service.DangNhapService;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;

public class DangNhapController implements Initializable {

    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }

    @FXML
    private TextField txtUserName;

    @FXML
    private TextField txtPass;

    public void login() {
        DangNhapService q = new DangNhapService();
        List<User> users = q.getUser(txtUserName.getText(), txtPass.getText());
        String msg = "Incorrect username or password";

        if (users.size() > 0) {
            msg = "Login success";
        }

        System.out.println(msg);
        
        Alert alert = new Alert(AlertType.CONFIRMATION);
        alert.setTitle("Login");
        alert.setHeaderText(null);
        alert.setContentText(msg);
        alert.showAndWait();

    }

    public void exit() {
        Platform.exit();
    }

}
