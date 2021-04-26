package group2it81.controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.Initializable;

public class ThanhToanController implements Initializable {
    @Override
    public void initialize (URL url, ResourceBundle rb){

    }
    SceneController switcher = new SceneController();
    
    public void back(ActionEvent event) throws IOException{
        switcher.switchScene("BanSach", event);
    }
    public void acceptPay(ActionEvent event) throws IOException{
        switcher.createAlert("Thanh toán thành công", "Thông báo");
    }
}
