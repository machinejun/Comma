package com.JMThouseWeb.JMThouse.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.JMThouseWeb.JMThouse.dto.RequestPostDto;
import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.model.Image;
import com.JMThouseWeb.JMThouse.model.LikeHouse;
import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.repository.HouseRepository;
import com.JMThouseWeb.JMThouse.repository.ImageRepository;
import com.JMThouseWeb.JMThouse.repository.LikeHouseRepository;
import com.JMThouseWeb.JMThouse.repository.ReviewRepository;
import com.JMThouseWeb.JMThouse.repository.StarScoreRepository;

@Service
public class HouseService {

	@Value("${file.path}")
	private String uploadFolder;

	@Autowired
	private HouseRepository houseRepository;

	@Autowired
	private ImageRepository imageRepository;

	@Autowired
	private LikeHouseRepository likeHouseRepository;

	@Autowired
	private ReviewRepository reviewRepository;

	@Autowired
	private StarScoreRepository starScoreRepository;

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
		houseRepository.deleteById(houseId);

	}

	@Transactional
	public void postHouse(RequestPostDto requestPostDto, User user) {
		House houseEntity = new House();
		houseEntity.setName(requestPostDto.getName());
		houseEntity.setAddress(requestPostDto.getAddress());
		houseEntity.setInfoText(requestPostDto.getInfoText());
		houseEntity.setType(requestPostDto.getType());
		houseEntity.setOneDayPrice(requestPostDto.getOneDayPrice());
		houseEntity.setHostId(user);

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

	@Transactional
	public void addWishList(int houseId, User user) {
		LikeHouse likeHouseEntity = new LikeHouse();
		House selectedHouse = houseRepository.findById(houseId).orElseThrow(() -> {
			return new IllegalArgumentException("해당하는 숙소를 찾을 수 없습니다.");
		});

		likeHouseEntity.setGuest(user);
		likeHouseEntity.setGuestId(user.getId());
		likeHouseEntity.setHouse(selectedHouse);
		likeHouseEntity.setHouseId(houseId);
		likeHouseRepository.save(likeHouseEntity);
	}

	@Transactional
	public List<House> getHouseListByAddress(String address, int houseId) {
		List<House> houses = houseRepository.findAllByAddress(address, houseId).orElseGet(() -> {
			return new ArrayList<House>();
		});
		return houses;
	}

	@Transactional
	public void deleteItemOfWishList(int houseId, int guestId) {
		likeHouseRepository.deleteByHouseIdAndGuestId(houseId, guestId);
	}

	@Transactional
	public List<House> findAllByHostId(int hostId) {
		List<House> houses = houseRepository.findAllByHostId(hostId);
		System.out.println(houses);
		return houses;
	}

	@Transactional
	public void updateHouse(int houseId, RequestPostDto requestPostDto) {

		House houseEntity = houseRepository.findById(houseId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 숙소는 존재하지 않습니다.");
		});

		houseEntity.setName(requestPostDto.getName());
		houseEntity.setAddress(requestPostDto.getAddress());
		houseEntity.setInfoText(requestPostDto.getInfoText());
		houseEntity.setType(requestPostDto.getType());
		houseEntity.setOneDayPrice(requestPostDto.getOneDayPrice());

		String imageFileName = UUID.randomUUID() + "_" + "image";
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

	@Transactional(readOnly = true)
	public int getReviewCount(int houseId) {
		return reviewRepository.getReviewCount(houseId).orElseGet(() -> {
			return 0;
		});
	}

	@Transactional
	public List<House> searchHouseByAddressAndType(String address, String type) {
		return houseRepository.findAllByAddressAndType(address, type);
	}

	@Transactional
	public List<House> searchHouseByAddressOrType(String address, String type) {
		return houseRepository.findAllByAddressOrType(address, type);
	}

}
