/*멤버 테이블 */
CREATE TABLE SPACE_MEMBER(
    ID        VARCHAR2(100)   PRIMARY KEY,
    PASS     VARCHAR2(50)       NOT NULL,
    NAME   VARCHAR2(50)          NOT NULL,
    HP        VARCHAR2(50)      NOT NULL,
    TNAME  VARCHAR2(50),     --대표자명
    CNAME  VARCHAR2(300),     --기업명
    CNUM  VARCHAR2(50),       --사업자번호
    CADDR1   VARCHAR2(100),
    CADDR2  VARCHAR2(100),
    CLIC   VARCHAR2(300),      --사업자등록증
    CHP     VARCHAR2(50),     --대표번호
    MDATE   DATE,
    POSITION NUMBER(1),    --개인(0),기업(1) 구분
    CHOICEIN   NUMBER(1),  --가입승인 [1: 바로 가입 , 0: 승인 대기]
    CHOICEOUT   NUMBER(1)     --탈퇴승인 [1: 탈퇴 버튼 활성화]
);


/*1:1 문의 테이블*/
CREATE TABLE SPACE_INQUIRY(
  ID  VARCHAR2(100)  NOT NULL CONSTRAINT FK_SPACE_INQUIRY_ID REFERENCES SPACE_MEMBER(ID),
  QID VARCHAR2(30) PRIMARY KEY,
  QTITLE VARCHAR2(100) NOT NULL,
  QCONTENT VARCHAR2(1500) NOT NULL,
  ACONTENT VARCHAR2(1500),
  QFILE VARCHAR2(300),
  QSFILE VARCHAR2(300),
  QTYPE  VARCHAR2(50)   NOT NULL,
  QSTATE  VARCHAR2(50)  NOT NULL,
  QDATE DATE
);

CREATE SEQUENCE SEQU_SPACE_INQUIRY
START WITH 1
INCREMENT BY 1;


/* 공지사항 TABLE */
CREATE TABLE SPACE_NOTICE (
NID     VARCHAR2(50) PRIMARY KEY,
NTITLE    VARCHAR2(500) NOT NULL,
NCONTENT  VARCHAR2(3000)NOT NULL,
NWRITER    VARCHAR2(100) NOT NULL,
NHIT    NUMBER(10),
NFILE    VARCHAR2(200),
NSFILE    VARCHAR2(200),
NDATE    DATE NOT NULL,
IMPORTANT VARCHAR2(50),
CONSTRAINT FK_NOTICE_WRITER FOREIGN KEY (NWRITER) REFERENCES SPACE_MEMBER(ID)
);
CREATE SEQUENCE SEQU_SPACE_NOTICE
START WITH 1
INCREMENT BY 1;


/* 자주묻는 질문 TABLE */
CREATE TABLE SPACE_FAQ(
FID     VARCHAR2(50) PRIMARY KEY,
FTITLE     VARCHAR2(500) NOT NULL,
FCONTENT  VARCHAR2(3000) NOT NULL,
FTYPE    VARCHAR2(50) NOT NULL
);
CREATE SEQUENCE SEQU_SPACE_FAQ
START WITH 1
INCREMENT BY 1;

/* 회의실 테이블*/
CREATE TABLE SPACE_ROOM (
  RID VARCHAR2(20) CONSTRAINT PK_RID PRIMARY KEY,
  ID VARCHAR2(30) NOT NULL CONSTRAINT FK_SPACE_ROOM_ID REFERENCES SPACE_MEMBER(ID) ON DELETE CASCADE, -- 회원테이블 기업 ID
  BRANCH_NAME VARCHAR2(50) NOT NULL,
  ROOM_NAME VARCHAR2(50) NOT NULL,
  INTRO VARCHAR2(300) NOT NULL,
  OPENING_TIME NUMBER NOT NULL,
  CLOSING_TIME NUMBER NOT NULL,
  CLOSED_DAY VARCHAR2(100) NOT NULL,
  CHECK_INFO VARCHAR2(100) NOT NULL,
  TYPE VARCHAR2(10) NOT NULL,
  CAPACITY NUMBER(4) NOT NULL,
  CHARGE NUMBER(10) NOT NULL,
  ADDRESS VARCHAR2(300) NOT NULL,
  RFILE1 VARCHAR2(200) NOT NULL,
  RSFILE1 VARCHAR2(200) NOT NULL,
  RFILE2 VARCHAR2(200),
  RSFILE2 VARCHAR2(200),
  RFILE3 VARCHAR2(200),
  RSFILE3 VARCHAR2(200),
  RDATE DATE
);

