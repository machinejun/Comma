
# project - Comma

**"Anyone Be Host, Be Guest"**

<br>

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

타지에서 대학 생활을 했던 사람이라면, 방학 때 또는 코로나로  수업이 비대면으로 전환 되었을 때 불가피하게 자취방을 오랜기간 비워두었던 경험이 있을 것입니다.
또한 출장, 면접, 대회 참여 등 타지역에서 잠시 숙박을 해야할 상황이 생겼을 때 혼자 숙박 업소를 이용하는 것이 금액적으로나 상황적으로 부담스럽게 느낀 경험이 다수 있을 거라 생각했습니다.

<br>

필요에 따라서 자신의 방을 타인에게 대여해줄 수도 있고, 타인의 방을 대여 할 수도 있는 서비스가 있다면 위의 2가지의 곤란한 상황을 서로에게 도움을 줄 수 있는 방향으로 묶어 낼 수 있을 것이라는 생각을 하여 이번 프로젝트를 진행하게 되었고, 사이트의 메인 키워드를 <b>"Anyone Be Host, Be Guest"</b>로 설정하였습니다.

<br>

콤마(Comma)에서는 전문적인 숙박 서비스를 제공하는 숙박업소가 아닌 일반적인 이용자도 숙박 서비스를 제공할 수 있는, 누구든 호스트가 되어 자신의 공간을 남에게 빌려줄 수 있는 서비스를 구현하고자 하였습니다. 이러한 시스템과 유사한 에어비앤비를 모티브로 하여 <b>"누구든 호스트, 누구든 게스트"</b>가 될 수 있는 웹 사이트를 만들게 되었습니다.

<br>

## 서비스 구현 흐름 (숙박 예약 서비스)

<img src="https://user-images.githubusercontent.com/99931188/184539538-69160046-fafc-454c-be4e-4860e1e127f5.png">

기존의 우리가 알고 있는 숙박 서비스는 전문적인 숙업업소를 대상으로 하며 숙박업소의 방이라는 물품을 <b>"구매"</b>하는 방향으로 서비스가 전개되어진다고 생각했습니다. 일반적으로 예약시 결제를 진행하는 기존의 흐름과 달리 저희의 서비스 대상은 숙박 업체가 아니라 바로 우리 옆에 있는 친구들이기에 기존의 서비스 흐름과 같은 <b>"구매"</b>와 다르게 친구와의 <b>"약속"</b>과 같이 아래의 흐름처럼 예약을 진행하기로 하였습니다.<br>

* 콤마(Comma)에서의 약속의 흐름
1. 내가 시간이 되는가 묻는다.  →  게스트 예약 
2. 친구가 가능하다고 대답한다.  →  호스트 승인
3. 그 날을 약속 날짜로 정한다. →  결제
<br>

## 기능 

* <b>공통 기능</b>

1.  로그인 / 소셜 로그인 (카카오 로그인 API, OAuth 2.0)
2.  회원가입 / 회원정보 수정
	- 회원가입 / 회원 정보 수정 시 validation 처리
		- 아이디 중복 확인
		- 비밀번호 글자수 제한(8~12자)
		- 이메일/전화번호 형식 확인
3.  호스트 / 게스트 모드 전환
4.  숙소 리스트 조회(검색)
	- 지역 카테고리별, 숙소 유형별 검색
5. 숙소 상세 조회
	- 상세페이지 정보 (숙소 정보, 지역 정보(주변 지도), 숙소 후기 정보, 다른 게스트의 참고 정보)
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
<img width="901" alt="erd" src="https://user-images.githubusercontent.com/96460131/184562383-0da75925-721e-4b95-b227-756bf605ad03.png">


