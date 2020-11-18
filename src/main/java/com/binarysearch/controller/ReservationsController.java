package com.binarysearch.controller;

import com.binarysearch.dao.ReservationsServiceInterface;
import com.binarysearch.domain.Reservations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="")
// 이렇게 해놓으면 경로에 무조건 /hospital이 붙음
public class ReservationsController {
  private final ReservationsServiceInterface reservationsSErviceInterface;

  @Autowired
  public ReservationsController(ReservationsServiceInterface reservationsSErviceInterface) {
    this.reservationsSErviceInterface = reservationsSErviceInterface;
  }

  @PostMapping("book")
  public String registerBook(@RequestBody Reservations books){
    reservationsSErviceInterface.saveReservations(books);
    System.out.print("Hi");
    //System.out.print(books.getResDate());
    return "Hi";
  }

}