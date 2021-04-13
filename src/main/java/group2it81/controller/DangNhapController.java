package group2it81.controller;

import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;
import java.io.IOException;

import group2it81.pojo.Book;
import group2it81.pojo.User;
import group2it81.service.BookService;
import group2it81.service.DangNhapService;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;

public class DangNhapController implements Initializable {

    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }

    @FXML
    private TextField txtUserName;

    @FXML
    private TextField txtPass;

    public void login(ActionEvent event) throws IOException{
        DangNhapService q = new DangNhapService();
        List<User> users = q.getUser(txtUserName.getText(), txtPass.getText());
        String msg = "Sai tên đăng nhập hoặc mật khẩu";

        if (!users.isEmpty()) {
            Parent home_page_parent = FXMLLoader.load(getClass().getResource("../../HomePage.fxml"));
            Scene scene = new Scene(home_page_parent);
            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            stage.hide();
            stage.setScene(scene);
            stage.show();
        } else {
            Alert alert = new Alert(AlertType.CONFIRMATION);
            alert.setTitle("Đăng nhập");
            alert.setHeaderText(null);
            alert.setContentText(msg);
            alert.showAndWait();
        }

        BookService bs = new BookService();
        List<Book> b = bs.loadBooks();
        
        for(Book book: b){
            System.out.println(book.getTenSach());
        }

    }

    public void exit() {
        Platform.exit();
    }

}
