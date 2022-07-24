package com.CommaWeb.Comma.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KaKaoPayResponseDto {
	private String aid;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	private String item_name;
	private Amount amount;
	private String created_at;
	private String approved_at;
	
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public class Amount {
		private int total;
		private int tax_free;
		private int vat;
		private int point;
		
	}
}
