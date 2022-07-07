package com.JMThouseWeb.JMThouse.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.JMThouseWeb.JMThouse.dto.ImageFileDto;
import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.model.Image;
import com.JMThouseWeb.JMThouse.repository.HouseRepository;
import com.JMThouseWeb.JMThouse.repository.ImageRepository;

@Service
public class HouseService {
	
	@Value("${file.path}")
	private String uploadFolder;
	
	@Autowired
	private HouseRepository houseRepository;
	
	@Autowired
	private ImageRepository imageRepository;

	@Transactional
	public void registerHouse(House house) {
		houseRepository.save(house);
	}

	@Transactional
	public House getHouseDetail(int houseId) {
		House houseEntity = houseRepository.findById(houseId).orElseThrow(() -> {
			return new IllegalArgumentException("해당하는 숙소를 찾을 수 없습니다.");
		});
		return houseEntity;
	}

	@Transactional
	public void updateHouse(int houseId, House house) {
		House houseEntity = houseRepository.findById(houseId).orElseThrow(() -> {
			return new IllegalArgumentException("해당하는 숙소를 찾을 수 없습니다.");
		});
		
		houseEntity.setName(house.getName());
		houseEntity.setInfoText(house.getInfoText());
		houseEntity.setAddress(house.getAddress());
		houseEntity.setType(house.getType());
		houseEntity.setImage(house.getImage());
		
	}

	@Transactional
	public void deleteHouse(int houseId) {
		// TODO Auto-generated method stub
		
	}

	@Transactional
	public void uploadImage(ImageFileDto fileDto) {

		String imageFileName = UUID.randomUUID() + "_" + "image"; // 한글이름 파일 저장시 오류 방지
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");
		
		Path imageFilePath = Paths.get(uploadFolder + newFileName);
		
		try {
			Files.write(imageFilePath, fileDto.getFile().getBytes());
			
			Image imageEntity = fileDto.toEntity(newFileName);
			imageRepository.save(imageEntity);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
