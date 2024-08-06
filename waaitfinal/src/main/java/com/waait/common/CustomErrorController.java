package com.waait.common;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {

	@RequestMapping("/error")
    public String handleError(HttpServletRequest request, @RequestParam(required = false) String errorCode) {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        System.out.println("statusCode : " + statusCode);
        if (statusCode != null) {
            switch (statusCode) {
                case 404:
                    return "error/error-404";
                case 500:
                    return "error/error-500";
                default:
                    return "error/error";
            }
        }
        return "error/error";
    }


}