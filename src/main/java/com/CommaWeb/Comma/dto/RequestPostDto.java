package com.CommaWeb.Comma.dto;

import org.springframework.web.multipart.MultipartFile;

import com.CommaWeb.Comma.model.Image;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RequestPostDto {

	private MultipartFile file;
	private String name;
	private String address;
	private String type;
	private int capacity;
	private int OneDayPrice;
	private String infoText;

	public Image toEntity(String imageUrl) {
		return Image.builder().imageUrl(imageUrl).originFileName(file.getOriginalFilename()).build();
	}
}
