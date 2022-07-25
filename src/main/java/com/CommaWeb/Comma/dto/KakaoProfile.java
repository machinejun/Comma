package com.CommaWeb.Comma.dto;

import java.math.BigInteger;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class KakaoProfile {

	private BigInteger id;
	private String connectedAt;
	Properties properties;
	KakaoAccount kakaoAccount;
	
	@Data
	@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
	public class Properties {
		private String nickname;
		private String profileImage;
		private String thumbnailImage;
	}
	
	@Data
	@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
	public class KakaoAccount {
		private boolean profileNicknameNeedsAgreement;
		private boolean profileImageNeedsAgreement;
		Profile profile;
		private boolean hasEmail;
		private boolean emailNeedsAgreement;
		private boolean isEmailValid;
		private boolean isEmailVerified;
		private String email;
		
		@Data
		@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
		public class Profile {
			private String nickname;
			private String thumbnailImageUrl;
			private String profileImageUrl;
			private boolean isDefaultImage;
			
		}
	}
}