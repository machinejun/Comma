package com.JMThouseWeb.JMThouse.dto;

import org.springframework.web.multipart.MultipartFile;

import com.JMThouseWeb.JMThouse.model.Image;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageFileDto {
	
	private MultipartFile file;
	
	public Image toEntity(String imageUrl) {
		return Image.builder()
				.imageUrl(imageUrl)
				.originFileName(file.getOriginalFilename())
				.build();
	}
}
