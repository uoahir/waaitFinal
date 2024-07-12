package com.waait.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.JsTree;
import com.waait.service.JsTreeService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class JsTreeController {
	
	private final JsTreeService jsTreeService;
	
	@GetMapping("/treedata")
	public ResponseEntity<List<JsTree>> getTreeData(){
		try {
			// DB에서 트리 데이터 조회
			List<JsTree> treeNodes = jsTreeService.getTreeDeptData();
			System.out.println(treeNodes);
			return ResponseEntity.ok(treeNodes);
			
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

}
