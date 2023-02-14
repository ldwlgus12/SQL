# # 나만의 Workbench 활용 가이드
- 우선 `MySQL Workbench`는 `SQL 개발과 관리`, `데이터베이스 설계, 생성 그리고 유지`를 위한 단일 개발 통합 환경을 제공하는 비주얼 데이터 베이스 설계 도구이다. (출처: wikipedia)


### # Workbench 활용 MySQL 접속 방법
- 공식 홈페이지에서 MySQL 다운로드
- 설치 진행하며 사용자 비밀번호 설정과 같은 개인설정 진행
- 설치 완료 후 설치 확인(MySQL Shell과 MySQL Workbench 창이 한꺼번에 뜨면 설치가 정상적으로 완료된 것)
- 이후 MySQL Workbench에 로그인하면 성공 

### # 실습 데이터베이스에 대한 `쿼리(Query)문` 작성 및 쿼리문 실행 방법
- 쿼리의 사전적 의미: `질의`
    - 즉, 여기서 쿼리는 질의를 보내고 결과를 얻는 것으로 보여짐
    - SQL(Structured Query Language)의 약자에 포함



1. 데이터베이스 파일 다운로드 및 확인 
2. MySQL 접속 후 다운로드 한 파일 import
3. import를 성공적으로 마쳤다면 파일이 제대로 import 됐는지 확인
4. 그 후 import한 파일을 선택하여 Query 에디터를 이용해 쿼리문을 입력해준다.
```
[예시]

SELECT * FROM customers;

뜻: customers에서 모든 정보(*)를 선택해라
```
- 만약 pc명이 한글이라 import에 실패한다면?
    - 처음 MySQL 설치 시 installer를 다운로드 하는 것이 아닌 zip파일로 다운로드하여 MySQL의 경로를 직접 지정
    - 그래도 실패한다면 윈도우 계정을 영어로 하나 더 만들어 그 계정으로 작업 실행

### # 그 외
- 쿼리 구문 작성시 표기법 규칙
    - [ ] : 선택적 절
    - ( ) : 리터럴 괄호
    - | : 논리 OR
    - [ , ...] : 안에 있는 쉼표 다음에 오는 줄임표는 앞의 항목이 쉼표로 구분된 목록으로 반복될 수 있음을 의미
- 쿼리 구문
    - `WITH`절, `SELECT`문, `SELECT * REPLACE`, `SELECT DISTINCT`, `FROM`절, `JOIN` 작업 등
- SQL 데이터 유형
    - null 허용 데이터 유형
    - 정렬 간으한 데이터 유형
    - 그룹화 가능한 데이터 유형
    - 비교 가능한 데이터 유형 등
- (출처: Google Cloud)
