package com.waait.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.waait.dto.Department;
import com.waait.dto.Node;
import com.waait.service.NodeService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class NodeController {
	
	private final NodeService nodeService;
	
	@GetMapping("/nodeData")
	public ResponseEntity<List<Node>> getTreeData(){
		try {
			// DB에서 트리 데이터 조회
			List<Node> nodeData = nodeService.getNodeData();
			System.out.println(nodeData);
			return ResponseEntity.ok(nodeData);
			
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
}
