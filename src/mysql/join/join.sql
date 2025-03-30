-- 5/12 완료

-- lv.2 조건에 맞는 도서와 저자 리스트 출력
SELECT book_id, author_name, date_format(published_date, '%Y-%m-%d') as published_date
from book b join author a on b.author_id = a.author_id
where category = '경제'
order by published_date

-- lv.3 없어진 기록 찾기
SELECT o.animal_id, o.name
from animal_outs o left join animal_ins i
on i.animal_id = o.animal_id
where i.animal_id is null;

-- lv.3 있었는데요 없었습니다.
SELECT i.animal_id, i.name
from animal_ins i inner join animal_outs o
on i.animal_id = o.animal_id
where i.datetime > o.datetime
order by i.datetime

-- lv.3 오랜 기간 보호한 동물(1)
SELECT i.name, i.datetime
from animal_ins i left join animal_outs o
on i.animal_id = o.animal_id
where o.animal_id is null
order by datetime
limit 3;

-- lv.2 상품 별 오프라인 매출 구하기
SELECT product_code, sum(price*sales_amount) as sales
from product p join offline_sale o on p.product_id = o.product_id
group by product_code
order by sales desc, product_code