package com.CommaWeb.Comma.api;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.ApproveDto;
import com.CommaWeb.Comma.dto.HostTableDto;
import com.CommaWeb.Comma.dto.KaKaoApproveDto;
import com.CommaWeb.Comma.dto.ResponseDto;
import com.CommaWeb.Comma.dto.ResponsePaidDto;
import com.CommaWeb.Comma.model.Reservation;
import com.CommaWeb.Comma.service.ReservationService;

@RestController
@RequestMapping("/api/reservation")
public class ReservationApiController {
	
	@Autowired
	HttpSession httpSession;

	@Autowired
	private ReservationService reservationService;

	
	// 예약을 하는 기능
	@PostMapping("/")
	public ResponseDto<String> reserveHouse(@RequestBody Reservation reservation, @AuthenticationPrincipal PrincipalDetail principal) {
		System.out.println(reservation);
		reservationService.makeReservation(reservation);
		return new ResponseDto<String>(HttpStatus.OK.value(), "OK");
	}
	
	// 호스트 예약관리 테이블에 정보를 가져오는 기능
	@GetMapping("/house/{houseId}/{hostId}")
	public List<HostTableDto> getHouseReservation(@PathVariable int hostId, @PathVariable int houseId,
			@RequestParam int month) {
		System.out.println(">> " + hostId + "+" + houseId);

		List<HostTableDto> result = reservationService.getTableInfo(hostId, houseId, month);
		return result;
	}

	@GetMapping("/house/{hostId}")
	public List<HostTableDto> getHouseReservation(@PathVariable int hostId, @RequestParam int month) {
		List<HostTableDto> result = reservationService.getTableInfo(hostId, month);
		return result;
	}
	
	// 호스트 측 예약 취소 기능
	@DeleteMapping("/delete/{reservationId}")
	public int deleteReservation(@PathVariable int reservationId) {
		reservationService.cancelReservation(reservationId);
		return reservationId;
	}
	
	// 호스트 예약 승인 기능
	@PostMapping("/approve")
	public ResponseDto<Integer> approveRes(@RequestBody ApproveDto approveDto) {
		System.out.println("get    " + approveDto);
		reservationService.changeResType(approveDto);
		return new ResponseDto<Integer>(HttpStatus.ACCEPTED.value(), approveDto.getResId());
	}
	
	// 예약에 대한 디테일 정보를 가져오는 기능
	@GetMapping("/detail")
	public Reservation showResDetail(@RequestParam int resId) {
		Reservation res = reservationService.findByResId(resId);
		System.out.println(res);
		return res;
	}
	
	// 결제를 요청하는 기능
	@PostMapping("/kakao")
	public KaKaoApproveDto payForKaKao(@RequestBody ResponsePaidDto paidDto) {
		System.out.println(paidDto);
		Reservation res = reservationService.findByResId(paidDto.getResId());
		int price = reservationService.getRangeDay(res.getCheckInDate(), res.getCheckOutDate())
				* res.getHouseId().getOneDayPrice();
		paidDto.setPrice(price);
		paidDto.setGuestName(res.getGuestId().getUsername());
		paidDto.setHostName(res.getHostId().getUsername());
		paidDto.setHouseName(res.getHouseId().getName());
		paidDto.setHouseId(res.getHouseId().getId());
		KaKaoApproveDto approveDto = requestReadyForKaKaoPay(paidDto.getGuestName(), paidDto.getHostName(),
				paidDto.getHouseName(), paidDto.getPrice());
		paidDto.setTid(approveDto.getTid());
		httpSession.setAttribute("kakao", paidDto);
		return approveDto;
	}
	
	// 카카오 API를 사용하여서 카카오 측에게 Post Message를 던지는 
	private KaKaoApproveDto requestReadyForKaKaoPay(String guestName, String hostName, String houseName, int price) {
		RestTemplate transmitter = new RestTemplate();
		HttpHeaders header = new HttpHeaders();
		header.add("Authorization", "KakaoAK d8767c47b52237a1d96cea7c9e34596b");
		header.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> param = new LinkedMultiValueMap<>();
		param.add("cid", "TC0ONETIME");
		param.add("partner_order_id", hostName);
		param.add("partner_user_id", guestName);
		param.add("item_name", houseName);
		param.add("quantity", "1");
		param.add("total_amount", String.valueOf(price));
		param.add("tax_free_amount", "0");
		param.add("approval_url", "http://localhost:9090/kakao/approve");
		param.add("cancel_url", "http://localhost:9090/user/cancel");
		param.add("fail_url", "http://localhost:9090/user/error");

		HttpEntity<MultiValueMap<String, String>> message = new HttpEntity<>(param, header);
		ResponseEntity<KaKaoApproveDto> response = transmitter.exchange("https://kapi.kakao.com/v1/payment/ready",
				HttpMethod.POST, message, KaKaoApproveDto.class);
		return response.getBody();
	}
	
	
}
