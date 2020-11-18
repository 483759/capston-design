package com.binarysearch.domain;

import java.util.Date;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="reservations")
public class Reservations {
  @Id
  private String id;
  private String userId;
  private String hosId;
  private String resDate;

  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }

  public String getUserId() {
    return userId;
  }
  public void setUserId(String id) {
    this.userId = userId;
  }

  public String getHosId() {
    return hosId;
  }
  public void setHosId(String id) {
    this.hosId = hosId;
  }

  public String getResDate(){return resDate;}
  public void setResDate(){this.resDate=resDate;}



  public Reservations(String id, String userId, String hosId, String resDate){
    super();
    this.id=id;
    this.userId=userId;
    this.hosId=hosId;
    this.resDate=resDate;
  }
}