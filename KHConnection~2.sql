
-- 사용자 계정을 추가하는 명령
create user kh identified by kh;

-- kh 계정에게 접속 및 데이터 생성/삭제/수정/조회 권한 부여
grant connect, resource to kh; 


