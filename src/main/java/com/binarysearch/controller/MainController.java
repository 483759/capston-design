package com.binarysearch.controller;

import com.binarysearch.dao.UsersServiceInterface;
import com.binarysearch.domain.Login;
import com.binarysearch.domain.Users;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {

  private final UsersServiceInterface usersServiceInterface;

  @Autowired
  public MainController(UsersServiceInterface usersServiceInterface) {
    this.usersServiceInterface = usersServiceInterface;
  }

  @GetMapping("/")
  public ModelAndView sayHi() {
    ModelAndView modelAndView = new ModelAndView("/main");
    return modelAndView;
  }

  @GetMapping("/main")
  public ModelAndView main() {
    ModelAndView modelAndView = new ModelAndView("/main");
    return modelAndView;
  }

  @GetMapping("/index")
  public ModelAndView index() {
    ModelAndView modelAndView = new ModelAndView("/index");
    return modelAndView;
  }

  @GetMapping("/join")
  public ModelAndView join() {
    ModelAndView modelAndView = new ModelAndView("createUser/join");
    return modelAndView;
  }

  @PostMapping("/join")
  public ModelAndView join(@RequestBody Users users) {
    String hashedPw = BCrypt.hashpw(users.getUserPw(), BCrypt.gensalt());
    users.setUserPw(hashedPw);
    usersServiceInterface.saveUsers(users);
    ModelAndView modelAndView = new ModelAndView("/loginUser/login");
    return modelAndView;
  }

  @GetMapping("/bookInfo")
  public ModelAndView bookInfo() {
    ModelAndView modelAndView = new ModelAndView("/bookInfo");
    return modelAndView;
  }

  @GetMapping("/bookList")
  public ModelAndView bookList() {

    Map<String, Object> map = new HashMap<>();
    List<Users> list = usersServiceInterface.getHospitalList();
    map.put("items", list);
    return new ModelAndView("/bookHospital/bookList", "map", map);
        /*
        ModelAndView modelAndView = new ModelAndView("/bookHospital/bookList");
        return modelAndView;
         */
  }

  @GetMapping("/bookPage")
  public ModelAndView bookPage() {
    ModelAndView modelAndView = new ModelAndView("/bookHospital/bookPage");
    return modelAndView;
  }

  @GetMapping("/conform")
  public ModelAndView conform(HttpSession session) {
    ModelAndView modelAndView = new ModelAndView("loginUser/conform");
    return modelAndView;
  }

  @GetMapping("/logout")
  public ModelAndView logout(HttpSession session) {
    ModelAndView modelAndView = new ModelAndView("loginUser/logout");
    return modelAndView;
  }

  @GetMapping("/hospitalList")
  public ModelAndView hospital_List() {
    Map<String, Object> map = new HashMap<>();
    List<Users> list = usersServiceInterface.getHospitalList();
    map.put("items", list);
    return new ModelAndView("/bookHospital/hospitalList", "map", map);
  }

  @RequestMapping("/hospitalList.do")
  public ModelAndView hospitalList() {
    Map<String, Object> map = new HashMap<>();
    List<Users> list = usersServiceInterface.getHospitalList();
    map.put("items", list);
    return new ModelAndView("/bookHospital/hospitalList", "map", map);
  }

  @GetMapping("/login")
  public ModelAndView loginGet(HttpSession session) {
    ModelAndView modelAndView = new ModelAndView("loginUser/login");
    return modelAndView;
  }

  @PostMapping("/login")
  public ResponseEntity loginPost(@RequestBody Login loginInfo, HttpSession session, Model model) {

    String hashedPw = BCrypt.hashpw(loginInfo.getUserPw(), BCrypt.gensalt());
    System.out.println(hashedPw);
    Users userInfo;
    try {
      userInfo = usersServiceInterface.login(loginInfo);
    } catch (Exception e) {
      return new ResponseEntity("로그인 실패", HttpStatus.CONFLICT);
    }

    model.addAttribute("userInfo", userInfo);
    session.setAttribute("userInfo", userInfo);
    if (BCrypt.checkpw(loginInfo.getUserPw(), userInfo.getUserPw())) {
      return new ResponseEntity("로그인 성공", HttpStatus.OK);
    } else {
      return new ResponseEntity("비밀번호 불일치", HttpStatus.CONFLICT);
    }
  }

  @GetMapping("/hjoin")
  public ModelAndView hjoin() {
    ModelAndView modelAndView = new ModelAndView("createUser/hjoin");
    return modelAndView;
  }

  @PostMapping("/hjoin")
  public String hjoin(@RequestBody Users users) {
    usersServiceInterface.saveUsers(users);
    System.out.println(users.getUserId() + " " + users.getUserAddress());
    return "hi";
  }

  @GetMapping("/jointype")
  public ModelAndView jointype() {
    ModelAndView modelAndView = new ModelAndView("createUser/jointype");
    return modelAndView;
  }

  @PostMapping("/duplicate")
  public ResponseEntity findId(@RequestBody HashMap<String, String> idVal) {
    String val = idVal.get("userId");
    System.out.println(val);

    Users man = usersServiceInterface.checkUsers(val);

      if (man == null) {
          return new ResponseEntity("유저정보 없음", HttpStatus.OK);
      } else {
          return new ResponseEntity("유저정보 있음", HttpStatus.OK);
      }
  }


}