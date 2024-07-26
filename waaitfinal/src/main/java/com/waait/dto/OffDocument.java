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
	private String vacaType;
	private String startDate;
	private String endDate;
	private int vacaUsed;
	private int[] empNo;
	
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
		return Objects.equals(endDate, other.endDate) && Objects.equals(vacaType, other.vacaType)
				&& Objects.equals(startDate, other.startDate) && vacaUsed == other.vacaUsed;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(endDate, vacaType, startDate, vacaUsed);
		return result;
	}

}
