package com.binarysearch.dao;

import com.binarysearch.domain.Users;

public interface UsersServiceInterface {
    void saveUsers(Users users);
    Users checkUsers(String userId);
}
