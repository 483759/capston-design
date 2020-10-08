package com.binarysearch.dao;

import com.binarysearch.domain.Hospitals;

import java.util.ArrayList;
import java.util.List;

public interface HospitalsServiceInterface {
  ArrayList<Hospitals> checkHospitals(String name);
}