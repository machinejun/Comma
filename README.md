# Project - Comma


## 프로젝트 기간
<h3>v.0.1.0</h3>
2022.07.05 ~ 2022.07.25

<br>

<h3>v.0.2.0</h3>
<p>2022.08.01 ~ 2022.08.11</p>

**📌 추가 기능 및 변화**

	* UI 개선
	* 고객센터 및 관리
	* 회원 신고 및 관리
	* 데이터 통계 현황 조회
	* 숙소 상세 주소 등록 및 조회 (도로명 API / 카카오맵 API)

<br>

## 프로젝트 소개

코로나 19 이후 여행지로 떠나기보다 프라이빗한 공간을 빌려 휴식을 즐기는 사람들이 늘어나면서 숙박 서비스 이용률이 증가하고 있습니다. <br>
대학 시절 방학 때 자취방을 오랜기간 비워두었던 경험이 있습니다. 이럴 때 전문 숙박 업소는 부담스럽고, 묵을 공간을 찾는 이에게 저의 공간을 빌려줄 수 있으면 좋겠다는 생각을 했었습니다. <br>
이런 점에서 착안하여 이번 프로젝트에서는 기본 숙박 예약 서비스 뿐만 아니라, 누구든 호스트가 되어 자신의 공간을 남에게 빌려줄 수 있는 서비스를 구현하고자 하였습니다.
이러한 시스템과 유사한 에어비앤비를 모티브로 하여 <b>"누구든 호스트, 누구든 게스트"</b>가 될 수 있는 웹 사이트를 만들게 되었습니다.

<br>

## 기능 

* <b>공통 기능</b>

1.  로그인 / 소셜 로그인 (카카오 로그인 API)
2.  회원가입 / 회원정보 수정
	- 회원가입 / 회원 정보 수정 시 validation 처리
		- 아이디 중복 확인
		- 비밀번호 글자수 제한(8~12자)
		- 이메일/전화번호 형식 확인
3.  호스트 / 게스트 모드 전환
4.  숙소 리스트 조회(검색)
	- 지역 카테고리별, 숙소 유형별 검색
5. 숙소 상세 조회
	- 숙소 상세 설명 / 리뷰 / 별점 / 위시리스트 카운트 조회
	- 상세 주소 확인 (카카오 지도 API)
6.  회원 신고
7. 고객센터
	- 사이트 서비스에 대한 문의글 작성
	- 비밀글 작성 (관리자와 작성자만 열람 가능)
	
<br>

* <b> 게스트 기능</b>

1. 예약 하기
   - 숙박 일정 지정(체크인/체크아웃 날짜 설정), 인원수, 요청 사항 작성
2. 위시리스트
   - 관심 있는 숙소를 추가/삭제하여 따로 관리할 수 있음
3. 리뷰 작성/조회/수정
   - 별점과 텍스트를 넣은 리뷰 작성
   -  리뷰 작성은 COMPLETED된 예약 건에 한해서 작성 가능
4. 예약 관리
   - 자신의 예약 내역을 관리 / 조회 (결제, 승인 / 취소 현황)
   - 숙소 예약 시 → WAITING
   - 호스트의 승인 → APPROVED (결제 가능)
   - 결제 완료 → PAID (카카오 결제 API)
   - 현재 날짜가 체크아웃 날짜를 지나면 → COMPLETED (리뷰 작성 가능)
5. 리뷰 관리
   - 자신이 작성한 리뷰 리스트 조회, 수정, 삭제
   - 자신의 리뷰에 대한 호스트 댓글 조회
   - 호스트 댓글에 부적절한 내용 있을 시 신고 가능 (해당 댓글과 작성자 신고 접수)
   
   <br>
   
* <b>호스트 기능</b>

1. 숙소 등록 
	- 숙소 이미지 파일 업로드
	- 상세 주소 입력 (도로명 주소 API)
2. 숙소 정보 수정, 삭제
3. 예약 관리
   - 자신이 등록한 숙소에 대한 예약 조회 (숙소별, 월별 조회)
   - 접수된 예약 건에 대한 승인, 취소
