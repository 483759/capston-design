package com.binarysearch.controller;

import com.binarysearch.dao.ReservationsServiceInterface;
import com.binarysearch.domain.Hospitals;
import com.binarysearch.domain.Reservations;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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

  /*
  @PostMapping("/reserve")
  public ArrayList<Hospitals> findName(@RequestBody HashMap<String, String> idVal1) {
    String val1 = idVal1.get("name");

    ArrayList<Hospitals> checkHospitals = reservationsSErviceInterface.checkHospitals(val1);

    return ((checkHospitals.size() == 0) ? null : checkHospitals);
  }

   */
}