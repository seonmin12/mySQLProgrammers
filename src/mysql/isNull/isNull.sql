-- 7/8 완료

-- lv.1 경기도에 위치한 식품창고 목록 출력
SELECT warehouse_id, warehouse_name, address,
if(FREEZER_YN IS NULL, "N", FREEZER_YN) AS FREEZER_YN
from food_warehouse
where address like '%경기도%'
order by warehouse_id

-- lv.1 이름이 없는 동물의 아이디
SELECT animal_id
from animal_ins
where name is null
order by animal_id asc;

-- lv.1 이름이 있는 동물의 아이디
SELECT animal_id
from animal_ins
where name is not null
order by animal_id asc;

-- lv.2 null 처리하기
SELECT animal_type, ifnull(name,'No name') as NAME, sex_upon_intake
from animal_ins

-- lv.1 나이 정보가 없는 회원 수 구하기
SELECT count(user_id) as USERS
from user_info
where age is null

-- lv.2  root 아이템 구하기
select i.item_id, item_name
from item_info i inner join item_tree t
on i.item_id = t.item_id
where parent_item_id is null
order by item_id asc

-- lv.1 잡은 물고기의 평균 길이 구하기
select round(avg(ifnull(length,10)),2) as AVERAGE_LENGTH
from fish_info
