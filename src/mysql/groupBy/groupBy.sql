-- 17/ 24 완료

-- lv.3 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기
SELECT
    DATE_FORMAT(START_DATE, '%m') AS MONTH,
    CAR_ID,
    COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
  AND CAR_ID IN (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY CAR_ID
    HAVING COUNT(*) >= 5
    )
GROUP BY MONTH, CAR_ID
ORDER BY MONTH ASC, CAR_ID desc;

-- lv.3 자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기
select distinct car_id,
if (car_id in (
               select car_id
               from car_rental_company_rental_history
               where date(start_date) <= '2022-10-16'
               and date(end_date) >= '2022-10-16' ),
    '대여중', '대여 가능') 'availability'
from car_rental_company_rental_history
order by car_id desc

-- lv.2 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기
SELECT car_type, count(car_id) as cars
from car_rental_company_car
where options like '%통풍시트%'
   or options like'%열선시트%'
   or options like '%가죽시트%'
group by car_type
order by car_type

-- lv.3 카테고리 별 도서 판매량 집계
SELECT category, sum(sales) as TOTAL_SALES
from book b inner join book_sales s on b.book_id = s.book_id
where sales_date like '%2022-01%'
group by category
order by category asc;

-- lv.3 즐겨찾기가 가장 많은 식당 정보 출력
SELECT r.food_type, r.rest_id, r.rest_name, r.favorites
FROM rest_info r
    JOIN (
    SELECT food_type, MAX(favorites) AS max_fav
    FROM rest_info
    GROUP BY food_type) m
              ON r.food_type = m.food_type AND r.favorites = m.max_fav
ORDER BY r.food_type DESC

-- lv.3 조건에 맞는 사용자와 총 거래금액 조회하기
SELECT user_id, nickname,sum(price) as total_sales
from used_goods_board g inner join used_goods_user u
on g.writer_id = u.user_id
where status like 'done'
group by user_id
having sum(price)>=700000
order by sum(price) asc

-- lv.2 진료과별 총 예약 횟수 출력하기
SELECT mcdp_cd AS 진료과코드,
       COUNT(*) AS `5월예약건수`
FROM appointment
WHERE DATE_FORMAT(apnt_ymd, '%Y-%m') = '2022-05'
GROUP BY mcdp_cd
ORDER BY `5월예약건수`, mcdp_cd ;

-- lv.2 성분으로 구분한 아이스크림 총 주문량
SELECT ingredient_type, sum(total_order) as TOTAL_ORDER
from first_half f inner join icecream_info i on f.flavor = i.flavor
group by ingredient_type
order by TOTAL_ORDER

-- lv.2 고양이와 개는 몇 마리 있을까
SELECT animal_type, count(animal_id) as count
from animal_ins
where animal_type in('Cat' or 'Dog')
group by animal_type
order by animal_type

-- lv.2 동명 동물 수 찾기
SELECT name, count(name) as count
from animal_ins
group by name
having count(name)>=2
order by name

-- lv.2 입양 시각 구하기(1)
SELECT date_format(datetime,'%H') as HOUR, count(date_format(datetime,'%H')) as count
from animal_outs
where date_format(datetime,'%H:%i') >= '09:00' AND date_format(datetime,'%H:%i') <= '19:59'
group by HOUR
order by HOUR

-- lv.2 가격대 별 상품 개수 구하기
SELECT FLOOR(PRICE / 10000) * 10000 AS PRICE_GROUP,
       COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP;

-- lv.2 조건에 맞는 사원 정보 조회하기
SELECT G.SCORE22 AS SCORE, G.EMP_NO, E.EMP_NAME, E.POSITION, E.EMAIL
FROM (SELECT EMP_NO, SUM(SCORE) AS 'SCORE22'
      FROM HR_GRADE
      GROUP BY EMP_NO
      ORDER BY SCORE22 DESC
       LIMIT 1) G
     LEFT JOIN HR_EMPLOYEES E
    ON G.EMP_NO = E.EMP_NO;

-- lv.3 부서별 평균 연봉 조회
select d.dept_id, dept_name_en, round(avg(sal),0) as AVG_SAL
from hr_department d inner join hr_employees e
on d.dept_id = e.dept_id
group by dept_id, dept_name_en
order by AVG_SAL DESC

-- lv.2 노선별 평균 역 사이 거리 조회
SELECT ROUTE
     ,CONCAT(ROUND(SUM(D_BETWEEN_DIST),1),'km') AS TOTAL_DISTANCE
     ,CONCAT(ROUND(AVG(D_BETWEEN_DIST),2),'km') AS AVERAGE_DISTANCE
FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY SUM(D_BETWEEN_DIST) DESC;

-- lv.2 물고기 종류 별 잡은 수 구하기
select count(i.fish_type) as FISH_COUNT, n.FISH_NAME
from fish_info i inner join fish_name_info n
on i.fish_type = n.fish_type
group by n.fish_name
order by fish_count desc

-- lv.2 월별 잡은 물고기 수 구하기
select count(ID) as FISH_COUNT, month(time) as MONTH
from fish_info
group by month
order by month







