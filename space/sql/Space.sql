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

alter table space_review modify room_name varchar2(50);
alter table space_review modify totallv number(3,2);

ALTER TABLE SPACE_INQUIRY DROP CONSTRAINT FK_SPACE_INQUIRY_ID;

ALTER TABLE SPACE_INQUIRY
ADD CONSTRAINT FK_SPACE_INQUIRY_ID FOREIGN KEY (ID)
REFERENCES SPACE_MEMBER(ID) ON DELETE CASCADE;