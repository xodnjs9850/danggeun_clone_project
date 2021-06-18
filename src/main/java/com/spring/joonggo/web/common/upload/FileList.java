package com.spring.joonggo.web.common.upload;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Getter @Setter
@ToString
public class FileList {

    private int productNum;
    private String userId;
    private String userNick;
    private Date createDate;
    private String originName;
    private String encryptName;
    private String ext;
    private String filePath;

}
