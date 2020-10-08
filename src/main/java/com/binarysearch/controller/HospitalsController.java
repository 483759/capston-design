package com.binarysearch.controller;

import com.binarysearch.domain.Hospitals;
import com.binarysearch.dao.HospitalsServiceInterface;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping(value="/bookHospital")
// 이렇게 해놓으면 경로에 무조건 /hospital이 붙음
public class HospitalsController {
  private final HospitalsServiceInterface hospitalsServiceInterface;

  @Autowired
  public HospitalsController(HospitalsServiceInterface hospitalsServiceInterface) {
    this.hospitalsServiceInterface = hospitalsServiceInterface;
  }

  @GetMapping("/") // localhost:8080/hospital/
  public ModelAndView sayHi() {
    ModelAndView modelAndView = new ModelAndView("/index");
    return modelAndView;
  }

  @GetMapping("/reserve") // localhost:8080/hospital/reserve
  public ModelAndView reserve() {
    ModelAndView modelAndView = new ModelAndView("bookHospital/reserve");
    return modelAndView;
  }

  @PostMapping("/reserve")
  public ArrayList<String> findName(@RequestBody HashMap<String, String> idVal1) {
    String val1 = idVal1.get("name");

    ArrayList<Hospitals> checkHospitals = hospitalsServiceInterface.checkHospitals(val1);


    if(checkHospitals.isEmpty()){
      return null;
    } else {
      ArrayList<String> nameList = new ArrayList<>();

      for(Hospitals h : checkHospitals) {
        System.out.println(h);
        nameList.add(h.getHospitalName());
      }

      return nameList;
    }
  }
}