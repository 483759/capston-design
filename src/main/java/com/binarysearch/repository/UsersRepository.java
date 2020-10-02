package com.binarysearch.repository;

import com.binarysearch.domain.Users;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UsersRepository extends MongoRepository<Users, String> {
    Users findByUserId(String userId);
}
