package com.binarysearch.repository;

import com.binarysearch.domain.Hospitals;
import com.binarysearch.domain.Reservations;
import java.util.ArrayList;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ReservationsRepository extends MongoRepository<Reservations, String> {

  ArrayList<Reservations> findByHosId(String hosId);
}