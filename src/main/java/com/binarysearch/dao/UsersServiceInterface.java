package com.binarysearch.dao;

import com.binarysearch.domain.Login;
import com.binarysearch.domain.Users;
import java.util.List;

public interface UsersServiceInterface {
    void saveUsers(Users users);
    Users checkUsers(String userId);
    Users getDetail(String userId);
    public Users login(Login login) throws Exception;
    List<Users> getHospitalList();
}
