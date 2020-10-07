package com.binarysearch.service;

import com.binarysearch.domain.Users;
import com.binarysearch.repository.UsersRepository;
import com.binarysearch.dao.UsersServiceInterface;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

@Service
public class UsersService implements UsersServiceInterface {

    private final UsersRepository usersRepository;

    @Autowired
    public UsersService(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
    }
    MongoTemplate mongoTemplate;


    public void saveUsers(Users users) {
        usersRepository.save(users);
    }

    @Override
    public Users checkUsers(String userId) {
        return usersRepository.findByUserId(userId);
    }
    public List<Users> getHospitalList(){
        //Query query=new Query();
        //return (List<Users>) mongoTemplate.find(query, Users.class, "users");
        return usersRepository.findAll();
    }
}
