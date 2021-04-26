package group2it81.controller;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.TextField;

import group2it81.pojo.Book;
import group2it81.pojo.BookDetail;
import group2it81.service.BookService;

import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.Action;

public class BanSachController implements Initializable {
    private static int totalPrice = 0;

    @FXML
    private TextField txtBookId;
    @FXML
    private Label lbAmount;

    @FXML 
    private Label lbTotal;
    @FXML
    private TableView<BookDetail> table;
    @FXML
    private TableColumn<BookDetail, Integer> colId;
    @FXML
    private TableColumn<BookDetail, String> colName;
    @FXML
    private TableColumn<BookDetail, String> colAuthor;
    @FXML
    private TableColumn<BookDetail, String> colBookType;
    @FXML
    private TableColumn<BookDetail, Integer> colPrice;
    @FXML
    private TableColumn<BookDetail, Integer> colAmount;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }
    BookService bs = new BookService();
    SceneController switcher = new SceneController();
    public void backHomePage(ActionEvent event) throws IOException{
        switcher.switchScene("HomePage", event);
    }

    public void switchToThanhToan(ActionEvent event) throws IOException{
        switcher.switchScene("Thanhtoan", event);
    }
    
    public void plus(ActionEvent event) throws IOException{
        int i = Integer.parseInt(lbAmount.getText()) + 1;
        lbAmount.setText(Integer.toString(i));
    }
    public void minus(ActionEvent event) throws IOException{
        if(Integer.parseInt(lbAmount.getText()) > 0)
        {
            int i = Integer.parseInt(lbAmount.getText()) - 1;
            lbAmount.setText(Integer.toString(i));
        }
    }
    public void clear(ActionEvent event) throws IOException{
        txtBookId.setText(null);
        lbAmount.setText("0");
    }

    public void delete(ActionEvent event) throws IOException{
        table.getItems().clear();
        txtBookId.setText(null);
        lbAmount.setText("0");
    }
    public void submit(ActionEvent event) throws IOException{
        
        Pattern pattern = Pattern.compile("[^0-9]");
        Matcher matcher = pattern.matcher(txtBookId.getText());
        if(!matcher.find() && !txtBookId.getText().equals("")){       
            if(Integer.parseInt(lbAmount.getText()) > 0)
            {
                List<Book> rsBooks = bs.searchBookById(Integer.parseInt(txtBookId.getText()));
                Book book = new Book();
                book = rsBooks.get(0);
                BookDetail b = new BookDetail();
                b.setId(book.getId());
                b.setTenSach(book.getTenSach());
                b.setLoaiSach(book.getLoaisach().getTenLoai());
                b.setTenTG(book.getAuthor().getHoTen());
                b.setGia(book.getDonGia());
                b.setSoLuong(book.getSoLuongTon());
                b.setSoLuongMua(Integer.parseInt(lbAmount.getText()));
                
                colId.setCellValueFactory(new PropertyValueFactory<BookDetail, Integer>("id"));
                colAmount.setCellValueFactory(new PropertyValueFactory<BookDetail, Integer>("soLuongMua"));
                colAuthor.setCellValueFactory(new PropertyValueFactory<BookDetail, String>("tenTG"));
                colBookType.setCellValueFactory(new PropertyValueFactory<BookDetail, String>("loaiSach"));
                colName.setCellValueFactory(new PropertyValueFactory<BookDetail, String>("tenSach"));
                colPrice.setCellValueFactory(new PropertyValueFactory<BookDetail, Integer>("gia"));

                table.getItems().add(b);

                
                totalPrice += (b.getSoLuongMua()*b.getGia());        
                lbTotal.setText(Integer.toString(totalPrice));

                txtBookId.setText(null);
                lbAmount.setText("0");
            }
            else
                switcher.createAlert("Vui lòng nhập số lượng", "Thông báo");
        }
        else
            switcher.createAlert("Vui lòng nhập mã sản phẩm", "Thông báo");

       
    }
    public void xoaSP(){
        totalPrice -= (table.getSelectionModel().getSelectedItem().getGia()*table.getSelectionModel().getSelectedItem().getSoLuongMua());
        table.getItems().remove(table.getSelectionModel().getSelectedItem());        
        lbTotal.setText(Integer.toString(totalPrice));
    }
    
}
