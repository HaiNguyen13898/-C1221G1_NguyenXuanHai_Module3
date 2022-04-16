package model;

public class Product {
    private int idProduct;
    private String nameProduct;
    private Double priceProduct;
    private String facilitiesProduct;

    public Product() {
    }

    public Product(Integer idProduct, String nameProduct, Double priceProduct, String facilitiesProduct) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.priceProduct = priceProduct;
        this.facilitiesProduct = facilitiesProduct;
    }

    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Integer idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public Double getPriceProduct() {
        return priceProduct;
    }

    public void setPriceProduct(Double priceProduct) {
        this.priceProduct = priceProduct;
    }

    public String getFacilitiesProduct() {
        return facilitiesProduct;
    }

    public void setFacilitiesProduct(String facilitiesProduct) {
        this.facilitiesProduct = facilitiesProduct;
    }
}
