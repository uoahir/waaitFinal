package com.waait.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.waait.dto.Approval;
import com.waait.service.EDocService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class ApprovalController {
	
	private final EDocService edocService;
	
	@GetMapping("/approvals{docId}")
	public List<Approval> approvals(@PathVariable int docId){
		List<Approval> approvals = edocService.selectApprovalByDocId(docId);
//		ObjectMapper om = new ObjectMapper();
//		try {
//			om.writeValueAsString(approvals);
//		} catch (JsonProcessingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println(om);
		System.out.println("요겅" + approvals);
		return approvals;
	}
}
