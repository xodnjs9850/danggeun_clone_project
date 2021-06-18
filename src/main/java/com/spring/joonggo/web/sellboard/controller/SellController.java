package com.spring.joonggo.web.sellboard.controller;

import com.spring.joonggo.web.common.paging.Criteria;
import com.spring.joonggo.web.common.paging.PageMaker;
import com.spring.joonggo.web.common.upload.FileList;
import com.spring.joonggo.web.common.upload.FileUtils;
import com.spring.joonggo.web.nboard.domain.DummyNBoard;
import com.spring.joonggo.web.nboard.domain.NBoard;
import com.spring.joonggo.web.sellboard.domain.DummyBoard;
import com.spring.joonggo.web.sellboard.domain.SellBoard;
import com.spring.joonggo.web.sellboard.service.SellBoardService;
import com.spring.joonggo.web.user.domain.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Log4j2
public class SellController {

    private final SellBoardService sellBoardService;

    // 업로드파일 저장 경로
    private static final String UPLOAD_PATH =
//            "D:\\tw\\study\\Gruop Study\\github\\joongo\\src\\main\\resources\\static\\images\\upload";
"D:\\tw\\study\\Gruop Study\\github\\joonggo2\\src\\main\\resources\\static\\images\\upload";
   /* @Autowired
    public SellController(SellBoardService sellBoardService) {
        this.sellBoardService = sellBoardService;
    }*/

    @GetMapping("")
    public String sellList(@ModelAttribute("cri") Criteria criteria
            , Model model
            , HttpSession session) {
//        List<SellBoard> sellList = sellBoardService.findAll();
        List<SellBoard> list = sellBoardService.findAll(criteria);
        model.addAttribute("sellList", list);

        // 페이지 정보 만들어서 jsp에게 전달
        model.addAttribute("pageMaker", new PageMaker(criteria, sellBoardService.getTotal(criteria)));
        return "/sellboard/home";
    }

    @GetMapping("/sellboard-write")
    public String write(HttpSession session) {
        return "/sellboard/sellboard-write";
    }

    @PostMapping("/sellboard-write")
    public String write(SellBoard sellBoard
            , @RequestParam("file") List<MultipartFile> files
            , HttpSession session) {

        // 업로드 파일의 정보객체를 생성
        //file 클래스의 생성자를 통해 첫번째 파라미터로 저장경로를
        // 두번쨰 파라미터로 파일명을 넣는다
        // 해당 저장위치에 저정명령

        FileList fileData = new FileList();

        for (MultipartFile file : files) {
            log.info("/upload POST 요청");
            log.info("file name : " + file.getOriginalFilename());
            log.info("file size : " + file.getSize());
            log.info("file type : " + file.getContentType());
            log.info("================================================");
//            File uploadFile = new File(UPLOAD_PATH, file.getOriginalFilename());
            try {
                fileData = FileUtils.uploadFile(file, UPLOAD_PATH);
                User loginUser =
                        (User) session.getAttribute("loginUser");
                fileData.setUserId(loginUser.getUserId());
                fileData.setUserNick(loginUser.getUserNickname());
                fileData.setProductNum(sellBoard.getProductNum());
                System.out.println(fileData);
            } catch (IOException e) {
                e.printStackTrace();
            }

//        System.out.println("============================================");
//        System.out.println(sellBoard);
//        System.out.println("============================================");
            sellBoardService.addProduct(sellBoard, fileData);
        }
        return "redirect:/";
    }

    @GetMapping("/content")
    public String detailContent(int productNum
            , @ModelAttribute("cri") Criteria criteria
            , Model model
            , HttpSession session) {
        SellBoard sellBoard = sellBoardService.intoContent(productNum);
        List<String> imgPath = sellBoardService.loadImg(productNum);
//        board =  boardService.viewCount(board);
//        model.addAttribute("cri", criteria);
        model.addAttribute("sellBoard", sellBoard);
        model.addAttribute("mainImgPath", imgPath.get(0));

        System.out.println("*************************************");
        System.out.println(imgPath);
        System.out.println("*************************************");
        return "/sellboard/sellboard-content";
    }

    @GetMapping("/delete")
    public String deleteList(int productNum) {
        sellBoardService.deleteProduct(productNum);
        return "redirect:/";
    }

    @GetMapping("/modify")
    public String modify(int productNum
            , Model model
            , HttpSession session) {
        SellBoard sellBoard = sellBoardService.intoContent(productNum);
//        User loginUser = (User) session.getAttribute("loginUser");
        model.addAttribute("sellBoard", sellBoard);
//        model.addAttribute("loginUser", session);
        return "/sellboard/sellboard-modify";
    }

    @PostMapping("/modify")
    public String modifySave(int productNum, DummyBoard dummyBoard) {
        System.out.println("==============================================");
        System.out.println(dummyBoard);
        System.out.println("==============================================");
        sellBoardService.modifyProduct(productNum, dummyBoard);
        return "redirect:/";
    }


}
