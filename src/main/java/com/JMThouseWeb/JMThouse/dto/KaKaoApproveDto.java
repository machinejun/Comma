package com.JMThouseWeb.JMThouse.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class KaKaoApproveDto {
	String tid;
	String next_redirect_pc_url;
}
