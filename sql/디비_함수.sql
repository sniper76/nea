CREATE FUNCTION `cpes_dev`.`FN_GET_ADDR_CD_BY_JC_CD`(IN_ADDR_FULL_CD VARCHAR(100)) RETURNS varchar(13) CHARSET utf8mb4
BEGIN
  #IN_ADDR_FULL_CD ex) '101,10104,1010402,101040202'
  DECLARE RET_VAL VARCHAR(13);
  
  SELECT A.JC_CD INTO  RET_VAL
  FROM CPES_JC_ADDR_MAPNG A 
  WHERE A.PROVINCE_ID = SUBSTRING(IN_ADDR_FULL_CD,1,3)
  AND A.DISTRICT_ID = SUBSTRING(IN_ADDR_FULL_CD,5,5);

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_ADDR_NM`(IN_ADDR_CD VARCHAR(36),IN_LVL VARCHAR(1), IN_LANG_CD VARCHAR(3)) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
  DECLARE RET_VAL VARCHAR(255);


		SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN LC.NM_KH
                ELSE LC.NM_EN
           END AS LC_NM    
			     INTO  RET_VAL
		FROM CPES_LOC_CD LC
		WHERE LC.LVL = IN_LVL
    AND LVL_CD = IN_ADDR_CD;


	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_ADDR_NM_BY_EDU_TRNNG`(IN_EDU_TRNNG_SEQ VARCHAR(40), IN_LANG_CD VARCHAR(3)) RETURNS varchar(1000) CHARSET utf8mb4
