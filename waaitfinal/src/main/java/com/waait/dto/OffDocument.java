package com.waait.dto;

import java.sql.Date;
import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OffDocument extends AbstractDocument {
	private String offType;
	private Date startDate;
	private Date endDate;
	
	@Override
	public String getDocument() {
		// TODO Auto-generated method stub
		return "휴가신청서";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		OffDocument other = (OffDocument) obj;
		return Objects.equals(endDate, other.endDate) && Objects.equals(offType, other.offType)
				&& Objects.equals(startDate, other.startDate);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(endDate, offType, startDate);
		return result;
	}
	
	

}