4. 리뷰 관리
   - 자신이 등록한 숙소에 대해 작성된 리뷰들을 조회
   - 게스트들이 작성한 리뷰에 대한 답글 작성
   - 자신이 작성한 답글 수정/삭제
   - 게스트의 리뷰 중 부적절한 내용 포함 시 신고 가능 (해당 리뷰와 작성자 신고 접수)
   
   <br>
   
* <b>관리자 기능</b>

1. 전체 유저 정보 조회
2. 고객센터 관리
	- 공지사항 등록
	- 문의글에 대한 댓글 작성
	- 회원의 비밀글 조회 / 댓글 작성
3. 회원 신고 관리
	- 신고된 회원과 게시물 조회
	- 사유 및 신고 게시물 확인 후 승인/취소 처리
	- 신고 승인시 해당 회원의 신고 횟수 + 1
4.  회원 및 숙소 데이터 현황 조회
	- 월별 데이터 증감 현황 조회
	- 지역별 숙소 등록 수 조회
	- 월별 숙소 예약 건수 별 TOP5/TOP10 조회

<br>

## 사용 기술 및 라이브러리

* <b>사용 언어</b>

<img src="https://img.shields.io/badge/java-1E8CBE?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">

<br>

* <b>RDBMS</b>

<img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">

<br>

* <b>빌드 관리</b>

<img src="https://img.shields.io/badge/maven-181717?style=for-the-badge&logo=apachemaven&logoColor=white">

<br>

* <b>웹개발 프레임워크</b>

<img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">

<br>

* <b>보안</b>

<img src="https://img.shields.io/badge/springsecurity-6DB33F?style=for-the-badge&logo=git&logoColor=white">

<br>

* <b>버전 관리</b>

<img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">

<br>

   
* <b>그 외 라이브러리</b>

jQuery, Jasper, jstl, security-tag, Lombok, jdbc, qlrm, datepicker, summernote
   
<br>

## ERD

