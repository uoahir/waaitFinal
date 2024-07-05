package com.waait.mypage.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Employee {
    private Long empNo;
    private String empId;
    private String empPwd;
    private String deptCode;
    private String levelCode;
    private String empName;
    private Date empStartDate;
    private Date empEndDate;
    private String leaveYN;
    private String empEmail;
    private String empProfile;
    private String empGender;
    private String empBirth;
    private String empPhone;
    private String empAddress;
    private String empSignfile;
	
	
}
