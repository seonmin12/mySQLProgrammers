-- 10/19 완료

-- lv.2 자동차 평균 대여 기간 구하기
SELECT car_id, round(avg(datediff(end_date,start_date)+1),1) as AVERAGE_DURATION
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
group by car_id
HAVING AVERAGE_DURATION >= 7
order by AVERAGE_DURATION desc, car_id desc

-- lv.2 조건에 부합하는 중고거래 상태 조회하기
SELECT board_id, writer_id, title, price,
       case status
           when 'SALE' then '판매중'
           when 'DONE' then '거래완료'
           when 'RESERVED' then '예약중'
           end as status
from used_goods_board
where date_format(created_date, '%Y-%m-%d') = '2022-10-05'
order by board_id desc;

-- lv.1 특정 옵션이 포함된 자동차 리스트 구하기
SELECT *
from CAR_RENTAL_COMPANY_CAR
where options like '%네비게이션%'
order by car_id desc;

-- lv.2 루시와 엘라 찾기
SELECT animal_id, name, sex_upon_intake
from animal_ins
where name in('Lucy','Ella','Pickle','Rogan','Sabrina','Mitty')
order by animal_id

-- lv.2 이름에 el 들어가는 동물 찾기
SELECT animal_id, name
from animal_ins
where animal_type ='Dog' and name like '%el%'
order by name

-- lv.1 한 해에 잡은 물고기 수 구하기
select count(id) as FISH_COUNT
from fish_info
where Date_format(time,'%Y') = 2021

-- lv.2 카테고리 별 상품 개수 구하기
SELECT
    LEFT(PRODUCT_CODE, 2) AS CATEGORY,
    COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY CATEGORY
ORDER BY CATEGORY ASC;

-- lv.2 DATETIME에서 DATE로 형 변환
SELECT animal_id, name, Date_format(datetime, '%Y-%m-%d') as 날짜
from animal_ins
order by animal_id

-- lv.2 중성화 여부 파악하기
SELECT
    animal_id,
    name,
    CASE
        WHEN sex_upon_intake LIKE 'Neutered%' THEN 'O'
        WHEN sex_upon_intake LIKE 'Spayed%' THEN 'O'
        ELSE 'X'
        END AS 중성화
FROM animal_ins
ORDER BY animal_id;

-- lv.1 자동차 대여 기록에서 장기/단기 대여 구분하기
SELECT
    HISTORY_ID,
    CAR_ID,
    DATE_FORMAT(start_date, '%Y-%m-%d') AS START_DATE,
    DATE_FORMAT(end_date, '%Y-%m-%d') AS END_DATE,
    CASE
        WHEN DATEDIFF(end_date, start_date) >= 29 THEN '장기 대여'
        ELSE '단기 대여'
        END AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE DATE_FORMAT(start_date, '%Y-%m') = '2022-09'
ORDER BY history_id DESC;

