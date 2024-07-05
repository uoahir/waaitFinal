package com.waait.config;

import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import jakarta.servlet.MultipartConfigElement;

//spring-boot3 이후로는 multipart로 파일 넘겨줄때 설정을 해야함
@Configuration
public class MultipartConfig {


}
