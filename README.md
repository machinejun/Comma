# Comma

## 프로젝트 구현 이유

숙박 서비스 웹 구현 Project

> 1. 숙박 서비스 선정 이유
>
> 대학생 때 여행을 가거나, 방학 기간일 때 마다 자취방을 2달 정도 비워 둘 때 마다 숙박 업소 뿐만 아니라 일반적인 자취방 같은 장소를 기존 숙박 시설보다
> 저렴하게 빌려주고 빌릴 수 있는 서비스가 있었으면 했습니다. 따라서 이러한 시스템과 가장 유사한 AirBnb 서비스를 참고하여 (숙박업소 검색, 조회, 예약)
> 기능을 구현하였으며, airBnb와의 차별성을 두기 위해서 리뷰에 답글을 달아 조금더 유저 친화적인 시스템을 구현하는 것을 목표로 하였습니다.

---

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

## 프로젝트 기간
2022-07-04 ~ 2022-07-25;