CREATE SEQUENCE SEQU_SPACE_ROOM
START WITH 1
INCREMENT BY 1;

ALTER TABLE SPACE_ROOM ADD (GRADE NUMBER DEFAULT 0);
ALTER TABLE SPACE_ROOM ADD (REVIEW_COUNT NUMBER(6) DEFAULT 0);

/* 회의실 옵션 테이블*/
CREATE TABLE SPACE_OPTION (
  RID VARCHAR2(20) NOT NULL CONSTRAINT FK_SPACE_OPTION_RID REFERENCES SPACE_ROOM(RID) ON DELETE CASCADE,
  LOUNGE NUMBER(1) DEFAULT 0,
  SMOKING_ROOM NUMBER(1) DEFAULT 0,
  PARKING_LOT NUMBER(1) DEFAULT 0,
  ELEVATOR NUMBER(1) DEFAULT 0,
  FREIGHT_ELEVATOR NUMBER(1) DEFAULT 0,
  VENDING_MACHINE NUMBER(1) DEFAULT 0,
  WIFI NUMBER(1) DEFAULT 0,
  ACCESSIBLE_TOILET NUMBER(1) DEFAULT 0,
  TOILET NUMBER(1) DEFAULT 0,
  WATER_DISPENSER NUMBER(1) DEFAULT 0,
  KTX NUMBER(1) DEFAULT 0,
  BEAM NUMBER(1) DEFAULT 0,
  VIDEO_DEVICE NUMBER(1) DEFAULT 0,
  MIC NUMBER(1) DEFAULT 0,
  LECTERN NUMBER(1) DEFAULT 0,
  TV NUMBER(1) DEFAULT 0,
  SPEAKER NUMBER(1) DEFAULT 0,
  PC NUMBER(1) DEFAULT 0,
  POINTER NUMBER(1) DEFAULT 0,
  BANNER NUMBER(1) DEFAULT 0,
  WHITEBOARD NUMBER(1) DEFAULT 0,
  DAIS NUMBER(1) DEFAULT 0,
  CONFERENCE_CALL NUMBER(1) DEFAULT 0,
  AIR_CONDITIONAL NUMBER(1) DEFAULT 0,
  HEATER NUMBER(1) DEFAULT 0,
  INTERNET NUMBER(1) DEFAULT 0,
  STUDIO NUMBER(1) DEFAULT 0,
  SNACK_CARRY NUMBER(1) DEFAULT 0,
  SNACK_SALE NUMBER(1) DEFAULT 0,
  MEAL_CARRY NUMBER(1) DEFAULT 0,
  MEAL_SALE NUMBER(1) DEFAULT 0,
  ONLINE_PAYMENT NUMBER(1) DEFAULT 0,
  OFFLINE_PAYMENT NUMBER(1) DEFAULT 0
);

--------------------- 예약 테이블 -------------------------
CREATE TABLE SPACE_RESERVE(
  RSID VARCHAR2(20) CONSTRAINT PK_RSID PRIMARY KEY,
  NAME VARCHAR2(50) NOT NULL,
  HP VARCHAR2(50) NOT NULL,
  EMAIL VARCHAR2(100) NOT NULL,
  RID VARCHAR2(20) CONSTRAINT FK_SPACE_RESERVE REFERENCES SPACE_ROOM(RID) ON DELETE CASCADE NOT NULL,
  BRANCH_NAME VARCHAR2(50) NOT NULL,
  ROOM_NAME VARCHAR2(50) NOT NULL,
  HEADCOUNT NUMBER(3) NOT NULL,
  TYPE VARCHAR2(10) NOT NULL,
  RESERVE_DATE DATE NOT NULL,
  CHECKIN_TIME NUMBER NOT NULL,
  CHECKOUT_TIME NUMBER NOT NULL,
  USED_HOURS NUMBER NOT NULL,
  CONVENIENCE1_NUM NUMBER(3),
  CONVENIENCE2_NUM NUMBER(3),
  CONVENIENCE3_NUM NUMBER(3),
  BEVERAGE1_NUM NUMBER(3),
  BEVERAGE2_NUM NUMBER(3),
  BEVERAGE3_NUM NUMBER(3),
  CORP_NAME VARCHAR2(50) NOT NULL,
  EVENT_NAME VARCHAR2(50) NOT NULL,
  AMOUNT NUMBER NOT NULL,
  PAY_TYPE VARCHAR2(10) NOT NULL,
  ETC_REQUEST VARCHAR2(100)
);
CREATE SEQUENCE SEQU_SPACE_RESERVE
START WITH 1
INCREMENT BY 1;

