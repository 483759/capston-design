package com.binarysearch.dao;

import com.binarysearch.domain.Users;
import java.util.List;

public interface UsersServiceInterface {
    void saveUsers(Users users);
    Users checkUsers(String userId);
    List<Users> getHospitalList();
}
