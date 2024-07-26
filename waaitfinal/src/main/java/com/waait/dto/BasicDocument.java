package com.waait.dto;

import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BasicDocument extends AbstractDocument {
	
	private String docContent;
	
	@Override
	public String getDocument() {
		// TODO Auto-generated method stub
		return "일반보고서";
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		BasicDocument other = (BasicDocument) obj;
		return Objects.equals(docContent, other.docContent);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(docContent);
		return result;
	}

	@Override
	public String toString() {
		return "BasicDocument [docContent=" + docContent  + super.toString() + "]";
	}


	
	
	
	

}
