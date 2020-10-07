package com.binarysearch.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="users")
public class Users {
    @Id
    private String _id;
    private String userId;
    private String userPw;
    private String userName;
    private String userTel;
    private String userAddress;

    public String getId() {
        return _id;
    }

    public void setId(String _id) {
        this._id = _id;
    }

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public Users(String _id, String userId, String userPw, String userName, String userTel, String userAddress){
        super();
        this._id=_id;
        this.userId=userId;
        this.userPw=userPw;
        this.userName=userName;
        this.userTel=userTel;
        this.userAddress=userAddress;
    }
}
