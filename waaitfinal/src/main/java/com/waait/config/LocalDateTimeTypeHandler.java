package com.waait.config;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class LocalDateTimeTypeHandler implements TypeHandler<LocalDateTime> {

	//DTO에서 String 타입을 DB에 저장시키는 mapper 에서 type핸들러 이용해서 insert함
	
	 @Override
	    public void setParameter(PreparedStatement ps, int i, LocalDateTime parameter, JdbcType jdbcType) throws SQLException {
	        if (parameter != null) {
	            ps.setTimestamp(i, Timestamp.valueOf(parameter));
	        } else {
	            ps.setNull(i, jdbcType.TYPE_CODE);
	        }
	    }

	    @Override
	    public LocalDateTime getResult(ResultSet rs, String columnName) throws SQLException {
	        Timestamp timestamp = rs.getTimestamp(columnName);
	        return timestamp != null ? timestamp.toLocalDateTime() : null;
	    }

	    @Override
	    public LocalDateTime getResult(ResultSet rs, int columnIndex) throws SQLException {
	        Timestamp timestamp = rs.getTimestamp(columnIndex);
	        return timestamp != null ? timestamp.toLocalDateTime() : null;
	    }

	    @Override
	    public LocalDateTime getResult(CallableStatement cs, int columnIndex) throws SQLException {
	        Timestamp timestamp = cs.getTimestamp(columnIndex);
	        return timestamp != null ? timestamp.toLocalDateTime() : null;
	    }

	
	
}
