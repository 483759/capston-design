package com.binarysearch.dao;

import com.binarysearch.domain.Hospitals;
import com.binarysearch.domain.Reservations;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public interface ReservationsServiceInterface {
  void saveReservations(Reservations books);
  ArrayList<Reservations> checkReservations(String hosId);
  Optional<Reservations> getReservation(String hosId);
  List<Reservations> getReservationList();
}