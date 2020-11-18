package com.binarysearch.dao;

import com.binarysearch.domain.Hospitals;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public interface HospitalsServiceInterface {
  ArrayList<Hospitals> checkHospitals(String name);
  Optional<Hospitals> getHospital(String hosId);
  List<Hospitals> getHospitalList();
}