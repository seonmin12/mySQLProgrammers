-- 24/33 완료

--lv.1 과일로 만든 아이스크림 고르기
SELECT f.flavor
from first_half f join icecream_info i on f.flavor = i.flavor
where total_order>3000 and ingredient_type = 'fruit_based'
order by total_order desc;


--lv.1 평균 일일 대여 요금 구하기
SELECT ROUND(AVG(daily_fee)) AS average_fee
FROM CAR_RENTAL_COMPANY_CAR
WHERE CAR_TYPE = 'SUV';

-- lv.1 흉부외과 또는 일반외과 의사 목록 출력하기
SELECT dr_name, dr_id, mcdp_cd,DATE_FORMAT(hire_ymd, '%Y-%m-%d') as hire_ymd
from doctor
where mcdp_cd in('CS','GS')
order by hire_ymd desc, dr_name;

-- lv.1 강원도에 위치한 생산공장 목록 출력
SELECT factory_id, factory_name, address
from food_factory
where address like '강원도%'
order by factory_id;

-- lv.1 인기있는 아이스크림
SELECT flavor
from first_half
order by total_order desc, shipment_id;

--lv.1 12세 이하 여자 환자 목록 출력
SELECT pt_name, pt_no, gend_cd, age, ifnull(tlno, 'NONE') as tlno
from patient
where age <=12 and gend_cd = 'w'
order by age desc, pt_name;

-- lv.1 조건에 맞는 도서 리스트 출력
SELECT Book_id, DATE_FORMAT(published_date, '%Y-%m-%d')as published_date
from book
where published_date like '2021%' and
    category like '인문'
order by published_date

--lv.1 조건에 부합하는 중고거래 댓글 조회
SELECT B.TITLE
     , B.BOARD_ID
     , R.REPLY_ID
     , R.WRITER_ID
     , R.CONTENTS
     , DATE_FORMAT(R.CREATED_DATE, '%Y-%m-%d') AS CREATED_DATE
FROM USED_GOODS_BOARD B
         JOIN USED_GOODS_REPLY R
              ON B.BOARD_ID = R.BOARD_ID
WHERE B.CREATED_DATE LIKE '2022-10%'
ORDER BY 6, 1

-- lv.2 3월에 태어난 여성회원 목록 출력
SELECT MEMBER_ID, MEMBER_NAME, GENDER, date_format(DATE_OF_BIRTH, '%Y-%m-%d') as DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE DATE_FORMAT(DATE_OF_BIRTH, '%m') = '03'
  AND GENDER = 'W'
  AND TLNO IS NOT NULL
ORDER BY MEMBER_ID ASC;

-- lv.2 재구매가 일어난 상품과 회원 리스트 구하기
SELECT user_id,product_id
from online_sale
group by user_id, product_id
having count(product_id)>=2
order by user_id asc, product_id desc;

-- lv.1 모든 레코드 조회
SELECT *
FROM animal_ins
order by animal_id

-- lv.1 역순 정렬
SELECT name, datetime
from animal_ins
order by animal_id desc

-- lv.1 아픈 동물 찾기
SELECT animal_id, name
from animal_ins
where intake_condition = 'Sick';

-- lv.1 어린 동물 찾기
SELECT animal_id, name
from animal_ins
where intake_condition not like 'Aged';

-- lv.1 동물의 아이디와 이름
SELECT animal_id, name
from animal_ins
order by animal_id;

-- lv.1 여러 기준으로 정렬
SELECT animal_id, name, datetime
from animal_ins
order by name, datetime desc;

-- lv.1 상위 n개 레코드
SELECT name
from animal_ins
order by datetime
    Limit 1;

-- lv.1 조건에 맞는 회원수 구하기
SELECT count(user_id) as users
from user_info
where joined like '2021%' and
    age between 20 and 29

-- lv.1 phthon 개발자 찾기
select id, email, first_name, last_name
from developer_infos
where skill_1 = 'python' or skill_2 = 'python' or skill_3 = 'python'
order by id;

-- lv.1 잔챙이 잡은 수 구하기
select count(id) as FISH_COUNT
from fish_info
where length is NULL;

-- lv.1 가장 큰 물고기 10마리 구하기
select Id, length
from fish_info
order by length desc, id
    limit 10;

-- lv.2 특정 물고기를 잡은 총 수 구하기
select count(id) as FISH_COUNT
from fish_info i inner join fish_name_info n
on i.fish_type = n.fish_type
where fish_name like'%BASS'or fish_name like'%SNAPPER'

-- lv.1 특정 형질을 가지는 대장균 찾기
select count(id) as COUNT
from ecoli_data
where (genotype&2 = 0) and (genotype & 1 =1 or genotype & 4 = 4);

-- lv.2 부모의 형질을 모두 가지는 대장균 찾기
SELECT
    a.id,
    a.genotype,
    b.genotype as parent_genotype
FROM ecoli_data a
LEFT JOIN ecoli_data b
ON a.parent_id = b.id
WHERE a.genotype & b.genotype = b.genotype
ORDER BY 1;









