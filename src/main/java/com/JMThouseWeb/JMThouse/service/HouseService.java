package com.JMThouseWeb.JMThouse.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.JMThouseWeb.JMThouse.dto.RequestPostDto;
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
		return houseRepository.findById(houseId).orElseThrow(() -> {
			return new IllegalArgumentException("해당하는 숙소를 찾을 수 없습니다.");
		});
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
		houseRepository.deleteById(houseId);

	}

	@Transactional
	public void postHouse(RequestPostDto requestPostDto) {
		House houseEntity = new House();
		houseEntity.setName(requestPostDto.getName());
		houseEntity.setAddress(requestPostDto.getAddress());
		houseEntity.setInfoText(requestPostDto.getInfoText());
		houseEntity.setType(requestPostDto.getType());
		houseEntity.setOneDayPrice(requestPostDto.getOneDayPrice());
		
		String imageFileName = UUID.randomUUID() + "_" + "image"; // 한글이름 파일 저장시 오류 방지
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");

		Path imageFilePath = Paths.get(uploadFolder + newFileName);

		try {
			Files.write(imageFilePath, requestPostDto.getFile().getBytes());

			Image imageEntity = requestPostDto.toEntity(newFileName);
			imageRepository.save(imageEntity);
			houseEntity.setImage(imageEntity);
			houseRepository.save(houseEntity);

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@Transactional
	public List<House> getHouseList() {
		List<House> houseList = houseRepository.findAll();
		return houseList;

	}

}
