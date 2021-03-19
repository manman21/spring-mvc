package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.NewEntity;

@Component
public class NewConverter {

	public NewDTO toDto(NewEntity entity) {
		NewDTO result = new NewDTO();
		result.setId(entity.getId());
		result.setTitle(entity.getTitle());
		result.setShortDescription(entity.getShortDescription());
		result.setContent(entity.getContent());
		result.setCategoryCode(entity.getCategory().getCode());
		result.setThumbnail(entity.getThumbnail());
		return result;
	}
	
	public NewEntity toEntity(NewDTO dto) {
		NewEntity result = new NewEntity();
		result.setTitle(dto.getTitle());
		result.setThumbnail(dto.getThumbnail());
		result.setContent(dto.getContent());
		result.setShortDescription(dto.getShortDescription());
		return result;
	}
	
	public NewEntity toEntity(NewEntity result, NewDTO dto) {
		result.setTitle(dto.getTitle());
		result.setThumbnail(dto.getThumbnail());
		result.setContent(dto.getContent());
		result.setShortDescription(dto.getShortDescription());
		return result;
	}
}
