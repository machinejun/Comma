
package com.CommaWeb.Comma.dto.kakaoSearch;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class Meta {
    public SameName sameName;
    public Integer pageableCount;
    public Integer totalCount;
    public Boolean isEnd;

}
