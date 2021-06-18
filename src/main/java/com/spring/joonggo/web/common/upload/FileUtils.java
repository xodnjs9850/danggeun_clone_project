package com.spring.joonggo.web.common.upload;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.UUID;

public class FileUtils {

    /*// 파일 확장자와 이름을 추출하는 메서드
    public void getExt(File file) {
        String fileName = file.getName();
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
    }*/
    // 사용자가 파일을 업로드했을 때 저장 처리 및 파일명을 리턴하는 메서드
    public static FileList uploadFile(MultipartFile file, String uploadPath) throws IOException {

        // 파일 확장자와 이름을 추출
        String originName = file.getOriginalFilename();
        String ext = originName.substring(originName.lastIndexOf(".") + 1);

        // 중복없는 파일명으로 변환
        // dog.jpg -> 12457234dcvdsafsf-schjwkt4392343-dvkshdrtg4523-dog.jsp
        String newFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

        // 저장 경로에 날짜별 폴더를 생성
        // ex) D:/develping/upload/2021/06/07
        String newUploadPath = getNewUploadPath(uploadPath);

        System.out.println("--------------------------------------------");
        System.out.println(newUploadPath);
        System.out.println(originName);
        System.out.println("--------------------------------------------");

        FileList fileList = new FileList();

        // 업로드 수행
        File uploadFile = new File(newUploadPath, newFileName);

        String[] dummy = newUploadPath.split("upload");
        System.out.println("==============================");
        System.out.println(Arrays.toString(dummy));

        try {
            file.transferTo(uploadFile);
            fileList.setExt(ext);
            fileList.setEncryptName(newFileName);
            fileList.setOriginName(originName);
            fileList.setFilePath(dummy[1] + File.separator + newFileName);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return fileList;
    }

    // 파일 확장자 제한
    private boolean fileExtLimit(String ext) throws Exception {

        final String[] PERMISSION_FILE_EXT_ARR = {"GIF", "JPEG", "JPG", "PNG"};

        ext = ext.toUpperCase();

        boolean isPermissionFileExt = false;

        for (int i = 0; i < PERMISSION_FILE_EXT_ARR.length; i++) {
            if (PERMISSION_FILE_EXT_ARR[i].equals(ext)) {
                isPermissionFileExt = true;
                break;
            }
        }
        return isPermissionFileExt;

    }


    // 날짜별 폴더 생성 메서드
    private static String getNewUploadPath(String uploadPath) {

        LocalDate now = LocalDate.now();
        int y = now.getYear();
        int m = now.getMonthValue();
        int d = now.getDayOfMonth();

        // 폴더 생성
        String[] dateInfo = {String.valueOf(y), len2(m), len2(d)};
        for (String date : dateInfo) {
            // File.separator : 운영체제에 맞게 경로구분 문자열을 만들어줌
            // 윈도우 : \\     리눅스 : /
            uploadPath += File.separator + date;

            // 이 경로대로 폴더 생성
            File directory = new File(uploadPath);
            if (!directory.exists()) {
                directory.mkdir();
            }
        }
        return uploadPath;
    }

    private static String len2(int len) {
        if (len < 10) {
            return "0" + len;
        } else {
            return "" + len;
        }
    }

}
