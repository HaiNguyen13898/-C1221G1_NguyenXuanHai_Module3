package model.services;

public class Services {
    private int idServices;
    private String nameServices;
    private int areaServices;
    private double costServices;
    private int maxPeopleServices;
    private String standardRoom;
    private String descriptionOtherConvenience;
    private double poolArea;
    private int numberFloor;
    private int idRentType;
    private int idServiceType;

    public Services() {
    }

    public Services(int idServices, String nameServices, int areaServices, double costServices, int maxPeopleServices, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberFloor, int idRentType, int idServiceType) {
        this.idServices = idServices;
        this.nameServices = nameServices;
        this.areaServices = areaServices;
        this.costServices = costServices;
        this.maxPeopleServices = maxPeopleServices;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberFloor = numberFloor;
        this.idRentType = idRentType;
        this.idServiceType = idServiceType;
    }

    public Services(String nameServices, int areaServices, double costServices, int maxPeopleServices, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberFloor, int idRentType, int idServiceType) {
        this.nameServices = nameServices;
        this.areaServices = areaServices;
        this.costServices = costServices;
        this.maxPeopleServices = maxPeopleServices;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberFloor = numberFloor;
        this.idRentType = idRentType;
        this.idServiceType = idServiceType;
    }

    public int getIdServices() {
        return idServices;
    }

    public void setIdServices(int idServices) {
        this.idServices = idServices;
    }

    public String getNameServices() {
        return nameServices;
    }

    public void setNameServices(String nameServices) {
        this.nameServices = nameServices;
    }

    public int getAreaServices() {
        return areaServices;
    }

    public void setAreaServices(int areaServices) {
        this.areaServices = areaServices;
    }

    public double getCostServices() {
        return costServices;
    }

    public void setCostServices(double costServices) {
        this.costServices = costServices;
    }

    public int getMaxPeopleServices() {
        return maxPeopleServices;
    }

    public void setMaxPeopleServices(int maxPeopleServices) {
        this.maxPeopleServices = maxPeopleServices;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getNumberFloor() {
        return numberFloor;
    }

    public void setNumberFloor(int numberFloor) {
        this.numberFloor = numberFloor;
    }

    public int getIdRentType() {
        return idRentType;
    }

    public void setIdRentType(int idRentType) {
        this.idRentType = idRentType;
    }

    public int getIdServiceType() {
        return idServiceType;
    }

    public void setIdServiceType(int idServiceType) {
        this.idServiceType = idServiceType;
    }
}
