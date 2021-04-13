package group2it81.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name = "nhaxb")
public class Producer {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int id;
    private String tenNXB;
    private String diaChi;
    private String lienHe;

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenNXB() {
        return this.tenNXB;
    }

    public void setTenNXB(String tenNXB) {
        this.tenNXB = tenNXB;
    }

    public String getDiaChi() {
        return this.diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getLienHe() {
        return this.lienHe;
    }

    public void setLienHe(String lienHe) {
        this.lienHe = lienHe;
    }

}
