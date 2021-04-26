package group2it81.controller;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.control.ChoiceBox;

import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.ResourceBundle;

public class ThongKeController implements Initializable {
    
    String timeStamp = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
    
    @FXML
    private BarChart<?, ?> reportChart;
    @FXML
    private CategoryAxis xThang;
    @FXML
    private NumberAxis yDoanhThu;

    @FXML
    private ChoiceBox<String> cbChoice;
    @FXML
    private ChoiceBox<Integer> cbFromMonth;
    @FXML
    private ChoiceBox<Integer> cbToMonth;
    @FXML
    private ChoiceBox<Integer> cbYear;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        //Test with loading data to Bar Chart
        XYChart.Series st = new XYChart.Series<>();
        st.getData().add(new XYChart.Data("Thang 1", 500));
        st.getData().add(new XYChart.Data("Thang 2", 524));
        st.getData().add(new XYChart.Data("Thang 3", 478));
        st.getData().add(new XYChart.Data("Thang 4", 320));
        st.getData().add(new XYChart.Data("Thang 5", 600));

        reportChart.getData().addAll(st);

        loadData();
        System.out.println(timeStamp);
    }
    
    
    public void loadData(){
        ObservableList<String> oblistChoice = FXCollections.observableArrayList();
        oblistChoice.addAll("Tháng", "Năm");
        cbChoice.setItems(oblistChoice);

        ObservableList<Integer> oblistMonth = FXCollections.observableArrayList();
        oblistMonth.addAll(1,2,3,4,5,6,7,8,9,10,11,12);
        cbFromMonth.setItems(oblistMonth);
        cbToMonth.setItems(oblistMonth);
        
        ObservableList<Integer> oblistYear = FXCollections.observableArrayList();
        for(int i = 2000; i <= Integer.parseInt(timeStamp); i++){
            oblistYear.addAll(i);
        }
        cbYear.setItems(oblistYear);
    }
   
    SceneController switcher = new SceneController();
    public void backHomePage(ActionEvent event) throws IOException{
        switcher.switchScene("HomePage", event);
    }
}
