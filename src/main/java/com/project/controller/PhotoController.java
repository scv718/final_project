package com.project.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.community.PhotoVO;

//@Controller
public class PhotoController {

	//단일파일업로드
			@RequestMapping("/photoUpload")
			public String photoUpload(HttpServletRequest request, PhotoVO vo){
			    String callback = vo.getCallback();
			    String callback_func = vo.getCallback_func();
			    String file_result = "";
			    try {
			        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
			            //파일이 존재하면
			            String original_name = vo.getFiledata().getOriginalFilename();
			            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
			            //파일 기본경로
			            String defaultPath = request.getSession().getServletContext().getRealPath("/");
			            //파일 기본경로 _ 상세경로
			            String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;              
			            File file = new File(path);
			            System.out.println("path:"+path);
			            //디렉토리 존재하지 않을경우 디렉토리 생성
			            if(!file.exists()) {
			                file.mkdirs();
			            }
			            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
			            String realname = UUID.randomUUID().toString() + "." + ext;
			        ///////////////// 서버에 파일쓰기 ///////////////// 
			            vo.getFiledata().transferTo(new File(path+realname));
			            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"+realname;
			        } else {
			            file_result += "&errstr=error";
			        }
			    } catch (Exception e) {
			        e.printStackTrace();
			    }
			    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
			}
}