--------------------- 예약화면 - 부가서비스 테이블 -------------------------
CREATE TABLE SPACE_SERVICE(
  RID VARCHAR2(20) CONSTRAINT FK_SPACE_SERVICE REFERENCES SPACE_ROOM(RID) ON DELETE CASCADE NOT NULL,
  CONVENIENCE1 VARCHAR2(100),
  CONVENIENCE1_PRICE NUMBER,
  CONVENIENCE2 VARCHAR2(100),
  CONVENIENCE2_PRICE NUMBER,
  CONVENIENCE3 VARCHAR2(100),
  CONVENIENCE3_PRICE NUMBER,
  BEVERAGE1 VARCHAR2(100),
  BEVERAGE1_PRICE NUMBER,
  BEVERAGE2 VARCHAR2(100),
  BEVERAGE2_PRICE NUMBER,
  BEVERAGE3 VARCHAR2(100),
  BEVERAGE3_PRICE NUMBER
);

/* 리뷰 테이블 */
CREATE TABLE SPACE_REVIEW (
   ID VARCHAR2(100) NOT NULL,
   RDATE DATE,
   RID VARCHAR2(20) NOT NULL,
   ROOM_NAME VARCHAR2(2) NOT NULL,
   RSID VARCHAR2(20) CONSTRAINT FK_SPACE_REVIEW REFERENCES SPACE_RESERVE(RSID) ON DELETE CASCADE,
   LOCATIONLV NUMBER(1) NOT NULL,
   FACILITYLV NUMBER(1) NOT NULL,
   PRICELV NUMBER(1) NOT NULL,
   SERVICELV NUMBER(1) NOT NULL,
   RCONTENT VARCHAR2(3000) NOT NULL,
   TOTALLV NUMBER(1) NOT NULL
);

insert into space_member(id,pass,name,hp)  values('test@naver.com','1234','테스터','010-1111-2222');
INSERT INTO SPACE_MEMBER VALUES('test','1234','홍길동','010-1111-1111','테스트기업','홍길동','02-2222-2222','서울 강남구','역삼동','사업자등록증','02-1111-1111',sysdate,1,1,0);

