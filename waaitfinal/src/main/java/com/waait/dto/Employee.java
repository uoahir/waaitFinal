package com.waait.dto;

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
	private Integer empNo; //시퀀스값
	private String empName; //사원이름
	private String empId; 	// 사원 아이디
	private String empPwd;	// 사원 비밀번호
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Set<GrantedAuthority> auth  = new HashSet<>();
	if(empNo==81) { //사원에 대한처리부분
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
