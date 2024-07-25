package com.waait.dto;

import java.sql.Date;
import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TripDocument extends AbstractDocument {
	private int tripId;
	private int docId;
	private String destination;
	private Date startDate;
	private Date endDate;
	private String purpose;
	// 관차 사용여부
	
	
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
		TripDocument other = (TripDocument) obj;
		return Objects.equals(destination, other.destination) && Objects.equals(endDate, other.endDate)
				&& Objects.equals(purpose, other.purpose) && Objects.equals(startDate, other.startDate);
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(destination, endDate, purpose, startDate);
		return result;
	}

	
	
	
}
