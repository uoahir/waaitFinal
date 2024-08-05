package com.waait.dto;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Node {
	private String id;
	private String pid;
	private String name;
	//private String title;
	//private List<Employee> employees;
	private List<String> employees;
	//private List<Map<String, Object>> empName;
}