/*공지사항데이터*/
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 왕초보도 가능! 촬영부터 편집까지 가능한 영상 녹화 스튜디오를 소개합니다.'
               ,'스페이스 닷컴의 녹화스튜디오를 소개합니다','test',0,'TuafYqr0QuagSxnsxyFgFkZAy7Z4pimLD8mSf4bA.jpeg','TuafYqr0QuagSxnsxyFgFkZAy7Z4pimLD8mSf4bA.jpeg',SYSDATE,'IMPORTANT');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[후기 이벤트] 회의실닷컴을 리뷰해주세요.'
              ,'스페이스 닷컴을 리뷰해주세요','test',0,'GGa4chVa7AKI3nLypvSEMRmNwLkUn1XDGo1eCJ8E.jpeg','GGa4chVa7AKI3nLypvSEMRmNwLkUn1XDGo1eCJ8E.jpeg',SYSDATE,'IMPORTANT');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[공지] 서울 화상회의실 모음'
              ,'서울 화상회의실 모음','test',0,'notice_content_img1.png','notice_content_img1.png',SYSDATE,'IMPORTANT');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[공지] 스페이스닷컴 이용문의 안내'
              ,'이용문의 안내','test',0,'notice_content_img2.png','notice_content_img2.png',SYSDATE,'IMPORTANT');
              
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[공지] 6월 후기이벤트 참여 회원, 다시 한번 축하드립니다.'
              ,'이벤트 당첨자는 메일확인 가입하신 메일 확인부탁드립니다. ','test',0,'','',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 금천구 1호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>
              더불어 중소규모의 온/오프라인 행사를 병행할 수도 있는 강의실도 준비되어있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 서대문구 3호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 인천 부평구 1호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 경기 안양 1호점을 소개합니다..'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[공지] 5월 후기이벤트 참여 회원, 다시 한번 축하드립니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 서초구 7호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 경기 성남 3호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 종로구 3호점을 소개합니다.'
             ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 강남구 5호점을 소개합니다.'
             ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 인천 연수구 1호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 용산구 5호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 경기 안산 1호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 경남 창원시 1호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 부산 사상구 1호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 중구 1호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 서초구 4호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 서초구 2호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 강남구 18호점을 소개합니다.'
              ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>
              4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>
              또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>
              역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>'
              ,'test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 송파구 3호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 영상스튜디오 강남구 22호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 경기 고양 1호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 종로구 9호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 송파구 1호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 경북 구미 1호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 종로구 8호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 부산 북구 1호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 종로구 7호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[이벤트] 포토 후기 이벤트! 스타벅스 아메리카노 증정'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 구로구 3호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 성동구 4호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신규 가맹점 종로구 6호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 경남 양산시 강연장 경남 양산시 1호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 을지로 세미나실 중구 10호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 제주도 회의실 제주 제주시 1호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[공지] 추석 연휴 고객센터 휴무 안내'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 부산 회의실 부산 기장군 1호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 시청 회의실 중구 9호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 서대문구 강의실 서대문구 2호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 광주 서구 회의실 광주 서구 1호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 사당역 강의실 서초구 6호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 대전 중구 강의실 대전 중구 1호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 대전 유성구 회의실 대전 유성구 1호점을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[이벤트] 이용후기 작성 이벤트! 스타벅스 아메리카노 증정'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[뉴스] 회의실닷컴, 간편 회의실 검색 및 예약 앱 회의실닷컴 런칭'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[이벤트] 포인트 더블 적립 이벤트!'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[공지] 화상회의 장비 렌탈 서비스 시작'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[공지] 회의실닷컴 홈페이지 개편 안내'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 강원 평창 워크샵장소 강원 평창 1호점 (올림픽로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 충남 보령시 세미나실 충남 보령 1호점 (웅천읍)을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 구로구 강의장 구로구 2호점 (디지털로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 부산 연산역 강의장 부산 연제구 1호점 (월드컵대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 선릉역 강의장 강남구 21호점 (선릉로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 선릉역 강의실 강남구 20호점 (선릉로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 시청역 회의실 중구 8호점 (세종대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 야탑역 회의실 경기 성남 2호점 (매화로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 삼성중앙역 세미나룸 강남구 19호점 (삼성로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 시청역 호텔 회의실 중구 7호점 (세종대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신방화역 회의실 강서구 2호점 (방화대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 마곡역 강의실 강서구 1호점 (공항대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 모란역 세미나실 경기 성남 1호점 (성남대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 성수역 회의실 성동구 2호점 (아차산로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 마포역 강의실 마포구 4호점 (마포대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 서울역 강의실 중구 6호점 (칠패로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 강동역 강의실 강동구 1호점 (천호대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 삼성역 강의실 강남구 18호점 (테헤란로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신설동역 강의실 동대문구 2호점 (왕산로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 교대역 미팅룸 서초구 5호점 (사임당로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 종각역 전산교육장 종로구 5호점 (종로)을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 잠실역 컨벤션 송파구 2호점 (올림픽로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 종각역 회의실 종로구 4호점 (종로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신사역 회의실 강남구 17호점 (강남대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 종각역 강의실 중구 5호점 (남대문로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 역삼역 강의실 강남구 16호점 (테헤란로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 사당역 회의실 서초구 4호점 (동작대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 양재역 회의실 강남구 15호점 (강남대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 역삼역 회의실 강남구 2호점 (역삼로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 당산역 강의실 영등포구 3호점 (당산로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 합정역 강의실 마포구 1호점 (양화로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 장한평역 회의실 동대문구 1호점 (천호대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 성수역 회의실 성동구 1호점 (동일로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 광화문역 회의실 종로구 3호점 (새문안로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 서대문역 회의실 서대문구 1호점 (통일로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 삼성역 회의실 강남구 9호점 (테헤란로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 강남역 회의실 강남구 8호점 (테헤란로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 광화문역 회의실 중구 4호점 (세종대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 한남동 워크샵장소 용산구 4호점 (대사관로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 남부터미널역 연회장 서초구 3호점 (서초중앙로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 광명시 회의실 경기 광명 2호점 (일직로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 부산역 교육장 부산 부산진구 1호점 (중앙대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 삼성동 회의실 강남구 14호점 (삼성로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 광명역 회의실 경기 광명 1호점 (일직로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 선릉역 강의실 &#039;강남구 13호점 (테헤란로)&#039;를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 강변역 회의실 광진구 2호점 (광나루로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 노량진역 강연장 동작구 1호점 (노량진로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 신사역 강의실 강남구 12호점 (논현로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 건대입구역 연회장 광진구 1호점 (능동로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 석촌역 회의실 송파구 1호점 (백제고분로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 학동역 회의실 강남구 11호점 (학동로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 수서역 회의실 강남구 10호점 (광평로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 공덕역 강의실 마포구 3호점 (만리재로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 여의도역 회의실 영등포구 2호점 (국제금융로)을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 여의도역 회의실 영등포구 1호점 (국제금융로)을 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 삼성역 회의실 강남구 7호점 (영동대로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');
insert into SPACE_NOTICE values('N_'||SEQU_SPACE_NOTICE.nextval, '[안내] 양재역 회의실 서초구 1호점 (효령로)를 소개합니다.'
               ,'온라인 웨비나 촬영 및 스트리밍이 가능한 스튜디오입니다.<br> 웨비나 방송실과 운영실로 구성되어있으며<br>               4K카메라, 음향설비, 스트리밍 장비 들을 완비하고 있는 스튜디오 입니다.<br>               또한 전문 기술 스탭이 항시 상주하여 기술적으로 쉽게 도움을 받을 수 있으며<br>               역 근방 도보 10분 이내 거리에 위치하여 높은 접근성을 보유하고 있습니다.<br>','test',0,' ',' ',SYSDATE,'NORMAL');


/*자주묻는질문 데이터 */
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '휴대폰 인증이 되지 않습니다'
          ,'<P>아래의 경우에는 휴대폰 인증이 불가할 수 있습니다.<p>+ 이미 인증된 다른 계정이 있다면 인증이 불가합니다.</p><p>+ 선블 휴대폰을 사용 중이신 경우 인증이 불가할 수 있습니다.</p><p>+ 휴대폰이 분실 또는 일시정시 (이용자의 요청/요금 미납) 상태인 경우</p><p>+ 이동통신사에 미등록된 휴대폰 (해지/미개통)인 경우</p><p>+ 인증을 시도한 휴대폰이 법인 명의로 개통된 경우 휴대폰 인증이 불가능합니다.<br>   (법인에서 이용하실 경우 관리 담당자의 실명 인증을 통해 이용해주시기 바랍니다.)</p><p>+ 본인인증 연동 모듈 사의 사정으로 인증이 불가능한 경우<br>   휴대폰 본인 인증은 24시간 가능하나, 간헐적으로 새벽시간 중 연동 모듈사의 서버 점검 등의 사요류 30분~1시간 정도 인증이 불가능한 경우가 발생할 수 있습니다.<br>   이 경우, 아래 채널로 문의하실 수 있습니다.<br>  </p><p><br></p><p></p></p>'
          ,'COMMONS');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '센터 방문답사는 어떻게 신청하나요?'
          ,'<p>회의실 예약 신청을 완료 한 후,<p><나의 회의실> 메뉴의 <예약한 회의실>에서 예약 건을 클릭하시면</p><p>우측에 <방문답사 신청>버튼을 통해 신청이 가능합니다.</p><p></p></p>'
          ,'RESERVE');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '회의실닷컴 이용에 문의가 있어요.'
          ,'<p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: none; line-height: 1.5em;"><span style="font-size: 1rem;">회의실닷컴 이용에 대한 자세한 문의는 회원가입 후<b> </b></span><span style="font-size: 1rem; margin: 0px; padding: 0px; border: none; font-family: noto-sans-scott-m;"><b>1:1 문의</b></span><span style="font-size: 1rem;">를 통해 남겨주시면 신속하게 답변드리도록 하겠습니다.</span><br><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: none; line-height: 1.5em;"><br style="color: rgb(72, 72, 72); letter-spacing: -1px; white-space: pre-line; font-family: dotum, 돋움 !important;"></p></p>'
          ,'COMMONS');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '센터 측 취소/환불 정책은 어디서 확인할 수 있나요?'
          ,'<p>"마이페이지 > 예약 회의실" 에서 확인하거나 회의실 찾기를 통해 센터의 세부정보를 확인할 수 있습니다.<p>규정에 명시된 취소 가능 기간은 평일 9~18시 기준입니다. *주말/공휴일 미포함*</p></p>'
          ,'RESERVE');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '예약취소 여부는 어떻게 확인할 수 있나요?'
          ,'<p>예약 취소시 카카오톡 알림톡으로 해당 내용을 전송해드리며, "마이페이지 > 예약 회의실"에서 내역을 확인할 수 있습니다.<br></p>'
          ,'RESERVE');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '예약은 취소 가능한가요?'
          ,'<p>가능합니다. 취소/환불 정책에 따라 수수료가 발생될 수 있습니다.<span lang="EN-US" style="font-family:함초롬바탕;mso-font-width:100%;letter-spacing:0.0pt;mso-text-raise:0.0pt;">1:1</span>문의 게시판으로 취소 요청 부탁드립니다<span lang="EN-US" style="font-family:함초롬바탕;mso-font-width:100%;letter-spacing:0.0pt;mso-text-raise:0.0pt;">.</span></p></p>'
          ,'RESERVE');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '이용후기는 어떻게 작성할 수 있나요?'
          ,'<p>회의실을 이용하시면 "마이페이지 > 예약 회의실"에서 이용후기를 작성할 수 있습니다.</p>'
          ,'USING');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '회의실 이용시 자동으로 적립금이 누적되나요?'
          ,'<p>회의실 이용 완료 후 이용후기 작성시에만 적립금이 누적됩니다.<p>개인회원인 경우 적립금은 상품으로 교환이 가능하며, 기업회원인 경우 적립금으로 대관료를 결제할 수 있습니다.</p><p></p><p></p></p>'
          ,'POINT');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '센터 장비 사용에 대한 자세한 정보는 어디에서 얻을 수 있나요?'
          ,'<p>센터 페이지에 편의시설과 부가서비스에서 해당 내용을 확인할 수 있습니다.<br></p>'
          ,'USING');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '정해진 예약시간보다 일찍 도착할 것 같습니다. 이용이 가능할까요?'
          ,'<p>회의실 입/퇴실 시간은 각 센터마다 상이하며, 센터의 시설정보를 확인해주시기 바랍니다.<br><p>회의실 사전 세팅을 위해 입실 시간을 당기는 경우에는 추가 예약이 필요합니다.</p></p>'
          ,'USING');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '카드 영수증은 어떻게 받을 수 있나요?'
          ,'<p>온라인 결제를 진행한 경우에는 <span style="font-size: 1rem;">1:1문의를 통해 남겨주시면 영수증 전달 드릴 수 있도록 하겠습니다.</span><p>현장결제의 경우에는 센터에 직접 방문하셔야 발급이 가능합니다.</p><p><br></p><p></p></p>'
          ,'RESERVE');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '현금영수증이나 세금계산서를 발급 받을 수 있나요?'
          ,'<p>모든 센터는 사업자등록증이 있는 정상적인 업체입니다.<p>카드 결제 및 온라인 결제 (카카오페이, 실시간 계좌이체)인 경우를 제외하고 현금영수증 및 세금계산서 발행이 가능합니다.</p></p>'
          ,'RESERVE');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '온라인 결제와 현장 결제의 차이점이 무엇인가요?'
          ,'<p><span style="font-size: 1rem;">온라인 결제는 총 결제 대금의 100%를 온라인으로 결제하는 형태를 말합니다.</span><br><p>현장 결제는 총 결제 대금의 일부를 무통장 입금으로 진행하고, 행사 이용전 현장에서 차액을 결제하는 형태를 말합니다.</p></p>'
          ,'RESERVE');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '예약이 승인 되었습니다. 결제는 어떻게 하나요?'
          ,'<p>예약이 승인되어 결제를 진행하시려면 "마이페이지 > 예약 회의실"에서 결제를 진행하시면 됩니다.<p>단, 센터에 따라 대관 신청서가 있는 경우 신청서 승인 후 결제를 진행하실 수 있습니다.</p><p>1일 이내 결제를 완료하셔야 예약이 확정되며, 이후에는 자동취소 처리가 됩니다.</p><p></p><p></p></p>'
          ,'RESERVE');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '회의실 예약시간을 연장하고 싶습니다. 어떻게 해야 하나요?'
          ,'<p>당일 예약시간 연장의 경우 센터에 직접 요청하실 수 있습니다.<p>단, 예약 상황에 따라 가능 여부가 달라질 수 있습니다.<br></p></p>'
          ,'USING');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '당일 예약이 가능한가요?'
          ,'<p>당일 예약 가능여부는 센터별로 상이합니다.<p>당일 예약이 가능한 센터의 경우 회의실 이용 시작 최소 30분 전까지 예약 신청이 이루어져야하며, 온라인 선결제로만 진행됩니다.</p></p>'
          ,'RESERVE');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '예약 변경은 가능한가요?'
          ,'<p>회의실닷컴 사이트에서 예약 변경이 가능합니다.<p>단, 센터 규정에 따라 위약금이 발생될 수 있습니다.<br></p></p>'
          ,'RESERVE');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '여러 회의실의 견적을 한번에 받고 싶어요.'
          ,'<p>1:1 문의를 통해 요청해주시면 견적서를 이메일로 송부드립니다.<br></p>'
          ,'ETC');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '예약을 신청하면 언제 예약가능 여부를 알 수 있나요?'
          ,'<p>영업일 기준일 최대 1일 안으로 예약가능 여부를 알려드립니다.<br></p>'
          ,'COMMONS');
insert into SPACE_FAQ VALUES('F_'||SEQU_SPACE_FAQ.NEXTVAL, '회원가입은 어떻게 하나요?'
          ,'<p>회의실닷컴 개인회원 가입은 네이버, 이메일로 가능합니다.<p>기업회원과 파트너회원은 이메일로만 가입이 가능합니다.</p></p>'
          ,'MEMBER');
      
      
insert into space_room values('r_'||sequ_space_room.nextval, 'test','종로구 1호점','컨퍼런스룸','접근성 및 회의실 컨디션 최상',9,22,'주말, 공휴일','입,퇴실 시간 예약시간 30분 전/후','ㅁ자형',8,55000,'서울 종로구 세종대로 149 광화문빌딩(동화면세점 건물) 20층','sx0jDcBSAARlRYpsD3yV47A38rNKlugEsId0PZHj.jpg','sx0jDcBSAARlRYpsD3yV47A38rNKlugEsId0PZHj.jpg','vRjJdEoBBRvhHU7OzDfo4T6twDmPyzMJ0a6msW3P.jpg','vRjJdEoBBRvhHU7OzDfo4T6twDmPyzMJ0a6msW3P.jpg','ExbCPm9ajnxHwm7DcZtn6PDBUZyfsC6AmLvxqejW.jpg','ExbCPm9ajnxHwm7DcZtn6PDBUZyfsC6AmLvxqejW.jpg',sysdate);
insert into space_room values('r_'||sequ_space_room.nextval, 'test','강남구 7호점','노스','실내 인테리어가 고급스러운 회의실',9,22,'주말 및 공휴일','예약시간 10분 전 입실 / 정시 퇴실','U자형',6,88000,'서울 강남구 영동대로 517 30층','wQHeiu3b9e7lgieEsMf3eRS9GEZSR8e2gDy5YGcf.jpg','wQHeiu3b9e7lgieEsMf3eRS9GEZSR8e2gDy5YGcf.jpg','wAMwJJzS3CJK2ImZAFeDAHzjYRwlzj584ODHbisK.jpg','wAMwJJzS3CJK2ImZAFeDAHzjYRwlzj584ODHbisK.jpg','ymee5NaTiAA7HokZetU3OZ0t72AbxkoFJ5viJpsh.jpg','ymee5NaTiAA7HokZetU3OZ0t72AbxkoFJ5viJpsh.jpg',sysdate);
insert into space_room values('r_'||sequ_space_room.nextval, 'test','마포구 3호점','소회의실','공덕역 대형회의장',9,21,'주말 및 공휴일','예약시간 30분 전 입실 / 정시 퇴실','ㅁ자형',20,125000,'서울 마포구 만리재로 14 6층','NQFMb3lnjqnLf7Gymoh0ui7mVSCuuWyug6SsdhkE.jpg','NQFMb3lnjqnLf7Gymoh0ui7mVSCuuWyug6SsdhkE.jpg','sx0jDcBSAARlRYpsD3yV47A38rNKlugEsId0PZHj.jpg','sx0jDcBSAARlRYpsD3yV47A38rNKlugEsId0PZHj.jpg','DpBhM8BPWNphLcDMvCFGgMulKubydiN57OfBJ389.jpg','DpBhM8BPWNphLcDMvCFGgMulKubydiN57OfBJ389.jpg',sysdate);
insert into space_room values('r_'||sequ_space_room.nextval, 'test','영등포구 1호점','6인실','여의도 IFC MALL',9,22,'주말 및 공휴일','예약시간 정시 입/퇴실','ㅁ자형',6,66000,'서울 영등포구 국제금융로 10 Two IFC 22층 / 여의도역','2iVpkQxwtlPBFKpbVyDXOm04TUmpVtEPfJlS5WLt.jpg','2iVpkQxwtlPBFKpbVyDXOm04TUmpVtEPfJlS5WLt.jpg','becQsPaNuki2UXgyuoFeqPiftiPCCktpZR2GRHIn.jpg','becQsPaNuki2UXgyuoFeqPiftiPCCktpZR2GRHIn.jpg','ZJjQg9taWOMmEDsDnK3xrn56lXVNxdAPdPGNhuq1.jpg','ZJjQg9taWOMmEDsDnK3xrn56lXVNxdAPdPGNhuq1.jpg',sysdate);
insert into space_room values('r_'||sequ_space_room.nextval, 'test','송파구 2호점','오디토리움','롯데월드타워에 위치한 컨벤션',9,22,'주말 및 공휴일','예약시간 30분 전 입실 / 30분 내 퇴실','강의식',180,575800,'서울 송파구 올림픽로 300 롯데월드타워 31F / 잠실역','4cFk6nKzD4c3RydKEIscQmgbscaG06kpI93ifw9B.jpg','4cFk6nKzD4c3RydKEIscQmgbscaG06kpI93ifw9B.jpg','BkXBqXrwrwfzEWV3NBSOR2VzlJmkN0eamb0NX99Z.jpg','BkXBqXrwrwfzEWV3NBSOR2VzlJmkN0eamb0NX99Z.jpg','XwylvPwCgOgGNXFFbSW6Rd2zLOTmWIvY9GmMoTUN.jpg','XwylvPwCgOgGNXFFbSW6Rd2zLOTmWIvY9GmMoTUN.jpg',sysdate);


insert into space_option values('r_1',1,1,1,1,1,0,1,0,1,0,0,1,0,1,1,1,1,0,1,1,1,1,0,1,1,1,0,1,1,0,1,0,1);
insert into space_service values('r_1','빔프로젝터',440000,'LED 스크린',2750000,'포인터 1개',0,'아이시스 디스펜서',6600,'',0,'',0);
insert into space_option values('r_2',1,1,1,1,1,0,1,0,1,1,0,0,0,0,0,1,0,0,0,1,1,0,0,1,1,0,0,1,0,0,0,0,1);
insert into space_service values('r_2','TV패널 1대/시간당',33000,'TV패널 1대/30분',16500,'의자 추가/1개당',16500,'',0,'',0,'',0);
insert into space_option values('r_3',1,1,1,1,0,0,0,0,1,0,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,0,1,0);
insert into space_service values('r_3','화상회의장비',400000,'빔프로젝터',50000,'노트북',70000,'',0,'',0,'',0);
insert into space_option values('r_4',1,1,1,1,1,0,1,0,1,1,0,1,1,1,0,1,1,0,0,0,1,0,1,1,1,1,0,1,1,0,0,0,1);
insert into space_service values('r_4','라커룸 1개/종일',11000,'18시 이후 직원 stand by 비용',33000,'',0,'커피/티/주스 선택',7700,'커피 10인세트',33000,'케이터링세트(쿠키, 빵 등)',132000);
insert into space_option values('r_5',1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,0,0,0,0,0,1,0,1);
insert into space_service values('r_5','주차 1대/시간',4400,'포인터 1대/시간',5500,'노트북 1개/시간',11000,'쿠키 4인 세트',22000,'쿠키 8인 세트',44000,'생수/병',1100);

    
commit;
