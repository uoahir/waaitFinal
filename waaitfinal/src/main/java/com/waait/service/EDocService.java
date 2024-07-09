package com.waait.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.waait.dto.Document;
import com.waait.dto.Employee;

public interface EDocService {
	List<Employee> employeeList();
	int insertBasicEdoc(Document document);
}
