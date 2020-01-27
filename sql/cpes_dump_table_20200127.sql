-- --------------------------------------------------------
-- 호스트:                          192.168.0.115
-- 서버 버전:                        10.0.38-MariaDB-0ubuntu0.16.04.1 - Ubuntu 16.04
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 cpes_dev.CPES_APPLIC 구조 내보내기
DROP TABLE IF EXISTS `CPES_APPLIC`;
CREATE TABLE IF NOT EXISTS `CPES_APPLIC` (
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `APPLIC_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '입사지원_형태_코드(온라인/이메일)(APPLIC_TYPE_CD)',
  `APPLIC_CANCEL_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '입사지원_취소_여부_YN',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `NEGO_AMT_UNIT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '협상_급여_단위_코드(NEGO_SALARY_UNIT_CD)',
  `NEGO_AMT` int(11) DEFAULT NULL COMMENT '협상_금액',
  `RESUME_OPEN_DT` datetime DEFAULT NULL COMMENT '이력서_열람_일시',
  `REFERRAL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '알선_여부',
  `APPLIC_PROC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '입사지원_진행_코드',
  `APPLIC_CANCEL_DT` datetime DEFAULT NULL COMMENT '입사지원_취소_날짜',
  `APPLIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '입사지원_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_일자',
  `MOD_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제_여부',
  `FAIL_REASON` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '불합격_사유',
  PRIMARY KEY (`APPLIC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_입사지원';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_AP_BASE_INDIC 구조 내보내기
DROP TABLE IF EXISTS `CPES_AP_BASE_INDIC`;
CREATE TABLE IF NOT EXISTS `CPES_AP_BASE_INDIC` (
  `BASE_INDIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기준_지표_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `DEPTH` int(11) NOT NULL COMMENT '깊이',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  `INDIC_ITEM_NM` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지표_항목_명',
  `YEAR` int(11) DEFAULT NULL COMMENT '년도',
  `TITLE` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  PRIMARY KEY (`BASE_INDIC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_AP_기준_지표';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_AP_INDIC_DATA 구조 내보내기
DROP TABLE IF EXISTS `CPES_AP_INDIC_DATA`;
CREATE TABLE IF NOT EXISTS `CPES_AP_INDIC_DATA` (
  `INDIC_DATA_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '지표_데이터_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `YEAR_BASE_INDIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '연별_기준_지표_시퀀스',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `RESULT` text COLLATE utf8mb4_unicode_ci COMMENT '결과',
  `MONTH` int(11) DEFAULT NULL COMMENT '월',
  `DEPTH` int(11) DEFAULT NULL COMMENT '깊이',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  `INDIC_ITEM_NM` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지표_항목_명',
  `VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '노출_여부',
  `REPORT_CYCLE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '보고_주기_코드',
  PRIMARY KEY (`INDIC_DATA_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_AP_지표_데이터';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_AP_YEAR_BASE_INDIC 구조 내보내기
DROP TABLE IF EXISTS `CPES_AP_YEAR_BASE_INDIC`;
CREATE TABLE IF NOT EXISTS `CPES_AP_YEAR_BASE_INDIC` (
  `YEAR_BASE_INDIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '연별_기준_지표_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `BASE_INDIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기준_지표_시퀀스',
  `DEPTH` int(11) DEFAULT NULL COMMENT '깊이',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  `INDIC_ITEM_NM` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지표_항목_명',
  `YEAR` int(11) DEFAULT NULL COMMENT '연도',
  `VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '노출_여부',
  `UPPER_YEAR_BASE_INDIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상위_연별_기준_지표_시퀀스',
  `FULL_YEAR_BASE_INDIC_SEQ` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '완성_연별_기준_지표_시퀀스',
  `TITLE` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_AP_연별_기준_지표';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_ATTACH_FILES 구조 내보내기
DROP TABLE IF EXISTS `CPES_ATTACH_FILES`;
CREATE TABLE IF NOT EXISTS `CPES_ATTACH_FILES` (
  `FILE_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일_시퀀스',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일_그룹_시퀀스',
  `ORIGINAL_NM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '원본_명',
  `SAVE_NM` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '저장_명',
  `SAVE_FILE_PATH` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일_저장_경로',
  `FILE_EXTENSION` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일_확장자',
  `FILE_SIZE` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일_크기',
  `REG_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  PRIMARY KEY (`FILE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_파일';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BANNER 구조 내보내기
DROP TABLE IF EXISTS `CPES_BANNER`;
CREATE TABLE IF NOT EXISTS `CPES_BANNER` (
  `BANNER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '배너_시퀀스',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `BGN_DT` char(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` char(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료_날짜',
  `CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `TITLE` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `BGN_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작_시간',
  `END_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료_시간',
  `BGN_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작_분',
  `END_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료_분',
  `BGN_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작_AMPM',
  `END_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료_AMPM',
  `RESV_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예약설정_여부',
  `TODAY_OPEN_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '하루동안_보지않기_여부',
  `CONN_URL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '연결_URL',
  PRIMARY KEY (`BANNER_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_배너';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BANWORD 구조 내보내기
DROP TABLE IF EXISTS `CPES_BANWORD`;
CREATE TABLE IF NOT EXISTS `CPES_BANWORD` (
  `BANWORD_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '금지어_시퀀스',
  `BANWORD` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '금지어',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '사용_여부',
  PRIMARY KEY (`BANWORD_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_금지어';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BATCH_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_BATCH_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_BATCH_LOG` (
  `BATCH_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '배치_로그_시퀀스',
  `BATCH_KIND_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '배치_종류_코드',
  `BATCH_KIND_NM` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '배치_종류_명',
  `BATCH_BGN_DT` datetime DEFAULT NULL COMMENT '배치_시작_날짜',
  `BATCH_END_DT` datetime DEFAULT NULL COMMENT '배치_종료_날짜',
  `SUCCESS_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성공_여부',
  PRIMARY KEY (`BATCH_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_배치_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BATCH_MONTH_POPUL_COMPNY 구조 내보내기
DROP TABLE IF EXISTS `CPES_BATCH_MONTH_POPUL_COMPNY`;
CREATE TABLE IF NOT EXISTS `CPES_BATCH_MONTH_POPUL_COMPNY` (
  `MONTH_POPUL_COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMPNY_BKMK_CNT` int(11) DEFAULT NULL,
  `RANKING` int(11) DEFAULT NULL,
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`MONTH_POPUL_COMPNY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BATCH_TODAY_POPUL_COMPNY 구조 내보내기
DROP TABLE IF EXISTS `CPES_BATCH_TODAY_POPUL_COMPNY`;
CREATE TABLE IF NOT EXISTS `CPES_BATCH_TODAY_POPUL_COMPNY` (
  `TODAY_POPUL_COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMPNY_BKMK_CNT` int(11) DEFAULT NULL,
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL,
  `RANKING` int(11) DEFAULT NULL,
  PRIMARY KEY (`TODAY_POPUL_COMPNY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BATCH_TODAY_POPUL_VACANCY 구조 내보내기
DROP TABLE IF EXISTS `CPES_BATCH_TODAY_POPUL_VACANCY`;
CREATE TABLE IF NOT EXISTS `CPES_BATCH_TODAY_POPUL_VACANCY` (
  `TODAY_POPUL_VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VACANCY_BKMK_CNT` int(11) DEFAULT NULL,
  `RANKING` int(11) DEFAULT NULL,
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`TODAY_POPUL_VACANCY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BATCH_WEEK_POPUL_COMPNY 구조 내보내기
DROP TABLE IF EXISTS `CPES_BATCH_WEEK_POPUL_COMPNY`;
CREATE TABLE IF NOT EXISTS `CPES_BATCH_WEEK_POPUL_COMPNY` (
  `WEEK_POPUL_COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMPNY_BKMK_CNT` int(11) DEFAULT NULL,
  `RANKING` int(11) DEFAULT NULL,
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_dT` datetime DEFAULT NULL,
  PRIMARY KEY (`WEEK_POPUL_COMPNY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BKMK 구조 내보내기
DROP TABLE IF EXISTS `CPES_BKMK`;
CREATE TABLE IF NOT EXISTS `CPES_BKMK` (
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `BKMK_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '북마크_시퀀스',
  `TABLE_KEY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '테이블_키_시퀀스',
  `CATE_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '카테고리_코드(CATE_CD)',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  PRIMARY KEY (`BKMK_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_북마크';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BULLETIN 구조 내보내기
DROP TABLE IF EXISTS `CPES_BULLETIN`;
CREATE TABLE IF NOT EXISTS `CPES_BULLETIN` (
  `BULLETIN_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판_시퀀스',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `BULLETIN_CATE_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판_카테고리_시퀀스',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  `DEPTH` int(11) DEFAULT NULL COMMENT '깊이',
  `WRITE_DT` datetime NOT NULL COMMENT '작성_날짜',
  `WRITER_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자_명',
  `TITLE_EN` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목_영어',
  `CONTENT_EN` text COLLATE utf8mb4_unicode_ci COMMENT '내용_영어',
  `VIEW_CNT` int(11) NOT NULL DEFAULT '0' COMMENT '조회_수',
  `COMMENT_CNT` int(11) DEFAULT '0' COMMENT '댓글_수',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제_여부',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `BULLETIN_MNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판_관리_시퀀스',
  `TITLE_KH` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목_크메르',
  `CONTENT_KH` text COLLATE utf8mb4_unicode_ci COMMENT '내용_크메르',
  `VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '노출_여부',
  `AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인_여부',
  `NTC_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공지_여부',
  `PHOTO_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사진_파일_그룹_시퀀스',
  `LIKE_CNT` int(11) DEFAULT '0' COMMENT '좋아요_수',
  `BULLETIN_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판_형태_코드',
  `BULLETIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE_BAN_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목_금칙_여부',
  `CONTENT_BAN_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용_금칙_여부',
  PRIMARY KEY (`BULLETIN_SEQ`),
  KEY `BULLETIN_ID` (`BULLETIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BULLETIN_CATE 구조 내보내기
DROP TABLE IF EXISTS `CPES_BULLETIN_CATE`;
CREATE TABLE IF NOT EXISTS `CPES_BULLETIN_CATE` (
  `BULLETIN_CATE_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판_카테고리_시퀀스',
  `BULLETIN_CATE_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판_카테고리_명',
  `BULLETIN_MNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판_관리_시퀀스',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  PRIMARY KEY (`BULLETIN_CATE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_게시판_카테고리';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BULLETIN_MNG 구조 내보내기
DROP TABLE IF EXISTS `CPES_BULLETIN_MNG`;
CREATE TABLE IF NOT EXISTS `CPES_BULLETIN_MNG` (
  `BULLETIN_MNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판_관리_시퀀스',
  `FILE_GRP_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_코드',
  `BULLETIN_NM` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판_명',
  `CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `CREATE_DT` datetime NOT NULL COMMENT '생성_날짜',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `COMMENT_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '댓글_여부',
  `FILE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일_여부',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제_여부',
  `MENU_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴_코드',
  `MENU_CD_DIV` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴_코드_구분',
  `BULLETIN_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판_형태_코드',
  `BANNER_USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '배너_사용_여부_YN',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `USER_AUTH_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_권한_코드(USER_AUTH_CD)',
  `BULLETIN_RANGE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판_범위_코드',
  `CATE_USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리_사용_여부',
  `JOBSK_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구직자_여부',
  `STDT_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '학생_여부',
  `EMPLOY_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용인_여부',
  `TRNNG_INSTT_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '훈련_기관_여부',
  `FILE_QTY` int(11) DEFAULT NULL COMMENT '파일_개수',
  `FILE_SIZE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_크기',
  `LIKE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '좋아요_여부',
  PRIMARY KEY (`BULLETIN_MNG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_게시판_관리';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BULLETIN_SCRAP 구조 내보내기
DROP TABLE IF EXISTS `CPES_BULLETIN_SCRAP`;
CREATE TABLE IF NOT EXISTS `CPES_BULLETIN_SCRAP` (
  `BULLETIN_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판_시퀀스',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  PRIMARY KEY (`USER_SEQ`,`BULLETIN_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_게시판_스크랩';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_BULLETIN_USER_AUTH 구조 내보내기
DROP TABLE IF EXISTS `CPES_BULLETIN_USER_AUTH`;
CREATE TABLE IF NOT EXISTS `CPES_BULLETIN_USER_AUTH` (
  `BULLETIN_USER_AUTH_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판_사용자_권한_시퀀스',
  `USER_AUTH_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_권한_코드',
  `BULLETIN_MNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판_관리_시퀀스',
  PRIMARY KEY (`BULLETIN_USER_AUTH_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_게시판_사용자_권한';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_COMMENT 구조 내보내기
DROP TABLE IF EXISTS `CPES_COMMENT`;
CREATE TABLE IF NOT EXISTS `CPES_COMMENT` (
  `COMMENT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '댓글_시퀀스',
  `WRITER_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자_명',
  `CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `WRITE_DT` datetime NOT NULL COMMENT '작성_날짜',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `BULLETIN_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판_시퀀스',
  `UPPER_COMMENT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상위_댓글_시쿼',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  `DEPTH` int(11) DEFAULT NULL COMMENT '깊이',
  `COMMENT_ID` int(11) NOT NULL COMMENT '댓글_아이디',
  `VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '노출_여부',
  `AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인_여부',
  `BAN_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '금칙어_여부',
  PRIMARY KEY (`COMMENT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_댓글';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_COMM_DTL_CD 구조 내보내기
DROP TABLE IF EXISTS `CPES_COMM_DTL_CD`;
CREATE TABLE IF NOT EXISTS `CPES_COMM_DTL_CD` (
  `DTL_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상세_코드',
  `GRP_CD` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '그룹_코드',
  `CD_EN_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드_영문_명',
  `CD_CONTENT` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드_설명',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `CD_KH_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드_크메르_명',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  `CD_LVL` tinyint(1) DEFAULT NULL COMMENT '코드_레벨',
  `UPPER_DTL_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상위_상세_코드',
  PRIMARY KEY (`DTL_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_공통_상세_코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_COMM_GRP_CD 구조 내보내기
DROP TABLE IF EXISTS `CPES_COMM_GRP_CD`;
CREATE TABLE IF NOT EXISTS `CPES_COMM_GRP_CD` (
  `GRP_CD` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '그룹_코드',
  `GRP_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '그룹_명',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `EXPLN` text COLLATE utf8mb4_unicode_ci COMMENT '설명',
  PRIMARY KEY (`GRP_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_공통_그룹_코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_COMPNY 구조 내보내기
DROP TABLE IF EXISTS `CPES_COMPNY`;
CREATE TABLE IF NOT EXISTS `CPES_COMPNY` (
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_시퀀스',
  `COMPNY_NM_KH` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_명_크메르',
  `COMPNY_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_타입_코드(COMPNY_TYPE_CD)',
  `USER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_아이디',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `REG_NUM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_번호',
  `PATENT_NUM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '특허_번호',
  `OWNER_NATION_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소유주_국가_코드(NATION_CD)',
  `EMPLOYEE_TOT_CNT` int(11) DEFAULT NULL COMMENT '종업원_총수',
  `FEMALE_EMPLOYEE_TOT_CNT` int(11) DEFAULT NULL COMMENT '여성_종업원_합계_수',
  `DISABL_EMPLOYEE_TOT_CNT` int(11) DEFAULT NULL COMMENT '장애인_종업원_합계_수',
  `FORGNER_TOT_CNT` int(11) DEFAULT NULL COMMENT '외국인_합계_수',
  `MAIN_JOB_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주요_직종_명',
  `MAIN_JOB_PERCENT` decimal(4,2) DEFAULT NULL COMMENT '주요_직종_퍼센트',
  `ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `LNGTD` decimal(18,6) DEFAULT NULL COMMENT '경도',
  `LATTD` decimal(18,6) DEFAULT NULL COMMENT '위도',
  `PROFILE` text COLLATE utf8mb4_unicode_ci COMMENT '프로필',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `COMPNY_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_아이디',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `ISIC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ICIS_코드',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주요_직종_ISCO_코드(ISCO_CD)',
  `BKMK_CNT` int(11) NOT NULL COMMENT '북마크_카운트',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `LIKE_CNT` int(11) NOT NULL COMMENT '좋아요_수',
  `MNGER_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_명',
  `MNGER_POSITION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_포지션',
  `MNGER_CELL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_휴대전화',
  `MNGER_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_이메일',
  `MNGER_TEL` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_전화',
  `COMPNY_FAX` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_팩스',
  `COMPNY_WEBSITE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_웹사이트',
  `COMPNY_FACEBOOK` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_페이스북',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `COMPNY_NM_EN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_명_영문',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  `EXE_EMPLOYEE_TOT_CNT` int(11) DEFAULT NULL COMMENT '임원 수',
  `COMPNY_HIS` text COLLATE utf8mb4_unicode_ci COMMENT '회사연혁',
  `LOGO_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로고_파일_그룹_시퀀스',
  `GOOGLE_MAP_LINK` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구글_맵_링크',
  `SUB_MNGER_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서브_담당자_명',
  `SUB_MNGER_POSITION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서브_담당자_포지션',
  `SUB_MNGER_CELL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서브_담당자_휴대전화',
  `SUB_MNGER_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서브_담당자_이메일',
  PRIMARY KEY (`COMPNY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_기업';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_COMPNY_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_COMPNY_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_COMPNY_LOG` (
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_시퀀스',
  `COMPNY_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_명',
  `COMPNY_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_타입_코드',
  `USER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_아이디',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드',
  `REG_NUM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_번호',
  `PATENT_NUM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '특허_번호',
  `OWNER_NATION_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소유주_국가_코드',
  `EMPLOYEE_TOT_CNT` int(11) DEFAULT NULL COMMENT '종업원_총수',
  `FEMALE_EMPLOYEE_TOT_CNT` int(11) DEFAULT NULL COMMENT '여성_종업원_합계_계산',
  `DISABL_EMPLOYEE_TOT_CNT` int(11) DEFAULT NULL COMMENT '장애인_종업원_합계_계산',
  `FORGNER_TOT_CNT` int(11) DEFAULT NULL COMMENT '외국인_합계_계산',
  `MAIN_JOB_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주요_직종_명',
  `MAIN_JOB_PERCENT` decimal(4,2) DEFAULT NULL COMMENT '주요_직종_퍼센트율',
  `ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드',
  `LNGTD` decimal(18,6) DEFAULT NULL COMMENT '경도',
  `LATTD` decimal(18,6) DEFAULT NULL COMMENT '위도',
  `PROFILE` text COLLATE utf8mb4_unicode_ci COMMENT '프로필',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `COMPNY_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_아이디',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_시퀀스',
  `ISIC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ICIS_CD',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주요_직종_ISCO_코드',
  `BKMK_CNT` int(11) NOT NULL COMMENT '북마크_카운트',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `LIKE_CNT` int(11) NOT NULL COMMENT '좋아요_카운트',
  `MNGER_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_명',
  `MNGER_POSITION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_포지션',
  `MNGER_CELL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_휴대전화',
  `MNGER_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_이메일',
  `MNGER_TEL` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_전화',
  `COMPNY_FAX` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_팩스',
  `COMPNY_WEBSITE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_웹사이트',
  `COMPNY_FACEBOOK` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_페이스북',
  `COMPNY_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_로그_시퀀스',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  PRIMARY KEY (`COMPNY_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_기업_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_COUNSEL 구조 내보내기
DROP TABLE IF EXISTS `CPES_COUNSEL`;
CREATE TABLE IF NOT EXISTS `CPES_COUNSEL` (
  `COUNSEL_SEQ` varbinary(36) NOT NULL COMMENT '상담_시퀀스',
  `COUNSEL_METHOD_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상담_방법_구분_코드(온/오프)(COUNSEL_METHOD_DIV_CD)',
  `COUNSEL_CATE_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상담_카테고리_구분_코드(진로/1:1상담)(COUNSEL_CATE_DIV_CD)',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드(ISCO_CD)',
  `QUST_TITLE` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '문의_제목',
  `QUST_CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '문의_내용',
  `QUST_ETC_REQ` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '문의_기타_당부',
  `HOPE_COUNSEL_DT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '희망_상담_날짜',
  `QUST_REG_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '문의_등록_사용자_시퀀스',
  `QUST_REG_DT` datetime NOT NULL COMMENT '문의_등록_날짜',
  `QUST_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '문의_파일_그룹_시퀀스',
  `ANS_TITLE` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변_제목',
  `ANS_CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '답변_내용',
  `ANS_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변_파일_그룹_시퀀스',
  `ANS_REG_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변_등록_사용자_시퀀스',
  `ANS_REG_DT` datetime DEFAULT NULL COMMENT '답변_등록_날짜',
  `ANS_MOD_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변_수정_사용자_시퀀스',
  `ANS_MOD_DT` datetime DEFAULT NULL COMMENT '답변_수정_날짜',
  `COUNSEL_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상담_진행_상태',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제_여부',
  `SECRET_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀_여부',
  `LIKE_CNT` int(11) NOT NULL COMMENT '좋아요_수',
  `COUNSEL_TARGET_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상담_대상_코드(학생/일반/기업/기관)',
  `VIEW_CNT` int(11) DEFAULT NULL COMMENT '조회_수',
  `COUNSEL_DT` char(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상담_날짜',
  `COUNSEL_NTCE` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상담_알림',
  `COUNSEL_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상담_시간',
  `COUNSEL_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상담_분',
  `COUNSEL_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상담_오전오후',
  `HOPE_COUNSEL_BGN_TIME` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '희망_상담_시작_시간',
  `HOPE_COUNSEL_END_TIME` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '희망_상담_종료_시간',
  `HOPE_COUNSEL_BGN_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '희망_상담_시작_AMPM',
  `HOPE_COUNSEL_END_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '희망_상담_종료_AMPM',
  `QUST_MOD_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '문의_수정_사용자_시퀀스',
  `QUST_MOD_DT` datetime DEFAULT NULL COMMENT '문의_수정_날짜',
  `QUST_JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '문의_JOB_CENTER_코드',
  PRIMARY KEY (`COUNSEL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_상담';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_EDU_TRNNG 구조 내보내기
DROP TABLE IF EXISTS `CPES_EDU_TRNNG`;
CREATE TABLE IF NOT EXISTS `CPES_EDU_TRNNG` (
  `EDU_TRNNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '교육_훈련_시퀀스',
  `EDU_BGN_DT` date DEFAULT NULL COMMENT '교육_시작_날짜',
  `EDU_TRNNG_NM` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_훈련_명',
  `EDU_END_DT` date DEFAULT NULL COMMENT '교육_종료_날짜',
  `TRNNG_NATNEXP_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '훈련_국비_구분_코드(TRNNG_NATNEXP_DIV_CD)',
  `SPONSOR` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '스폰서',
  `RECURMT_BGN_DT` date DEFAULT NULL COMMENT '모집_시작_날짜',
  `RECURMT_END_DT` date DEFAULT NULL COMMENT '모집_종료_날짜',
  `EDU_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '교육_구분_코드(NEA_교육_여부)(EDU_DIV_CD)',
  `EDU_DURA` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_기간',
  `DAY_TIME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '하루_시간',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지방_코드(PRVC_CD)',
  `JC_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_승인_상태_코드',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `INSTT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기관_시퀀스',
  `CATE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리_코드',
  `PROC_PROGRAM_STUDY` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '과정_프로그램_학습',
  `DEGREE_AWARDS` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '학위_수여',
  `PROSPECT_OCCUP_CATE` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '유망_직업_카테고리',
  `TUITION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수업료',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  `RECRUMT_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모집_상태_코드',
  `JC_AGREE_DT` datetime DEFAULT NULL COMMENT 'JOB_CENTER_승인_날짜',
  `JC_REJECT_DT` datetime DEFAULT NULL COMMENT 'JOB_CENTER_반려_날짜',
  `ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `NEA_EDU_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NEA_교육_구분_코드',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  `EDU_TRNNG_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_훈련_아이디',
  `EDU_CLOSE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_마감_여부',
  `EDU_CLOSE_DT` datetime DEFAULT NULL COMMENT '교육_마감_날짜',
  `BKMK_CNT` int(11) DEFAULT NULL COMMENT '북마크 수',
  `VIEW_CNT` int(11) DEFAULT NULL COMMENT '조회 수',
  `FREE_PAID_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '무료_유료_여부',
  `PROGRAM_CERT_NUM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_인증_번호',
  `EDU_TRNNG_KEYWORD` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_훈련_키워드',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_CD',
  `MNGER_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_명',
  `MNGER_EMAIL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_이메일',
  `MNGER_CELL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_연락처',
  PRIMARY KEY (`EDU_TRNNG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_교육_훈련';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_EDU_TRNNG_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_EDU_TRNNG_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_EDU_TRNNG_LOG` (
  `EDU_TRNNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EDU_TRNNG_NM` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EDU_BGN_DT` date DEFAULT NULL,
  `EDU_END_DT` date DEFAULT NULL,
  `TRNNG_NATNEXP_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SPONSOR` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RECURMT_BGN_DT` date DEFAULT NULL,
  `RECURMT_END_DT` date DEFAULT NULL,
  `EDU_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EDU_DURA` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DAY_TIME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JC_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROC_PROGRAM_STUDY` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEGREE_AWARDS` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROSPECT_OCCUP_CATE` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TUITION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REG_DT` datetime NOT NULL,
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MOD_DT` datetime NOT NULL,
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RECRUMT_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JC_AGREE_DT` datetime DEFAULT NULL,
  `JC_REJECT_DT` datetime DEFAULT NULL,
  `ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NEA_EDU_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EDU_TRNNG_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EDU_CLOSE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EDU_CLOSE_DT` datetime DEFAULT NULL,
  `FREE_PAID_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EDU_TRNNG_KEYWORD` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BKMK_CNT` int(11) DEFAULT NULL,
  `VIEW_CNT` int(11) DEFAULT NULL,
  `PROGRAM_CERT_NO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EDU_TRNNG_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EDU_TRNNG_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_EDU_TRNNG_SUB 구조 내보내기
DROP TABLE IF EXISTS `CPES_EDU_TRNNG_SUB`;
CREATE TABLE IF NOT EXISTS `CPES_EDU_TRNNG_SUB` (
  `EDU_TRNNG_SUB_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '교육_훈련_서브_시퀀스',
  `EDU_TRNNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '교육_훈련_시퀀스',
  `EDU_TARGET` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_대상',
  `ADMSS_CRITERIA` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '입학_기준',
  `CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `ENROL_METHOD` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_방법',
  `SIGN` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서명',
  `EDU_PROVD` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_제공',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `PROGRAM_CORS_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_코스_유형_코드',
  `MAJOR_1DEPTH_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전공_1깊이_코드',
  `MAJOR_2DEPTH_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전공_2깊이_코드',
  `SKILL_JOB_PROGRAM_CORS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기술_직업_프로그램_코스_코드',
  `HIGH_GENRL_EDU_CORS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고등_일반_교육_코드',
  `TIME_WEEK` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시간_요일',
  `RECRUMT_MEMB` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모집_인원',
  `TEACHER_NM_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강사_명_1',
  `TEACHER_NM_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강사_명_2',
  `TEACHER_1_CAREER` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강사_1_약력',
  `TEACHER_2_CAREER` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강사_2_약력',
  `LECTURE_PHOTO_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강의_사진_파일_그룹_시퀀스',
  `TEACHER_1_PHOTO_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강사_1_사진_파일_그룹_시퀀스',
  `TEACHER_2_PHOTO_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강사_2_사진_파일_그룹_시퀀스',
  `AREA` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장소',
  `GOOGLE_MAP_LINK` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구글_맵_링크',
  `MNGER_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_명',
  `CELL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '핸드폰',
  `EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `TEACH_DT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강의_날짜',
  `TEACH_BGN_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강의_시작_시간',
  `TEACH_BGN_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강의_시작_분',
  `TEACH_BGN_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강의_시작_AMPM',
  `CURRICL` text COLLATE utf8mb4_unicode_ci COMMENT '커리큘럼',
  `MATR` text COLLATE utf8mb4_unicode_ci COMMENT '준비물',
  `TEACH_END_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강의_종료_시간',
  `TEACH_END_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강의_종료_분',
  `TEACH_END_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강의_종료_AMPM',
  `TEACH_HOUR_WEEK` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강의_시간_요일',
  PRIMARY KEY (`EDU_TRNNG_SUB_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_교육_훈련_서브';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_EDU_TRNNG_SUB_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_EDU_TRNNG_SUB_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_EDU_TRNNG_SUB_LOG` (
  `EDU_TRNNG_SUB_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EDU_TARGET` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADMSS_CRITERIA` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8mb4_unicode_ci,
  `ENROL_METHOD` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SIGN` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EDU_PROVD` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROGRAM_CORS_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAJOR_1DEPTH_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAJOR_2DEPTH_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SKILL_JOB_PROGRAM_CORS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HIGH_GENRL_EDU_CORS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TIME_WEEK` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RECRUMT_MEMB` int(11) DEFAULT NULL,
  `TEACHER_NM_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACHER_NM_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACHER_1_CAREER` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACHER_2_CAREER` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LECTURE_PHOTO_FILE_GRP_SEQ` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACHER_1_PHOTO_FILE_GRP_SEQ` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACHER_2_PHOTO_FILE_GRP_SEQ` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AREA` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GOOGLE_MAP_LINK` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MNGER_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CELL` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACH_DT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACH_BGN_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACH_BGN_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACH_BGN_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CURRICL` text COLLATE utf8mb4_unicode_ci,
  `MATR` text COLLATE utf8mb4_unicode_ci,
  `TEACH_END_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACH_END_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACH_END_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TEACH_HOUR_WEEK` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EDU_TRNNG_SUB_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EDU_TRNNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`EDU_TRNNG_SUB_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_EDU_TRNNG_USER 구조 내보내기
DROP TABLE IF EXISTS `CPES_EDU_TRNNG_USER`;
CREATE TABLE IF NOT EXISTS `CPES_EDU_TRNNG_USER` (
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `JC_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_승인_상태_코드',
  `EDU_TRNNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '교육_훈련_시퀀스',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  `CANCEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '취소여부',
  PRIMARY KEY (`USER_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_교육_훈련_사용자';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_BOOTH 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_BOOTH`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_BOOTH` (
  `BOOTH_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'BOOTH_SEQ',
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_시퀀스',
  `COMPNY_INSTT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_기관_시퀀스',
  `COMPNY_INSTT_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_기관_분류_코드',
  `BOOTH_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부스명',
  `BOOTH_FEE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부스_사용료',
  `BOOTH_REQ_DT` datetime DEFAULT NULL COMMENT '부스_신청일',
  `BOOTH_CANCEL_REQ_DT` datetime DEFAULT NULL COMMENT '부스_신청_취소_요청일',
  `BOOTH_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예약상태_코드',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_코드',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  PRIMARY KEY (`BOOTH_SEQ`),
  KEY `CPES_FAIR_BOOTH_FK` (`FAIR_SEQ`),
  KEY `CPES_FAIR_BOOTH_FK_2` (`COMPNY_INSTT_SEQ`,`FAIR_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_부스';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_BOOTH_HIST 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_BOOTH_HIST`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_BOOTH_HIST` (
  `BOOTH_RESV_HIST_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부스_예약_이력_시퀀스',
  `BOOTH_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부스_시퀀스',
  `COMPNY_INSTT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_기관_시퀀스',
  `COMPNY_INSTT_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_기관_구분_코드',
  `RESV_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예약_상태_코드',
  `BOOTH_CANCEL_REQ_DT` datetime DEFAULT NULL COMMENT '부스_취소_요청_날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MNGER_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_명',
  `MNGER_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_이메일',
  `MNGER_CELL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_휴대폰'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_부스_이력';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_BOOTH_WAIT_REQ 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_BOOTH_WAIT_REQ`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_BOOTH_WAIT_REQ` (
  `FAIR_BOOTH_WAIT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_부스_대기_시퀀스',
  `COMPNY_INSTT_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_기관_분류_코드',
  `COMPNY_INSTT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_기관_시퀀스',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `BOOTH_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부스_시퀀스',
  `MNGER_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_명',
  `MNGER_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_이메일',
  `MNGER_CELL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_연락처',
  `BOOTH_RESV_HIST_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부스_예약_이력_시퀀스'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_부스_대기_요청';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_COUNSEL 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_COUNSEL`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_COUNSEL` (
  `FAIR_COUNSEL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_상담_시퀀스',
  `NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '명',
  `TEL` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '연락처',
  `EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `COUNSEL_CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '상담_내용',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_시퀀스',
  PRIMARY KEY (`FAIR_COUNSEL_SEQ`),
  KEY `CPES_FAIR_COUNSEL_FK` (`FAIR_SEQ`),
  CONSTRAINT `CPES_FAIR_COUNSEL_FK` FOREIGN KEY (`FAIR_SEQ`) REFERENCES `CPES_FAIR_MST` (`FAIR_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_상담';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_MST 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_MST`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_MST` (
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_시퀀스',
  `FAIR_NM_KH` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_명_KH',
  `FAIR_NM_EN` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_명_EN',
  `FAIR_DTL_EXPLN_KH` text COLLATE utf8mb4_unicode_ci COMMENT '채용행사_상세_내용_KH',
  `FAIR_DTL_EXPLN_EN` text COLLATE utf8mb4_unicode_ci COMMENT '채용행사_상세_내용_EN',
  `FAIR_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_상태_코드(FAIR_STS_CD)',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_주소_코드(ADDR_CD)',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_주소_완성_명',
  `ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_주소_상세',
  `ADDR_DTL2` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세주소2',
  `GOOGLE_MAP_LINK` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구글_맵_링크',
  `FAIR_LNGTD` decimal(18,6) DEFAULT NULL COMMENT '채용행사_경도',
  `FAIR_LATTD` decimal(18,6) DEFAULT NULL COMMENT '채용행사_위도',
  `THUMB_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '썸네일_파일_그룹_시퀀스',
  `FAIR_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_파일_그룹_시퀀스',
  `BOOTH_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부스_파일_그룹_시퀀스',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `FAIR_VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_전시_여부',
  `FAIR_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_구분_코드',
  `MST_JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주관_JOB_CENTER_코드',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_코드',
  `FAIR_BGN_DT` date DEFAULT NULL COMMENT '채용행사 시작_날짜',
  `FAIR_BGN_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_시작_시간',
  `FAIR_BGN_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_시작_분',
  `FAIR_BGN_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_시작_AMPM',
  `FAIR_END_DT` date DEFAULT NULL COMMENT '채용행사_종료_날짜',
  `FAIR_END_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_종료_시간',
  `FAIR_END_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_종료_분',
  `FAIR_END_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_종료_AMPM',
  `RECURMT_BGN_DT` date DEFAULT NULL COMMENT '모집기간_시작_날짜',
  `RECURMT_BGN_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모집_시작_시간',
  `RECURMT_BGN_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모집_시작_분',
  `RECURMT_BGN_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모집_시작_AMPM',
  `RECURMT_END_DT` date DEFAULT NULL COMMENT '모집기간_종료_날짜',
  `RECURMT_END_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모집_종료_시간',
  `RECURMT_END_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모집_종료_분',
  `RECURMT_END_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모집_종료_AMPM',
  `TEL1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전화1',
  `TEL2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전화2',
  `EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `URL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL',
  `FAIR_HASHTAG` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_해시태그',
  `FAIR_COMPNY_VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_참가기업_노출_여부',
  `FAIR_VACANCY_VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_채용공고_노출_여부',
  `FAIR_INSTT_VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_기관_노출_여부',
  `FAIR_TRNNG_VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_훈련_노출_여부',
  `BOOTH_TEL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부스_전화',
  `BOOTH_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부스_이메일',
  `BOOTH_FEE_EXPLN` text COLLATE utf8mb4_unicode_ci COMMENT '부스_사용료_설명',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `BKMK_CNT` int(11) DEFAULT NULL COMMENT '북마크_수',
  `SPONSOR_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '스폰서_파일_그룹_시퀀스',
  `SUPPORTER_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서포터_파일_그룹_시퀀스',
  `FAIR_NOTI` text COLLATE utf8mb4_unicode_ci COMMENT '행사_알림',
  `FAIR_WORKSHOP_VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '워크샵_노출_여부',
  `FAIR_KEYWORD` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '채용행사_키워드',
  PRIMARY KEY (`FAIR_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_마스터';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_OFLINE_PATCPTN 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_OFLINE_PATCPTN`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_OFLINE_PATCPTN` (
  `FAIR_OFLINE_PATCPTN_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_오프라인_참여_인원_시퀀스',
  `USER_NM` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_명',
  `BIRTH` date DEFAULT NULL COMMENT '생년월일',
  `USER_EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_이메일',
  `USER_CELL` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_연락처',
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`FAIR_OFLINE_PATCPTN_SEQ`),
  KEY `CPES_FAIR_OFLINE_PATCPTN_FK` (`FAIR_SEQ`),
  CONSTRAINT `CPES_FAIR_OFLINE_PATCPTN_FK` FOREIGN KEY (`FAIR_SEQ`) REFERENCES `CPES_FAIR_MST` (`FAIR_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_오프라인_참여';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_ONLINE_PATCPTN 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_ONLINE_PATCPTN`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_ONLINE_PATCPTN` (
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_시퀀스',
  `JC_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_승인_상태_코드',
  `JC_AGREE_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_승인_사용자_시퀀스',
  `JC_AGREE_DT` datetime DEFAULT NULL COMMENT 'JOB_CENTER_승인_날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `PATCPTN_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '참여_여부_YN',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  `CANCEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '취소_여부',
  PRIMARY KEY (`FAIR_SEQ`,`USER_SEQ`),
  KEY `CPES_FAIR_ONLINE_PATCPTN_FK_1` (`USER_SEQ`),
  CONSTRAINT `CPES_FAIR_ONLINE_PATCPTN_FK` FOREIGN KEY (`FAIR_SEQ`) REFERENCES `CPES_FAIR_MST` (`FAIR_SEQ`),
  CONSTRAINT `CPES_FAIR_ONLINE_PATCPTN_FK_1` FOREIGN KEY (`USER_SEQ`) REFERENCES `CPES_USER` (`USER_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_온라인_참여';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_PATCPTN_COMPNY 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_PATCPTN_COMPNY`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_PATCPTN_COMPNY` (
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_시퀀스',
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_시퀀스',
  `JC_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_승인_상태_코드',
  `JC_AGREE_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_승인_사용자_시퀀스',
  `JC_AGREE_DT` datetime DEFAULT NULL COMMENT 'JOB_CENTER_승인_날짜',
  `COMPNY_RESP_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_응답_여부',
  `REQ_DT` datetime DEFAULT NULL COMMENT '신청_날짜',
  `INVITE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '초청_여부',
  `INVITE_DT` datetime DEFAULT NULL COMMENT '초청_날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '삭제_여부',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `CANCEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '취소_여부',
  PRIMARY KEY (`COMPNY_SEQ`,`FAIR_SEQ`),
  KEY `CPES_FAIR_PATCPTN_COMPNY_FK_1` (`FAIR_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_참여_기업';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_PATCPTN_COMPNY_VACANCY 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_PATCPTN_COMPNY_VACANCY`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_PATCPTN_COMPNY_VACANCY` (
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_시퀀스',
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스',
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  PRIMARY KEY (`COMPNY_SEQ`,`VACANCY_SEQ`,`FAIR_SEQ`),
  KEY `CPES_FAIR_PATCPTN_COMPNY_VACANCY_FK_1` (`VACANCY_SEQ`),
  KEY `CPES_FAIR_PATCPTN_COMPNY_VACANCY_FK_2` (`FAIR_SEQ`),
  KEY `CPES_FAIR_PATCPTN_COMPNY_VACANCY_FK` (`COMPNY_SEQ`,`FAIR_SEQ`),
  CONSTRAINT `CPES_FAIR_PATCPTN_COMPNY_VACANCY_FK` FOREIGN KEY (`COMPNY_SEQ`, `FAIR_SEQ`) REFERENCES `CPES_FAIR_PATCPTN_COMPNY` (`COMPNY_SEQ`, `FAIR_SEQ`),
  CONSTRAINT `CPES_FAIR_PATCPTN_COMPNY_VACANCY_FK_1` FOREIGN KEY (`VACANCY_SEQ`) REFERENCES `CPES_VACANCY` (`VACANCY_SEQ`),
  CONSTRAINT `CPES_FAIR_PATCPTN_COMPNY_VACANCY_FK_2` FOREIGN KEY (`FAIR_SEQ`) REFERENCES `CPES_FAIR_MST` (`FAIR_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_참여_기업_구인';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_PATCPTN_INSTT 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_PATCPTN_INSTT`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_PATCPTN_INSTT` (
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_시퀀스',
  `INSTT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기관_시퀀스',
  `JC_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잡센터_승인_상태_코',
  `JC_AGREE_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잡센터_승인_사용자_시퀀',
  `JC_AGREE_DT` datetime DEFAULT NULL COMMENT '잡센터_승인일',
  `INSTT_RESP_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_응답_여부',
  `REQ_DT` datetime DEFAULT NULL COMMENT '신청_날짜',
  `INVITE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '초청_여부',
  `INVITE_DT` datetime DEFAULT NULL COMMENT '초청_날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '삭제_여부',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_일자',
  `CANCEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '취소_여부',
  PRIMARY KEY (`INSTT_SEQ`,`FAIR_SEQ`),
  KEY `CPES_FAIR_PATCPTN_INSTT_FK` (`FAIR_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_참여_기관';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_PATCPTN_INSTT_TRNNG 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_PATCPTN_INSTT_TRNNG`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_PATCPTN_INSTT_TRNNG` (
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_시퀀스',
  `EDU_TRNNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '교육_훈련_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `JC_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주관센터승인여부',
  `JC_AGREE_DT` datetime DEFAULT NULL COMMENT '승인일시',
  `INSTT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기관_시퀀스',
  PRIMARY KEY (`FAIR_SEQ`,`INSTT_SEQ`,`EDU_TRNNG_SEQ`),
  KEY `CPES_FAIR_PATCPTN_INSTT_TRNNG_FK_1` (`EDU_TRNNG_SEQ`),
  KEY `CPES_FAIR_PATCPTN_INSTT_TRNNG_FK_2` (`INSTT_SEQ`),
  CONSTRAINT `CPES_FAIR_PATCPTN_INSTT_TRNNG_FK` FOREIGN KEY (`FAIR_SEQ`) REFERENCES `CPES_FAIR_MST` (`FAIR_SEQ`),
  CONSTRAINT `CPES_FAIR_PATCPTN_INSTT_TRNNG_FK_1` FOREIGN KEY (`EDU_TRNNG_SEQ`) REFERENCES `CPES_EDU_TRNNG` (`EDU_TRNNG_SEQ`),
  CONSTRAINT `CPES_FAIR_PATCPTN_INSTT_TRNNG_FK_2` FOREIGN KEY (`INSTT_SEQ`) REFERENCES `CPES_INSTT` (`INSTT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_참여_기관_훈련';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_WORKSHOP 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_WORKSHOP`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_WORKSHOP` (
  `FAIR_WORKSHOP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_워크샵_시퀀스',
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_시퀀스',
  `WORKSHOP_NM` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '워크샵_명',
  `EXPLN` text COLLATE utf8mb4_unicode_ci COMMENT '설명',
  `WORKSHOP_THUM_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '워크샵_썸네일_파일_그룹_시퀀스',
  `WORKSHOP_DT` date DEFAULT NULL COMMENT '워크샵_날짜',
  `BGN_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작_시간',
  `BGN_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작_분',
  `BGN_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작_AMPM',
  `END_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료_시간',
  `END_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료_분',
  `END_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료_AMPM',
  `WORKSHOP_ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '워크샵_주소_코드',
  `WORKSHOP_ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '워크샵_주소_완성_코드',
  `WORKSHOP_ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '워크샵_주소_완성_명',
  `WORKSHOP_ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '워크샵_주소_상세',
  `LECTURE_ROOM` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강의_실',
  `TUITION_GRP_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수강료_구분_코드',
  `TUITION` int(11) DEFAULT NULL COMMENT '수강료',
  `GOOGLE_MAP_LINK` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구글_맵_링크',
  `MNGER_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_명',
  `MNGER_TEL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_전화번호',
  `MNGER_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_이메일',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `TARGET` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대상',
  `RECURMT_MAN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모집_인원',
  `TEACHER_NM1` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강사_명1',
  `TEACHER_NM2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강사_명2',
  `TEACHER_PHOTO1_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강사_사진1_파일_그룹_시퀀스',
  `TEACHER_PHOTO2_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강사_사진2_파일_그룹_시퀀스',
  `TEACHER_BHIST1` text COLLATE utf8mb4_unicode_ci COMMENT '강사_약력1',
  `TEACHER_BHIST2` text COLLATE utf8mb4_unicode_ci COMMENT '강사_약력2',
  `TEACH_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '강의_파일_그룹_시퀀스',
  `USE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `WORKSHOP_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '워크샵_상태_코드',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  PRIMARY KEY (`FAIR_WORKSHOP_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_워크샵';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_FAIR_WORKSHOP_PATCPTN 구조 내보내기
DROP TABLE IF EXISTS `CPES_FAIR_WORKSHOP_PATCPTN`;
CREATE TABLE IF NOT EXISTS `CPES_FAIR_WORKSHOP_PATCPTN` (
  `FAIR_WORKSHOP_PATCPTN_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '행사_워크샵_참여_시퀀스',
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '행사_시퀀스',
  `FAIR_WORKSHOP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '행사_워크샵_시퀀스',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `JC_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_승인_상태_코드',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `JC_AGREE_DT` datetime DEFAULT NULL COMMENT 'JOB_CENTER_승인_날짜',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  `CANCEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '취소_여부',
  `PATCPTN_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '참가_여부',
  PRIMARY KEY (`FAIR_WORKSHOP_PATCPTN_SEQ`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_채용행사_워크샵_참여';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_INSTT 구조 내보내기
DROP TABLE IF EXISTS `CPES_INSTT`;
CREATE TABLE IF NOT EXISTS `CPES_INSTT` (
  `INSTT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기관_시퀀스',
  `INSTT_NM_KH` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명_크메르',
  `INSTT_OWNER_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_대표자_명',
  `INSTT_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기관_형태_코드(INSTT_TYPE_CD)',
  `INSTT_REG_NUM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기관_등록_번호',
  `INSTT_ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_주소_상세',
  `INSTT_CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '기관_내용',
  `INSTT_MNGER_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_담당자_명',
  `INSTT_OFFICE_TEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_사무실_연락처',
  `INSTT_CELL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_핸드폰',
  `INSTT_FAX` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_팩스',
  `INSTT_PROFILE` text COLLATE utf8mb4_unicode_ci COMMENT '기관_프로필',
  `INSTT_HIS` text COLLATE utf8mb4_unicode_ci COMMENT '기관_연혁',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `INSTT_EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_이메일',
  `INSTT_WEBSITE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_웹사이트',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `INSTT_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_상태_코드',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  `INSTT_OWNER_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_소유_코드',
  `INSTT_NM_EN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명_영어',
  `INSTT_MAP_LINK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_맵_링크',
  `INSTT_ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_주소_코드',
  `INSTT_ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_주소_완성_코드',
  `INSTT_ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_주소_완성_명',
  `BKMK_CNT` int(11) DEFAULT NULL COMMENT '북마크_수',
  `GOOGLE_MAP_LINK` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구글_맵_링크',
  `INSTT_LOGO_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_로고_파일_그룹_시퀀스',
  PRIMARY KEY (`INSTT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_기관';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_INSTT_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_INSTT_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_INSTT_LOG` (
  `INSTT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_NM_KH` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_OWNER_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTT_REG_NUM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTT_ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_CONTENT` text COLLATE utf8mb4_unicode_ci,
  `INSTT_MNGER_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_OFFICE_TEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_CELL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_FAX` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_WEBSITE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REG_DT` datetime NOT NULL,
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MOD_DT` datetime NOT NULL,
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_OWNER_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_NM_EN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_PROFILE` text COLLATE utf8mb4_unicode_ci,
  `INSTT_HIS` text COLLATE utf8mb4_unicode_ci,
  `INSTT_MAP_LINK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BKMK_CNT` int(11) DEFAULT NULL,
  `INSTT_LOGO_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `구글_맵_링크` char(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`INSTT_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_INSTT_MAJOR_CD 구조 내보내기
DROP TABLE IF EXISTS `CPES_INSTT_MAJOR_CD`;
CREATE TABLE IF NOT EXISTS `CPES_INSTT_MAJOR_CD` (
  `DTL_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상세_코드',
  `GRP_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '그룹_코드',
  `CD_EN_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드_영문_명',
  `CD_KH_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드_크메르_명',
  `CD_CONTENT` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드_설명',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`DTL_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_기관_전공_코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_INSTT_TRNNG_HIST 구조 내보내기
DROP TABLE IF EXISTS `CPES_INSTT_TRNNG_HIST`;
CREATE TABLE IF NOT EXISTS `CPES_INSTT_TRNNG_HIST` (
  `INSTT_TRNNG_HIST_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기관_훈련_이력_시퀀스',
  `TRNNG_DT` date DEFAULT NULL COMMENT '훈련_날짜',
  `TRNNG_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '훈련_명',
  `EDU_PROGRAM_ID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_프로그램_ID',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `INSTT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기관_시퀀스'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_기관_훈련_이력';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_INSTT_TRNNG_HIST_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_INSTT_TRNNG_HIST_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_INSTT_TRNNG_HIST_LOG` (
  `INSTT_TRNNG_HIST_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TRNNG_DT` datetime DEFAULT NULL,
  `TRNNG_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EDU_PROGRAM_ID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL,
  `INSTT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INSTT_TRNNG_HIST_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTT_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`INSTT_TRNNG_HIST_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_INTVW 구조 내보내기
DROP TABLE IF EXISTS `CPES_INTVW`;
CREATE TABLE IF NOT EXISTS `CPES_INTVW` (
  `CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `INTVW_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '면접제의_유형_코드',
  `INTVW_OPEN_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '면접제의_열람_여부',
  `INTVW_OPEN_DT` datetime DEFAULT NULL COMMENT '면접제의_열람_날짜',
  `INTVW_DT` datetime DEFAULT NULL COMMENT '면접_날짜',
  `REFERRAL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '알선_여부',
  `INTVW_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '면접제의_시퀀스',
  `APPLIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci COMMENT '입사지원_시퀀스',
  `INTVW_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인터뷰_진행상태_코드',
  `INTVW_REJECT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '면접제의_거절_코드',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제_여'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_면접제의';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_INTVW_HIS_MNG 구조 내보내기
DROP TABLE IF EXISTS `CPES_INTVW_HIS_MNG`;
CREATE TABLE IF NOT EXISTS `CPES_INTVW_HIS_MNG` (
  `INTVW_HIS_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '면접_이력_시퀀스',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_시퀀스',
  `INTVW_DT` datetime NOT NULL COMMENT '면접_날짜',
  `INTVW_DT_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '면접_날짜_시간',
  `INTVW_DT_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '면접_날짜_분',
  `INTVW_DT_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '면접_날짜_AMPM',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  `ADDR_DTL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `CONTENT` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `REG_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`INTVW_HIS_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_면접_이력_관리';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_ISCED_CD 구조 내보내기
DROP TABLE IF EXISTS `CPES_ISCED_CD`;
CREATE TABLE IF NOT EXISTS `CPES_ISCED_CD` (
  `ISCED_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ISCED_아이디',
  `EN_NM` varchar(255) DEFAULT NULL COMMENT '영문_명',
  `KH_NM` varchar(255) DEFAULT NULL COMMENT '크메르_명',
  `LVL` varchar(255) DEFAULT NULL COMMENT '레벨',
  `CD_LVL` varchar(255) DEFAULT NULL COMMENT '코드_레벨',
  `ISCED_CD` varchar(255) DEFAULT NULL COMMENT 'ISCED_코드',
  `SORT` decimal(10,5) DEFAULT NULL COMMENT '순서',
  `DIGIT_1` varchar(10) DEFAULT NULL COMMENT '디지트_1',
  `DIGIT_2` varchar(10) DEFAULT NULL COMMENT '디지트_2',
  `DIGIT_3` varchar(10) DEFAULT NULL COMMENT '디지트_3',
  `DIGIT_4` varchar(10) DEFAULT NULL COMMENT '디지트_4',
  `STS_CD` int(11) DEFAULT NULL COMMENT '상태_코드',
  `REG_USER_SEQ` varchar(50) DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `USE_YN` char(1) DEFAULT NULL COMMENT '사용_여부',
  `UPPER_CD` varchar(13) DEFAULT NULL COMMENT '상위코드',
  PRIMARY KEY (`ISCED_ID`) USING BTREE,
  FULLTEXT KEY `name_english` (`EN_NM`),
  FULLTEXT KEY `name_khmer` (`KH_NM`),
  FULLTEXT KEY `digit_1` (`DIGIT_1`),
  FULLTEXT KEY `digit_2` (`DIGIT_2`),
  FULLTEXT KEY `digit_3` (`DIGIT_3`),
  FULLTEXT KEY `digit_4` (`DIGIT_4`),
  FULLTEXT KEY `level` (`LVL`),
  FULLTEXT KEY `level_code` (`CD_LVL`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_ISCO_CD 구조 내보내기
DROP TABLE IF EXISTS `CPES_ISCO_CD`;
CREATE TABLE IF NOT EXISTS `CPES_ISCO_CD` (
  `ISCO_ID` int(11) DEFAULT NULL,
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ISCO_코드',
  `EN_NM` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '영문_명',
  `KH_NM` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '크메르_명',
  `UPPER_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상위_코드',
  `CD_LVL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드_레벨',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `LVL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '레벨',
  `EXPLN` text COLLATE utf8mb4_unicode_ci COMMENT '설명',
  `CATE_NM` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리_명',
  `OCCUP_INC_KH` text COLLATE utf8mb4_unicode_ci COMMENT '직업_내부_크메르',
  `OCCUP_INC_EN` text COLLATE utf8mb4_unicode_ci COMMENT '직업_내부_영어',
  `OCCUP_EXC_KH` text COLLATE utf8mb4_unicode_ci COMMENT '직업_외부_크메르',
  `OCCUP_EXC_EN` text COLLATE utf8mb4_unicode_ci COMMENT '직업_외부_영어',
  `NOTE_KH` text COLLATE utf8mb4_unicode_ci COMMENT '노트_크메르',
  `NOTE_EN` text COLLATE utf8mb4_unicode_ci COMMENT '노트_영어',
  `DEF_EN` text COLLATE utf8mb4_unicode_ci COMMENT '정의_크메르',
  `DEF_KH` text COLLATE utf8mb4_unicode_ci COMMENT '정의_영어',
  `TASK_EN` text COLLATE utf8mb4_unicode_ci,
  `TASK_KH` text COLLATE utf8mb4_unicode_ci,
  `JOB_CATE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB CATEGORIES CODE',
  `TITLE_KH` text COLLATE utf8mb4_unicode_ci COMMENT '제목_크메르',
  `DUTIES_KH` text COLLATE utf8mb4_unicode_ci COMMENT '직장_크메르',
  `SKILL_KH` text COLLATE utf8mb4_unicode_ci COMMENT '기술_크메르',
  `RESPONSIBILITIES_KH` text COLLATE utf8mb4_unicode_ci COMMENT '책임_크메르',
  `EDU_TRNNG_KH` text COLLATE utf8mb4_unicode_ci COMMENT '교육_훈련_크메르',
  `HIGH_EDU_KH` text COLLATE utf8mb4_unicode_ci COMMENT '고등_교육_크메르',
  `MAJOR_STUDY_KH` text COLLATE utf8mb4_unicode_ci COMMENT '전공_학업_크메르',
  `SKILL_RELATED_EXP_KH` text COLLATE utf8mb4_unicode_ci COMMENT '기술_관련_경험_크메르',
  `TITLE_EN` text COLLATE utf8mb4_unicode_ci COMMENT '제목_영문',
  `DUTIES_EN` text COLLATE utf8mb4_unicode_ci COMMENT '직장_영문',
  `SKILL_EN` text COLLATE utf8mb4_unicode_ci COMMENT '기술_영문',
  `RESPONSIBILITIES_EN` text COLLATE utf8mb4_unicode_ci COMMENT '책임_영문',
  `EDU_TRNNG_EN` text COLLATE utf8mb4_unicode_ci COMMENT '교육_훈련_영문',
  `HIGH_EDU_EN` text COLLATE utf8mb4_unicode_ci COMMENT '교육_훈련_영문',
  `MAJOR_STUDY_EN` text COLLATE utf8mb4_unicode_ci COMMENT '전공_학업_영문',
  `SKILL_RELATED_EXP_EN` text COLLATE utf8mb4_unicode_ci COMMENT '기술_관련_경험_영문',
  `THUMB_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '썸네일_파일_그룹_시퀀스',
  `ISCO_FULL_CD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_완성_코드',
  PRIMARY KEY (`ISCO_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_ISCO_코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_ISIC_CD 구조 내보내기
DROP TABLE IF EXISTS `CPES_ISIC_CD`;
CREATE TABLE IF NOT EXISTS `CPES_ISIC_CD` (
  `ISIC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ISIC_코드',
  `EN_NM` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '영문_명',
  `KH_NM` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '크메르_명',
  `LVL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '레벨',
  `CD_LVL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드_레벨',
  `SECTION_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '섹션_코드',
  `SECTION_CLASS` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '섹션_클래스',
  `EXPLN_IN` text COLLATE utf8mb4_unicode_ci COMMENT '설명',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `EXPLN_EX` text COLLATE utf8mb4_unicode_ci COMMENT '외부_설명',
  `SORT` int(11) DEFAULT NULL,
  `UPPER_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상위코드',
  `ISIC_ID` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ISIC_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_ISIC_코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_JC_ADDR_MAPNG 구조 내보내기
DROP TABLE IF EXISTS `CPES_JC_ADDR_MAPNG`;
CREATE TABLE IF NOT EXISTS `CPES_JC_ADDR_MAPNG` (
  `JC_ADDR_MAPNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_주소_매핑_시퀀스',
  `UPPER_ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상위_주소_코드',
  `JC_NM_EN` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_명_영어',
  `JC_NM_KH` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_명_크메르',
  `TOT_JOB_CNT` int(11) DEFAULT NULL COMMENT '총_직업_수',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `ADDR` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잡센터_코드',
  `LAT_LNG` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '위도_경도',
  `PROVINCE_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시도_아이디',
  `DISTRICT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구역_아이디',
  PRIMARY KEY (`JC_ADDR_MAPNG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_JOB_CENTER_주소_매핑';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_JOBSK_MATCH_SET 구조 내보내기
DROP TABLE IF EXISTS `CPES_JOBSK_MATCH_SET`;
CREATE TABLE IF NOT EXISTS `CPES_JOBSK_MATCH_SET` (
  `JOBSK_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `HOPE_SALARY` int(11) DEFAULT NULL COMMENT '희망_급여',
  `EMPLOY_CTRCT_UNDECID_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고용_계약_미결정_코드',
  `WORK_TIME_FULL_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시간_풀_코드',
  `EMPLOY_FORM_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_형태_코드',
  `MIN_WORK_EXP` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소_근무_경험',
  `WORK_TIME_PART_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시간_파트_코드',
  `EMPLOY_CTRCT_DECID_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_계약_고정_코드',
  PRIMARY KEY (`JOBSK_MATCH_SET_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구직_맞춤_설정';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_JOBSK_MATCH_SET_ISCO 구조 내보내기
DROP TABLE IF EXISTS `CPES_JOBSK_MATCH_SET_ISCO`;
CREATE TABLE IF NOT EXISTS `CPES_JOBSK_MATCH_SET_ISCO` (
  `JOBSK_MATCH_SET_ISCO_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_ISCO_시퀀스',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드',
  `JOBSK_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_시퀀스',
  PRIMARY KEY (`JOBSK_MATCH_SET_ISCO_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구직_맞춤_설정_ISCO';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_JOBSK_MATCH_SET_LANG 구조 내보내기
DROP TABLE IF EXISTS `CPES_JOBSK_MATCH_SET_LANG`;
CREATE TABLE IF NOT EXISTS `CPES_JOBSK_MATCH_SET_LANG` (
  `JOBSK_MATCH_SET_LANG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_언어_시퀀스',
  `LANG_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_코드',
  `JOBSK_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_시퀀스',
  PRIMARY KEY (`JOBSK_MATCH_SET_LANG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구직_맞춤_설정_언어';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_JOBSK_MATCH_SET_LOC 구조 내보내기
DROP TABLE IF EXISTS `CPES_JOBSK_MATCH_SET_LOC`;
CREATE TABLE IF NOT EXISTS `CPES_JOBSK_MATCH_SET_LOC` (
  `JOBSK_MATCH_SET_LOC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_지역_코드(ADDR_CD)',
  `JOBSK_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_시퀀스',
  `JOBSK_MATCH_SET_LOC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_지역_시퀀스',
  PRIMARY KEY (`JOBSK_MATCH_SET_LOC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구직_맞춤_설정_지역';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_JOBSK_MATCH_SET_MIN_EDU_DEGREE 구조 내보내기
DROP TABLE IF EXISTS `CPES_JOBSK_MATCH_SET_MIN_EDU_DEGREE`;
CREATE TABLE IF NOT EXISTS `CPES_JOBSK_MATCH_SET_MIN_EDU_DEGREE` (
  `JOBSK_MATCH_SET_MIN_EDU_DEGREE_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_최소_교육_정도_시퀀스',
  `JOBSK_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_시퀀스',
  `MIN_EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구직_맞춤_설정_최소_교육_정도_코드',
  PRIMARY KEY (`JOBSK_MATCH_SET_MIN_EDU_DEGREE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구직_맞춤_설정_최소_교육_정도';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_JOBSK_MATCH_SET_PREFERNT_COND 구조 내보내기
DROP TABLE IF EXISTS `CPES_JOBSK_MATCH_SET_PREFERNT_COND`;
CREATE TABLE IF NOT EXISTS `CPES_JOBSK_MATCH_SET_PREFERNT_COND` (
  `JOBSK_MATCH_SET_PREFERNT_COND_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_우대_조건_시퀀스',
  `PREFERNT_COND_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우대_조건_코드',
  `JOBSK_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_맞춤_설정_시퀀스',
  PRIMARY KEY (`JOBSK_MATCH_SET_PREFERNT_COND_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구직_맞춤_설정_우대_조건';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_JOBSK_REQ 구조 내보내기
DROP TABLE IF EXISTS `CPES_JOBSK_REQ`;
CREATE TABLE IF NOT EXISTS `CPES_JOBSK_REQ` (
  `JOBSK_REQ_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직_신청_시퀀스',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_코드',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `REG_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `JOBSK_NUM` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구직번호',
  `JC_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_승인_상태_코드',
  `JC_AGREE_DT` datetime DEFAULT NULL COMMENT 'JOB_CENTER_승인_날짜',
  `RESUME_OPEN_DT` datetime DEFAULT NULL COMMENT '이력서_열람_날짜',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  `DEL_DT` datetime DEFAULT NULL COMMENT '삭제_날짜',
  `JOBSK_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구직_상태_코드',
  `RESUME_TITLE` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_제목',
  `JOBSK_END_DT` datetime DEFAULT NULL COMMENT '구직_종료_날짜',
  `AGREE_REJECT_REASON` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인_거절_사유(미승인사유)',
  `JOBSK_REG_DT` datetime DEFAULT NULL COMMENT '구직_신청_날짜',
  PRIMARY KEY (`JOBSK_REQ_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구직_신청';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_JOB_CENTER 구조 내보내기
DROP TABLE IF EXISTS `CPES_JOB_CENTER`;
CREATE TABLE IF NOT EXISTS `CPES_JOB_CENTER` (
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '잡_센터_코드',
  `JC_EN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잡_센터_영문',
  `JC_KH` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잡_센터_크메르',
  `ADDR_EN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_영문',
  `ADDR_KH` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_크메르',
  `TEL1` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '연락처1',
  `TEL2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '연락처2',
  `TEL3` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '연락처3',
  `TEL4` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '연락처4',
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `FACEBOOK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '페이스북',
  `WEBSITE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '웹사이트',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드',
  `EXPLN_EN` text COLLATE utf8mb4_unicode_ci COMMENT '설명_영문',
  `LNGTD` decimal(18,6) DEFAULT '0.000000' COMMENT '경도',
  `LATTD` decimal(18,6) DEFAULT '0.000000' COMMENT '위도',
  `EXPLN_KH` text COLLATE utf8mb4_unicode_ci COMMENT '설명_크메르',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `MAP_LINK` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구글_맵_링크',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  PRIMARY KEY (`JC_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_잡_센터';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_LIKE 구조 내보내기
DROP TABLE IF EXISTS `CPES_LIKE`;
CREATE TABLE IF NOT EXISTS `CPES_LIKE` (
  `LIKE_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '좋아요_시퀀스',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `CATE_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '카테고리_코드(CATE_CD)',
  `TABLE_KEY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '테이블_키_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  PRIMARY KEY (`LIKE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_좋아요';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_LMI_BASE_INDIC 구조 내보내기
DROP TABLE IF EXISTS `CPES_LMI_BASE_INDIC`;
CREATE TABLE IF NOT EXISTS `CPES_LMI_BASE_INDIC` (
  `LMI_BASE_INDIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'LMI_기준_지표_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `DEPTH` int(11) NOT NULL COMMENT '깊이',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  `INDIC_ITEM_NM` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기준_항목_명',
  PRIMARY KEY (`LMI_BASE_INDIC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_LMI_기준_지표';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_LMI_INDIC_DATA 구조 내보내기
DROP TABLE IF EXISTS `CPES_LMI_INDIC_DATA`;
CREATE TABLE IF NOT EXISTS `CPES_LMI_INDIC_DATA` (
  `LMI_INDIC_DATA_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'LMI_지표_데이터_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `LMI_YEAR_BASE_INDIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'LMI_연간_기준_지표_시퀀스',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_코드',
  `CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `YEAR` int(11) DEFAULT NULL COMMENT '연도',
  `DEPTH` int(11) DEFAULT NULL COMMENT '깊이',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  `INDIC_ITEM_NM` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지표_항목_명',
  `VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '노출_여부',
  `REPORT_CYCLE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '보고_주기_코드',
  PRIMARY KEY (`LMI_INDIC_DATA_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_LMI_지표_데이터';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_LMI_YEAR_BASE_INDIC 구조 내보내기
DROP TABLE IF EXISTS `CPES_LMI_YEAR_BASE_INDIC`;
CREATE TABLE IF NOT EXISTS `CPES_LMI_YEAR_BASE_INDIC` (
  `LMI_YEAR_BASE_INDIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'LMI_연별_기준_지표_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `LMI_BASE_INDIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'LMI_기준_지표_시퀀스',
  `DEPTH` int(11) DEFAULT NULL COMMENT '깊이',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  `INDIC_ITEM_NM` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지표_항목_명',
  `YEAR` int(11) DEFAULT NULL COMMENT '연도',
  `VIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '노출_여부',
  `UPPER_LMI_YEAR_BASE_INDIC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상위_LMI_연별_기준_지표_시퀀스',
  `FULL_LMI_YEAR_BASE_INDIC_SEQ` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '완성_LMI_연별_기준_지표_시퀀스',
  PRIMARY KEY (`LMI_YEAR_BASE_INDIC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_LMI_연별_기준_지표';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_LOC_CD 구조 내보내기
DROP TABLE IF EXISTS `CPES_LOC_CD`;
CREATE TABLE IF NOT EXISTS `CPES_LOC_CD` (
  `LOC_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '지역_시퀀스',
  `LVL_CD` int(11) DEFAULT '0' COMMENT '레벨_코드',
  `COUNTRY_ID` int(11) DEFAULT '0' COMMENT '국가_아이디',
  `PROVINCE_ID` int(11) DEFAULT '0' COMMENT '주_아이디',
  `DISTRICT_ID` int(11) DEFAULT '0' COMMENT '구역_아이디',
  `COMMUNE_ID` int(11) DEFAULT '0' COMMENT '도시_아이디',
  `VILLAGE_ID` int(11) DEFAULT '0' COMMENT '마을_아이디',
  `PARENT_ID` int(11) DEFAULT '0' COMMENT '부모_아이디',
  `LVL` int(11) DEFAULT '0' COMMENT '레벨',
  `NM_EN` varchar(255) DEFAULT NULL COMMENT '명_영어',
  `NM_KH` varchar(255) DEFAULT NULL COMMENT '명_크메르',
  `PROVINCE_ID_API` int(11) NOT NULL COMMENT '주_아이디_API',
  `ADDR_FULL_CD` varchar(50) DEFAULT NULL COMMENT '주소_전체_코드',
  PRIMARY KEY (`LOC_SEQ`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34156 DEFAULT CHARSET=utf8mb4 COMMENT='CPES_주소_코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_LSJS_XLS_REG_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_LSJS_XLS_REG_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_LSJS_XLS_REG_LOG` (
  `LSJS_XLS_REG_LOG_SQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'LSJS_엑셀_등록_로그_시퀀스',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `MSG` text COLLATE utf8mb4_unicode_ci COMMENT '메세지',
  `RSLT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '결과_코드(RSLT_CD)',
  `UPLOAD_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '업로드_아이디',
  `REG_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `XLS_UPLOAD_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '엑셀_업로드_구분_코드(XUD0000000001 : 회원등록, XUD0000000002 : 이력서등록)',
  PRIMARY KEY (`LSJS_XLS_REG_LOG_SQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_LSJS_엑셀_등록_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_MENU 구조 내보내기
DROP TABLE IF EXISTS `CPES_MENU`;
CREATE TABLE IF NOT EXISTS `CPES_MENU` (
  `MENU_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴_코드(MENU_CD)',
  `UPPER_MENU_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상위_메뉴_코드(UPPER_MENU_CD)',
  `MENU_NM_KH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴_명_크메르',
  `MENU_NM_EN` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴_명_영어',
  `MENU_NM_KR` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴_명_한글',
  `MENU_LVL` int(11) NOT NULL COMMENT '메뉴_레벨',
  `MENU_SORT` int(11) NOT NULL COMMENT '메뉴_정렬',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `MENU_GRP_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴_그룹_코드(MENU_GRP_CD)',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `MENU_URL` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴_URL',
  `BULLETIN_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판_여부',
  `PROGRAM_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_시퀀스',
  `PROGRAM_MAP_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_맵_여부',
  `FULL_MENU_CD` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '완성_메뉴_코드',
  `RANGE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '범위_코드',
  PRIMARY KEY (`MENU_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_메뉴';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_MENU_PROGRAM_MAP 구조 내보내기
DROP TABLE IF EXISTS `CPES_MENU_PROGRAM_MAP`;
CREATE TABLE IF NOT EXISTS `CPES_MENU_PROGRAM_MAP` (
  `MENU_PROGRAM_MAP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴_프로그램_맵_시퀀스',
  `MENU_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴_코드',
  `PROGRAM_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_시퀀스',
  `PRI_PROGRAM_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표_프로그램_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_메뉴_프로그램_맵';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_MENU_PROGRAM_MAP_BAK 구조 내보내기
DROP TABLE IF EXISTS `CPES_MENU_PROGRAM_MAP_BAK`;
CREATE TABLE IF NOT EXISTS `CPES_MENU_PROGRAM_MAP_BAK` (
  `MENU_PROGRAM_MAP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴_프로그램_맵_시퀀스',
  `MENU_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴_코드',
  `PROGRAM_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_시퀀스',
  `PRI_PROGRAM_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표_프로그램_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_메뉴_프로그램_맵';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_MENU_TMPLT 구조 내보내기
DROP TABLE IF EXISTS `CPES_MENU_TMPLT`;
CREATE TABLE IF NOT EXISTS `CPES_MENU_TMPLT` (
  `MENU_TMPLT_SEQ` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴_템플릿_시퀀스',
  `TMPLT_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '템플릿_명',
  `TMPLT_EXPLN` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '템플릿_설명',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`MENU_TMPLT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_메뉴_템플릿';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_MENU_TMPLT_MAPNG 구조 내보내기
DROP TABLE IF EXISTS `CPES_MENU_TMPLT_MAPNG`;
CREATE TABLE IF NOT EXISTS `CPES_MENU_TMPLT_MAPNG` (
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `MENU_TMPLT_SEQ` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴_템플릿_시퀀스',
  `MENU_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴_코드(MENU_CD)',
  PRIMARY KEY (`MENU_TMPLT_SEQ`,`MENU_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_메뉴_템플릿_매핑';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_MSG 구조 내보내기
DROP TABLE IF EXISTS `CPES_MSG`;
CREATE TABLE IF NOT EXISTS `CPES_MSG` (
  `MSG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메세지_시퀀스',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제_여부',
  PRIMARY KEY (`MSG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_메세지';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_OFFER 구조 내보내기
DROP TABLE IF EXISTS `CPES_OFFER`;
CREATE TABLE IF NOT EXISTS `CPES_OFFER` (
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_시퀀스',
  `CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `OFFER_OPEN_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '입사제의열람여부',
  `OFFER_OPEN_DT` datetime DEFAULT NULL COMMENT '입사제의열람일시',
  `OFFER_ACPT_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '입사제의수락여부',
  `OFFER_ACPT_DT` datetime DEFAULT NULL COMMENT '입사제의수락날짜',
  `EMAIL_NTCE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일_알림_여부',
  `EMAIL_NTCE_DT` datetime DEFAULT NULL COMMENT '이메일_알림_날짜',
  `REFERRAL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '알선_여부',
  `SMS_NTCE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SMS알림여부',
  `SMS_NTCE_DT` datetime DEFAULT NULL COMMENT 'SMS알림날짜',
  `OFFER_SEQ` varchar(36) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '입사제의_시퀀스',
  PRIMARY KEY (`OFFER_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_입사제의';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_OPEN_VACANCY 구조 내보내기
DROP TABLE IF EXISTS `CPES_OPEN_VACANCY`;
CREATE TABLE IF NOT EXISTS `CPES_OPEN_VACANCY` (
  `OPEN_VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '열람_구인_시퀀스',
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_시퀀스',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_시퀀스',
  `REG_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  PRIMARY KEY (`OPEN_VACANCY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_열람_구인';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_POPUP 구조 내보내기
DROP TABLE IF EXISTS `CPES_POPUP`;
CREATE TABLE IF NOT EXISTS `CPES_POPUP` (
  `POPUP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '팝업_시퀀스',
  `WIDTH` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '넓이',
  `HEIGHT` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '높이',
  `TOP_POSITION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상단_위치',
  `LEFT_POSITION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '좌측_위치',
  `BGN_DT` char(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` char(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료_날짜',
  `CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시컨스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `TITLE` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `BGN_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작_시간',
  `END_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료_시간',
  `BGN_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작_분',
  `END_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료_분',
  `BGN_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작_AMPM',
  `END_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료_AMPM',
  `RESV_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예약_여부',
  `TODAY_OPEN_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '하루동안보지않기',
  PRIMARY KEY (`POPUP_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_팝업';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_PROGRAM 구조 내보내기
DROP TABLE IF EXISTS `CPES_PROGRAM`;
CREATE TABLE IF NOT EXISTS `CPES_PROGRAM` (
  `PROGRAM_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램_시퀀스',
  `PROGRAM_ID` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_아이디',
  `PROGRAM_NM_KH` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_명_KH',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `BULLETIN_MNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판_관리_시퀀스',
  `PROGRAM_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_URL',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `RANGE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '범위_코드',
  `MENU_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴_코드',
  `PROGRAM_NM_EN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_명_EN',
  PRIMARY KEY (`PROGRAM_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_프로그램';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_PROGRAM_BAK 구조 내보내기
DROP TABLE IF EXISTS `CPES_PROGRAM_BAK`;
CREATE TABLE IF NOT EXISTS `CPES_PROGRAM_BAK` (
  `PROGRAM_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램_시퀀스',
  `PROGRAM_ID` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_아이디',
  `PROGRAM_NM_KH` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_명_KH',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `BULLETIN_MNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판_관리_시퀀스',
  `PROGRAM_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_URL',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `RANGE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '범위_코드',
  `MENU_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴_코드',
  `PROGRAM_NM_EN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_명_EN',
  PRIMARY KEY (`PROGRAM_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_프로그램';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_REFERRAL 구조 내보내기
DROP TABLE IF EXISTS `CPES_REFERRAL`;
CREATE TABLE IF NOT EXISTS `CPES_REFERRAL` (
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `REFERRAL_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '알선_구분_코드',
  `REFERRAL_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '알선_상태_코드',
  `EMAIL_NTCE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메일_알림_여부',
  `EMAIL_NTCE_DT` datetime DEFAULT NULL COMMENT '메일_알림_날짜',
  `REFERRAL_COUNSEL_RECORD` text COLLATE utf8mb4_unicode_ci COMMENT '알선_상담_기록',
  `MNGER_OPINION` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_의견',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  `REFERRAL_REJECT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '알선_거절_코드',
  PRIMARY KEY (`VACANCY_SEQ`,`RESUME_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_알선';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME` (
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `RESUME_ID` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_아이디',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `USER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_아이디',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `CMPLT_USER_NM_KH` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '완성형_사용자_명_크메르',
  `CMPLT_USER_NM_EN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '완성형_사용자_명_영어',
  `GENDER_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별_코드(GENDER_CD)',
  `NATION_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '국가_코드(NATION_CD)',
  `BIRTH` date DEFAULT NULL COMMENT '생년월일',
  `IDENTI_NO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고유_번호',
  `BIRTH_LOC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '출생_지역_코드(ADDR_CD)',
  `MARRI_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '결혼_코드(MARRI_CD)',
  `FAMILY_CNT` int(11) DEFAULT NULL COMMENT '가족_카운트',
  `UNDER_AGE15_FAMILY_CNT` int(11) DEFAULT NULL COMMENT '15세_미만_가족_계산',
  `OVER_AGE64_FAMILY_CNT` int(11) DEFAULT NULL COMMENT '65세_이상_가족_계산',
  `ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `FRSTIME_JOB_SEEKER_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초_구직_여부_YN',
  `STUDYING_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '학업중_여부_YN',
  `RET_MIGRAT_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '해외_이주_노동자_여부_YN',
  `RURAL_LABO_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '농촌_노동자_여부',
  `SRVC_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서비스_근무_여부',
  `ETHNIC_MINOR_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소수_민족_여부',
  `DISABL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_여부_YN',
  `DISABL_OPTION_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_옵션_코드(DISABL_OPTION_CD)',
  `DISABL_ETC` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_기타',
  `NOW_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '현재_근무_여부_YN',
  `BEFORE_WORK_DURA` int(11) DEFAULT NULL COMMENT '이전_근무_기간',
  `SELFEMP_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '자영업_여부_YN',
  `SELFEMP_CLASS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '자영업_분류_코드(SELFEMP_CLASS_CD)',
  `URGENT_JOBSEEK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '긴급_구직_여부_YN',
  `JOBSEEK_WAIT_DURA` int(11) DEFAULT NULL COMMENT '구직_대기_기간',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `PRO_LICNS_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전문_자격증_여부_YN',
  `PRO_LICNS_SPEC` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전문_자격증_사양',
  `CAREER_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '경력_여부',
  `TOT_CAREER_TERM_YEAR_CNT` int(11) DEFAULT NULL COMMENT '합계_경력_기간_년_계산',
  `TOT_CAREER_TERM_MONTH_CNT` int(11) DEFAULT NULL COMMENT '합계_경력_기간_월_계산',
  `JC_USER_MOD_DT` datetime DEFAULT NULL COMMENT 'JOB_CENTER_사용자_수정_날짜',
  `JC_VERITY_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_승인_사용자_시퀀스',
  `JC_NOTE` text COLLATE utf8mb4_unicode_ci COMMENT 'JOB_CENTER_노트',
  `UPLOAD_CV` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'UPLOAD_CV',
  `STEP_INPUT` int(11) DEFAULT NULL COMMENT 'STEP_INPUT',
  `MOBILE_ID` int(11) DEFAULT NULL COMMENT 'MOBILE_ID',
  `RESUME_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_상태_코드(RESUME_STS_CD)',
  `LAST_MOD_DT` datetime DEFAULT NULL COMMENT '마지막_수정_날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `LANG_USE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_사용_코드(LANG_USE_CD)',
  `RESUME_TITLE` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_제목',
  `PRI_RESUME_YN` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주_이력서_여부_YN',
  `RESUME_KEYWORD` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_키워드',
  `PREFER_JOB_TITLE` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_직업_직책',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드(ISCO_CD)',
  `ISIC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISIC_코드(ISIC_CD)',
  `EMPLOY_FORM_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_형태_코드(EMPLOY_FORM_CD)',
  `PREFER_EMPLOY_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_고용_유형_코드(PREFER_EMPLOYMT_TYPE_CD)',
  `TYPE_EMPLOY_HOUR_DAY` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '형태_근무_시간_날짜',
  `TYPE_EMPLOY_DAY_WEEK` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '형태_근무_날짜_월',
  `PREFER_CRTCT_TERMS` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우선_계약_조건',
  `PREFER_CRTCT_TERMS_DURA` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우선_계약_조건_기간',
  `PREFER_CRTCT_TYPE` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_계약_형태',
  `NIGHT_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '야간_근무_여부_YN',
  `OVER_TIME_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '초과_시간_근무_여부_YN',
  `HLDAY_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공휴일_근무_여부_YN',
  `EXPCT_MIN_SALARY_AMT` decimal(11,2) DEFAULT NULL COMMENT '예상_최저_급여_금액',
  `EXPCT_MAX_SALARY_AMT` decimal(11,2) DEFAULT NULL COMMENT '예상_최고_급여_금액',
  `EXPCT_SALARY_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예상_급여_형태_코드(EXPCT_SALARY_TYPE_CD)',
  `DIFF_PROVC_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '타지_근무_여부',
  `WORK_BGN_ABLE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시작_여부',
  `WORK_BGN_ABLE_WITHIN` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시작',
  `JOBSK_REQ_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구직_신청_여부',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `BIRTH_ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '출생_지역_상세',
  `PREFER_DAY_MON` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_월요일',
  `PREFER_DAY_TUE` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_화요일',
  `PREFER_DAY_WED` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_수요일',
  `PREFER_DAY_THU` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_목요일',
  `PREFER_DAY_FRI` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_금요일',
  `PREFER_DAY_SAT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_토요일',
  `PREFER_DAY_SUN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_일요일',
  `PREFER_POSITION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '희망_직책',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  `JC_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잡센터_승인_상태_코드',
  PRIMARY KEY (`RESUME_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_CELL 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_CELL`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_CELL` (
  `RESUME_CELL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_휴대전화_시퀀스',
  `RESUME_CELL_ID` int(11) DEFAULT NULL COMMENT '이력서_휴대전화_아이디',
  `CELL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴대전화',
  `CELL_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴대전화_상태_코드(CELL_STS_CD))',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  PRIMARY KEY (`RESUME_CELL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_휴대전화';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_CELL_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_CELL_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_CELL_LOG` (
  `RESUME_CELL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_휴대전화_시퀀스',
  `RESUME_CELL_ID` int(11) DEFAULT NULL COMMENT '이력서_휴대전화_아이디',
  `CELL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴대전화',
  `CELL_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴대전화_상태_코드(CELL_STS_CD))',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  `RESUME_CELL_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_휴대전화_로그_시퀀스',
  PRIMARY KEY (`RESUME_CELL_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_휴대전화_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_CELL_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_CELL_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_CELL_TEMP` (
  `RESUME_CELL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_휴대전화_시퀀스',
  `RESUME_CELL_ID` int(11) DEFAULT NULL COMMENT '이력서_휴대전화_아이디',
  `CELL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴대전화',
  `CELL_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴대전화_상태_코드(CELL_STS_CD))',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  PRIMARY KEY (`RESUME_CELL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_휴대전화';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_DISABL 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_DISABL`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_DISABL` (
  `RESUME_DISABL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_장애_시퀀스',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `DISABLE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_코드',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`RESUME_DISABL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_장애';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_DISABL_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_DISABL_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_DISABL_LOG` (
  `RESUME_DISABL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_장애_시퀀스',
  `DISABLE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_코드',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  `RESUME_DISABL_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_장래_로그_시퀀스',
  PRIMARY KEY (`RESUME_DISABL_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_장애_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_DISABL_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_DISABL_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_DISABL_TEMP` (
  `RESUME_DISABL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_장애_시퀀스',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `DISABLE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_코드',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`RESUME_DISABL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_장애';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_EMAIL 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_EMAIL`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_EMAIL` (
  `RESUME_EMAIL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_이메일_시퀀스',
  `RESUME_EMAIL_ID` int(11) DEFAULT NULL COMMENT '이력서_이메일_아이디',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `EMAIL_ADDR` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일_주소',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `MST_EMAIL_ADDR_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표_이메일_주소_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`RESUME_EMAIL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_이메일';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_EMAIL_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_EMAIL_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_EMAIL_LOG` (
  `RESUME_EMAIL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_이메일_시퀀스',
  `RESUME_EMAIL_ID` int(11) DEFAULT NULL COMMENT '이력서_이메일_아이디',
  `EMAIL_ADDR` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일_주소',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `MST_EMAIL_ADDR_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표_이메일_주소_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  `RESUME_EMAIL_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_이메일_로그_시퀀스',
  PRIMARY KEY (`RESUME_EMAIL_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_이메일_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_EMAIL_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_EMAIL_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_EMAIL_TEMP` (
  `RESUME_EMAIL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_이메일_시퀀스',
  `RESUME_EMAIL_ID` int(11) DEFAULT NULL COMMENT '이력서_이메일_아이디',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `EMAIL_ADDR` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일_주소',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용_여부',
  `MST_EMAIL_ADDR_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표_이메일_주소_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`RESUME_EMAIL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_이메일';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_GENRL_EDU 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_GENRL_EDU`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_GENRL_EDU` (
  `RESUME_GENRL_EDU_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_일반_교육_시퀀스',
  `RESUME_EDU_ID` int(11) DEFAULT NULL COMMENT '이력서_교육_아이디',
  `EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_정도_코드(EDU_DEGREE_CD)',
  `ISCED_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCED_코드(ISCED_CD)',
  `EDU_DURA` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_기간',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `INSTT_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명',
  `ADDR_PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_주',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  PRIMARY KEY (`RESUME_GENRL_EDU_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_일반_교육';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_GENRL_EDU_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_GENRL_EDU_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_GENRL_EDU_LOG` (
  `RESUME_GENRL_EDU_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_일반_교육_시퀀스',
  `RESUME_EDU_ID` int(11) DEFAULT NULL COMMENT '이력서_교육_아이디',
  `EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_정도_코드(EDU_DEGREE_CD)',
  `ISCED_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCED_코드(ISCED_CD)',
  `EDU_DURA` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_기간',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `INSTT_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명',
  `ADDR_PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_주',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  `RESUME_GENRL_EDU_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_일반_교육_로그_시퀀스',
  PRIMARY KEY (`RESUME_GENRL_EDU_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_일반_교육_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_GENRL_EDU_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_GENRL_EDU_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_GENRL_EDU_TEMP` (
  `RESUME_GENRL_EDU_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_일반_교육_시퀀스',
  `RESUME_EDU_ID` int(11) DEFAULT NULL COMMENT '이력서_교육_아이디',
  `EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_정도_코드(EDU_DEGREE_CD)',
  `ISCED_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCED_코드(ISCED_CD)',
  `EDU_DURA` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_기간',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `INSTT_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명',
  `ADDR_PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_주',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  PRIMARY KEY (`RESUME_GENRL_EDU_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_일반_교육';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_HOPE_WORK_LOC 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_HOPE_WORK_LOC`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_HOPE_WORK_LOC` (
  `RESUME_HOPE_WORK_LOC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_희망_근무_지역_시퀀스',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드',
  `ADDR_DTL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  PRIMARY KEY (`RESUME_HOPE_WORK_LOC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_희망_근무_지역';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_HOPE_WORK_LOC_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_HOPE_WORK_LOC_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_HOPE_WORK_LOC_LOG` (
  `RESUME_HOPE_WORK_LOC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_희망_근무_지역_시퀀스',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드',
  `ADDR_DTL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  `RESUME_HOPE_WORK_LOC_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_희망_근무_지역_로그_시퀀스',
  PRIMARY KEY (`RESUME_HOPE_WORK_LOC_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_희망_근무_지역_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_HOPE_WORK_LOC_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_HOPE_WORK_LOC_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_HOPE_WORK_LOC_TEMP` (
  `RESUME_HOPE_WORK_LOC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_희망_근무_지역_시퀀스',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드',
  `ADDR_DTL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  PRIMARY KEY (`RESUME_HOPE_WORK_LOC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_희망_근무_지역';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_ISCO 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_ISCO`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_ISCO` (
  `RESUME_ISCO_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_ISCO_시퀀스',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `ISCO_FULL_CD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_완성_코드',
  `ISCO_FULL_NM` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_완성_명',
  `ISCO_UPPER_CD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_상위_코드',
  PRIMARY KEY (`RESUME_ISCO_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_ISCO';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_ISCO_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_ISCO_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_ISCO_TEMP` (
  `RESUME_ISCO_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_ISCO_시퀀스',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `ISCO_FULL_CD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_완성_코드',
  `ISCO_FULL_NM` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_완성_명',
  PRIMARY KEY (`RESUME_ISCO_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_ISCO';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_LANG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_LANG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_LANG` (
  `RESUME_LANG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_언어_시퀀스',
  `RESUME_LANG_ID` int(11) DEFAULT NULL COMMENT '이력서_언어_아이디',
  `LANG_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_코드(LANG_CD)',
  `LANG_LVL_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_레벨_코드(LANG_LVL_CD)',
  `LANG_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_형태_코드(Native, foreign language)(LANG_TYPE_CD)',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`RESUME_LANG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_언어';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_LANG_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_LANG_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_LANG_LOG` (
  `RESUME_LANG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_언어_시퀀스',
  `RESUME_LANG_ID` int(11) DEFAULT NULL COMMENT '이력서_언어_아이디',
  `LANG_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_코드(LANG_CD)',
  `LANG_LVL_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_레벨_코드(LANG_LVL_CD)',
  `LANG_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_형태_코드(Native, foreign language)(LANG_TYPE_CD)',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  `RESUME_LANG_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_언어_로그_시퀀스',
  PRIMARY KEY (`RESUME_LANG_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_언어_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_LANG_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_LANG_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_LANG_TEMP` (
  `RESUME_LANG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_언어_시퀀스',
  `RESUME_LANG_ID` int(11) DEFAULT NULL COMMENT '이력서_언어_아이디',
  `LANG_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_코드(LANG_CD)',
  `LANG_LVL_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_레벨_코드(LANG_LVL_CD)',
  `LANG_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_형태_코드(Native, foreign language)(LANG_TYPE_CD)',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`RESUME_LANG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_언어';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_LOG` (
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_시퀀스',
  `RESUME_ID` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_아이디',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_시퀀스',
  `USER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_아이디',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `CMPLT_USER_NM_KH` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '완성형_사용자_명_크메르',
  `CMPLT_USER_NM_EN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '완성형_사용자_명_영어',
  `GENDER_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별_코드(GENDER_CD)',
  `NATION_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '국가_코드(NATION_CD)',
  `BIRTH` date DEFAULT NULL COMMENT '생년월일',
  `IDENTI_NO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고유_번호',
  `BIRTH_LOC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '출생_지역_코드(ADDR_CD)',
  `MARRI_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '결혼_코드(MARRI_CD)',
  `FAMILY_CNT` int(11) DEFAULT NULL COMMENT '가족_카운트',
  `UNDER_AGE15_FAMILY_CNT` int(11) DEFAULT NULL COMMENT '15세_미만_가족_계산',
  `OVER_AGE64_FAMLIY_CNT` int(11) DEFAULT NULL COMMENT '65세_이상_가족_계산',
  `ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `FRSTIME_JOB_SEEKER_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초_구직_여부_YN',
  `STUDYING_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '학업중_여부_YN',
  `RET_MIGRAT_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '해외_이주_노동자_여부_YN',
  `RURAL_LABO_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '농촌_노동자_여부',
  `SRVC_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서비스_근무_여부',
  `ETHNIC_MINOR_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소수_민족_여부',
  `DISABL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_여부_YN',
  `DISABL_OPTION_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_옵션_코드(DISABL_OPTION_CD)',
  `DISABL_ETC` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_기타',
  `NOW_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '현재_근무_여부_YN',
  `BEFORE_WORK_DURA` int(11) DEFAULT NULL COMMENT '이전_근무_기간',
  `SELFEMP_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '자영업_여부_YN',
  `SELFEMP_CLASS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '자영업_분류_코드(SELFEMP_CLASS_CD)',
  `URGENT_JOBSEEK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '긴급_구직_여부_YN',
  `JOBSEEK_WAIT_DURA` int(11) DEFAULT NULL COMMENT '구직_대기_기간',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `PRO_LICNS_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전문_자격증_여부_YN',
  `PRO_LICNS_SPEC` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전문_자격증_사양',
  `CAREER_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '경력_여부',
  `TOT_CAREER_TERM_YEAR_CNT` int(11) DEFAULT NULL COMMENT '합계_경력_기간_년_계산',
  `TOT_CAREER_TERM_MONTH_CNT` int(11) DEFAULT NULL COMMENT '합계_경력_기간_월_계산',
  `JC_USER_MOD_DT` datetime DEFAULT NULL COMMENT 'JOB_CENTER_사용자_수정_날짜',
  `JC_VERITY_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_승인_사용자_시퀀스',
  `JC_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_승인_여부_YN',
  `JC_NOTE` text COLLATE utf8mb4_unicode_ci COMMENT 'JOB_CENTER_노트',
  `UPLOAD_CV` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'UPLOAD_CV',
  `STEP_INPUT` int(11) DEFAULT NULL COMMENT 'STEP_INPUT',
  `MOBILE_ID` int(11) DEFAULT NULL COMMENT 'MOBILE_ID',
  `RESUME_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_상태_코드(RESUME_STS_CD)',
  `LAST_MOD_DT` datetime DEFAULT NULL COMMENT '마지막_수정_날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `LANG_USE_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '언어_사용_코드(LANG_USE_CD)',
  `RESUME_TITLE` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_제목',
  `PRI_RESUME_YN` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주_이력서_여부_YN',
  `RESUME_KEYWORD` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_키워드',
  `PREFER_JOB_TITLE` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_직업_직책',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드(ISCO_CD)',
  `ISIC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISIC_코드(ISIC_CD)',
  `EMPLOY_FORM_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_형태_코드(EMPLOY_FORM_CD)',
  `PREFER_EMPLOY_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_고용_유형_코드(PREFER_EMPLOYMT_TYPE_CD)',
  `TYPE_EMPLOY_HOUR_DAY` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '형태_근무_시간_날짜',
  `TYPE_EMPLOY_DAY_WEEK` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '형태_근무_날짜_월',
  `PREFER_CRTCT_TERMS` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우선_계약_조건',
  `PREFER_CRTCT_TERMS_DURA` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우선_계약_조건_기간',
  `PREFER_CRTCT_TYPE` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_계약_형태',
  `NIGHT_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '야간_근무_여부_YN',
  `OVER_TIME_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '초과_시간_근무_여부_YN',
  `HLDAY_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공휴일_근무_여부_YN',
  `EXPCT_MIN_SALARY_AMT` decimal(11,2) DEFAULT NULL COMMENT '예상_최저_급여_금액',
  `EXPCT_MAX_SALARY_AMT` decimal(11,2) DEFAULT NULL COMMENT '예상_최고_급여_금액',
  `EXPCT_SALARY_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예상_급여_형태_코드(EXPCT_SALARY_TYPE_CD)',
  `DIFF_PROVC_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '타지_근무_여부',
  `WORK_BGN_ABLE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시작_여부',
  `WORK_BGN_ABLE_WITHIN` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시작',
  `JOBSK_REQ_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구직_신청_여부',
  `JC_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_승인_상태_코드(JC_AGREE_STS_CD)',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `BIRTH_ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '출생_지역_상세',
  `PREFER_DAY_MON` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_월요일',
  `PREFER_DAY_TUE` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_화요일',
  `PREFER_DAY_WED` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_수요일',
  `PREFER_DAY_THU` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_목요일',
  `PREFER_DAY_FRI` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_금요일',
  `PREFER_DAY_SAT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_토요일',
  `PREFER_DAY_SUN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_일요일',
  `PREFER_POSITION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '희망_직책',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  PRIMARY KEY (`RESUME_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_OPEN_COMPNY 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_OPEN_COMPNY`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_OPEN_COMPNY` (
  `RESUME_OPEN_COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_열람_기업_시퀀스',
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_시퀀스',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_열람_기업';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_OTHER_TRNNG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_OTHER_TRNNG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_OTHER_TRNNG` (
  `RESUME_OTHER_TRNNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_다른_훈련_시퀀스',
  `RESUME_OTHER_TRNNG_ID` int(11) DEFAULT NULL COMMENT '이력서_다른_훈련_아이디',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `TRNNG_EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '훈련_교육_정도_코드(TRNNG_EDU_DEGREE_CD))',
  `INSTT_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명',
  `ISCED_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCED_코드(ISCED_CD)',
  `ADDR_PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_주',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  PRIMARY KEY (`RESUME_OTHER_TRNNG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_다른_훈련';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_OTHER_TRNNG_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_OTHER_TRNNG_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_OTHER_TRNNG_LOG` (
  `RESUME_OTHER_TRNNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_다른_훈련_시퀀스',
  `RESUME_OTHER_TRNNG_ID` int(11) DEFAULT NULL COMMENT '이력서_다른_훈련_아이디',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `TRNNG_EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '훈련_교육_정도_코드(TRNNG_EDU_DEGREE_CD))',
  `INSTT_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명',
  `ISCED_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCED_코드(ISCED_CD)',
  `ADDR_PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_주',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  `RESUME_OTHER_TRNNG_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_다른_훈련_로그_시퀀스',
  PRIMARY KEY (`RESUME_OTHER_TRNNG_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_다른_훈련_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_OTHER_TRNNG_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_OTHER_TRNNG_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_OTHER_TRNNG_TEMP` (
  `RESUME_OTHER_TRNNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_다른_훈련_시퀀스',
  `RESUME_OTHER_TRNNG_ID` int(11) DEFAULT NULL COMMENT '이력서_다른_훈련_아이디',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `TRNNG_EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '훈련_교육_정도_코드(TRNNG_EDU_DEGREE_CD))',
  `INSTT_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명',
  `ISCED_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCED_코드(ISCED_CD)',
  `ADDR_PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_주',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  PRIMARY KEY (`RESUME_OTHER_TRNNG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_다른_훈련';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_REF_MAN 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_REF_MAN`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_REF_MAN` (
  `RESUME_REF_MAN_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_관계_사람_시퀀스',
  `RESUME_REF_MAN_ID` int(11) DEFAULT NULL COMMENT '이력서_관계_사람_아이디',
  `NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '명',
  `ORGNZ_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조직_명',
  `POSITION` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '위치',
  `REF` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관계',
  `CELL` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴대전화',
  `EMAIL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_CODE',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  `ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  PRIMARY KEY (`RESUME_REF_MAN_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_관계_사람';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_REF_MAN_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_REF_MAN_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_REF_MAN_LOG` (
  `RESUME_REF_MAN_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_관계_사람_시퀀스',
  `RESUME_REF_MAN_ID` int(11) DEFAULT NULL COMMENT '이력서_관계_사람_아이디',
  `NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '명',
  `ORGNZ_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조직_명',
  `POSITION` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '위치',
  `REF` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관계',
  `CELL` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴대전화',
  `EMAIL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `ADDR` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  `RESUME_REF_MAN_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_관계_사람_로그_시퀀스',
  PRIMARY KEY (`RESUME_REF_MAN_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_관계_사람_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_REF_MAN_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_REF_MAN_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_REF_MAN_TEMP` (
  `RESUME_REF_MAN_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_관계_사람_시퀀스',
  `RESUME_REF_MAN_ID` int(11) DEFAULT NULL COMMENT '이력서_관계_사람_아이디',
  `NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '명',
  `ORGNZ_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조직_명',
  `POSITION` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '위치',
  `REF` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관계',
  `CELL` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴대전화',
  `EMAIL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `ADDR_CD` varbinary(13) DEFAULT NULL COMMENT '주소_코드',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  `ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`RESUME_REF_MAN_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_관계_사람';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_SKILL 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_SKILL`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_SKILL` (
  `RESUME_SKILL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_기술_시퀀스',
  `RESUME_SKILL_ID` int(11) DEFAULT NULL COMMENT '이력서_기술_아이디(SKILL_CD)',
  `SKILL_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기술_코드(SKILL_CD)',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  PRIMARY KEY (`RESUME_SKILL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_기술';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_SKILL_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_SKILL_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_SKILL_LOG` (
  `RESUME_SKILL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_기술_시퀀스',
  `RESUME_SKILL_ID` int(11) DEFAULT NULL COMMENT '이력서_기술_아이디(SKILL_CD)',
  `SKILL_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기술_코드(SKILL_CD)',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  `RESUME_SKILL_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_기술_로그_시퀀스',
  PRIMARY KEY (`RESUME_SKILL_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_기술_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_SKILL_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_SKILL_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_SKILL_TEMP` (
  `RESUME_SKILL_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_기술_시퀀스',
  `RESUME_SKILL_ID` int(11) DEFAULT NULL COMMENT '이력서_기술_아이디(SKILL_CD)',
  `SKILL_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기술_코드(SKILL_CD)',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  PRIMARY KEY (`RESUME_SKILL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_기술';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_SPECIAL_STUDY 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_SPECIAL_STUDY`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_SPECIAL_STUDY` (
  `SPECIAL_STUDY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '특별_교육_시퀀스',
  `SPECIAL_STUDY_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '특별_교육_명',
  `DURA_MONTH_CNT` int(11) DEFAULT NULL COMMENT '기간_월_수',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `INSTT_NM` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명',
  `CNTRY_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '국가_코드',
  `PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지방_코드',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  PRIMARY KEY (`SPECIAL_STUDY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_특별_교육';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_SPECIAL_STUDY_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_SPECIAL_STUDY_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_SPECIAL_STUDY_TEMP` (
  `SPECIAL_STUDY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '특별_교육_시퀀스',
  `SPECIAL_STUDY_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '특별_교육_명',
  `DURA_MONTH_CNT` int(11) DEFAULT NULL COMMENT '기간_월_수',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `INSTT_NM` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명',
  `CNTRY_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '국가_코드',
  `PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지방_코드',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  PRIMARY KEY (`SPECIAL_STUDY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_특별_교육';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_TEMP` (
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `RESUME_ID` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_아이디',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `USER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_아이디',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `CMPLT_USER_NM_KH` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '완성형_사용자_명_크메르',
  `CMPLT_USER_NM_EN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '완성형_사용자_명_영어',
  `GENDER_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별_코드(GENDER_CD)',
  `NATION_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '국가_코드(NATION_CD)',
  `BIRTH` date DEFAULT NULL COMMENT '생년월일',
  `IDENTI_NO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고유_번호',
  `BIRTH_LOC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '출생_지역_코드(ADDR_CD)',
  `MARRI_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '결혼_코드(MARRI_CD)',
  `FAMILY_CNT` int(11) DEFAULT NULL COMMENT '가족_카운트',
  `UNDER_AGE15_FAMILY_CNT` int(11) DEFAULT NULL COMMENT '15세_미만_가족_계산',
  `OVER_AGE64_FAMILY_CNT` int(11) DEFAULT NULL COMMENT '65세_이상_가족_계산',
  `ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `FRSTIME_JOB_SEEKER_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초_구직_여부_YN',
  `STUDYING_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '학업중_여부_YN',
  `RET_MIGRAT_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '해외_이주_노동자_여부_YN',
  `RURAL_LABO_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '농촌_노동자_여부',
  `SRVC_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서비스_근무_여부',
  `ETHNIC_MINOR_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소수_민족_여부',
  `DISABL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_여부_YN',
  `DISABL_OPTION_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_옵션_코드(DISABL_OPTION_CD)',
  `DISABL_ETC` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애_기타',
  `NOW_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '현재_근무_여부_YN',
  `BEFORE_WORK_DURA` int(11) DEFAULT NULL COMMENT '이전_근무_기간',
  `SELFEMP_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '자영업_여부_YN',
  `SELFEMP_CLASS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '자영업_분류_코드(SELFEMP_CLASS_CD)',
  `URGENT_JOBSEEK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '긴급_구직_여부_YN',
  `JOBSEEK_WAIT_DURA` int(11) DEFAULT NULL COMMENT '구직_대기_기간',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `PRO_LICNS_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전문_자격증_여부_YN',
  `PRO_LICNS_SPEC` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전문_자격증_사양',
  `CAREER_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '경력_여부',
  `TOT_CAREER_TERM_YEAR_CNT` int(11) DEFAULT NULL COMMENT '합계_경력_기간_년_계산',
  `TOT_CAREER_TERM_MONTH_CNT` int(11) DEFAULT NULL COMMENT '합계_경력_기간_월_계산',
  `JC_USER_MOD_DT` datetime DEFAULT NULL COMMENT 'JOB_CENTER_사용자_수정_날짜',
  `JC_VERITY_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_승인_사용자_시퀀스',
  `JC_NOTE` text COLLATE utf8mb4_unicode_ci COMMENT 'JOB_CENTER_노트',
  `UPLOAD_CV` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'UPLOAD_CV',
  `STEP_INPUT` int(11) DEFAULT NULL COMMENT 'STEP_INPUT',
  `MOBILE_ID` int(11) DEFAULT NULL COMMENT 'MOBILE_ID',
  `RESUME_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_상태_코드(RESUME_STS_CD)',
  `LAST_MOD_DT` datetime DEFAULT NULL COMMENT '마지막_수정_날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `LANG_USE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_사용_코드(LANG_USE_CD)',
  `RESUME_TITLE` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_제목',
  `PRI_RESUME_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주_이력서_여부_YN',
  `RESUME_KEYWORD` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_키워드',
  `PREFER_JOB_TITLE` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_직업_직책',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드(ISCO_CD)',
  `ISIC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISIC_코드(ISIC_CD)',
  `EMPLOY_FORM_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_형태_코드(EMPLOY_FORM_CD)',
  `PREFER_EMPLOY_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_고용_유형_코드(PREFER_EMPLOYMT_TYPE_CD)',
  `TYPE_EMPLOY_HOUR_DAY` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '형태_근무_시간_날짜',
  `TYPE_EMPLOY_DAY_WEEK` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '형태_근무_날짜_월',
  `PREFER_CRTCT_TERMS` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우선_계약_조건',
  `PREFER_CRTCT_TERMS_DURA` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우선_계약_조건_기간',
  `PREFER_CRTCT_TYPE` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_계약_형태',
  `NIGHT_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '야간_근무_여부_YN',
  `OVER_TIME_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '초과_시간_근무_여부_YN',
  `HLDAY_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공휴일_근무_여부_YN',
  `EXPCT_MIN_SALARY_AMT` decimal(11,2) DEFAULT NULL COMMENT '예상_최저_급여_금액',
  `EXPCT_MAX_SALARY_AMT` decimal(11,2) DEFAULT NULL COMMENT '예상_최고_급여_금액',
  `EXPCT_SALARY_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예상_급여_형태_코드(EXPCT_SALARY_TYPE_CD)',
  `DIFF_PROVC_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '타지_근무_여부',
  `WORK_BGN_ABLE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시작_여부',
  `WORK_BGN_ABLE_WITHIN` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시작',
  `JOBSK_REQ_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구직_신청_여부',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `BIRTH_ADDR_DTL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '출생_지역_상세',
  `PREFER_DAY_MON` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_월요일',
  `PREFER_DAY_TUE` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_화요일',
  `PREFER_DAY_WED` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_수요일',
  `PREFER_DAY_THU` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_목요일',
  `PREFER_DAY_FRI` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_금요일',
  `PREFER_DAY_SAT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_토요일',
  `PREFER_DAY_SUN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선호_요일_일요일',
  `PREFER_POSITION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '희망_직책',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  PRIMARY KEY (`RESUME_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_임시';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_TVET_EDU 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_TVET_EDU`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_TVET_EDU` (
  `RESUME_TVET_EDU_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_TVET교육시퀀스',
  `RESUME_TVET_EDU_ID` int(11) DEFAULT NULL COMMENT '이력서_TVET_교육_아이디',
  `EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_정도_코드(EDU_DEGREE_CD))',
  `ISCED_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCED_코드(ISCED_CD)',
  `DURA` int(11) DEFAULT NULL COMMENT '기간',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `INSTT_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`RESUME_TVET_EDU_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_TVET_교육';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_TVET_EDU_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_TVET_EDU_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_TVET_EDU_LOG` (
  `RESUME_TVET_EDU_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_TVET교육시퀀스',
  `RESUME_TVET_EDU_ID` int(11) DEFAULT NULL COMMENT '이력서_TVET_교육_아이디',
  `EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_정도_코드(EDU_DEGREE_CD))',
  `ISCED_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCED_코드(ISCED_CD)',
  `DURA` int(11) DEFAULT NULL COMMENT '기간',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `INSTT_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  `RESUME_TVET_EDU_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_TVET_교육_로그_시퀀스',
  PRIMARY KEY (`RESUME_TVET_EDU_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_TVET_교육_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_TVET_EDU_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_TVET_EDU_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_TVET_EDU_TEMP` (
  `RESUME_TVET_EDU_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_TVET교육시퀀스',
  `RESUME_TVET_EDU_ID` int(11) DEFAULT NULL COMMENT '이력서_TVET_교육_아이디',
  `EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_정도_코드(EDU_DEGREE_CD))',
  `ISCED_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCED_코드(ISCED_CD)',
  `DURA` int(11) DEFAULT NULL COMMENT '기간',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `INSTT_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관_명',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`RESUME_TVET_EDU_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_TVET_교육';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_WORK_EXP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_WORK_EXP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_WORK_EXP` (
  `RESUME_WORK_EXP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_근무_경험_시퀀스',
  `RESUME_WORK_EXP_ID` int(11) DEFAULT NULL COMMENT '이력서_근무_경험_아이디',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드(ISCO_CD)',
  `ISIC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(ISIC_CD)',
  `ORGNZ_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조직_명',
  `LEAVE_REASON` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '퇴사_사유',
  `ADDR_PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_주',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `JOB_SECTOR` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `JOB_POSITION` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `SELFEMP_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '자영업_여부_YN',
  PRIMARY KEY (`RESUME_WORK_EXP_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_근무_경험';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_WORK_EXP_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_WORK_EXP_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_WORK_EXP_LOG` (
  `RESUME_WORK_EXP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이력서_근무_경험_시퀀스',
  `RESUME_WORK_EXP_ID` int(11) DEFAULT NULL COMMENT '이력서_근무_경험_아이디',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드(ISCO_CD)',
  `ISIC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(ISIC_CD)',
  `ORGNZ_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조직_명',
  `LEAVE_REASON` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '퇴사_사유',
  `ADDR_PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_주',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `SELFEMP_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '자영업_여부_YN',
  `RESUME_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_로그_시퀀스',
  `RESUME_WORK_EXP_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_근무_경험_로그_시퀀스',
  PRIMARY KEY (`RESUME_WORK_EXP_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_근무_경험_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_RESUME_WORK_EXP_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_RESUME_WORK_EXP_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_RESUME_WORK_EXP_TEMP` (
  `RESUME_WORK_EXP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_근무_경험_시퀀스',
  `RESUME_WORK_EXP_ID` int(11) DEFAULT NULL COMMENT '이력서_근무_경험_아이디',
  `BGN_DT` date DEFAULT NULL COMMENT '시작_날짜',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드(ISCO_CD)',
  `ISIC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(ISIC_CD)',
  `ORGNZ_NM` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조직_명',
  `LEAVE_REASON` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '퇴사_사유',
  `ADDR_PROVC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_주',
  `RESUME_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력서_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `SELFEMP_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '자영업_여부_YN',
  PRIMARY KEY (`RESUME_WORK_EXP_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_이력서_근무_경험';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_SMS_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_SMS_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_SMS_LOG` (
  `SMS_LOG_SEQ` int(11) NOT NULL COMMENT 'SMS_로그_시퀀스',
  `SMS_USERNAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SMS_사용자명',
  `SMS_PASSWORD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SMS_비밀번호',
  `SMS_FROM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SMS_발신',
  `SMS_TO` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SMS_수신',
  `SMS_TEXT` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SMS_내용',
  `SMS_STATUS` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SMS_상태',
  `SMS_MSGID` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SMS_메세지아이디',
  `SMS_ERR_MSG` text COLLATE utf8mb4_unicode_ci COMMENT 'SMS_에러_메세지',
  `SMS_SEND_DT` datetime DEFAULT NULL COMMENT 'SMS_전송_날짜',
  `SMS_RECEIVE_DT` datetime DEFAULT NULL COMMENT 'SMS_받은_날짜',
  PRIMARY KEY (`SMS_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='SMS_LOG';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_SURVEY 구조 내보내기
DROP TABLE IF EXISTS `CPES_SURVEY`;
CREATE TABLE IF NOT EXISTS `CPES_SURVEY` (
  `SURVEY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설문_시퀀스',
  `SURVEY_TITLE` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문_제목',
  `SURVEY_CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '설문_내용',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `SURVEY_BGN_DT` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문_시작_날짜',
  `SURVEY_BGN_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '설문_시작_시간',
  `SURVEY_BGN_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '설문_시작_분',
  `SURVEY_BGN_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '설문_시작_오전오후',
  `SURVEY_END_DT` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문_종료_날짜',
  `SURVEY_END_HOUR` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문_종료_시간',
  `SURVEY_END_MINUTE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문_종료_분',
  `SURVEY_END_AMPM` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문_종료_오전오후',
  `SURVEY_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문_상태_코드(SURVEY_STS_CD)',
  `FAIR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '채용행사_시퀀스',
  `USE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  PRIMARY KEY (`SURVEY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_설문';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_SURVEY_ANS 구조 내보내기
DROP TABLE IF EXISTS `CPES_SURVEY_ANS`;
CREATE TABLE IF NOT EXISTS `CPES_SURVEY_ANS` (
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `SURVEY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설문_시퀀스',
  `SURVEY_QUST_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설문_문항_시퀀스',
  `SURVEY_ANS_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설문_답변_시퀀스',
  `SURVEY_ANS` text COLLATE utf8mb4_unicode_ci COMMENT '설문_답변',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  PRIMARY KEY (`SURVEY_ANS_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_설문_답변';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_SURVEY_ANS_MAN 구조 내보내기
DROP TABLE IF EXISTS `CPES_SURVEY_ANS_MAN`;
CREATE TABLE IF NOT EXISTS `CPES_SURVEY_ANS_MAN` (
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `SURVEY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설문_시퀀스',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  PRIMARY KEY (`USER_SEQ`,`SURVEY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_설문_답변자';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_SURVEY_ITEM 구조 내보내기
DROP TABLE IF EXISTS `CPES_SURVEY_ITEM`;
CREATE TABLE IF NOT EXISTS `CPES_SURVEY_ITEM` (
  `SURVEY_ITEM_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설문_항목_시퀀스',
  `SURVEY_ITEM` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문_항목',
  `SORT` int(11) DEFAULT NULL COMMENT '순서',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `SURVEY_QUST_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설문_문항_시퀀스',
  PRIMARY KEY (`SURVEY_ITEM_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_설문_항목';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_SURVEY_QUST 구조 내보내기
DROP TABLE IF EXISTS `CPES_SURVEY_QUST`;
CREATE TABLE IF NOT EXISTS `CPES_SURVEY_QUST` (
  `SURVEY_QUST_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설문_문항_시퀀스',
  `SURVEY_QUST_TITLE` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문_문항_제목',
  `SURVEY_ITEM_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문_문항_형태_코드(SURVEY_ITEM_TYPE_CD)',
  `ANS_CNT` int(11) DEFAULT NULL COMMENT '답변_수',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제_여부',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `SURVEY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설문_시퀀스',
  PRIMARY KEY (`SURVEY_QUST_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_설문_문항';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_SYNONYM 구조 내보내기
DROP TABLE IF EXISTS `CPES_SYNONYM`;
CREATE TABLE IF NOT EXISTS `CPES_SYNONYM` (
  `SYNONYM_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '동의어_시쿼스',
  `EN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '영문',
  `KH` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '크메르',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  PRIMARY KEY (`SYNONYM_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_동의어';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_SYS_CONN_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_SYS_CONN_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_SYS_CONN_LOG` (
  `SYS_CONN_LOG` int(36) NOT NULL COMMENT '시스템_접속_로그_시퀀스',
  `USER_IP` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_IP',
  `URL` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'URL',
  `LOGIN_DT` datetime DEFAULT NULL COMMENT '로그인_날짜',
  `PROGRAM_SEQ` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '화면_ID',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `SESSION_ID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '세션_아이디',
  `LOGOUT_DT` datetime DEFAULT NULL COMMENT '로그아웃_날짜',
  `RANGE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '범위_코드',
  `MOBILE_PC_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모바일_PC_구분_코드',
  PRIMARY KEY (`SYS_CONN_LOG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_시스템_접속_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_SYS_PAGE_CONN_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_SYS_PAGE_CONN_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_SYS_PAGE_CONN_LOG` (
  `SYS_PAGE_CONN_LOG_SEQ` int(11) NOT NULL COMMENT '시스템_페이지_접속_로그_시퀀스',
  `PROGRAM_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_시퀀스',
  `PROGRAM_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_URL',
  `CONN_BGN_DT` datetime DEFAULT NULL COMMENT '접속_시작_날짜',
  `CONN_END_DT` datetime DEFAULT NULL COMMENT '접속_종료_날짜',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `PROGRAM_NM_KH` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_명_크메르',
  `PROGRAM_NM_EN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램_명_영문',
  `RANGE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '범위_코드',
  `SESSION_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '세션_아이디',
  `MOBILE_PC_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모바일_PC_구분_코드',
  PRIMARY KEY (`SYS_PAGE_CONN_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_시스템_페이지_접속_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_TEACH_ADDR 구조 내보내기
DROP TABLE IF EXISTS `CPES_TEACH_ADDR`;
CREATE TABLE IF NOT EXISTS `CPES_TEACH_ADDR` (
  `TEACH_ADDR_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수강_주소_시퀀스',
  `EDU_TRNNG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교육_훈련_시퀀스',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_수강_장소';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_USER 구조 내보내기
DROP TABLE IF EXISTS `CPES_USER`;
CREATE TABLE IF NOT EXISTS `CPES_USER` (
  `USER_AUTH_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_권한_코드(USER_AUTH_CD)',
  `USER_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_이메일(로그인계정)',
  `USER_NM_KH` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_명_크메르',
  `USER_PWD_OLD` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_비밀번호_OLD(MD5)',
  `PWD_CREAT_DT` date DEFAULT NULL COMMENT '비밀번호_생성_날짜',
  `PWD_FAIL_CNT` int(11) NOT NULL COMMENT '비밀번호_실패_카운트',
  `USER_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_상태_코드(USER_STS_CD)',
  `WTHDR_REASON` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탈퇴_사유',
  `LAST_LOGIN_DT` date DEFAULT NULL COMMENT '마지막_로그인_날짜',
  `LAST_LOGIN_IP` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '마지막_로그인_아이피',
  `USER_CELL` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_연락처(로그인계정)',
  `USER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_아이디',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `USER_PWD` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_비밀번호_NEW(SHA512)',
  `NEW_PWD_APPLY_YN` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '신규_비밀번호_적용_여부_YN',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `WTHDR_REASON_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탈퇴_사유_코드(WTHDR_REASON_CD)',
  `ACCNT_LOCK_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '계정_잠김_상태_코드(ACNT_LOCK_STS_CD)',
  `PRIVATE_INFO_USE_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '개인_정보_사용_동의_여부_YN',
  `SMS_NTCE_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SMS문자_알림_동의_여부_YN',
  `EMAIL_NTCE_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이메일_알림_동의_여부_YN',
  `EMAIL_USER_AUTH_VALUE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일_사용자_인증_값',
  `NID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NID',
  `USER_GRP_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_그룹_코드(USER_GRP_CD)',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `BIRTH` date DEFAULT NULL COMMENT '생년월일',
  `GENDER_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별_코드(GENDER_CD)',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `ADDR_DTL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `INFO_OPEN_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '정보_공개_여부_YN',
  `CONCIL_REQ_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '알선_신청_여부_YN',
  `MEMB_TAC_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원_약관_동의_여부_YN',
  `PRIVATE_INFO_COLLCT_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인_정보_수집_동의_여부_YN',
  `INFO_PROVD_INFO_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '정보_제공_안내_동의_여부_YN',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `MNG_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관리자_아이디',
  `MNG_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관리자_여부',
  `USER_NM_EN` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_명_영어',
  `JOBSK_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구직_상태_코드',
  `DORMANCY_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴면_여부',
  `SMS_EMAIL_AUTH_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SMS_이메일_인증_구분_코드',
  `AUTH_CMPLT_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인증_완료_여부_YN',
  `JOIN_ROUTE_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '가입_경로_구분_코드',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  `USER_TEL` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_전화번호',
  `NEA_JC_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NEA_JOB_CENTER_구분_코드',
  `NON_NEA_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT 'NON NEA 여',
  `JOBSK_STS_DT` datetime DEFAULT NULL COMMENT '구직_상태_날짜',
  `WORK_RETIRE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '재직_퇴직_코드',
  PRIMARY KEY (`USER_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_사용자';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_USER_CHG 구조 내보내기
DROP TABLE IF EXISTS `CPES_USER_CHG`;
CREATE TABLE IF NOT EXISTS `CPES_USER_CHG` (
  `USER_CHG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '회원_변경_시퀀스',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `CHG_REASON` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '변경_사유',
  `CHG_AGREE_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '변경_승인_상태_코드',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `CHG_PREV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '변경_이전_코드(USER_AUTH_CD)',
  `CHG_NEXT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '변경_이후_코드(USER_AUTH_CD)',
  `STS_CHG_DT` datetime DEFAULT NULL COMMENT '상태_변경_날짜',
  `AGREE_REJECT_REASON` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인_거부_사유',
  `USER_EMAIL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자이메일',
  PRIMARY KEY (`USER_CHG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_회원_변경';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_USER_LOG 구조 내보내기
DROP TABLE IF EXISTS `CPES_USER_LOG`;
CREATE TABLE IF NOT EXISTS `CPES_USER_LOG` (
  `USER_AUTH_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_권한_코드(USER_AUTH_CD)',
  `USER_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_이메일(로그인계정)',
  `USER_NM_KH` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_명_크메르',
  `USER_PWD_OLD` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_비밀번호_OLD(MD5)',
  `PWD_CREAT_DT` date DEFAULT NULL COMMENT '비밀번호_생성_날짜',
  `PWD_FAIL_CNT` int(11) NOT NULL COMMENT '비밀번호_실패_카운트',
  `USER_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_상태_코드(USER_STS_CD)',
  `WTHDR_REASON` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탈퇴_사유',
  `LAST_LOGIN_DT` date DEFAULT NULL COMMENT '마지막_로그인_날짜',
  `LAST_LOGIN_IP` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '마지막_로그인_아이피',
  `USER_CELL` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_연락처(로그인계정)',
  `USER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_아이디',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_시퀀스',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `USER_PWD` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_비밀번호_NEW(SHA512)',
  `NEW_PWD_APPLY_YN` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '신규_비밀번호_적용_여부_YN',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `WTHDR_REASON_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탈퇴_사유_코드(WTHDR_REASON_CD)',
  `ACCNT_LOCK_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '계정_잠김_상태_코드(ACNT_LOCK_STS_CD)',
  `PRIVATE_INFO_USE_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '개인_정보_사용_동의_여부_YN',
  `SMS_NTCE_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SMS문자_알림_동의_여부_YN',
  `EMAIL_NTCE_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이메일_알림_동의_여부_YN',
  `EMAIL_USER_AUTH_VALUE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일_사용자_인증_값',
  `NID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NID',
  `USER_GRP_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_그룹_코드(USER_GRP_CD)',
  `FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일_그룹_시퀀스',
  `BIRTH` date DEFAULT NULL COMMENT '생년월일',
  `GENDER_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별_코드(GENDER_CD)',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `ADDR_DTL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_상세',
  `INFO_OPEN_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '정보_공개_여부_YN',
  `CONCIL_REQ_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '알선_신청_여부_YN',
  `MEMB_TAC_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원_약관_동의_여부_YN',
  `PRIVATE_INFO_COLLCT_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인_정보_수집_동의_여부_YN',
  `INFO_PROVD_INFO_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '정보_제공_안내_동의_여부_YN',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `MNG_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관리자_아이디',
  `MNG_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관리자_여부',
  `USER_NM_EN` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_명_영어',
  `JOBSK_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구직_상태_코드',
  `DORMANCY_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴면_여부',
  `SMS_EMAIL_AUTH_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SMS_이메일_인증_구분_코드',
  `AUTH_CMPLT_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인증_완료_여부_YN',
  `JOIN_ROUTE_DIV_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '가입_경로_구분_코드',
  `DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제_여부',
  `USER_LOG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_로그_시퀀스',
  PRIMARY KEY (`USER_LOG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_사용자_로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_USER_MENU 구조 내보내기
DROP TABLE IF EXISTS `CPES_USER_MENU`;
CREATE TABLE IF NOT EXISTS `CPES_USER_MENU` (
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `MENU_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴_코드(MENU_CD)',
  `REG_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `PRI_PROGRAM_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표_여부',
  PRIMARY KEY (`USER_SEQ`,`MENU_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_사용자_메뉴';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_USER_MENU_BAK 구조 내보내기
DROP TABLE IF EXISTS `CPES_USER_MENU_BAK`;
CREATE TABLE IF NOT EXISTS `CPES_USER_MENU_BAK` (
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  `MENU_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴_코드(MENU_CD)',
  `REG_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `PRI_PROGRAM_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표_여부',
  PRIMARY KEY (`USER_SEQ`,`MENU_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_사용자_메뉴';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_USER_PROGRAM 구조 내보내기
DROP TABLE IF EXISTS `CPES_USER_PROGRAM`;
CREATE TABLE IF NOT EXISTS `CPES_USER_PROGRAM` (
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MENU_PROGRAM_MAP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL,
  `PROGRAM_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRI_PROGRAM_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자 프로그램 권한';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_USER_PROGRAM_BAK 구조 내보내기
DROP TABLE IF EXISTS `CPES_USER_PROGRAM_BAK`;
CREATE TABLE IF NOT EXISTS `CPES_USER_PROGRAM_BAK` (
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MENU_PROGRAM_MAP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL,
  `PROGRAM_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRI_PROGRAM_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자 프로그램 권한';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_USER_WTHDR_REQ 구조 내보내기
DROP TABLE IF EXISTS `CPES_USER_WTHDR_REQ`;
CREATE TABLE IF NOT EXISTS `CPES_USER_WTHDR_REQ` (
  `USER_WTHDR_REQ_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '회원_탈퇴_요청_시퀀스',
  `WTHDR_REASON` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탈퇴_사유',
  `WTHDR_REQ_DT` datetime DEFAULT NULL COMMENT '탈퇴_요청_날짜',
  `AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인_여부_YN',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자_시퀀스',
  PRIMARY KEY (`USER_WTHDR_REQ_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_회원_탈퇴_요청';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY` (
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스',
  `VACANCY_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_아이디',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `COMPNY_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_아이디',
  `VACANCY_TITLE` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_제목',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드(ISCO_CD)',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `WORK_BGN_DT` date DEFAULT NULL COMMENT '근무_시작_날짜',
  `RECRUMT_DIFFCLT_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모집_어려움_여부_YN',
  `DIFFCLT_REASON` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '어려움_사유',
  `EMPLOY_FORM_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_형태_코드(EMPLOY_FROM_CD)',
  `EMPLOY_CTRCT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_계약_코드(EMPLOY_CRTCT_CD)',
  `EMPLOY_CTRCT_DURA` int(11) DEFAULT NULL COMMENT '고용_계약_기간',
  `EMPLOY_CTRCT_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_계약_유형_코드(EMPLOY_CRTCT_TYPE_CD)',
  `WORK_HOUR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시간_코드(WORK_TIME_CD)',
  `WORK_MORN_BGN_TIME` time DEFAULT NULL COMMENT '근무_오전_시작_시간',
  `WORK_MORN_END_TIME` time DEFAULT NULL COMMENT '근무_오전_종료_시간',
  `WORK_AFTERNN_BGN_TIME` time DEFAULT NULL COMMENT '근무_오후_시작_시간',
  `WORK_AFTERNN_END_TIME` time DEFAULT NULL COMMENT '근무_오후_종료_시간',
  `WORK_NIGHT_BGN_TIME` time DEFAULT NULL COMMENT '근무_야간_시작_시간',
  `WORK_NIGHT_END_TIME` time DEFAULT NULL COMMENT '근무_야간_종료_시간',
  `DAY_WORK_TIME` int(11) DEFAULT NULL COMMENT '하루_근무_시간',
  `WEEK_WORK_DAY` int(11) DEFAULT NULL COMMENT '주간_근무_하루',
  `NIGHT_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '야간_근무_여부_YN',
  `NIGHT_WORK_SPEC` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '야간_근무_사양',
  `HLDAY_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공휴일_근무_여부_YN',
  `OVER_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '초과_근무_여부_YN',
  `FLEX_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탄력_근무_여부_YN',
  `PROBT_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '견습_여부_YN',
  `PROBT_DURA` int(11) DEFAULT NULL COMMENT '견습_기간',
  `TRNNG_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '훈련_여부_YN',
  `TRNNG_DURA` int(11) DEFAULT NULL COMMENT '훈련_기간',
  `MIN_SALARY_AMT` decimal(10,2) DEFAULT NULL COMMENT '최저_급여_금액',
  `MAX_SALARY_AMT` decimal(10,2) DEFAULT NULL COMMENT '최고_급여_금액',
  `SALARY_UNIT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '급여_단위_코드(SALARY_UNIT_CD)',
  `NSSF_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NSSF_YN',
  `ETC_INSU_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기타_보험_여부_YN',
  `ETC_INSU_SPEC` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기타_보험_사양',
  `MIN_EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소_교육_정도_코드(EDU_DEGREE_CD)',
  `ISCED_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCED_코드(ISCED_CD)',
  `PRO_LICNS_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전문_자격증_여부_YN',
  `PRO_LICNS_NM` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전문_자격증_명',
  `MIN_WORK_EXP` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소_근무_경험',
  `ISIC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISIC_코드',
  `ETC_WORK_EXP` text COLLATE utf8mb4_unicode_ci COMMENT '기타_근무_경험',
  `ETC_SKILL_REQ` text COLLATE utf8mb4_unicode_ci COMMENT '기타_능력_요구',
  `ETC_PREF` text COLLATE utf8mb4_unicode_ci COMMENT '기타_우대',
  `JOB_DESC` text COLLATE utf8mb4_unicode_ci COMMENT '직업_기술',
  `RECPT_METHOD` text COLLATE utf8mb4_unicode_ci COMMENT '접수_방법',
  `EMPLOYER_SIGN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용주_서명',
  `VACANCY_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_상태_코드(VACANCY_STS_CD)',
  `JC_MOD_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_수정_사용자_시퀀스',
  `JC_MOD_DT` datetime DEFAULT NULL COMMENT 'JOB_CENTER_수정_날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_시퀀스',
  `LANG_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_코드(LANG_CD)',
  `VIDEO_INTVW_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '영상_면접_여부_YN',
  `VACANCY_CERT_NO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_인증_번호',
  `INTERN_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인턴_여부_YN',
  `BKMK_CNT` int(11) NOT NULL COMMENT '북마크_카운트',
  `JC_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_승인_여부_YN',
  `BGN_DT` datetime DEFAULT NULL COMMENT '시작_날짜',
  `RECRUMT_MEMB` int(11) DEFAULT NULL COMMENT '모집_인원',
  `SPOT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '직위',
  `VACANCY_CLOSE_DT` datetime DEFAULT NULL COMMENT '구인_마감_날짜',
  `VIEW_CNT` int(11) DEFAULT NULL COMMENT '조회_수',
  `WORK_EXPLN` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '업무설명',
  `RSPNSB` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '책임',
  `DUTY` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '의무',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `VACANCY_KEYWORD` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_키워드',
  `VACANCY_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_형태_코드',
  `PREFER_EMPLOYMT_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_유형_코드(PREFER_EMPLOYMT_TYPE_CD)',
  `EXPCT_SALARY_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기본_급여_코드',
  `NSSF_SPEC` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NSSF_사양',
  `RECRUMT_JOB_REF_KNOW` text COLLATE utf8mb4_unicode_ci COMMENT '모집_직종_관련_지',
  `RECRUMT_JOB_REF_BASIC_SKILL` text COLLATE utf8mb4_unicode_ci COMMENT '모집_직정_관련_기본_깃',
  `RECRUMT_JOB_REF_WORK_NEED_ITEM` text COLLATE utf8mb4_unicode_ci COMMENT '모집_직종_관련_업무_필요_항',
  `ETC` text COLLATE utf8mb4_unicode_ci COMMENT '기타',
  `MNGER_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_명',
  `MNGER_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_이메일',
  `MNGER_CELL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_연락',
  `IMG_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지_파일_그룹_시퀀',
  `RESUME_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이렧서_파일_그룹_시퀀스',
  `JC_AGREE_STS_CD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인상태코드',
  `JC_AGREE_DT` datetime DEFAULT NULL COMMENT '승인일시',
  `MIN_EDU_DEGREE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소_교육_정도_여',
  `MIN_WORK_EXP_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소_근무_경험_여',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭여_여',
  `AGREE_REJECT_REASON` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인_거절_사유(미승인사유)',
  PRIMARY KEY (`VACANCY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_ITEM_WEIGHT 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_ITEM_WEIGHT`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_ITEM_WEIGHT` (
  `VACANCY_ITEM_WEIGHT_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_항목_가중치_시퀀스',
  `ITEM1` int(11) DEFAULT NULL COMMENT '항목1',
  `ITEM2` int(11) DEFAULT NULL COMMENT '항목2',
  `ITEM3` int(11) DEFAULT NULL COMMENT '항목3',
  `ITEM4` int(11) DEFAULT NULL COMMENT '항목4',
  `ITEM5` int(11) DEFAULT NULL COMMENT '항목5',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  PRIMARY KEY (`VACANCY_ITEM_WEIGHT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_항목_가중치';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_LANG 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_LANG`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_LANG` (
  `VACANCY_LANG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_언어_시퀀스',
  `LANG_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_코드(LANG_CD)',
  `LANG_LVL_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_레벨_코드(LANG_LVL_CD)',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스',
  PRIMARY KEY (`VACANCY_LANG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_언어';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_LANG_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_LANG_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_LANG_TEMP` (
  `VACANCY_LANG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_언어_시퀀스',
  `LANG_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_코드(LANG_CD)',
  `LANG_LVL_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_레벨_코드(LANG_LVL_CD)',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스',
  PRIMARY KEY (`VACANCY_LANG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_언어_임시';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_LOC 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_LOC`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_LOC` (
  `VACANCY_LOC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_지역_시퀀스',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `VACANCY_NO` int(11) DEFAULT NULL COMMENT '구인_번호',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  PRIMARY KEY (`VACANCY_LOC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_지역';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_LOC_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_LOC_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_LOC_TEMP` (
  `VACANCY_LOC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_지역_시퀀스',
  `ADDR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_코드(ADDR_CD)',
  `VACANCY_NO` int(11) DEFAULT NULL COMMENT '구인_번호',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스',
  `ADDR_FULL_CD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_코드',
  `ADDR_FULL_NM` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소_완성_명',
  PRIMARY KEY (`VACANCY_LOC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_지역_임시';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_MATCH_SET 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_MATCH_SET`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_MATCH_SET` (
  `VACANCY_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_맞춤_설정_시퀀스',
  `HOPE_SALARY` int(11) DEFAULT NULL COMMENT '희망_급여',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_시퀀스',
  `MIN_WORK_EXP` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소_근무_경험',
  `WORK_TIME_FULL_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시간_풀_코드',
  `WORK_TIME_PART_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시간_파트_코드',
  `EMPLOY_CTRCT_UNDECID_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_계약_미결정_코드',
  `EMPLOY_CTRCT_DECID_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_계약_고정_코드',
  PRIMARY KEY (`VACANCY_MATCH_SET_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_맞춤_설정';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_MATCH_SET_EDU_DEGREE 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_MATCH_SET_EDU_DEGREE`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_MATCH_SET_EDU_DEGREE` (
  `VACANCY_MATCH_SET_EDU_DEGREE_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_맞춤_설정_학력_시퀀스',
  `MIN_EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소_교육_정도_코드',
  `VACANCY_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_맞춤_설정_시퀀스',
  PRIMARY KEY (`VACANCY_MATCH_SET_EDU_DEGREE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_맞춤_설정_교육_정도';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_MATCH_SET_ISCO 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_MATCH_SET_ISCO`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_MATCH_SET_ISCO` (
  `VACANCY_MATCH_SET_ISCO_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_맞춤_설정_ISCO_시퀀스',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드',
  `VACANCY_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_맞춤_설정_시퀀스',
  PRIMARY KEY (`VACANCY_MATCH_SET_ISCO_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_맞춤_설정_ISCO';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_MATCH_SET_LANG 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_MATCH_SET_LANG`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_MATCH_SET_LANG` (
  `VACANCY_MATCH_SET_LANG_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_맞춤_설정_언어_시퀀스',
  `LANG_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_코드',
  `VACANCY_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_맞춤_설정_시퀀스',
  PRIMARY KEY (`VACANCY_MATCH_SET_LANG_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_맞춤_설정_언어';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_MATCH_SET_LOC 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_MATCH_SET_LOC`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_MATCH_SET_LOC` (
  `VACANCY_MATCH_SET_LOC_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_맞춤_설정_지역_시퀀스',
  `VACANCY_MATCH_SET_LOC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_맞춤_설정_지역_코드',
  `VACANCY_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_맞춤_설정_시퀀스',
  PRIMARY KEY (`VACANCY_MATCH_SET_LOC_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_맞춤_설정_지역';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_MATCH_SET_PREFERNT_COND 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_MATCH_SET_PREFERNT_COND`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_MATCH_SET_PREFERNT_COND` (
  `VACANCY_MATCH_SET_PREFERNT_COND_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_맞춤_설정_우대_조건_시퀀스',
  `PREFERNT_COND_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우대_조건_코드',
  `VACANCY_MATCH_SET_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_맞춤_설정_시퀀스',
  PRIMARY KEY (`VACANCY_MATCH_SET_PREFERNT_COND_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_맞춤_설정_우대_조건';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_PREFERNT_COND 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_PREFERNT_COND`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_PREFERNT_COND` (
  `VACANCY_PREFERNT_COND_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_우대_조건_시퀀스',
  `PREFERNT_COND_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우대_조건_코드',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_우대_조건';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_PREFERNT_COND_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_PREFERNT_COND_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_PREFERNT_COND_TEMP` (
  `VACANCY_PREFERNT_COND_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_우대_조건_시퀀스',
  `PREFERNT_COND_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우대_조건_코드',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime DEFAULT NULL COMMENT '수정_날짜',
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_우대_조건_임시';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_TEMP` (
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스',
  `VACANCY_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_아이디',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_코드(JC_CD)',
  `JC_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_사용자_시퀀스',
  `COMPNY_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_아이디',
  `VACANCY_TITLE` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_제목',
  `ISCO_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCO_코드(ISCO_CD)',
  `END_DT` date DEFAULT NULL COMMENT '종료_날짜',
  `WORK_BGN_DT` date DEFAULT NULL COMMENT '근무_시작_날짜',
  `RECRUMT_DIFFCLT_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모집_어려움_여부_YN',
  `DIFFCLT_REASON` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '어려움_사유',
  `EMPLOY_FORM_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_형태_코드(EMPLOY_FROM_CD)',
  `EMPLOY_CTRCT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_계약_코드(EMPLOY_CRTCT_CD)',
  `EMPLOY_CTRCT_DURA` int(11) DEFAULT NULL COMMENT '고용_계약_기간',
  `EMPLOY_CTRCT_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_계약_유형_코드(EMPLOY_CRTCT_TYPE_CD)',
  `WORK_HOUR_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '근무_시간_코드(WORK_TIME_CD)',
  `WORK_MORN_BGN_TIME` time DEFAULT NULL COMMENT '근무_오전_시작_시간',
  `WORK_MORN_END_TIME` time DEFAULT NULL COMMENT '근무_오전_종료_시간',
  `WORK_AFTERNN_BGN_TIME` time DEFAULT NULL COMMENT '근무_오후_시작_시간',
  `WORK_AFTERNN_END_TIME` time DEFAULT NULL COMMENT '근무_오후_종료_시간',
  `WORK_NIGHT_BGN_TIME` time DEFAULT NULL COMMENT '근무_야간_시작_시간',
  `WORK_NIGHT_END_TIME` time DEFAULT NULL COMMENT '근무_야간_종료_시간',
  `DAY_WORK_TIME` int(11) DEFAULT NULL COMMENT '하루_근무_시간',
  `WEEK_WORK_DAY` int(11) DEFAULT NULL COMMENT '주간_근무_하루',
  `NIGHT_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '야간_근무_여부_YN',
  `NIGHT_WORK_SPEC` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '야간_근무_사양',
  `HLDAY_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공휴일_근무_여부_YN',
  `OVER_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '초과_근무_여부_YN',
  `FLEX_WORK_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탄력_근무_여부_YN',
  `PROBT_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '견습_여부_YN',
  `PROBT_DURA` int(11) DEFAULT NULL COMMENT '견습_기간',
  `TRNNG_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '훈련_여부_YN',
  `TRNNG_DURA` int(11) DEFAULT NULL COMMENT '훈련_기간',
  `MIN_SALARY_AMT` decimal(10,2) DEFAULT NULL COMMENT '최저_급여_금액',
  `MAX_SALARY_AMT` decimal(10,2) DEFAULT NULL COMMENT '최고_급여_금액',
  `SALARY_UNIT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '급여_단위_코드(SALARY_UNIT_CD)',
  `NSSF_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NSSF_YN',
  `ETC_INSU_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기타_보험_여부_YN',
  `ETC_INSU_SPEC` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기타_보험_사양',
  `MIN_EDU_DEGREE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소_교육_정도_코드(EDU_DEGREE_CD)',
  `ISCED_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISCED_코드(ISCED_CD)',
  `PRO_LICNS_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전문_자격증_여부_YN',
  `PRO_LICNS_NM` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전문_자격증_명',
  `MIN_WORK_EXP` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소_근무_경험',
  `ISIC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISIC_코드',
  `ETC_WORK_EXP` text COLLATE utf8mb4_unicode_ci COMMENT '기타_근무_경험',
  `ETC_SKILL_REQ` text COLLATE utf8mb4_unicode_ci COMMENT '기타_능력_요구',
  `ETC_PREF` text COLLATE utf8mb4_unicode_ci COMMENT '기타_우대',
  `JOB_DESC` text COLLATE utf8mb4_unicode_ci COMMENT '직업_기술',
  `RECPT_METHOD` text COLLATE utf8mb4_unicode_ci COMMENT '접수_방법',
  `EMPLOYER_SIGN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용주_서명',
  `VACANCY_STS_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_상태_코드(VACANCY_STS_CD)',
  `JC_MOD_USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_수정_사용자_시퀀스',
  `JC_MOD_DT` datetime DEFAULT NULL COMMENT 'JOB_CENTER_수정_날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기업_시퀀스',
  `LANG_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어_코드(LANG_CD)',
  `VIDEO_INTVW_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '영상_면접_여부_YN',
  `VACANCY_CERT_NO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_인증_번호',
  `INTERN_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인턴_여부_YN',
  `BKMK_CNT` int(11) NOT NULL COMMENT '북마크_카운트',
  `JC_AGREE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JOB_CENTER_승인_여부_YN',
  `BGN_DT` datetime DEFAULT NULL COMMENT '시작_날짜',
  `RECRUMT_MEMB` int(11) DEFAULT NULL COMMENT '모집_인원',
  `SPOT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '직위',
  `VACANCY_CLOSE_DT` datetime DEFAULT NULL COMMENT '구인_마감_날짜',
  `VIEW_CNT` int(11) DEFAULT NULL COMMENT '조회_수',
  `WORK_EXPLN` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '업무설명',
  `RSPNSB` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '책임',
  `DUTY` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '의무',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용_여부',
  `VACANCY_KEYWORD` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_키워드',
  `VACANCY_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구인_형태_코드',
  `PREFER_EMPLOYMT_TYPE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고용_유형_코드(PREFER_EMPLOYMT_TYPE_CD)',
  `EXPCT_SALARY_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기본_급여_코드',
  `NSSF_SPEC` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NSSF_사양',
  `RECRUMT_JOB_REF_KNOW` text COLLATE utf8mb4_unicode_ci COMMENT '모집_직종_관련_지',
  `RECRUMT_JOB_REF_BASIC_SKILL` text COLLATE utf8mb4_unicode_ci COMMENT '모집_직정_관련_기본_깃',
  `RECRUMT_JOB_REF_WORK_NEED_ITEM` text COLLATE utf8mb4_unicode_ci COMMENT '모집_직종_관련_업무_필요_항',
  `ETC` text COLLATE utf8mb4_unicode_ci COMMENT '기타',
  `MNGER_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_명',
  `MNGER_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_이메일',
  `MNGER_CELL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자_연락',
  `IMG_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지_파일_그룹_시퀀',
  `RESUME_FILE_GRP_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이렧서_파일_그룹_시퀀스',
  `JC_AGREE_STS_CD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인상태코드',
  `JC_AGREE_DT` datetime DEFAULT NULL COMMENT '승인일시',
  `MIN_EDU_DEGREE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소_교육_정도_여',
  `MIN_WORK_EXP_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소_근무_경험_여',
  PRIMARY KEY (`VACANCY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_WAGE 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_WAGE`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_WAGE` (
  `VACANCY_WAGE_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_임금_시퀀스',
  `WAGE_UNIT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '임금_단위_코드(WAGE_UNIT_CD)',
  `MIN_WAGE` double(10,5) DEFAULT NULL COMMENT '최저_임금',
  `MAX_WAGE` double(10,5) DEFAULT NULL COMMENT '최고_임금',
  `TIME_UNIT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시간_단위_코드(TIME_UNIT_CD)',
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`VACANCY_WAGE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_임금';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VACANCY_WAGE_TEMP 구조 내보내기
DROP TABLE IF EXISTS `CPES_VACANCY_WAGE_TEMP`;
CREATE TABLE IF NOT EXISTS `CPES_VACANCY_WAGE_TEMP` (
  `VACANCY_WAGE_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_임금_시퀀스',
  `WAGE_UNIT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '임금_단위_코드(WAGE_UNIT_CD)',
  `MIN_WAGE` double(10,5) DEFAULT NULL COMMENT '최저_임금',
  `MAX_WAGE` double(10,5) DEFAULT NULL COMMENT '최고_임금',
  `TIME_UNIT_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시간_단위_코드(TIME_UNIT_CD)',
  `VACANCY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '구인_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime NOT NULL COMMENT '등록_날짜',
  `MOD_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정_사용자_시퀀스',
  `MOD_DT` datetime NOT NULL COMMENT '수정_날짜',
  PRIMARY KEY (`VACANCY_WAGE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_구인_임금';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VIDEO_INTVW_HOLIDAY 구조 내보내기
DROP TABLE IF EXISTS `CPES_VIDEO_INTVW_HOLIDAY`;
CREATE TABLE IF NOT EXISTS `CPES_VIDEO_INTVW_HOLIDAY` (
  `VIDEO_INTVW_HOLIDAY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '영상_면접_휴일_시퀀스',
  `JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JOB_CENTER_코드',
  `DT` date DEFAULT NULL COMMENT '날짜',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `EXPLN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설명',
  PRIMARY KEY (`VIDEO_INTVW_HOLIDAY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_영상_면접_휴일';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.CPES_VIDEO_INTVW_PATCPTN 구조 내보내기
DROP TABLE IF EXISTS `CPES_VIDEO_INTVW_PATCPTN`;
CREATE TABLE IF NOT EXISTS `CPES_VIDEO_INTVW_PATCPTN` (
  `VIDEO_INTVW_PATCPTN_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '영상_면접_참여_시퀀스',
  `JOBSK_JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구직자_JOB_CENTER_코드',
  `VIDEO_TIME_TABLE_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '영상_면접_시간_코드',
  `VIDEO_INTVW_DT` date DEFAULT NULL COMMENT '영상_면접_날짜',
  `COMPNY_JC_CD` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_JOB_CENTER_코드',
  `COMPNY_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기업_시퀀스',
  `USER_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자_시퀀스',
  `REG_USER_SEQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록_사용자_시퀀스',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록_날짜',
  `INTVW_SEQ` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '면접_시퀀스'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CPES_영상_면접_참여';

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 함수 cpes_dev.FN_GET_ADDR_CD_BY_JC_CD 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_ADDR_CD_BY_JC_CD`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_ADDR_CD_BY_JC_CD`(IN_ADDR_FULL_CD VARCHAR(100)) RETURNS varchar(13) CHARSET utf8mb4
BEGIN
  #IN_ADDR_FULL_CD ex) '101,10104,1010402,101040202'
  DECLARE RET_VAL VARCHAR(13);
  
  SELECT A.JC_CD INTO  RET_VAL
  FROM CPES_JC_ADDR_MAPNG A 
  WHERE A.PROVINCE_ID = SUBSTRING(IN_ADDR_FULL_CD,1,3)
  AND A.DISTRICT_ID = SUBSTRING(IN_ADDR_FULL_CD,5,5);

	RETURN	RET_VAL;

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_ADDR_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_ADDR_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_ADDR_NM`(IN_ADDR_CD VARCHAR(36),IN_LVL VARCHAR(1), IN_LANG_CD VARCHAR(3)) RETURNS varchar(255) CHARSET utf8mb4
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_ADDR_NM_BY_EDU_TRNNG 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_ADDR_NM_BY_EDU_TRNNG`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_ADDR_NM_BY_EDU_TRNNG`(IN_EDU_TRNNG_SEQ VARCHAR(40), IN_LANG_CD VARCHAR(3)) RETURNS varchar(1000) CHARSET utf8mb4
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_AGE_BY_DATE 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_AGE_BY_DATE`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_AGE_BY_DATE`( P_DATE DATETIME) RETURNS int(11)
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

END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_APPLIC_STAT_CNT 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_APPLIC_STAT_CNT`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_APPLIC_STAT_CNT`(IN_VACANCY_SEQ VARCHAR(40), IN_APPLIC_PROC_CD VARCHAR(13)) RETURNS int(11)
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_BASE_DATE_CHAR 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_BASE_DATE_CHAR`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_BASE_DATE_CHAR`(P_DATE datetime, P_LANG VARCHAR(2)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
	
  DECLARE V_RTNVAL            VARCHAR(20);
  
  SET V_RTNVAL = CASE WHEN P_LANG = 'KR' THEN DATE_FORMAT(P_DATE, '%Y/%m/%d') ELSE DATE_FORMAT(P_DATE, '%d/%m/%Y') END;
  
	RETURN V_RTNVAL;
  
END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_BASE_DATE_TIME 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_BASE_DATE_TIME`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_BASE_DATE_TIME`(P_DATE datetime, P_FM VARCHAR(10), P_LANG VARCHAR(2)) RETURNS varchar(25) CHARSET utf8mb4
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
  
END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_BKMK_SEQ 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_BKMK_SEQ`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_BKMK_SEQ`(IN_USER_SEQ VARCHAR(36), IN_TYPE VARCHAR(20), IN_TABLE_SEQ VARCHAR(36)) RETURNS varchar(40) CHARSET utf8mb4
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_BKMK_YN 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_BKMK_YN`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_BKMK_YN`(IN_USER_SEQ VARCHAR(36), IN_TYPE VARCHAR(20), IN_TABLE_SEQ VARCHAR(36)) RETURNS varchar(1) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_COMMON_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_COMMON_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_COMMON_NM`(IN_GRP_CD VARCHAR(30), IN_DTL_CD VARCHAR(13), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_COMPNY_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_COMPNY_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_COMPNY_NM`(IN_COMPNY_SEQ VARCHAR(36), IN_LANG_CD VARCHAR(3)) RETURNS varchar(255) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(255);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN COMPNY_NM_KH
         ELSE COMPNY_NM_EN
         END AS COMPNY_NM
         INTO  RET_VAL
  FROM CPES_COMPNY
  WHERE COMPNY_SEQ = IN_COMPNY_SEQ;

	RETURN	RET_VAL;

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_CONVRT_MSG 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_CONVRT_MSG`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_CONVRT_MSG`(P_MSG_CD VARCHAR(10), P_VAL VARCHAR(10)) RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
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

END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_EDU_CONVERSION 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_EDU_CONVERSION`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_EDU_CONVERSION`(IN_EDU_PARAM VARCHAR(13)) RETURNS varchar(13) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
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


END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_FAIR_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_FAIR_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_FAIR_NM`(IN_FAIR_SEQ VARCHAR(36), IN_LANG_CD VARCHAR(3)) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
  DECLARE RET_VAL VARCHAR(255);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN FAIR_NM_KH
         ELSE FAIR_NM_EN
         END AS FAIR_NM
         INTO  RET_VAL
  FROM CPES_FAIR_MST
  WHERE FAIR_SEQ = IN_FAIR_SEQ;

	RETURN	RET_VAL;

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_FILE_PATH 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_FILE_PATH`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_FILE_PATH`(
	`FILE_SEQ` VARCHAR(50)

) RETURNS varchar(5000) CHARSET utf8mb4
    COMMENT '저장된 파일 경로 조회'
BEGIN

	DECLARE FILE_PATH VARCHAR(500);
	
	SELECT AF.SAVE_FILE_PATH INTO FILE_PATH
	FROM CPES_ATTACH_FILES AF
	WHERE AF.FILE_SEQ = FILE_SEQ;
	
	RETURN FILE_PATH;

END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_INSTT_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_INSTT_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_INSTT_NM`(IN_INSTT_SEQ VARCHAR(36), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN INSTT_NM_KH
         ELSE INSTT_NM_EN
         END AS INSTT_NM
         INTO  RET_VAL
  FROM CPES_INSTT
  WHERE INSTT_SEQ = IN_INSTT_SEQ;

	RETURN	RET_VAL;

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_ISCED_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_ISCED_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_ISCED_NM`(IN_ISCED_CD VARCHAR(30), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN KH_NM
         ELSE EN_NM
         END AS CD_NM
         INTO  RET_VAL
  FROM CPES_ISCED_CD
  WHERE ISCED_CD = IN_ISCED_CD;

	RETURN	RET_VAL;

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_ISCO_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_ISCO_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_ISCO_NM`(IN_ISCO_CD VARCHAR(30), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN KH_NM
         ELSE EN_NM
         END AS CD_NM
         INTO  RET_VAL
  FROM CPES_ISCO_CD
  WHERE ISCO_CD = IN_ISCO_CD;

	RETURN	RET_VAL;

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_ISIC_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_ISIC_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_ISIC_NM`(IN_ISIC_CD VARCHAR(30), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN KH_NM
         ELSE EN_NM
         END AS CD_NM
         INTO  RET_VAL
  FROM CPES_ISIC_CD
  WHERE ISIC_CD = IN_ISIC_CD;

	RETURN	RET_VAL;

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_JOB_CNTR_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_JOB_CNTR_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_JOB_CNTR_NM`(IN_JC_CD VARCHAR(13), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN JC_KH
         ELSE JC_EN
         END AS JC_NM
         INTO  RET_VAL
  FROM CPES_JOB_CENTER
  WHERE JC_CD = IN_JC_CD;

	RETURN	RET_VAL;

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_LIKE_YN 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_LIKE_YN`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_LIKE_YN`(IN_USER_SEQ VARCHAR(36), IN_TYPE VARCHAR(20), IN_TABLE_SEQ VARCHAR(36)) RETURNS varchar(1) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_MASKING_DISPLAY_YN 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_MASKING_DISPLAY_YN`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_MASKING_DISPLAY_YN`(IN_APPLIC_SEQ VARCHAR(40)) RETURNS varchar(1) CHARSET utf8mb4
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_MASKING_DISPLAY_YN2 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_MASKING_DISPLAY_YN2`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_MASKING_DISPLAY_YN2`(IN_VACANCY_SEQ VARCHAR(40), IN_USER_SEQ VARCHAR(40)) RETURNS varchar(1) CHARSET utf8mb4
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

	

END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_MATCH_EDU_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_MATCH_EDU_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_MATCH_EDU_NM`(IN_EDU_PARAM VARCHAR(13), IN_MATCH_PARAM VARCHAR(13)) RETURNS varchar(13) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
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


END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_MATCH_EDU_POINT 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_MATCH_EDU_POINT`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_MATCH_EDU_POINT`(IN_EDU_PARAM VARCHAR(13), IN_MATCH_PARAM VARCHAR(13)) RETURNS int(3)
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



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_MATCH_LOC_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_MATCH_LOC_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_MATCH_LOC_NM`(IN_PROVINCE_PARAM VARCHAR(20), IN_DISTRICT_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(100)) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_MATCH_LOC_POINT 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_MATCH_LOC_POINT`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_MATCH_LOC_POINT`(IN_PROVINCE_PARAM VARCHAR(20), IN_DISTRICT_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(100)) RETURNS int(3)
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_MATCH_OCCU_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_MATCH_OCCU_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_MATCH_OCCU_NM`(IN_ONE_PARAM VARCHAR(20), IN_TOW_PARAM VARCHAR(20),IN_THREE_PARAM VARCHAR(20),IN_FOUR_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(20)) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_MATCH_OCCU_POINT 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_MATCH_OCCU_POINT`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_MATCH_OCCU_POINT`(IN_ONE_PARAM VARCHAR(20), IN_TOW_PARAM VARCHAR(20),IN_THREE_PARAM VARCHAR(20),IN_FOUR_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(20)) RETURNS int(3)
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_MATCH_WAGE_NM 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_MATCH_WAGE_NM`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_MATCH_WAGE_NM`(IN_WAGE_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(100)) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_MATCH_WAGE_POINT 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_MATCH_WAGE_POINT`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_MATCH_WAGE_POINT`(IN_WAGE_PARAM VARCHAR(20), IN_MATCH_PARAM VARCHAR(100)) RETURNS int(3)
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

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_NEW_YN 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_NEW_YN`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_NEW_YN`(IN_REG_DT DATETIME) RETURNS varchar(1) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(1);

  SELECT IF(DATE_SUB(NOW(), INTERVAL 10 DAY) <= IN_REG_DT, 'Y', 'N') AS NEW_YN
         INTO  RET_VAL
  FROM DUAL;

	RETURN	RET_VAL;

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_REMAIN_CNT 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_REMAIN_CNT`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_REMAIN_CNT`(I_DT date) RETURNS int(5)
BEGIN
	
  DECLARE V_RTNVAL            INT(5);
  
  SET V_RTNVAL =  CASE WHEN TIMESTAMPDIFF(HOUR,NOW(),I_DT) >= 24 THEN DATEDIFF(I_DT,NOW()) ELSE TIMESTAMPDIFF(HOUR,NOW(),I_DT) END;
                      
  
	RETURN V_RTNVAL;
  
END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_REMAIN_DIV 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_REMAIN_DIV`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_REMAIN_DIV`(I_DT date) RETURNS varchar(5) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
	
  DECLARE V_RTNVAL            VARCHAR(5);
  
  SET V_RTNVAL = CASE WHEN TIMESTAMPDIFF(HOUR,NOW(),I_DT) >= 24 THEN 'day' ELSE 'hurry' END;
                      
  
	RETURN V_RTNVAL;
  
END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_STR_TO_DATE 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_STR_TO_DATE`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_STR_TO_DATE`(P_DATE      VARCHAR(10), P_DIV      VARCHAR(1)) RETURNS datetime
BEGIN
  
  DECLARE V_RTNVAL        datetime;
  DECLARE V_STR_DATE      VARCHAR(50);
  
  SET V_STR_DATE = REPLACE(P_DATE, '/', '-'); 
  SET V_STR_DATE = CASE WHEN P_DIV = 'S' THEN CONCAT(V_STR_DATE, ' ', '00:00:00') ELSE CONCAT(V_STR_DATE, ' ', '23:59:59') END;
  SET V_RTNVAL = DATE_FORMAT(STR_TO_DATE(V_STR_DATE, '%d-%m-%Y %H:%i:%S'), '%Y-%m-%d %H:%i:%S');
  
  RETURN V_RTNVAL;
  
END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_USER_AGE 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_USER_AGE`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_USER_AGE`(
	`BIRTH` VARCHAR(50)
) RETURNS int(11)
BEGIN

	DECLARE AGE INT;
	
	SELECT FLOOR((CAST(REPLACE(CURRENT_DATE,'-','') AS UNSIGNED) - CAST(REPLACE(BIRTH,'-','') AS UNSIGNED)) / 10000) INTO AGE;
	
	RETURN AGE;

END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_USER_NM_BY_USER_SEQ 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_USER_NM_BY_USER_SEQ`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_USER_NM_BY_USER_SEQ`(IN_USER_SEQ VARCHAR(36), IN_LANG_CD VARCHAR(3)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(100);

  SELECT CASE WHEN UPPER(IN_LANG_CD) = 'KH' THEN USER_NM_KH
         ELSE USER_NM_EN
         END AS USER_NM
         INTO  RET_VAL
  FROM CPES_USER
  WHERE USER_SEQ = IN_USER_SEQ;

	RETURN	RET_VAL;

	



END//
DELIMITER ;

-- 함수 cpes_dev.FN_GET_UUID_SEQ 구조 내보내기
DROP FUNCTION IF EXISTS `FN_GET_UUID_SEQ`;
DELIMITER //
CREATE DEFINER=`cpes`@`%` FUNCTION `FN_GET_UUID_SEQ`() RETURNS varchar(36) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
  DECLARE RET_VAL VARCHAR(36);

  SELECT REPLACE(UUID(),'-','') INTO  RET_VAL
  FROM DUAL;

	

	RETURN	RET_VAL;

	



END//
DELIMITER ;

-- 테이블 cpes_dev.isced 구조 내보내기
DROP TABLE IF EXISTS `isced`;
CREATE TABLE IF NOT EXISTS `isced` (
  `isced_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_english` varchar(255) DEFAULT NULL,
  `name_khmer` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `level_code` varchar(255) DEFAULT NULL,
  `isced_code` varchar(255) DEFAULT NULL,
  `order` decimal(10,5) DEFAULT NULL,
  `digit_1` varchar(10) DEFAULT NULL,
  `digit_2` varchar(10) DEFAULT NULL,
  `digit_3` varchar(10) DEFAULT NULL,
  `digit_4` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`isced_id`) USING BTREE,
  FULLTEXT KEY `name_english` (`name_english`),
  FULLTEXT KEY `name_khmer` (`name_khmer`),
  FULLTEXT KEY `digit_1` (`digit_1`),
  FULLTEXT KEY `digit_2` (`digit_2`),
  FULLTEXT KEY `digit_3` (`digit_3`),
  FULLTEXT KEY `digit_4` (`digit_4`),
  FULLTEXT KEY `level` (`level`),
  FULLTEXT KEY `level_code` (`level_code`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.isco 구조 내보내기
DROP TABLE IF EXISTS `isco`;
CREATE TABLE IF NOT EXISTS `isco` (
  `isco_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_english` varchar(255) DEFAULT NULL,
  `name_khmer` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `level_code` varchar(255) DEFAULT NULL,
  `isco_code` varchar(255) DEFAULT NULL,
  `definition_english` text,
  `definition_khmer` text,
  `task_include_english` text,
  `task_include_khmer` text,
  `occupation_include_khmer` text,
  `occupation_include_english` text,
  `occupation_exclude_khmer` text,
  `occupation_exclude_english` text,
  `note_khmer` text,
  `note_english` text,
  `status` int(11) DEFAULT NULL,
  `order` decimal(10,5) DEFAULT NULL,
  `keyword` varchar(500) NOT NULL,
  PRIMARY KEY (`isco_id`) USING BTREE,
  FULLTEXT KEY `name_english` (`name_english`),
  FULLTEXT KEY `name_khmer` (`name_khmer`),
  FULLTEXT KEY `isco_code` (`isco_code`),
  FULLTEXT KEY `level` (`level`),
  FULLTEXT KEY `level_code` (`level_code`)
) ENGINE=MyISAM AUTO_INCREMENT=620 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.isic 구조 내보내기
DROP TABLE IF EXISTS `isic`;
CREATE TABLE IF NOT EXISTS `isic` (
  `isic_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_english` varchar(255) DEFAULT NULL,
  `name_khmer` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `level_code` varchar(255) DEFAULT NULL,
  `isic_code` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `sec_class` varchar(255) DEFAULT NULL,
  `explanatory_note_exclusion` text,
  `explanatory_note_inclusion` text,
  `s_order` decimal(10,5) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `isic_id_api` int(11) NOT NULL,
  PRIMARY KEY (`isic_id`) USING BTREE,
  FULLTEXT KEY `name_english` (`name_english`),
  FULLTEXT KEY `name_khmer` (`name_khmer`),
  FULLTEXT KEY `level` (`level`),
  FULLTEXT KEY `level_code` (`level_code`)
) ENGINE=MyISAM AUTO_INCREMENT=767 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.jobshop_location 구조 내보내기
DROP TABLE IF EXISTS `jobshop_location`;
CREATE TABLE IF NOT EXISTS `jobshop_location` (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `location_en` varchar(255) DEFAULT NULL,
  `location_kh` varchar(255) DEFAULT NULL,
  `total_job` int(11) DEFAULT NULL,
  PRIMARY KEY (`temp_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.location_app 구조 내보내기
DROP TABLE IF EXISTS `location_app`;
CREATE TABLE IF NOT EXISTS `location_app` (
  `locationID` int(11) NOT NULL,
  `locationNameKh` varchar(255) CHARACTER SET utf8 NOT NULL,
  `locationNameEn` varchar(255) CHARACTER SET utf8 NOT NULL,
  `jcRef` int(11) NOT NULL,
  `mapLatLong` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mapZome` int(11) NOT NULL,
  PRIMARY KEY (`locationID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.nea_job_center_office 구조 내보내기
DROP TABLE IF EXISTS `nea_job_center_office`;
CREATE TABLE IF NOT EXISTS `nea_job_center_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jc_id` int(11) NOT NULL,
  `office_name_english` varchar(255) DEFAULT NULL,
  `office_name_khmer` varchar(266) DEFAULT NULL,
  `address` text,
  `address_khmer` text,
  `contact_no1` varchar(255) DEFAULT NULL,
  `contact_no2` varchar(255) DEFAULT NULL,
  `contact_no3` varchar(255) DEFAULT NULL,
  `contact_no4` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `description` text,
  `let` double NOT NULL,
  `lon` double NOT NULL,
  `description_kh` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 cpes_dev.vacancy 구조 내보내기
DROP TABLE IF EXISTS `vacancy`;
CREATE TABLE IF NOT EXISTS `vacancy` (
  `vacancy_id` int(11) NOT NULL AUTO_INCREMENT,
  `jc_id` int(11) DEFAULT NULL,
  `jc_staff_id` int(11) DEFAULT NULL,
  `employer_id` int(11) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `job_title_isco_id` int(11) DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `working_date` date DEFAULT NULL,
  `difficulty_recruitment` tinyint(1) DEFAULT NULL,
  `difficulty_specify` varchar(512) DEFAULT NULL,
  `form_of_employment_id` int(11) DEFAULT NULL,
  `term_of_employment_contract` tinyint(1) DEFAULT NULL,
  `term_of_employment_contract_duration` int(11) DEFAULT NULL,
  `contract_can_be_id` int(11) DEFAULT NULL,
  `hour_of_work` tinyint(1) DEFAULT NULL,
  `hour_of_work_morning_start_time` time DEFAULT NULL,
  `hour_of_work_morning_end_time` time DEFAULT NULL,
  `hour_of_work_afternoon_start_time` time DEFAULT NULL,
  `hour_of_work_afternoon_end_time` time DEFAULT NULL,
  `hour_of_work_night_start_time` time DEFAULT NULL,
  `hour_of_work_night_end_time` time DEFAULT NULL,
  `hour_of_work_work_hourly` int(11) DEFAULT NULL,
  `hour_of_work_work_daily` int(11) DEFAULT NULL,
  `work_type_night_shift` tinyint(1) DEFAULT NULL,
  `work_type_night_shift_specify` varchar(255) DEFAULT NULL,
  `work_type_work_on_sunday` tinyint(1) DEFAULT NULL,
  `work_type_overtime` tinyint(1) DEFAULT NULL,
  `work_type_flexible_working_time` tinyint(1) DEFAULT NULL,
  `probation` tinyint(1) DEFAULT NULL,
  `probation_duration` int(11) DEFAULT NULL,
  `training` tinyint(1) DEFAULT NULL,
  `training_duration` int(11) DEFAULT NULL,
  `base_wage_min` decimal(10,2) DEFAULT NULL,
  `base_wage_max` decimal(10,2) DEFAULT NULL,
  `base_wage_unit` tinyint(1) DEFAULT NULL,
  `nssf` tinyint(1) DEFAULT NULL,
  `other_insurance` tinyint(1) DEFAULT NULL,
  `other_insurance_specify` varchar(255) DEFAULT NULL,
  `minimum_education_degree_id` int(11) DEFAULT NULL,
  `isced_id` int(11) DEFAULT NULL,
  `professional_license` tinyint(1) DEFAULT NULL,
  `professional_license_name` varchar(255) DEFAULT NULL,
  `minimum_work_experience` int(11) DEFAULT NULL,
  `work_experience_isic_id` int(11) DEFAULT NULL,
  `other_work_experience` text,
  `other_skill_requirement` text,
  `other_preference` text,
  `job_description` text,
  `how_to_apply` text,
  `employer_signature` varchar(255) DEFAULT NULL,
  `post_status` int(1) DEFAULT '0',
  `job_create_date` datetime DEFAULT NULL,
  `job_latest_update` datetime DEFAULT NULL,
  `jc_staff_last_update` int(11) DEFAULT NULL,
  `vacancy_type` int(2) NOT NULL,
  PRIMARY KEY (`vacancy_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=31406 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 내보낼 데이터가 선택되어 있지 않습니다.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
