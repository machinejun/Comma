# Comma

## 프로젝트 구현 이유

숙박 서비스 웹 구현 Project

> 1. 숙박 서비스 선정 이유
>
> 대학생 때 여행을 가거나, 방학 기간일 때 마다 자취방을 2달 정도 비워 둘 때 마다 숙박 업소 뿐만 아니라 일반적인 자취방 같은 장소를 기존 숙박 시설보다
> 저렴하게 빌려주고 빌릴 수 있는 서비스가 있었으면 했습니다. 따라서 이러한 시스템과 가장 유사한 AirBnb 서비스를 참고하여 (숙박업소 검색, 조회, 예약)
> 기능을 구현하였으며, airBnb와의 차별성을 두기 위해서 리뷰에 답글을 달아 조금더 유저 친화적인 시스템을 구현하는 것을 목표로 하였습니다.

---

## 프로젝트 기간
2022-07-04 ~ 2022-07-25;


## 프로젝트 기능

#### 공통기능

1.  회원가입/ 로그인/ 회원 정보 수정
2.  카카오 로그인
3.  호스트/게스트 모드 전환
4.  숙소 조회

#### 게스트 모드 기능

1. 예약 하기
   - 체크인/ 체크아웃 날짜, 인원수, 요청사항 작성
2. 찜 하기
   - 관심있는 숙소를 따로 관리할 수 있는 페이지
3. 리뷰 작성/조회/수정 하기
   - 평점, 텍스트, 이미지등을 넣어서 리뷰를 작성
4. 자신의 예약 현황 보기
   - 자신의 예약 시스템을 관리 할 수 있는 공간(결제, 예약 취소, 리뷰 작성)
   - 게스트 예약(Waiting 상태) -> 호스트 승인(approved 상태) -> 게스트 결제(padi 상태)
   - -> 현재 날짜가 checkout 날짜를 지나게 되면(completed 상태) -> 리뷰작성 가능
5. 리뷰 관리
   - 자신이 작성한 리뷰를 수정, 삭제

#### 호스트 기능

1. 숙소 등록
   - 자신의 숙소를 페이지에 업로드
2. 숙소 정보 수정, 삭제
3. 예약 관리
   - 자신이 등록한 숙소에 대한 예약들을 조회 숙소별, 월별로 조회
   - 게스트가 신청한 예약에 대해서 승인, 취소 할 수 있는 공간
4. 리뷰 관리
   - 자신이 등록한 숙소에 대해 작성된 리뷰들을 조회
   - 게스트들이 작성한 리뷰에 대해 답글 작성
   - 자신이 작성한 답글에 대해서 수정, 삭제

#### 관리자 기능

1. 전체 유저 정보 조회

---

## 사용한 기술

> 프론트: bootStrap5, Jquery, html5, css

> 서버 : JAVA ,Spring boot, Mysql, JPA

> 보안 : security, Csrf

---

## 페이지 구성

### 메인
![메인1](https://user-images.githubusercontent.com/96460131/181153554-252fc86e-7bc7-4d18-813f-3bbaf25f5955.png)
![메인2](https://user-images.githubusercontent.com/96460131/181153584-d80b0445-e416-4e65-aa18-220e94921140.png)
![메인3](https://user-images.githubusercontent.com/96460131/181153595-ff403ffc-2d44-4f4d-8b86-2be4ccb41450.png)
![메인4](https://user-images.githubusercontent.com/96460131/181153613-961e406c-817e-482a-910e-113f4731dbea.png)
![메인5](https://user-images.githubusercontent.com/96460131/181153622-5f4ed15a-dbb5-4c16-a36c-8e6e627337d6.png)


### 숙소 리스트
![리스트1](https://user-images.githubusercontent.com/96460131/181153660-57d29c8a-05c1-49a2-bf73-e4b3c3d0c979.png)
![리스트2](https://user-images.githubusercontent.com/96460131/181153666-024a0a80-16ff-4dad-b022-af69de2b5d72.png)

### 숙소 검색
![검색1](https://user-images.githubusercontent.com/96460131/181153715-4066c0eb-f062-4f41-b0ea-f37b16cc7dfb.png)
![검색2](https://user-images.githubusercontent.com/96460131/181153732-daca7bb9-4c82-4add-a76a-2e98bdb51987.png)

### 숙소 상세정보 조회
![숙소상세1](https://user-images.githubusercontent.com/96460131/181153776-dcad94b4-0062-4351-bfc5-41ae0e9378c3.png)
![숙소상세2](https://user-images.githubusercontent.com/96460131/181153784-0c60beae-bc0c-4a08-8f56-e49fcd4cb5cb.png)


## 게스트

### 숙소 예약
![예약1](https://user-images.githubusercontent.com/96460131/181153824-95a567d8-5a88-448c-865c-0edfd9ad1607.png)
![예약2](https://user-images.githubusercontent.com/96460131/181153838-be92492e-a70d-47a1-8cea-21957e65a0d9.png)
![예약3](https://user-images.githubusercontent.com/96460131/181153846-14e4f4f0-5e2a-46f5-aedf-d552a09e55b8.png)

### 예약 내역 조회
![예약내역1](https://user-images.githubusercontent.com/96460131/181153898-224285d1-1679-41c3-9000-4f0024f9ced5.png)
![예약내역2](https://user-images.githubusercontent.com/96460131/181153904-8b5805e6-9280-4b08-b864-6803ac0e9ad7.png)

### 리뷰 작성, 리뷰 
![리뷰1](https://user-images.githubusercontent.com/96460131/181153934-10ca8218-6faf-4976-9d45-1e50686a3947.png)
![리뷰2](https://user-images.githubusercontent.com/96460131/181153938-a841361e-b0a7-4249-8707-aefdd5b65edc.png)

### 위시리스트
![위시리스트1](https://user-images.githubusercontent.com/96460131/181154074-643d2d4c-9920-431e-be3c-7d330d1f6db4.png)
![위시리스트2](https://user-images.githubusercontent.com/96460131/181154077-d1b4983d-464b-4eb6-8c2c-4bf0bb7ab3ce.png)


## 호스트

### 숙소 관리

#### 등록
![숙소등록1](https://user-images.githubusercontent.com/96460131/181154360-38952971-4fdc-4a6c-8571-b0cb73e36eed.png)

#### 조회
![숙소관리1](https://user-images.githubusercontent.com/96460131/181154391-c8c5a543-4ccf-47c7-b3e8-0b2f3dd61d93.png)
![숙소관리2](https://user-images.githubusercontent.com/96460131/181154394-eff277fa-4ca6-466c-9b6f-79dacc57d9e6.png)


### 에약 내역 조회
![호스트예약테이블1](https://user-images.githubusercontent.com/96460131/181154410-ce8d4035-f553-460e-b2d1-8c90fa4cf3ca.png)
![호스트예약테이블2](https://user-images.githubusercontent.com/96460131/181154418-a0fee679-8fa2-4dfe-8023-1868e51a8fe0.png)


## 관리자