## Git flow 전략
![image](https://user-images.githubusercontent.com/99931188/184559433-b350841a-69c7-45d8-bf4f-b316cd47e7a3.png)

   - <b>main : </b>프로젝트 version별 완성 단위, 최종으로 배포
   - <b>developer : </b>개발을 진행하는 중심적인 브랜치, feature 브랜치에서 기능 완성 단위로 merge
   - <b>feature-** : </b>팀원 개개인의 기능 단위 개발
<br>

## 페이지 구성

<br>

## 공통

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

<br>

|고객센터 게시판 메인|문의글 상세 조회|
|--|--|
| ![고객센터_게시판](https://user-images.githubusercontent.com/96460131/184563663-eda350aa-5ae4-41ee-bfdd-29649dcfffa4.jpg)|![고객센터_관리자_댓글](https://user-images.githubusercontent.com/96460131/184563691-76299333-cb68-443d-a246-e09688ef5318.jpg)|
|관리자가 작성시 공지사항으로 등록되어 최상단 정렬|일반 문의글/비밀글 작성 (비밀글 작성시 작성자, 관리자만 조회 가능)|


<br>

## 게스트

### 숙소 예약


|숙소 예약| 예약 내역 조회 |
|--|--|
| ![게스트예약](https://user-images.githubusercontent.com/96460131/181460083-df1cb3d1-9b55-4894-9501-5937c640e296.gif) | ![예약내역조회](https://user-images.githubusercontent.com/96460131/181461941-a03b0256-fd4c-4ed2-abb4-4fe53cfaa539.gif) |
|이미 예약되어 있는 날짜 지정 불가, 호스트가 지정한 최대 인원 수 제한| |

<br>

|결제| 결제 완료 |
|--|--|
| ![카카오페이 결제](https://user-images.githubusercontent.com/96460131/181154799-264297b8-ad33-48cf-9d4c-63e48fec3b18.png) | ![예약완료](https://user-images.githubusercontent.com/96460131/181170884-827f773f-c97a-4df2-9bbd-15f59cc1b3dd.png) |



### 리뷰

| 리뷰 등록 | 리뷰 수정 | 리뷰 삭제 |
|--|--|--|
| ![리뷰등록](https://user-images.githubusercontent.com/96460131/181460869-247fd745-023e-4454-822d-017488a2d274.gif) | ![리뷰수정](https://user-images.githubusercontent.com/96460131/181656824-385dda00-841a-4e3c-b0e9-6a8fd6bdf808.gif) | ![리뷰삭제](https://user-images.githubusercontent.com/96460131/181656807-7dff361f-89bf-456f-b5af-56769de21738.gif) |



### 위시리스트

| 위시리스트 추가 | 위시리스트 삭제 |
|--|--|
| ![위시리스트_추가](https://user-images.githubusercontent.com/96460131/184466025-ad25d465-beed-49d2-b5f9-8dfb8281caf8.gif)| ![위시리스트_삭제](https://user-images.githubusercontent.com/96460131/184466034-9fbe2319-3ef9-48f0-9900-84c1dbac57b5.gif) |



<br>

## 호스트

### 숙소 관리

|등록|수정|삭제|
|--|--|--|
| ![숙소등록](https://user-images.githubusercontent.com/96460131/181459021-59208100-ec6f-4507-b30f-ec2aa4828da8.gif) | ![ezgif com-gif-maker (3)](https://user-images.githubusercontent.com/96460131/181504618-6f13f3d0-89bb-495c-bebc-d9abcab31842.gif) |![ezgif com-gif-maker](https://user-images.githubusercontent.com/96460131/181504013-517c7849-a11d-4216-bc73-148dff8a85f7.gif)|



### 리뷰 관리

| 댓글 등록 | 댓글 수정 | 댓글 삭제 |
|--|--|--|
| ![댓글달기](https://user-images.githubusercontent.com/96460131/181455213-0518ff6b-9aed-44e5-8219-57804da10943.gif) | ![댓글수정](https://user-images.githubusercontent.com/96460131/181656397-885c8895-02de-4fc9-8dc5-dc54b4defb27.gif) | ![댓글삭제](https://user-images.githubusercontent.com/96460131/181470956-83113b58-66ac-4353-bfae-29431a96c18a.gif) |


### 예약 관리

|예약 승인|예약 취소|
|--|--|
| ![예약승인](https://user-images.githubusercontent.com/96460131/181657823-fdcc40aa-54c5-4871-bd5d-c3a825bfcbb0.gif) | ![예약취소](https://user-images.githubusercontent.com/96460131/181657812-37422562-f387-4722-953a-4badb71c63a4.gif) |


<br>

## 관리자

### 회원 및 회원 신고 관리

|회원 관리|신고 관리|
|--|--|
| ![관리자_회원관리](https://user-images.githubusercontent.com/96460131/184563158-33d27cd8-f11f-49f2-a1d0-77200680ad71.jpg)|![관리자_회원신고관리](https://user-images.githubusercontent.com/96460131/184562516-89e3a252-21e0-420d-844b-6a4ebec08473.jpg)|
|가입된 회원의 정보 조회|접수된(RECEIVED) 신고에 대한 승인(APPROVED)/취소(CANCELED) 처리|

### 고객센터 문의글 관리
|문의글 조회 및 답변|공지사항 등록|
|--|--|
|![관리자_댓글등록](https://user-images.githubusercontent.com/96460131/184763924-df72e80b-b9a7-4489-a253-85f15cb5300d.gif)|![관리자_공지사항등록](https://user-images.githubusercontent.com/96460131/184762346-9039cc06-1e02-49b8-872c-034400d97c65.gif)|
|일반글/비밀글 제한없이 조회 / 답변 등록|관리자가 문의글 작성시 공지사항으로 등록(최상위 정렬)|



### 데이터 통계

|월별 데이터 증감 조회|지역별 숙소 조회|인기 숙소/호스트 조회|
|--|--|--|
|![관리자_그래프1](https://user-images.githubusercontent.com/96460131/184562641-c93fc353-0019-45f1-8c0a-4bf3d50b75c1.jpg)|![관리자_그래프3](https://user-images.githubusercontent.com/96460131/184562739-5dd25d41-30ad-409c-9248-d370dfda8898.jpg)|![관리자_그래프2](https://user-images.githubusercontent.com/96460131/184562653-30ace0e5-85cd-4805-8123-17e68ed9a749.jpg)|

<br>

## Detail page


| 에러 페이지 |호스트 모드 전환|게스트 모드 전환|
|--|--|--|
| ![bandicam 2022-08-16 09-55-23-122](https://user-images.githubusercontent.com/96460131/184765892-fec7a01c-c576-492f-b94c-baec75f63b50.jpg) | ![호스트되기](https://user-images.githubusercontent.com/96460131/181458686-7cecac67-bf97-4146-9de2-ee73851cf9e7.gif) | ![게스트되기](https://user-images.githubusercontent.com/96460131/181458714-3fc76e9f-6afb-47b3-b8eb-0d90034213cc.gif) |


