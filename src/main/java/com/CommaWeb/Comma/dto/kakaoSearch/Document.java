
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
public class Document {
    public String placeName;
    public String distance;
    public String placeUrl;
    public String categoryName;
    public String addressName;
    public String roadAddressName;
    public String id;
    public String phone;
    public String categoryGroupCode;
    public String categoryGroupName;
    public String x;
    public String y;
}
