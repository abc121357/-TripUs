/*
인덱스 확인
*/
SELECT * FROM ALL_IND_COLUMNS WHERE TABLE_NAME='TUMYFAV';
/*



*/
UPDATE
      TUMEM
SET
      MPROFILE='/resources/img/p1.jpg'
WHERE
      MNO='M201908270001';
      
COMMIT;

SELECT
      MYLOCATION
      ,MYTITLE
      ,MYLINK
      ,MYINSERTDATE
FROM
      TUMYFAV
WHERE
      MNO='';
      
SELECT *
FROM TUMYFAV;
CREATE TABLE
            TUMYFAV(MYNO VARCHAR2(14) PRIMARY KEY,
                    MYTITLE VARCHAR2(60) NOT NULL,
                    MYID VARCHAR2(500) NOT NULL,
                    MYGRADE VARCHAR2(1) NOT NULL,
                    MYLOCATION VARCHAR2(100) NOT NULL,
                    MYLINK VARCHAR2(300),
                    MYCNO NUMBER(8) NOT NULL,
                    MNO VARCHAR2(13),
                    MYINSERTDATE DATE,
                    MYRECORDINSERTDATE DATE,
                    MYRECORDUPDATEDATE DATE
                      );
INSERT
INTO      TUMYFAV
VALUES
      ('MY201909150001','음식점','test01','1','지역위치','링크','2516988','M201909150001',SYSDATE,SYSDATE,SYSDATE);
      
COMMIT;
ROLLBACK;
DELETE 
	      TUMYFAV
	WHERE
      1=1
AND
	      MNO='M201909150001'
AND
        MYCNO=795034
;
        
DROP TABLE TUMYFAV;