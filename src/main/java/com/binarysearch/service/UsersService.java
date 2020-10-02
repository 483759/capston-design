package com.binarysearch.service;

import com.binarysearch.domain.Users;
import com.binarysearch.repository.UsersRepository;
import com.binarysearch.dao.UsersServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersService implements UsersServiceInterface {

    private final UsersRepository usersRepository;

    @Autowired
    public UsersService(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
    }

    public void saveUsers(Users users) {
        usersRepository.save(users);
    }

    @Override
    public Users checkUsers(String userId) {
        return usersRepository.findByUserId(userId);
    }
}
