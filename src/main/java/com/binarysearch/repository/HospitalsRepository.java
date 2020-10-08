package com.binarysearch.repository;

import com.binarysearch.domain.Hospitals;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.ArrayList;
import java.util.List;

public interface HospitalsRepository extends MongoRepository<Hospitals, String> {
    ArrayList<Hospitals> findByHospitalArea(String doo);
}