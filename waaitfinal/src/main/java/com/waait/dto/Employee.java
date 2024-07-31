package com.waait.dto;

import java.sql.Date;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.mybatis.spring.boot.autoconfigure.MybatisAutoConfiguration;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.waait.common.EmpAuthority;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Employee implements UserDetails{
   
	private static final long serialVersionUID = 1L;
	private Long empNo;
    private String empId;
    private String empPwd;
    private String deptCode;
    private Department department;
    private String levelCode;
    private JobLevel jobLevel;
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
	private int basicAnnualLeave; // 기본연차
	private int remainingAnnualLeave; // 잔여연차
    private String deptName;
    private String teamName;
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Set<GrantedAuthority> auth  = new HashSet<>();
	if(deptCode.equals("L1")) { //사원에 대한처리부분
		auth.add(new SimpleGrantedAuthority(EmpAuthority.ADMIN.name()));
		
	}
	auth.add(new SimpleGrantedAuthority(EmpAuthority.USER.name()));
		return auth;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.empPwd;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.empId;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
