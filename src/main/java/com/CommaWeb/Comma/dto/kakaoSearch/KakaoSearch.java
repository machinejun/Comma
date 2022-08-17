
package com.CommaWeb.Comma.dto.kakaoSearch;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class KakaoSearch {
    public Meta meta;
    public List<Document> documents = null;

}
