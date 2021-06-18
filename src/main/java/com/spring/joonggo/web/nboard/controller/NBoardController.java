package com.spring.joonggo.web.nboard.controller;

import com.spring.joonggo.web.common.paging.Criteria;
import com.spring.joonggo.web.common.paging.PageMaker;
import com.spring.joonggo.web.nboard.domain.DummyNBoard;
import com.spring.joonggo.web.nboard.domain.NBoard;
import com.spring.joonggo.web.nboard.service.NBoardService;
import com.spring.joonggo.web.user.domain.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/nboard")
@Log4j2
@CrossOrigin
@RequiredArgsConstructor
public class NBoardController {

    private final NBoardService nBoardService;

//    @Autowired
//    public NBoardController(NBoardService nBoardService) {
//        this.nBoardService = nBoardService;
//    }

    //게시글 목록화면 요청
    @GetMapping("/list")
    public String list(Criteria criteria, Model model, HttpSession session) {

        log.info(criteria);
        model.addAttribute("nBoardList", nBoardService.getBoardList(criteria));
        //페이지 정보 만들어서 jsp에게 보내기
        model.addAttribute("pageMaker", new PageMaker(criteria, nBoardService.getTotal(criteria)));
        log.info("nboard list GET 요청!");

        User loginUser = (User) session.getAttribute("loginUser");
        model.addAttribute("loginUser", loginUser);

        return "/nboard/nboard-list";
    }

    //게시글 작성화면 요청
    @GetMapping("/register")
    public String write(HttpSession session, Model model) {
        log.info("nBoard register GET 요청!");
        User loginUser = (User) session.getAttribute("loginUser");
        model.addAttribute("loginUser", loginUser);
        return "/nboard/nboard-write";
    }

    //게시글 정보 저장 요청
    @PostMapping("/register")
    public String register(NBoard nBoard) {
        log.info("nBoard register POST 요청!");
        nBoardService.register(nBoard);

        return "redirect:/nboard/list";
    }

    //게시글 삭제 요청
    @GetMapping("/delete")
    public String delete(int boardNo) {
        log.info("nBoard delete GET 요청!");
        nBoardService.delete(boardNo);
        return "redirect:/nboard/list";
    }

    //게시글 상세 보기 요청
    @GetMapping("/detail")
    public String detail(int boardNo
            , @RequestParam("vf") boolean viewCntFlag
            , @ModelAttribute("cri") Criteria criteria
            , Model model
            , HttpSession session
    ) {
        NBoard nBoard = nBoardService.viewDetail(boardNo, viewCntFlag);
        log.info("nboard detail GET!! - " + nBoard);
        model.addAttribute("board", nBoard);

        User loginUser = (User) session.getAttribute("loginUser");
        model.addAttribute("loginUser", loginUser);
        log.info("현재 사용중인 user : " + loginUser);

        return "/nboard/nboard-content";
    }

    //게시글 수정 화면 요청
    @GetMapping("/modify")
    public String modify(int boardNo
            , @RequestParam("vf") boolean viewCntFlag
            , Model model
            , HttpSession session
    ) {
        log.info("nboard modify GET!!");
        NBoard nBoard = nBoardService.viewDetail(boardNo, viewCntFlag);
        model.addAttribute("nBoard", nBoard);
        User loginUser = (User) session.getAttribute("loginUser");
        model.addAttribute("loginUser", loginUser);
        return "/nboard/nboard-modify";
    }

    //게시글 수정 저장 요청
    @PostMapping("/modify")
    public String modify(int boardNo
            , DummyNBoard dummyNBoard
    ) {
        log.info("nboard modify POST!!");
        nBoardService.modify(boardNo, dummyNBoard);
        return "redirect:/nboard/detail?boardNo=" + boardNo + "&vf=false";
    }


}
