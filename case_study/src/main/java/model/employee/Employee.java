package model.employee;

public class Employee {
    private int idEmployee;
    private String nameEmployee;
    private String dateBirth;
    private String idCardEmployee;
    private double salary;
    private String phoneNumber;
    private String email;
    private String address;
    private int idPosition;
    private int idEducationDegree;
    private int idDivision;

    public Employee() {
    }

    public Employee(String nameEmployee, String dateBirth, String idCardEmployee, double salary, String phoneNumber, String email, String address, int idPosition, int idEducationDegree, int idDivision) {
        this.nameEmployee = nameEmployee;
        this.dateBirth = dateBirth;
        this.idCardEmployee = idCardEmployee;
        this.salary = salary;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.idPosition = idPosition;
        this.idEducationDegree = idEducationDegree;
        this.idDivision = idDivision;
    }

    public int getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(int idEmployee) {
        this.idEmployee = idEmployee;
    }

    public String getNameEmployee() {
        return nameEmployee;
    }

    public void setNameEmployee(String nameEmployee) {
        this.nameEmployee = nameEmployee;
    }

    public String getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(String dateBirth) {
        this.dateBirth = dateBirth;
    }

    public String getIdCardEmployee() {
        return idCardEmployee;
    }

    public void setIdCardEmployee(String idCardEmployee) {
        this.idCardEmployee = idCardEmployee;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getIdPosition() {
        return idPosition;
    }

    public void setIdPosition(int idPosition) {
        this.idPosition = idPosition;
    }

    public int getIdEducationDegree() {
        return idEducationDegree;
    }

    public void setIdEducationDegree(int idEducationDegree) {
        this.idEducationDegree = idEducationDegree;
    }

    public int getIdDivision() {
        return idDivision;
    }

    public void setIdDivision(int idDivision) {
        this.idDivision = idDivision;
    }

    public Employee(int idEmployee, String nameEmployee, String dateBirth, String idCardEmployee, double salary, String phoneNumber, String email, String address, int idPosition, int idEducationDegree, int idDivision) {
        this.idEmployee = idEmployee;
        this.nameEmployee = nameEmployee;
        this.dateBirth = dateBirth;
        this.idCardEmployee = idCardEmployee;
        this.salary = salary;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.idPosition = idPosition;
        this.idEducationDegree = idEducationDegree;
        this.idDivision = idDivision;
    }
}
