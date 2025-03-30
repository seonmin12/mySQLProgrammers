-- 9/10 완료

-- lv.1 가장 비싼 상품 구하기
SELECT max(price) as MAX_PRICE
from product

-- lv.2 가격이 제일 비싼 식품 정보 출력
SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE
FROM FOOD_PRODUCT
ORDER BY PRICE DESC
LIMIT 1

-- lv.1 최댓값 구하기
SELECT max(datetime) as 시간
from animal_ins

-- lv.2 최솟값 구하기
SELECT min(datetime) as 시간
from animal_ins

-- lv.2 동물수 구하기
SELECT count(animal_id) as count
from animal_ins

-- lv.2 중복 제거하기
SELECT COUNT(DISTINCT name) AS count
FROM animal_ins
WHERE name IS NOT NULL;

-- lv.2 조건에 맞는 아이템 가격 총합
select sum(price) as TOTAL_PRICE
from item_info
where rarity = 'legend'

-- lv.3 물고기 종류 별 대어 찾기
SELECT ID, FISH_NAME, LENGTH
FROM (SELECT ID, FISH_TYPE, LENGTH,
             RANK() OVER(PARTITION BY FISH_TYPE ORDER BY LENGTH DESC) AS LENGTHRANK
      FROM FISH_INFO) AS INFO
         JOIN FISH_NAME_INFO AS NAME
              ON NAME.FISH_TYPE = INFO.FISH_TYPE
WHERE LENGTHRANK = 1
ORDER BY ID;

-- lv.1 잡은 물고기 중 가장 큰 물고기의 길이 구하기
select concat(max(length),'cm') as MAX_LENGTH
from fish_info




