# Project - Comma

## 숙박 서비스 선정 이유

코로나 이후로 꼭 여행지를 가지 않더라도 프라이빗한 공간에서 자신들만의 여행을 즐기는 사람들이 늘어나면서, 숙박 서비스를 이용률이 증가하고 있습니다.
이러한 점을 착안하여 AirBnb를 모티브로 한 숙박 예약 서비스 웹을 구현하고자 하였습니다.
숙박 업소 뿐만 아니라 일반 원룸 같은 장소를 기존 숙박 시설보다
저렴하게 빌려주거나 빌릴 수 있는 서비스가 있었으면 했습니다. 따라서 이러한 시스템과 가장 유사한 AirBnb 서비스를 참고하여 프로젝트를 진행하게 되었습니다.


## 프로젝트 기간
2022-07-04 ~ 2022-07-25


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
   - 게스트 예약(Waiting 상태) -> 호스트 승인(approved 상태) -> 게스트 결제(paid 상태)
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

> 프론트: bootStrap5, JSP, Jquery, html5, css

> 서버 : JAVA ,Spring boot, Mysql, JPA, Qlrm

> 보안 : security, Csrf

---

## 페이지 구성

## 메인
![메인1](https://user-images.githubusercontent.com/96460131/181153554-252fc86e-7bc7-4d18-813f-3bbaf25f5955.png)
![메인2](https://user-images.githubusercontent.com/96460131/181153584-d80b0445-e416-4e65-aa18-220e94921140.png)
![메인3](https://user-images.githubusercontent.com/96460131/181153595-ff403ffc-2d44-4f4d-8b86-2be4ccb41450.png)

### 회원가입
![image](https://user-images.githubusercontent.com/96460131/181155537-b59d9586-2e17-4a0d-a7f6-e07b7bdd08e4.png)

### 로그인
![메인5](https://user-images.githubusercontent.com/96460131/181153622-5f4ed15a-dbb5-4c16-a36c-8e6e627337d6.png)

### 회원정보 수정
![회원정보 수정](https://user-images.githubusercontent.com/96460131/181155179-d6bda3b1-48b5-4283-b6a5-e0f9260c0df2.png)


### 숙소 리스트
![리스트1](https://user-images.githubusercontent.com/96460131/181153660-57d29c8a-05c1-49a2-bf73-e4b3c3d0c979.png)
![리스트2](https://user-images.githubusercontent.com/96460131/181153666-024a0a80-16ff-4dad-b022-af69de2b5d72.png)

### 숙소 검색
- 숙소 유형, 지역별 조회
![검색1](https://user-images.githubusercontent.com/96460131/181165467-365706ce-f994-4eef-bd1a-bcd30271f6c0.png)
![검색2](https://user-images.githubusercontent.com/96460131/181153732-daca7bb9-4c82-4add-a76a-2e98bdb51987.png)

### 숙소 상세정보 조회
- 해당 숙소의 상세 설명, 별점, 리뷰 조회
- 예약 페이지 연결
- 하트 아이콘 클릭시 위시리스트 추가
![숙소상세1](https://user-images.githubusercontent.com/96460131/181153776-dcad94b4-0062-4351-bfc5-41ae0e9378c3.png)
![숙소상세2](https://user-images.githubusercontent.com/96460131/181165537-17fc78be-53d0-4421-ac96-be5f9763bb00.png)


## 게스트

### 숙소 예약
- 숙소를 예약하면 먼저 WAITING 상태가 되고, 호스트가 해당 예약을 승인해야만 APPROVED 상태가 되어 해당 예약이 확정됨
![예약1](https://user-images.githubusercontent.com/96460131/181156458-9692a3a5-23ee-4902-abb8-e4cb9a97df9f.png)
![예약2](https://user-images.githubusercontent.com/96460131/181153838-be92492e-a70d-47a1-8cea-21957e65a0d9.png)
![예약3](https://user-images.githubusercontent.com/96460131/181153846-14e4f4f0-5e2a-46f5-aedf-d552a09e55b8.png)


### 예약 내역 조회
![예약내역1](https://user-images.githubusercontent.com/96460131/181153898-224285d1-1679-41c3-9000-4f0024f9ced5.png)
![예약내역2](https://user-images.githubusercontent.com/96460131/181153904-8b5805e6-9280-4b08-b864-6803ac0e9ad7.png)


### 결제
![카카오페이 결제](https://user-images.githubusercontent.com/96460131/181154799-264297b8-ad33-48cf-9d4c-63e48fec3b18.png)


### 결제 완료
![예약완료](https://user-images.githubusercontent.com/96460131/181170884-827f773f-c97a-4df2-9bbd-15f59cc1b3dd.png)


### 리뷰 작성, 리뷰 
- 예약 종료일이 되면 APPROVED 상태가 COMPLETED 상태가 되어 리뷰 작성 가능 (이전엔 작성 불가)
![리뷰1](https://user-images.githubusercontent.com/96460131/181153934-10ca8218-6faf-4976-9d45-1e50686a3947.png)
![리뷰2](https://user-images.githubusercontent.com/96460131/181153938-a841361e-b0a7-4249-8707-aefdd5b65edc.png)

### 위시리스트
- 하트 아이콘 클릭시 위시리스트에서 삭제
![위시리스트1](https://user-images.githubusercontent.com/96460131/181154074-643d2d4c-9920-431e-be3c-7d330d1f6db4.png)
![위시리스트2](https://user-images.githubusercontent.com/96460131/181154077-d1b4983d-464b-4eb6-8c2c-4bf0bb7ab3ce.png)


## 호스트

### 숙소 관리

- 등록
![숙소등록1](https://user-images.githubusercontent.com/96460131/181154360-38952971-4fdc-4a6c-8571-b0cb73e36eed.png)

- 조회
![숙소관리1](https://user-images.githubusercontent.com/96460131/181154391-c8c5a543-4ccf-47c7-b3e8-0b2f3dd61d93.png)
![숙소관리2](https://user-images.githubusercontent.com/96460131/181154394-eff277fa-4ca6-466c-9b6f-79dacc57d9e6.png)


### 에약 내역 조회
- WAITING 상태인 게스트의 예약 승인 처리, 예약 취소 
![호스트예약테이블1](https://user-images.githubusercontent.com/96460131/181154410-ce8d4035-f553-460e-b2d1-8c90fa4cf3ca.png)
![호스트예약테이블2](https://user-images.githubusercontent.com/96460131/181156586-fe49a21c-f1fd-4074-825e-d7283693062f.png)



## 관리자

### 회원 조회
![관리자](https://user-images.githubusercontent.com/96460131/181155327-950b3b21-2568-4d37-bb3f-bc7d8db105b1.png)

