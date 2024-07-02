package com.waait.controller;

import org.springframework.stereotype.Controller;

import com.waait.mypage.model.service.MailService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class MailController {
	
	private final MailService service;
}
