package com.CommaWeb.Comma.dto.csBoardDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CSboardRequestDto {
	private int boardId;
	private String password;
}
