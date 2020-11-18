package com.binarysearch.controller;

import com.binarysearch.domain.Hospitals;
import com.binarysearch.dao.HospitalsServiceInterface;
import com.binarysearch.domain.Users;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.Map;
import java.util.Optional;
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
@RequestMapping(value="")
// 이렇게 해놓으면 경로에 무조건 /hospital이 붙음
public class HospitalsController {
  private final HospitalsServiceInterface hospitalsServiceInterface;

  @Autowired
  public HospitalsController(HospitalsServiceInterface hospitalsServiceInterface) {
    this.hospitalsServiceInterface = hospitalsServiceInterface;
  }

  @GetMapping("/reserve") // localhost:8080/hospital/reserve
  public ModelAndView reserve() {
    Map<String, Object> map=new HashMap<>();
    List<Hospitals> list=hospitalsServiceInterface.getHospitalList();
    map.put("items",list);
    ModelAndView modelAndView = new ModelAndView("bookHospital/reserve","map",map);
    return modelAndView;
  }

  @PostMapping("/reserve")
  public ArrayList<Hospitals> findName(@RequestBody HashMap<String, String> idVal1) {
    String val1 = idVal1.get("name");

    ArrayList<Hospitals> checkHospitals = hospitalsServiceInterface.checkHospitals(val1);

    return ((checkHospitals.size() == 0) ? null : checkHospitals);
  }


  @RequestMapping("/book.do")
  public ModelAndView book(String id) {
    System.out.println(id);
    //Hospitals userInfo = hospitalsServiceInterface.checkHospitals(id);
    Optional<Hospitals> hosInfo=hospitalsServiceInterface.getHospital(id);
    Hospitals hos=hosInfo.get();
    //if(dto==null)System.out.println("No Id");
    //if(userInfo==null)System.out.println("No");
    return new ModelAndView("bookHospital/bookPage", "dto", hos);
    //return new ModelAndView("bookHospital/bookPage");
  }
}