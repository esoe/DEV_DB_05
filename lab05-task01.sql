--Задание 1. Модификация данных в БД
--
--Используя оператор INSERT …VALUES вставьте в таблицы вашей БД по 2 записи (с учетом ограничений целостности). Приведите скрипт, который вы использовали.
--INSERT INTO имя_таблицы (столбец1, столбец2, ... столбецN) 
--VALUES (значение1, значение2, ... значениеN)

-------------------------
-- Библиотечный фонд
-------------------------
--"library".genres
insert into "library"."genres" (value)
values
	('поэзия')
	, ('фантастика')
	, ('детектив')
	, ('фэнтези');

--"library".publishers
insert into "library"."publishers" ("name", address, phone, contactname)
values
	('Литрес', 'Россия, Москва, 1-й Красногвардейский проезд, 15', 3373377, 'Петров Петр Петрович')
	, ('Просвещение', 'Россия, СПб', 1471288, 'Иванов Иван Иванович')
	, ('Питер', 'Россия, СПб', 1234567, 'Александров Александр Александрович');

--"library".bindings
insert into "library"."bindings" ("type")
values
	('жесткий')
	, ('мягкий');

--"library".repository
insert into "library"."repository"
	("title"
	, "instances"
	, "isbn"
	, "year"
	, "bindings_id"
	, "publishers_id"
	, "genres_id")
values
	('Человек с земли'
	, 10
	, 123234345
	, '2016-05-25'::date
	, 1
	, 1
	, 2)
	, ('Палеантология'
	, 20
	, 113289376
	, '2008-02-12'::date
	, 2
	, 2
	, 2);

--"library"."barcodes"
insert into "library"."barcodes" (value, repository_id)
values
	(1365, 1)
	, (1366, 1)
	, (1367, 1)
	, (1368, 1)
	, (1369, 1)
	, (1370, 2);

--"library"."authors"
insert into "library".authors ("fio", "country")
values
	('Константинов Костя', 'Россия')
	, ('Павлов Павел', 'Турция');

--"library"."bibliography"
insert into "library"."bibliography" ("repository_id", "authors_id")
values
	(1, 1)
	, (2, 1);

-------------------------
-- Выдача книг
--"library".certificates
insert into "library"."certificates" ("serial", "number")
values
	('СВ21', 123456)
	,('СВ45', 984562);

--"library"."pasports"
insert into "library"."pasports" ("serial", "number")
values
	(4007, 419231)
	, (3212, 343512);

--"library"."accounts"
-- Родители
insert into "library"."accounts"
	("fname"
	, "sname"
	, "lname"
	, "address"
	, "phone"
	, "pasport_id")
values 
	('Максим'
	, 'Максимович'
	, 'Максимов'
	, 'СПБ, ...'
	, 2135476
	, 1)
	, ('Степан'
	, 'Степанович'
	, 'Степанов'
	, 'МСК, ...'
	, 1260842
	, 2);
select * from "library".accounts;

--Подопечные
insert into "library"."accounts"
	("fname"
	, "sname"
	, "lname"
	, "sertificate_id"
	, "account_id")
values 
	('Андрей'
	, 'Максимович'
	, 'Максимов'
	, 1
	, 1)
	, ('Екатерина'
	, 'Степановна'
	, 'Степанова'
	, 2
	, 2);

--"library".allocation
--выдача книги
--id заполняется самостоятельно
insert into "library"."allocation"
	("account_id"
	, "book_out"
	, "book_in"
	, "barcode_id")
values
	(1, '2023-05-01', '2023-05-12', 1)
	, (2, '2023-05-01', '2023-05-17', 1)
	, (3, '2023-05-01', '2023-05-23', 2)
	, (4, '2023-05-01', '2023-05-23', 2);

--возврат книги (сделать самостоятельным отношением)
update "library"."allocation"
	set book_in_fact=now()
		where id=1;
update "library"."allocation"
	set book_in_fact='2023-05-02'
		where id=2;
update "library"."allocation"
	set book_in_fact=default
		where id=3;
select* from "library".allocation;
--возврат с опозданием


-------------------------
-- Бронирование
--"library".booking


















--Выполните модификацию записей в таблицах вашей БД, в соответствии с бизнес-требованиями выбранной предметной области. Приведите скрипт.


--Напишите скрипт, для удаления неактуальных записей из таблиц вашей БД.