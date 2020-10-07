package com.binarysearch.controller;

import com.binarysearch.dao.UsersServiceInterface;
import com.binarysearch.domain.Users;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
        ModelAndView modelAndView = new ModelAndView("/index");
        return modelAndView;
    }

    @GetMapping("/join")
    public ModelAndView join() {
        ModelAndView modelAndView = new ModelAndView("createUser/join");
        return modelAndView;
    }

    @PostMapping("/join")
    public String join(@RequestBody Users users) {
        usersServiceInterface.saveUsers(users);
        System.out.println(users.getUserId() + " " + users.getUserAddress());
        return "hi";
    }

    @GetMapping("/bookInfo")
    public ModelAndView bookInfo() {
        ModelAndView modelAndView = new ModelAndView("/bookInfo");
        return modelAndView;
    }

    @GetMapping("/bookList")
    public ModelAndView bookList() {
        ModelAndView modelAndView = new ModelAndView("/bookHospital/bookList");
        return modelAndView;
    }

    @GetMapping("/bookCheck")
    public ModelAndView bookCheck() {
        ModelAndView modelAndView = new ModelAndView("/bookCheck");
        return modelAndView;
    }

    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView("/login");
        return modelAndView;
    }

    @GetMapping("/hospitalList")
    public ModelAndView hospital_List(){
        Map<String, Object> map=new HashMap<>();
        List<Users> list=usersServiceInterface.getHospitalList();
        map.put("items",list);
        return new ModelAndView("/bookHospital/hospitalList","map",map);
    }

    @RequestMapping("/hospitalList.do")
    public ModelAndView hospitalList(){
        Map<String, Object> map=new HashMap<>();
        List<Users> list=usersServiceInterface.getHospitalList();
        map.put("items",list);
        return new ModelAndView("/hospitalList","map",map);
    }

    @PostMapping("/login")
    public ResponseEntity login(@RequestBody HashMap<String, String> loginInfo) {

        Users userInfo = usersServiceInterface.checkUsers(loginInfo.get("userId"));

        if(userInfo == null){
            return new ResponseEntity("로그인을 할 수 없습니다.", HttpStatus.CONFLICT);
        }else{
            if (userInfo.getUserPw().equals(loginInfo.get("userPw"))){
                return new ResponseEntity("로그인 성공", HttpStatus.OK);
            }
            else {
                return new ResponseEntity("비밀번호 불일치", HttpStatus.CONFLICT);
            }
        }
    }

    @PostMapping("/duplicate")
    public ResponseEntity findId(@RequestBody HashMap<String, String> idVal) {
        String val = idVal.get("userId");
        System.out.println(val);

        Users man = usersServiceInterface.checkUsers(val);

        if(man == null)
            return new ResponseEntity("유저정보 없음", HttpStatus.OK);
        else
            return new ResponseEntity("유저정보 있음", HttpStatus.OK);
    }


}