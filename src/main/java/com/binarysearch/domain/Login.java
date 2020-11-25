package com.binarysearch.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="users")
public class Login {
  @Id

  private String userId;
  private String userPw;
  private boolean useCookie;

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getUserPw() {
    return userPw;
  }

  public void setUserPw(String userPw) {
    this.userPw = userPw;
  }

  public boolean getUseCookie(){return useCookie;}

  public void setUseCookie(boolean useCookie){this.useCookie=useCookie;}

  public Login(String userId, String userPw, boolean useCookie){
    super();
    this.userId=userId;
    this.userPw=userPw;
    this.useCookie=useCookie;
  }
}
