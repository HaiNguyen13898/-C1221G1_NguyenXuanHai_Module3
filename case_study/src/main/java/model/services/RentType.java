package model.services;

public class RentType {
    private int idRentType;
    private String nameRentType;
    private Double costRentType;

    public RentType() {
    }

    public RentType(int idRentType, String nameRentType, Double costRentType) {
        this.idRentType = idRentType;
        this.nameRentType = nameRentType;
        this.costRentType = costRentType;
    }

    public int getIdRentType() {
        return idRentType;
    }

    public void setIdRentType(int idRentType) {
        this.idRentType = idRentType;
    }

    public String getNameRentType() {
        return nameRentType;
    }

    public void setNameRentType(String nameRentType) {
        this.nameRentType = nameRentType;
    }

    public Double getCostRentType() {
        return costRentType;
    }

    public void setCostRentType(Double costRentType) {
        this.costRentType = costRentType;
    }
}
