package com.binarysearch.service;

import com.binarysearch.domain.Hospitals;
import com.binarysearch.repository.HospitalsRepository;
import com.binarysearch.dao.HospitalsServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service //인터페이스 상속받아서 메소드 구현해줌
public class HospitalsService implements HospitalsServiceInterface {

  private final HospitalsRepository hospitalsRepository;

  @Autowired
  public HospitalsService(HospitalsRepository hospitalsRepository) {
    this.hospitalsRepository = hospitalsRepository;
  }

  @Override
  public ArrayList<Hospitals> checkHospitals(String doo) {
    return hospitalsRepository.findByHospitalArea(doo);
  }
  public List<Hospitals> getHospitalList(){
    return hospitalsRepository.findAll();
  }
}