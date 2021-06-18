/*
package com.spring.joonggo.web.common.upload;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@Log4j2
public class FileUploadController {

    // 업로드파일 저장 경로
    private static final String UPLOAD_PATH = "D:\\joonggo\\upload";

    // 파일 업로드 요청 처리
    // MultipartFile : 클라이언트가 전송한 파일의 여러 데이터를 담고있는 객체
    @PostMapping("/upload")
    public String upload(@RequestParam("file") List<MultipartFile> files) {
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
                System.out.println(fileData);
            } catch (IOException e) {
                e.printStackTrace();
            }

            */
/*try {
                file.transferTo(uploadFile);
            } catch (IOException e) {
                e.printStackTrace();
            }*//*

        }
        return "/";
    }

}
*/