BEGIN
  DECLARE RET_VAL VARCHAR(1000);
  
    SELECT GROUP_CONCAT(TBL.ADDR_NM SEPARATOR ',') INTO RET_VAL
    FROM (
  		SELECT    
  				  FN_GET_ADDR_NM(A.ADDR_CD, '2', IN_LANG_CD) AS ADDR_NM
  		FROM CPES_TEACH_ADDR A
  		WHERE A.EDU_TRNNG_SEQ = IN_EDU_TRNNG_SEQ
    ) TBL;
    
	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_AGE_BY_DATE`( P_DATE DATETIME) RETURNS int(11)
BEGIN

	DECLARE L_AGE INT;
	
	SELECT 
  CASE WHEN P_DATE IS NULL OR P_DATE = '' THEN
            0
  ELSE
    /* Full Age 
    ROUND((TO_DAYS(NOW()) - TO_DAYS(DATE_FORMAT(BIRTH, '%Y-%m-%d'))) / 365)
    */
    /* American Age */
    TRUNCATE((TO_DAYS(NOW()) - TO_DAYS(DATE_FORMAT(BIRTH, '%Y-%m-%d'))) / 365, 0)
  END
  INTO L_AGE
  ;
	
	RETURN L_AGE;

END;


CREATE FUNCTION `cpes_dev`.`FN_GET_APPLIC_STAT_CNT`(IN_VACANCY_SEQ VARCHAR(40), IN_APPLIC_PROC_CD VARCHAR(13)) RETURNS int(11)
BEGIN
  
  DECLARE RET_VAL INT;
  
  IF IN_APPLIC_PROC_CD = 'ALL' THEN
    SELECT COUNT(1) INTO  RET_VAL
    FROM CPES_APPLIC A 
    INNER JOIN CPES_VACANCY B
  	ON A.VACANCY_SEQ = B.VACANCY_SEQ
  	INNER JOIN CPES_COMPNY C
  	ON B.COMPNY_SEQ = C.COMPNY_SEQ
  	INNER JOIN CPES_RESUME D
  	ON A.RESUME_SEQ = D.RESUME_SEQ
  	INNER JOIN CPES_USER E
  	ON D.USER_SEQ = E.USER_SEQ
    WHERE A.VACANCY_SEQ =  IN_VACANCY_SEQ
    AND A.APPLIC_CANCEL_YN = 'N' 
    AND A.DEL_YN = 'N'
    AND B.USE_YN = 'Y'
    AND B.DEL_YN = 'N'
    AND C.USE_YN = 'Y'
    AND C.DEL_YN = 'N'
    AND D.USE_YN = 'Y'
    AND E.DEL_YN = 'N'
    AND E.USE_YN = 'Y';
  ELSE
    SELECT COUNT(1) INTO  RET_VAL
    FROM CPES_APPLIC A 
    INNER JOIN CPES_VACANCY B
  	ON A.VACANCY_SEQ = B.VACANCY_SEQ
  	INNER JOIN CPES_COMPNY C
  	ON B.COMPNY_SEQ = C.COMPNY_SEQ
  	INNER JOIN CPES_RESUME D
  	ON A.RESUME_SEQ = D.RESUME_SEQ
  	INNER JOIN CPES_USER E
  	ON D.USER_SEQ = E.USER_SEQ
    WHERE A.VACANCY_SEQ =  IN_VACANCY_SEQ
    AND A.APPLIC_PROC_CD = IN_APPLIC_PROC_CD
    AND A.APPLIC_CANCEL_YN = 'N' 
    AND A.DEL_YN = 'N'
    AND B.USE_YN = 'Y'
    AND B.DEL_YN = 'N'
    AND C.USE_YN = 'Y'
    AND C.DEL_YN = 'N'
    AND D.USE_YN = 'Y'
    AND E.DEL_YN = 'N'
    AND E.USE_YN = 'Y';
  END IF;


	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_BASE_DATE_CHAR`(P_DATE datetime, P_LANG VARCHAR(2)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
	
  DECLARE V_RTNVAL            VARCHAR(20);
  
  SET V_RTNVAL = CASE WHEN P_LANG = 'KR' THEN DATE_FORMAT(P_DATE, '%Y/%m/%d') ELSE DATE_FORMAT(P_DATE, '%d/%m/%Y') END;
  
	RETURN V_RTNVAL;
  
END;


CREATE FUNCTION `cpes_dev`.`FN_GET_BASE_DATE_TIME`(P_DATE datetime, P_FM VARCHAR(10), P_LANG VARCHAR(2)) RETURNS varchar(25) CHARSET utf8mb4
BEGIN
	
  DECLARE V_RTNVAL            VARCHAR(25);
  
  SET V_RTNVAL = 
  CASE WHEN P_FM = 'Y' THEN
            DATE_FORMAT(P_DATE, '%Y')
       WHEN P_FM = 'M' THEN
            CASE WHEN P_LANG = 'KR' THEN DATE_FORMAT(P_DATE, '%Y/%m') ELSE DATE_FORMAT(P_DATE, '%m/%Y') END
       WHEN P_FM = 'D' THEN
            CASE WHEN P_LANG = 'KR' THEN DATE_FORMAT(P_DATE, '%Y/%m/%d') ELSE DATE_FORMAT(P_DATE, '%d/%m/%Y') END
       WHEN P_FM = 'H' THEN
            CASE WHEN P_LANG = 'KR' THEN DATE_FORMAT(P_DATE, '%Y/%m/%d %H') ELSE DATE_FORMAT(P_DATE, '%d/%m/%Y %H') END
       WHEN P_FM = 'I' THEN
            CASE WHEN P_LANG = 'KR' THEN DATE_FORMAT(P_DATE, '%Y/%m/%d %H:%i') ELSE DATE_FORMAT(P_DATE, '%d/%m/%Y %H:%i') END
       WHEN P_FM = 'S' THEN
            CASE WHEN P_LANG = 'KR' THEN DATE_FORMAT(P_DATE, '%Y/%m/%d %H:%i:%s') ELSE DATE_FORMAT(P_DATE, '%d/%m/%Y %H:%i:%s') END
       WHEN P_FM = 'AMPM' THEN
            CASE WHEN P_LANG = 'KR' THEN DATE_FORMAT(NOW(), '%Y/%m/%d %h:%i %p') ELSE DATE_FORMAT(NOW(), '%Y/%m/%d %h:%i %p') END
       
       
  END;
  
	RETURN V_RTNVAL;
  
END;


CREATE FUNCTION `cpes_dev`.`FN_GET_BKMK_SEQ`(IN_USER_SEQ VARCHAR(36), IN_TYPE VARCHAR(20), IN_TABLE_SEQ VARCHAR(36)) RETURNS varchar(40) CHARSET utf8mb4
BEGIN
  DECLARE RET_VAL VARCHAR(40);

  SELECT  BKMK_SEQ
  INTO  RET_VAL
  FROM CPES_BKMK
  WHERE TABLE_KEY_SEQ = IN_TABLE_SEQ
  AND CATE_CD = IN_TYPE
  AND USER_SEQ =  IN_USER_SEQ
  LIMIT 1;


	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_BKMK_YN`(IN_USER_SEQ VARCHAR(36), IN_TYPE VARCHAR(20), IN_TABLE_SEQ VARCHAR(36)) RETURNS varchar(1) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(1);

  SELECT  CASE WHEN COUNT(1) > 0 THEN 'Y'
          ELSE 'N'
          END AS LIKE_YN
  INTO  RET_VAL
  FROM CPES_BKMK
  WHERE TABLE_KEY_SEQ = IN_TABLE_SEQ
  AND CATE_CD = IN_TYPE
  AND USER_SEQ =  IN_USER_SEQ;


	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_COMMON_NM`(IN_GRP_CD VARCHAR(30), IN_DTL_CD VARCHAR(13), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN CD_KH_NM
         ELSE CD_EN_NM
         END AS CD_NM
         INTO  RET_VAL
  FROM CPES_COMM_DTL_CD
  WHERE GRP_CD = IN_GRP_CD
  AND DTL_CD = IN_DTL_CD
  AND USE_YN = 'Y';

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_COMPNY_NM`(IN_COMPNY_SEQ VARCHAR(36), IN_LANG_CD VARCHAR(3)) RETURNS varchar(255) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(255);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN COMPNY_NM_KH
         ELSE COMPNY_NM_EN
         END AS COMPNY_NM
         INTO  RET_VAL
  FROM CPES_COMPNY
  WHERE COMPNY_SEQ = IN_COMPNY_SEQ;

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_CONVRT_MSG`(P_MSG_CD VARCHAR(10), P_VAL VARCHAR(10)) RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  
  DECLARE RET_VAL VARCHAR(50);
  
  IF P_MSG_CD = 'YN' THEN
    SET RET_VAL = CASE WHEN P_VAL = 'Y' THEN 'Yes'
                       WHEN P_VAL = 'N' THEN 'No'
                  ELSE
                      ''
                  END;
  ELSE
    SET RET_VAL = '';
  END IF;

	RETURN	RET_VAL;

END;


CREATE FUNCTION `cpes_dev`.`FN_GET_EDU_CONVERSION`(IN_EDU_PARAM VARCHAR(13)) RETURNS varchar(13) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE VAR_CONVERSION VARCHAR(13);
  
  SET VAR_CONVERSION = '';
 
    
    	
         IF IN_EDU_PARAM = 'EGR0000000101'
         THEN SET VAR_CONVERSION = 'MED0000000001';
        
         ELSEIF IN_EDU_PARAM IN (  'EGR0000000102'
									,'EGR0000000103'
									,'EGR0000000104'
									,'EGR0000000105'
									,'EGR0000000106')
		 THEN SET VAR_CONVERSION = 'MED0000000002';
		 
		 ELSEIF IN_EDU_PARAM IN (  'EGR0000000107'
									,'EGR0000000108'
									,'EGR0000000109'
									,'EGR0000000110'
									,'EGR0000000111'
		                            ,'EGR0000000112')
		 THEN SET VAR_CONVERSION = 'MED0000000003';
		 
		 ELSEIF IN_EDU_PARAM IN ( 'EGR0000000113'
									,'EGR0000000114'
									,'EGR0000000115')
		 THEN SET VAR_CONVERSION = 'MED0000000004';
		
		 ELSEIF IN_EDU_PARAM = 'EGR0000000116'
		 THEN SET VAR_CONVERSION = 'MED0000000005';
		 
		 ELSEIF IN_EDU_PARAM IN ( 'EGR0000000211'
									,'EGR0000000212'
									,'EGR0000000213'
									,'EGR0000000214'
									,'EGR0000000217'
									,'EGR0000000219'
									,'EGR0000000220'
									,'EGR0000000221'
									,'EGR0000000317')
		 THEN SET VAR_CONVERSION = 'MED0000000006';
		
		 ELSEIF IN_EDU_PARAM IN ( 'EGR0000000318'
									,'EGR0000000319'
									,'EGR0000000320')
		 THEN SET VAR_CONVERSION = 'MED0000000007';
	
		 ELSEIF IN_EDU_PARAM = 'EGR0000000321'
		 THEN SET VAR_CONVERSION = 'MED0000000009';
		
		 ELSEIF IN_EDU_PARAM = 'EGR0000000322'
		 THEN SET VAR_CONVERSION = 'MED0000000010';
		 
		 END IF;

   
	RETURN	VAR_CONVERSION;


END;


CREATE FUNCTION `cpes_dev`.`FN_GET_FAIR_NM`(IN_FAIR_SEQ VARCHAR(36), IN_LANG_CD VARCHAR(3)) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
  DECLARE RET_VAL VARCHAR(255);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN FAIR_NM_KH
         ELSE FAIR_NM_EN
         END AS FAIR_NM
         INTO  RET_VAL
  FROM CPES_FAIR_MST
  WHERE FAIR_SEQ = IN_FAIR_SEQ;

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_FILE_PATH`(
	`FILE_SEQ` VARCHAR(50)

) RETURNS varchar(5000) CHARSET utf8mb4
    COMMENT '저장된 파일 경로 조회'
BEGIN

	DECLARE FILE_PATH VARCHAR(500);
	
	SELECT AF.SAVE_FILE_PATH INTO FILE_PATH
	FROM CPES_ATTACH_FILES AF
	WHERE AF.FILE_SEQ = FILE_SEQ;
	
	RETURN FILE_PATH;

END;


CREATE FUNCTION `cpes_dev`.`FN_GET_INSTT_NM`(IN_INSTT_SEQ VARCHAR(36), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN INSTT_NM_KH
         ELSE INSTT_NM_EN
         END AS INSTT_NM
         INTO  RET_VAL
  FROM CPES_INSTT
  WHERE INSTT_SEQ = IN_INSTT_SEQ;

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_ISCED_NM`(IN_ISCED_CD VARCHAR(30), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN KH_NM
         ELSE EN_NM
         END AS CD_NM
         INTO  RET_VAL
  FROM CPES_ISCED_CD
  WHERE ISCED_CD = IN_ISCED_CD;

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_ISCO_NM`(IN_ISCO_CD VARCHAR(30), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN KH_NM
         ELSE EN_NM
         END AS CD_NM
         INTO  RET_VAL
  FROM CPES_ISCO_CD
  WHERE ISCO_CD = IN_ISCO_CD;

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_ISIC_NM`(IN_ISIC_CD VARCHAR(30), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN KH_NM
         ELSE EN_NM
         END AS CD_NM
         INTO  RET_VAL
  FROM CPES_ISIC_CD
  WHERE ISIC_CD = IN_ISIC_CD;

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_JOB_CNTR_NM`(IN_JC_CD VARCHAR(13), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN JC_KH
         ELSE JC_EN
         END AS JC_NM
         INTO  RET_VAL
  FROM CPES_JOB_CENTER
  WHERE JC_CD = IN_JC_CD;

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_LIKE_YN`(IN_USER_SEQ VARCHAR(36), IN_TYPE VARCHAR(20), IN_TABLE_SEQ VARCHAR(36)) RETURNS varchar(1) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(1);

  SELECT  CASE WHEN COUNT(1) > 0 THEN 'Y'
          ELSE 'N'
          END AS LIKE_YN
  INTO  RET_VAL
  FROM CPES_LIKE
  WHERE TABLE_KEY_SEQ = IN_TABLE_SEQ
  AND CATE_CD = IN_TYPE
  AND USER_SEQ =  IN_USER_SEQ;


	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_MASKING_DISPLAY_YN`(IN_APPLIC_SEQ VARCHAR(40)) RETURNS varchar(1) CHARSET utf8mb4
BEGIN
 
  DECLARE RET_VAL VARCHAR(1);
  
  
  SELECT CASE WHEN SUM(A.CNT) > 0 THEN 'Y' ELSE 'N'
         END AS DISPLAY_YN INTO RET_VAL
  FROM (
    SELECT COUNT(1) AS CNT
    FROM CPES_INTVW A
    WHERE A.APPLIC_SEQ = IN_APPLIC_SEQ
    AND A.INTVW_STS_CD = 'ITV0000000002' /*인터뷰 수락*/
    UNION ALL
    SELECT COUNT(1) AS CNT
    FROM CPES_APPLIC A
    WHERE A.APPLIC_SEQ = IN_APPLIC_SEQ
    AND A.APPLIC_PROC_CD = 'APC0000000004' /* 햡격 */
 ) A;

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_MASKING_DISPLAY_YN2`(IN_VACANCY_SEQ VARCHAR(40), IN_USER_SEQ VARCHAR(40)) RETURNS varchar(1) CHARSET utf8mb4
BEGIN
 
  DECLARE RET_VAL VARCHAR(1); /* DISPLAY_YN 반환값 Y일경우 마스크 해제 */
  DECLARE OUT_INTVW_CNT INT;  /* 인터뷰 수락 COUNT */
  DECLARE OUT_APPLIC_SEQ VARCHAR(40); /* 합격한 입사지원일 경우 */
  
  SET RET_VAL = 'N'; /* DEFAULT = 'N' */
  
  IF IN_USER_SEQ = NULL OR IN_USER_SEQ = '' THEN /* 로그인사용자 번호가 없을경우 */
    SET  RET_VAL = 'N';
    RETURN RET_VAL;
  ELSE 
      SELECT 
            B.APPLIC_SEQ INTO OUT_APPLIC_SEQ
      FROM CPES_VACANCY A
      INNER JOIN CPES_APPLIC B
      ON A.VACANCY_SEQ = B.VACANCY_SEQ
      WHERE A.VACANCY_SEQ = IN_VACANCY_SEQ
      AND B.RESUME_SEQ  IN (
        SELECT F.RESUME_SEQ
        FROM CPES_RESUME F
        WHERE F.USER_SEQ = IN_USER_SEQ
      )
      AND B.APPLIC_PROC_CD = 'APC0000000004' /* 합격 */
      LIMIT 1;
    
      /* 입사지원 합격 하지 않았을경우 */
      IF(OUT_APPLIC_SEQ  = NULL OR OUT_APPLIC_SEQ = '') THEN
         SET  RET_VAL = 'N';
         RETURN RET_VAL;
      ELSEIF(OUT_APPLIC_SEQ  <> NULL AND OUT_APPLIC_SEQ <> '') THEN /* 합격한 입사지원일 경우*/
         SET  RET_VAL = 'Y';
         RETURN RET_VAL;
      END IF;
      
      SELECT COUNT(1) INTO OUT_INTVW_CNT
      FROM CPES_INTVW A
      WHERE A.APPLIC_SEQ = OUT_APPLIC_SEQ
      AND A.INTVW_STS_CD = 'ITV0000000002'; /*인터뷰 수락*/ 
      
      IF(OUT_INTVW_CNT > 0) THEN
         SET  RET_VAL = 'Y';
         RETURN RET_VAL;
      ELSE 
        SET  RET_VAL = 'N';
      END IF;
    
  END IF;

    


	RETURN	RET_VAL;

	

END;


CREATE FUNCTION `cpes_dev`.`FN_GET_MATCH_EDU_NM`(IN_EDU_PARAM VARCHAR(13), IN_MATCH_PARAM VARCHAR(13)) RETURNS varchar(13) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(13);
  DECLARE VAR_CONVERSION VARCHAR(13);
  
  SET RET_VAL = 'Non';
  SET VAR_CONVERSION = '';
 
    
    	
         IF IN_MATCH_PARAM = 'EGR0000000101'
         THEN SET VAR_CONVERSION = 'MED0000000001';
        
         ELSEIF IN_MATCH_PARAM IN (  'EGR0000000102'
									,'EGR0000000103'
									,'EGR0000000104'
									,'EGR0000000105'
									,'EGR0000000106')
		 THEN SET VAR_CONVERSION = 'MED0000000002';
		 
		 ELSEIF IN_MATCH_PARAM IN (  'EGR0000000107'
									,'EGR0000000108'
									,'EGR0000000109'
									,'EGR0000000110'
									,'EGR0000000111'
		                            ,'EGR0000000112')
		 THEN SET VAR_CONVERSION = 'MED0000000003';
		 
		 ELSEIF IN_MATCH_PARAM IN ( 'EGR0000000113'
									,'EGR0000000114'
									,'EGR0000000115')
		 THEN SET VAR_CONVERSION = 'MED0000000004';
		
		 ELSEIF IN_MATCH_PARAM = 'EGR0000000116'
		 THEN SET VAR_CONVERSION = 'MED0000000005';
		 
		 ELSEIF IN_MATCH_PARAM IN ( 'EGR0000000211'
									,'EGR0000000212'
									,'EGR0000000213'
									,'EGR0000000214'
									,'EGR0000000217'
									,'EGR0000000219'
									,'EGR0000000220'
									,'EGR0000000221'
									,'EGR0000000317')
		 THEN SET VAR_CONVERSION = 'MED0000000006';
		
		 ELSEIF IN_MATCH_PARAM IN ( 'EGR0000000318'
									,'EGR0000000319'
									,'EGR0000000320')
		 THEN SET VAR_CONVERSION = 'MED0000000007';
	
		 ELSEIF IN_MATCH_PARAM = 'EGR0000000321'
		 THEN SET VAR_CONVERSION = 'MED0000000009';
		
		 ELSEIF IN_MATCH_PARAM = 'EGR0000000322'
		 THEN SET VAR_CONVERSION = 'MED0000000010';
		 
		 END IF;
		 
    
	 	IF IN_EDU_PARAM = VAR_CONVERSION
	    THEN SET RET_VAL = 'Match';
	    
	    ELSEIF IN_EDU_PARAM = 'MED0000000001' AND VAR_CONVERSION <= 'MED0000000001'
	    THEN SET RET_VAL = 'Match';
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000002' AND VAR_CONVERSION <= 'MED0000000002'
	    THEN SET RET_VAL = 'Match';
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000003' AND VAR_CONVERSION <= 'MED0000000003'
	    THEN SET RET_VAL = 'Match';
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000004' AND VAR_CONVERSION <= 'MED0000000004'
	    THEN SET RET_VAL = 'Match';
	    
	    ELSEIF IN_EDU_PARAM = 'MED0000000005' AND VAR_CONVERSION <= 'MED0000000005'
	    THEN SET RET_VAL = 'Match';
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000006' AND VAR_CONVERSION <= 'MED0000000006'
	    THEN SET RET_VAL = 'Match';
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000007' AND VAR_CONVERSION <= 'MED0000000007'
	    THEN SET RET_VAL = 'Match';
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000009' AND VAR_CONVERSION <= 'MED0000000009'
	    THEN SET RET_VAL = 'Match';
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000010' AND VAR_CONVERSION <= 'MED0000000010'
	    THEN SET RET_VAL = 'Match';
	    
	    ELSE
	         SET RET_VAL = 'Non';
	    END IF;
    
   
	RETURN	RET_VAL;


END;


CREATE FUNCTION `cpes_dev`.`FN_GET_MATCH_EDU_POINT`(IN_EDU_PARAM VARCHAR(13), IN_MATCH_PARAM VARCHAR(13)) RETURNS int(3)
BEGIN
  DECLARE RET_VAL INT(3);
  DECLARE VAR_CONVERSION VARCHAR(13);
  
  SET RET_VAL = 0;
  SET VAR_CONVERSION = '';
 
    IF IN_MATCH_PARAM = 'EGR0000000101'
         THEN SET VAR_CONVERSION = 'MED0000000001';
        
         ELSEIF IN_MATCH_PARAM IN (  'EGR0000000102'
									,'EGR0000000103'
									,'EGR0000000104'
									,'EGR0000000105'
									,'EGR0000000106')
		 THEN SET VAR_CONVERSION = 'MED0000000002';
		 
		 ELSEIF IN_MATCH_PARAM IN (  'EGR0000000107'
									,'EGR0000000108'
									,'EGR0000000109'
									,'EGR0000000110'
									,'EGR0000000111'
		                            ,'EGR0000000112')
		 THEN SET VAR_CONVERSION = 'MED0000000003';
		 
		 ELSEIF IN_MATCH_PARAM IN ( 'EGR0000000113'
									,'EGR0000000114'
									,'EGR0000000115')
		 THEN SET VAR_CONVERSION = 'MED0000000004';
		
		 ELSEIF IN_MATCH_PARAM = 'EGR0000000116'
		 THEN SET VAR_CONVERSION = 'MED0000000005';
		 
		 ELSEIF IN_MATCH_PARAM IN ( 'EGR0000000211'
									,'EGR0000000212'
									,'EGR0000000213'
									,'EGR0000000214'
									,'EGR0000000217'
									,'EGR0000000219'
									,'EGR0000000220'
									,'EGR0000000221'
									,'EGR0000000317')
		 THEN SET VAR_CONVERSION = 'MED0000000006';
		
		 ELSEIF IN_MATCH_PARAM IN ( 'EGR0000000318'
									,'EGR0000000319'
									,'EGR0000000320')
		 THEN SET VAR_CONVERSION = 'MED0000000007';
	
		 ELSEIF IN_MATCH_PARAM = 'EGR0000000321'
		 THEN SET VAR_CONVERSION = 'MED0000000009';
		
		 ELSEIF IN_MATCH_PARAM = 'EGR0000000322'
		 THEN SET VAR_CONVERSION = 'MED0000000010';
		 
		 END IF;
		 
    
	 	IF IN_EDU_PARAM = VAR_CONVERSION
	    THEN SET RET_VAL = 25;
	    
	    ELSEIF IN_EDU_PARAM = 'MED0000000001' AND VAR_CONVERSION <= 'MED0000000001'
	    THEN SET RET_VAL = 25;
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000002' AND VAR_CONVERSION <= 'MED0000000002'
	    THEN SET RET_VAL = 25;
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000003' AND VAR_CONVERSION <= 'MED0000000003'
	    THEN SET RET_VAL = 25;
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000004' AND VAR_CONVERSION <= 'MED0000000004'
	    THEN SET RET_VAL = 25;
	    
	    ELSEIF IN_EDU_PARAM = 'MED0000000005' AND VAR_CONVERSION <= 'MED0000000005'
	    THEN SET RET_VAL = 25;
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000006' AND VAR_CONVERSION <= 'MED0000000006'
	    THEN SET RET_VAL = 25;
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000007' AND VAR_CONVERSION <= 'MED0000000007'
	    THEN SET RET_VAL = 25;
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000009' AND VAR_CONVERSION <= 'MED0000000009'
	    THEN SET RET_VAL = 25;
	   
	    ELSEIF IN_EDU_PARAM = 'MED0000000010' AND VAR_CONVERSION <= 'MED0000000010'
	    THEN SET RET_VAL = 25;
	    
	    ELSE
	         SET RET_VAL = 0;
	    END IF;
    
   
	RETURN	RET_VAL;



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_MATCH_LOC_NM`(IN_PROVINCE_PARAM VARCHAR(20), IN_DISTRICT_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(100)) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(10);
  DECLARE VAL_PROVINCE INT(3);
  DECLARE VAL_DISTRICT INT(3);
  
  SET VAL_PROVINCE = (SELECT LVL_CD FROM CPES_LOC_CD WHERE REPLACE(LVL_CD,',','') = SUBSTRING_INDEX(SUBSTRING_INDEX(IN_MATCH_PARAM,',',-4),',',1));
  SET VAL_DISTRICT = (SELECT LVL_CD FROM CPES_LOC_CD WHERE REPLACE(LVL_CD,',','') = SUBSTRING_INDEX(SUBSTRING_INDEX(IN_MATCH_PARAM,',',-3),',',1));
  SET RET_VAL = 'Non';
  
    IF IF(IN_DISTRICT_PARAM, 0, 1) = 0
    THEN
	 	IF IN_DISTRICT_PARAM = VAL_DISTRICT
	    THEN SET RET_VAL = 'Match';
	    
	    ELSEIF IN_PROVINCE_PARAM = VAL_PROVINCE
	    THEN SET RET_VAL = 'Similar';
	    
	    ELSEIF IN_DISTRICT_PARAM !=  VAL_DISTRICT
	    THEN SET RET_VAL = 'Non';
	    END IF;
	ELSEIF IF(IN_PROVINCE_PARAM, 0, 1) = 0 AND IF(IN_DISTRICT_PARAM, 0, 1) = 1
	THEN
	     IF IN_PROVINCE_PARAM = VAL_PROVINCE
	     THEN SET RET_VAL = 'Match';
	     
	     ELSEIF IN_PROVINCE_PARAM != VAL_PROVINCE
	     THEN SET RET_VAL = 'Non';
         END IF;
    
    ELSE 
         SET RET_VAL = 'Non';
    END IF;
   
	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_MATCH_LOC_POINT`(IN_PROVINCE_PARAM VARCHAR(20), IN_DISTRICT_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(100)) RETURNS int(3)
BEGIN
  DECLARE RET_VAL INT(3);
  DECLARE VAL_PROVINCE INT(3);
  DECLARE VAL_DISTRICT INT(3);
  
  SET VAL_PROVINCE = (SELECT LVL_CD FROM CPES_LOC_CD WHERE REPLACE(LVL_CD,',','') = SUBSTRING_INDEX(SUBSTRING_INDEX(IN_MATCH_PARAM,',',-4),',',1));
  SET VAL_DISTRICT = (SELECT LVL_CD FROM CPES_LOC_CD WHERE REPLACE(LVL_CD,',','') = SUBSTRING_INDEX(SUBSTRING_INDEX(IN_MATCH_PARAM,',',-3),',',1));
  SET RET_VAL = 0;
  
    IF IF(IN_DISTRICT_PARAM, 0, 1) = 0
    THEN
	 	IF IN_DISTRICT_PARAM = VAL_DISTRICT
	    THEN SET RET_VAL = 25;
	    
	    ELSEIF IN_PROVINCE_PARAM = VAL_PROVINCE
	    THEN SET RET_VAL = 20;
	    
	    ELSEIF IN_DISTRICT_PARAM !=  VAL_DISTRICT
	    THEN SET RET_VAL = 0;
	    END IF;
	ELSEIF IF(IN_PROVINCE_PARAM, 0, 1) = 0 AND IF(IN_DISTRICT_PARAM, 0, 1) = 1
	THEN
	     IF IN_PROVINCE_PARAM = VAL_PROVINCE
	     THEN SET RET_VAL = 25;
	     
	     ELSEIF IN_PROVINCE_PARAM != VAL_PROVINCE
	     THEN SET RET_VAL = 0;
         END IF;
    
    ELSE 
         SET RET_VAL = 0;
    END IF;
   
	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_MATCH_OCCU_NM`(IN_ONE_PARAM VARCHAR(20), IN_TOW_PARAM VARCHAR(20),IN_THREE_PARAM VARCHAR(20),IN_FOUR_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(20)) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(10);
  DECLARE FOUR_DEPTH VARCHAR(20);
  DECLARE THREE_DEPTH VARCHAR(20);
  DECLARE TWO_DEPTH VARCHAR(20);
  DECLARE ONE_DEPTH VARCHAR(20);
  
  SET FOUR_DEPTH = (SELECT ISCO_ID FROM CPES_ISCO_CD WHERE ISCO_CD =  IN_MATCH_PARAM);
  SET THREE_DEPTH = (SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(CD_LVL,'=>',-2),'=>',1) FROM CPES_ISCO_CD WHERE  ISCO_CD =  IN_MATCH_PARAM);
  SET TWO_DEPTH = (SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(CD_LVL,'=>',-3),'=>',1) FROM CPES_ISCO_CD WHERE  ISCO_CD =  IN_MATCH_PARAM);
  SET ONE_DEPTH = (SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(CD_LVL,'=>',-4),'=>',1) FROM CPES_ISCO_CD WHERE  ISCO_CD =  IN_MATCH_PARAM);
  SET RET_VAL = 'Non';
  
    IF IF(IN_FOUR_PARAM, 0, 1) = 0
    THEN
	 	IF IN_FOUR_PARAM = FOUR_DEPTH
	    THEN SET RET_VAL = 'Match';
	    
	    ELSEIF IN_THREE_PARAM = THREE_DEPTH
	    THEN SET RET_VAL = 'Similar';
	    
	    ELSEIF IN_THREE_PARAM !=  THREE_DEPTH
	    THEN SET RET_VAL = 'Non';
	    END IF;
	ELSEIF IF(IN_THREE_PARAM, 0, 1) = 0 AND IF(IN_FOUR_PARAM, 0, 1) = 1
	THEN
	     IF IN_THREE_PARAM = THREE_DEPTH
	     THEN SET RET_VAL = 'Match';
	     
	     ELSEIF IN_THREE_PARAM != THREE_DEPTH
	     THEN SET RET_VAL = 'Non';
         END IF;
    ELSEIF IF(IN_TOW_PARAM, 0, 1) = 0 AND IF(IN_THREE_PARAM, 0, 1) = 1 AND IF(IN_FOUR_PARAM, 0, 1) = 1
    THEN 
         IF IN_TOW_PARAM = TWO_DEPTH
         THEN SET RET_VAL = 'Match';
         
         ELSEIF IN_TOW_PARAM != TWO_DEPTH
         THEN SET RET_VAL = 'Non';
         END IF;
    ELSEIF IF(IN_ONE_PARAM, 0, 1) = 0 AND IF(IN_TOW_PARAM, 0, 1) = 1 AND IF(IN_THREE_PARAM, 0, 1) = 1 AND IF(IN_FOUR_PARAM, 0, 1) = 1
    THEN 
         IF IN_ONE_PARAM = ONE_DEPTH
         THEN SET RET_VAL = 'Match';
         
         ELSEIF IN_ONE_PARAM != ONE_DEPTH
         THEN SET RET_VAL = 'Non';
         END IF;
    ELSE 
         SET RET_VAL = 'Non';
    END IF;
   
	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_MATCH_OCCU_POINT`(IN_ONE_PARAM VARCHAR(20), IN_TOW_PARAM VARCHAR(20),IN_THREE_PARAM VARCHAR(20),IN_FOUR_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(20)) RETURNS int(3)
BEGIN
  DECLARE RET_VAL INT(3);
  DECLARE FOUR_DEPTH VARCHAR(20);
  DECLARE THREE_DEPTH VARCHAR(20);
  DECLARE TWO_DEPTH VARCHAR(20);
  DECLARE ONE_DEPTH VARCHAR(20);
  
  SET FOUR_DEPTH = (SELECT ISCO_ID FROM CPES_ISCO_CD WHERE ISCO_CD =  IN_MATCH_PARAM);
  SET THREE_DEPTH = (SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(CD_LVL,'=>',-2),'=>',1) FROM CPES_ISCO_CD WHERE  ISCO_CD =  IN_MATCH_PARAM);
  SET TWO_DEPTH = (SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(CD_LVL,'=>',-3),'=>',1) FROM CPES_ISCO_CD WHERE  ISCO_CD =  IN_MATCH_PARAM);
  SET ONE_DEPTH = (SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(CD_LVL,'=>',-4),'=>',1) FROM CPES_ISCO_CD WHERE  ISCO_CD =  IN_MATCH_PARAM);
  SET RET_VAL = 0;
  
    IF IF(IN_FOUR_PARAM, 0, 1) = 0
    THEN
	 	IF IN_FOUR_PARAM = FOUR_DEPTH
	    THEN SET RET_VAL = 25;
	    
	    ELSEIF IN_THREE_PARAM = THREE_DEPTH
	    THEN SET RET_VAL = 20;
	    
	    ELSEIF IN_THREE_PARAM !=  THREE_DEPTH
	    THEN SET RET_VAL = 0;
	    END IF;
	ELSEIF IF(IN_THREE_PARAM, 0, 1) = 0 AND IF(IN_FOUR_PARAM, 0, 1) = 1
	THEN
	     IF IN_THREE_PARAM = THREE_DEPTH
	     THEN SET RET_VAL = 25;
	     
	     ELSEIF IN_THREE_PARAM != THREE_DEPTH
	     THEN SET RET_VAL = 0;
         END IF;
    ELSEIF IF(IN_TOW_PARAM, 0, 1) = 0 AND IF(IN_THREE_PARAM, 0, 1) = 1 AND IF(IN_FOUR_PARAM, 0, 1) = 1
    THEN 
         IF IN_TOW_PARAM = TWO_DEPTH
         THEN SET RET_VAL = 25;
         
         ELSEIF IN_TOW_PARAM != TWO_DEPTH
         THEN SET RET_VAL = 0;
         END IF;
    ELSEIF IF(IN_ONE_PARAM, 0, 1) = 0 AND IF(IN_TOW_PARAM, 0, 1) = 1 AND IF(IN_THREE_PARAM, 0, 1) = 1 AND IF(IN_FOUR_PARAM, 0, 1) = 1
    THEN 
         IF IN_ONE_PARAM = ONE_DEPTH
         THEN SET RET_VAL = 25;
         
         ELSEIF IN_ONE_PARAM != ONE_DEPTH
         THEN SET RET_VAL = 0;
         END IF;
    ELSE 
         SET RET_VAL = 0;
    END IF;
   
	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_MATCH_WAGE_NM`(IN_WAGE_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(100)) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(10);
  
  SET RET_VAL = 'Non';
  
    IF IF(IN_WAGE_PARAM, 0, 1) = 0 AND IF(IN_MATCH_PARAM, 0, 1) = 0
    THEN
	 	IF IN_WAGE_PARAM >= IN_MATCH_PARAM
	    THEN SET RET_VAL = 'Match';
	    
		ELSE 
	         SET RET_VAL = 'Non';
	    END IF;
    ELSE 
         SET RET_VAL = 'Non';
    END IF;
   
	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_MATCH_WAGE_POINT`(IN_WAGE_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(100)) RETURNS int(3)
BEGIN
  DECLARE RET_VAL INT(3);
  
  SET RET_VAL = 0;
  
    IF IF(IN_WAGE_PARAM, 0, 1) = 0 AND IF(IN_MATCH_PARAM, 0, 1) = 0
    THEN
	 	IF IN_WAGE_PARAM >= IN_MATCH_PARAM
	    THEN SET RET_VAL = 25;
	    
		ELSE 
	         SET RET_VAL = 0;
	    END IF;
    ELSE 
         SET RET_VAL = 0;
    END IF;
   
	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_NEW_YN`(IN_REG_DT DATETIME) RETURNS varchar(1) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(1);

  SELECT IF(DATE_SUB(NOW(), INTERVAL 10 DAY) <= IN_REG_DT, 'Y', 'N') AS NEW_YN
         INTO  RET_VAL
  FROM DUAL;

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_REMAIN_CNT`(I_DT date) RETURNS int(5)
BEGIN
	
  DECLARE V_RTNVAL            INT(5);
  
  SET V_RTNVAL =  CASE WHEN TIMESTAMPDIFF(HOUR,NOW(),I_DT) >= 24 THEN DATEDIFF(I_DT,NOW()) ELSE TIMESTAMPDIFF(HOUR,NOW(),I_DT) END;
                      
  
	RETURN V_RTNVAL;
  
END;


CREATE FUNCTION `cpes_dev`.`FN_GET_REMAIN_DIV`(I_DT date) RETURNS varchar(5) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
	
  DECLARE V_RTNVAL            VARCHAR(5);
  
  SET V_RTNVAL = CASE WHEN TIMESTAMPDIFF(HOUR,NOW(),I_DT) >= 24 THEN 'day' ELSE 'hurry' END;
                      
  
	RETURN V_RTNVAL;
  
END;


CREATE FUNCTION `cpes_dev`.`FN_GET_STR_TO_DATE`(P_DATE      VARCHAR(10), P_DIV      VARCHAR(1)) RETURNS datetime
BEGIN
  
  DECLARE V_RTNVAL        datetime;
  DECLARE V_STR_DATE      VARCHAR(50);
  
  SET V_STR_DATE = REPLACE(P_DATE, '/', '-'); 
  SET V_STR_DATE = CASE WHEN P_DIV = 'S' THEN CONCAT(V_STR_DATE, ' ', '00:00:00') ELSE CONCAT(V_STR_DATE, ' ', '23:59:59') END;
  SET V_RTNVAL = DATE_FORMAT(STR_TO_DATE(V_STR_DATE, '%d-%m-%Y %H:%i:%S'), '%Y-%m-%d %H:%i:%S');
  
  RETURN V_RTNVAL;
  
END;


CREATE FUNCTION `cpes_dev`.`FN_GET_USER_AGE`(
	`BIRTH` VARCHAR(50)
) RETURNS int(11)
BEGIN

	DECLARE AGE INT;
	
	SELECT FLOOR((CAST(REPLACE(CURRENT_DATE,'-','') AS UNSIGNED) - CAST(REPLACE(BIRTH,'-','') AS UNSIGNED)) / 10000) INTO AGE;
	
	RETURN AGE;

END;


CREATE FUNCTION `cpes_dev`.`FN_GET_USER_NM_BY_USER_SEQ`(IN_USER_SEQ VARCHAR(36), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN USER_NM_KH
         ELSE USER_NM_EN
         END AS USER_NM
         INTO  RET_VAL
  FROM CPES_USER
  WHERE USER_SEQ = IN_USER_SEQ;

	RETURN	RET_VAL;

	



END;


CREATE FUNCTION `cpes_dev`.`FN_GET_UUID_SEQ`() RETURNS varchar(36) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(36);

  SELECT REPLACE(UUID(),'-','') INTO  RET_VAL
  FROM DUAL;

	

	RETURN	RET_VAL;

	



END;