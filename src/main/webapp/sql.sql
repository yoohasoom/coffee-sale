create table tbl_product_02 (
pcode varchar2(10) not null primary key,
name varchar2(20),
cost number(10)
);

create table tbl_shop_02 (
scode varchar2(10) not null primary key,
sname varchar2(20)
);

create table tbl_salelist_02 (
saleno number(10) not null primary key,
pcode varchar2(10) not null,
saledate date,
scode varchar2(10) not null,
amount varchar2(10)
);

insert into tbl_product_02 values('AA01', '아메리카노', 3000);
insert into tbl_product_02 values('AA02', '에스프레소', 3500);
insert into tbl_product_02 values('AA03', '카페라떼', 4000);
insert into tbl_product_02 values('AA04', '카라멜마끼', 4500);
insert into tbl_product_02 values('AA05', '카푸치노', 5000);
insert into tbl_product_02 values('AA06', '초코롤케익', 6000);
insert into tbl_product_02 values('AA07', '녹차롤케익', 6500);
insert into tbl_product_02 values('AA08', '망고쥬스', 7000);
insert into tbl_product_02 values('AA09', '핫초코', 2500);

insert into tbl_shop_02 values('S001', '강남점');
insert into tbl_shop_02 values('S002', '강서점');
insert into tbl_shop_02 values('S003', '강동점');
insert into tbl_shop_02 values('S004', '강북점');
insert into tbl_shop_02 values('S005', '동대문점');
insert into tbl_shop_02 values('S006', '인천점');

insert into tbl_salelist_02 values(100001, 'AA01', '20180902', 'S001', 50);
insert into tbl_salelist_02 values(100002, 'AA03', '20180902', 'S002', 40);
insert into tbl_salelist_02 values(100003, 'AA04', '20180902', 'S002', 20);
insert into tbl_salelist_02 values(100004, 'AA04', '20180902', 'S001', 30);
insert into tbl_salelist_02 values(100005, 'AA05', '20180902', 'S004', 40);
insert into tbl_salelist_02 values(100006, 'AA03', '20180902', 'S004', 30);
insert into tbl_salelist_02 values(100007, 'AA01', '20180902', 'S003', 40);
insert into tbl_salelist_02 values(100008, 'AA04', '20180902', 'S004', 10);
insert into tbl_salelist_02 values(100009, 'AA01', '20180902', 'S003', 20);
insert into tbl_salelist_02 values(100010, 'AA05', '20180902', 'S003', 30);
insert into tbl_salelist_02 values(100011, 'AA01', '20180902', 'S001', 40);
insert into tbl_salelist_02 values(100012, 'AA03', '20180902', 'S002', 50);
insert into tbl_salelist_02 values(100013, 'AA04', '20180902', 'S002', 50);
insert into tbl_salelist_02 values(100014, 'AA05', '20180902', 'S004', 20);
insert into tbl_salelist_02 values(100015, 'AA01', '20180902', 'S003', 30);

<--List-->
select ts.saleno, ts.pcode, ts.saledate, ts.scode, tp.name, ts.amount, sum(tp.cost * ts.amount) as total
from tbl_salelist_02 ts, tbl_product_02 tp
where ts.pcode = tp.pcode
group by ts.saleno, ts.pcode, ts.saledate, ts.scode, tp.name, ts.amount
order by ts.saleno;

<--MeList-->
select shop.scode, shop.sname, sum(tp.cost * sale.amount) as total
from tbl_salelist_02 sale, tbl_product_02 tp, tbl_shop_02 shop
where shop.scode = sale.scode and tp.pcode = sale.pcode
group by shop.scode, shop.sname
order by shop.scode;

<--SangList-->
select tp.pcode, tp.name, sum(tp.cost * sale.amount) as total
from tbl_salelist_02 sale, tbl_product_02 tp
where tp.pcode = sale.pcode
group by tp.pcode, tp.name
order by tp.pcode;

<--Regiconfirm-->
insert into tbl_salelist_02 values(?, ?, ?, ?, ?);