![erd](https://user-images.githubusercontent.com/96460131/184461899-e04ab4d2-9d78-4e16-9603-aafa2f34a715.png)
<br>
## Git flow 전략
   - <b>main : </b>프로젝트 version별 완성 단위, 최종으로 배포
   - <b>developer : </b>개발을 진행하는 중심적인 브랜치, feature 브랜치에서 기능 완성 단위로 merge
   - <b>feature-** : </b>팀원 개개인의 기능 단위 개발
<br>

## 페이지 구성

</br>

| 메인 | 숙소 리스트 |
|--|--|
| ![메인](https://user-images.githubusercontent.com/96460131/184464058-eae8f097-1bc7-4042-9e44-67ea13fe98fb.gif) | ![리스트](https://user-images.githubusercontent.com/96460131/184464689-646d1397-033b-4223-9d10-272a3a68003a.gif) |


| 일반 로그인 | 소셜 로그인 |
|--|--|
|![로그인](https://user-images.githubusercontent.com/96460131/184464450-599a4b3c-3177-49f1-867f-4e59d421e81a.gif)  | ![소셜로그인](https://user-images.githubusercontent.com/96460131/181501469-eac0a891-edb8-4415-9332-f82dd0edf876.gif) |


<br>

|회원가입|회원정보 수정|
|--|--|
| ![회원가입](https://user-images.githubusercontent.com/96460131/184464377-51ff4f79-9bc2-480b-9ae8-7d807a7edf0d.gif) | ![회원정보수정](https://user-images.githubusercontent.com/96460131/184464553-0ec27e85-8389-452a-83af-cc302b5fd4ea.gif) |

<br>

|숙소 검색| 숙소 상세 조회 |
|--|--|
| ![리스트_검색](https://user-images.githubusercontent.com/96460131/184464276-33b851a3-4194-46a3-99e5-229379de6a23.gif) | ![숙소상세조회](https://user-images.githubusercontent.com/96460131/184464820-600df3c0-4f27-45ba-bd8c-b7a0cf4cdeb3.gif) |
|지역 카테고리별, 유형별 검색|상세 주소, 숙소 리뷰 조회, 같은 지역 카테고리인 숙소 별점 순 4개 추천|

</br>

## 게스트

### 숙소 예약


|숙소 예약| 예약 내역 조회 |
|--|--|
| ![게스트예약](https://user-images.githubusercontent.com/96460131/181460083-df1cb3d1-9b55-4894-9501-5937c640e296.gif) | ![예약내역조회](https://user-images.githubusercontent.com/96460131/181461941-a03b0256-fd4c-4ed2-abb4-4fe53cfaa539.gif) |



|결제| 결제완료 |
|--|--|
| ![카카오페이 결제](https://user-images.githubusercontent.com/96460131/181154799-264297b8-ad33-48cf-9d4c-63e48fec3b18.png) | ![예약완료](https://user-images.githubusercontent.com/96460131/181170884-827f773f-c97a-4df2-9bbd-15f59cc1b3dd.png) |



### 리뷰 작성, 리뷰 

| 리뷰 등록 | 리뷰 수정 | 리뷰 삭제 |
|--|--|--|
| ![리뷰등록](https://user-images.githubusercontent.com/96460131/181460869-247fd745-023e-4454-822d-017488a2d274.gif) | ![리뷰수정](https://user-images.githubusercontent.com/96460131/181656824-385dda00-841a-4e3c-b0e9-6a8fd6bdf808.gif) | ![리뷰삭제](https://user-images.githubusercontent.com/96460131/181656807-7dff361f-89bf-456f-b5af-56769de21738.gif) |




### 위시리스트
- 하트 아이콘 클릭시 추가, 삭제

| 위시리스트 추가 | 위시리스트 삭제 |
|--|--|
| ![위시리스트_추가](https://user-images.githubusercontent.com/96460131/184466025-ad25d465-beed-49d2-b5f9-8dfb8281caf8.gif)| ![위시리스트_삭제](https://user-images.githubusercontent.com/96460131/184466034-9fbe2319-3ef9-48f0-9900-84c1dbac57b5.gif) |



</br>

## 호스트

### 숙소 관리

|등록|수정|삭제|
|--|--|--|
| ![숙소등록](https://user-images.githubusercontent.com/96460131/181459021-59208100-ec6f-4507-b30f-ec2aa4828da8.gif) | ![ezgif com-gif-maker (3)](https://user-images.githubusercontent.com/96460131/181504618-6f13f3d0-89bb-495c-bebc-d9abcab31842.gif) |![ezgif com-gif-maker](https://user-images.githubusercontent.com/96460131/181504013-517c7849-a11d-4216-bc73-148dff8a85f7.gif)|



### 리뷰 관리

| 댓글 등록 | 댓글 수정 | 댓글 삭제 |
|--|--|--|
| ![댓글달기](https://user-images.githubusercontent.com/96460131/181455213-0518ff6b-9aed-44e5-8219-57804da10943.gif) | ![댓글수정](https://user-images.githubusercontent.com/96460131/181656397-885c8895-02de-4fc9-8dc5-dc54b4defb27.gif) | ![댓글삭제](https://user-images.githubusercontent.com/96460131/181470956-83113b58-66ac-4353-bfae-29431a96c18a.gif) |


### 예약 내역 관리
- WAITING 상태인 게스트의 예약 승인 처리, 예약 취소 

|예약 승인|예약 취소|
|--|--|
| ![예약승인](https://user-images.githubusercontent.com/96460131/181657823-fdcc40aa-54c5-4871-bd5d-c3a825bfcbb0.gif) | ![예약취소](https://user-images.githubusercontent.com/96460131/181657812-37422562-f387-4722-953a-4badb71c63a4.gif) |



</br>

## 관리자

### 회원 조회
![관리자](https://user-images.githubusercontent.com/96460131/181155327-950b3b21-2568-4d37-bb3f-bc7d8db105b1.png)

## Detail page


| 에러 페이지 |호스트 모드|게스트 모드 |
|--|--|--|
| ![에러페이지](https://user-images.githubusercontent.com/96460131/181458756-73942d34-6f6a-4fe4-8f1d-4b7c1af0bc43.gif) | ![호스트되기](https://user-images.githubusercontent.com/96460131/181458686-7cecac67-bf97-4146-9de2-ee73851cf9e7.gif) | ![게스트되기](https://user-images.githubusercontent.com/96460131/181458714-3fc76e9f-6afb-47b3-b8eb-0d90034213cc.gif) |

<br/>

- 예약 안내

![image](https://user-images.githubusercontent.com/99931188/181436220-a8603903-4f86-4a25-bf52-c8caa03c690d.png)

