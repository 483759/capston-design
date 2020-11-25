package com.binarysearch.service;

import com.binarysearch.domain.Login;
import com.binarysearch.domain.Users;
import com.binarysearch.repository.UsersRepository;
import com.binarysearch.dao.UsersServiceInterface;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.mongodb.core.MongoTemplate;

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
    public Users login(Login login) throws Exception{
        return usersRepository.findByUserId(login.getUserId());
    }
    public Users getDetail(String userId) {
        //id에 해당하는 값 (레코드) 1개를 찾을 경우에는 findById(_id, 클래스, 테이블이름) 사용
        //return mongoTemplate.findById(userName, Users.class, "users");
        return usersRepository.findByUserId(userId);
        //id에 해당되는 자료를 COLLECTION_NAME테이블에서 가져와서 DTO에 저장
    }
}
