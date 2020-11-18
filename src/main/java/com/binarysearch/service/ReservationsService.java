package com.binarysearch.service;

import com.binarysearch.dao.ReservationsServiceInterface;
import com.binarysearch.domain.Reservations;
import com.binarysearch.repository.ReservationsRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service //인터페이스 상속받아서 메소드 구현해줌
public class ReservationsService implements ReservationsServiceInterface {

  private final ReservationsRepository reservationsRepository;

  @Autowired
  public ReservationsService(ReservationsRepository reservationsRepository) {
    this.reservationsRepository = reservationsRepository;
  }

  public void saveReservations(Reservations books){reservationsRepository.save(books);}

  @Override
  public ArrayList<Reservations> checkReservations(String hosId) {
    //return reservationsRepository.findByHospitalArea(doo);
    return reservationsRepository.findByHosId(hosId);
  }

  public Optional<Reservations> getReservation(String id){
    return reservationsRepository.findById(id);
  }

  public List<Reservations> getReservationList(){
    return reservationsRepository.findAll();
  }
}