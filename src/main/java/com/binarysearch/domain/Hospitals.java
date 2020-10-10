package com.binarysearch.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="hospitals")
public class Hospitals {
  @Id
  private String id;
  private String hospitalSigu;
  private String hospitalArea;
  private String hospitalCode;
  private String hospitalPhone;
  private String hospitalName;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getHospitalSigu() {
    return hospitalSigu;
  }

  public void setHospitalSigu(String hospitalSigu) { this.hospitalSigu = hospitalSigu; }

  public String getHospitalArea() { return hospitalArea; }

  public void setHospitalArea(String hospitalArea) { this.hospitalArea = hospitalArea; }

  public String getHospitalCode() {
    return hospitalCode;
  }

  public void setHospitalCode(String hospitalCode) {
    this.hospitalCode = hospitalCode;
  }

  public String getHospitalPhone() {
    return hospitalPhone;
  }

  public void setHospitalPhone(String hospitalPhone) {
    this.hospitalPhone = hospitalPhone;
  }

  public String getHospitalName() { return hospitalName; }

  public void setHospitalName(String hospitalName) {
    this.hospitalName = hospitalName;
  }

  public Hospitals(String id, String hospitalSigu, String hospitalArea, String hospitalCode,String hospitalPhone,String hospitalName){
    super();
    this.id=id;
    this.hospitalSigu=hospitalSigu;
    this.hospitalArea=hospitalArea;
    this.hospitalCode=hospitalCode;
    this.hospitalPhone=hospitalPhone;
    this.hospitalName=hospitalName;
  }
}