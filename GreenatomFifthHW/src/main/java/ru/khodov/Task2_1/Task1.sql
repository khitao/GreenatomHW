
SELECT * FROM trainee.t_competition;

--Выдайте всю информацию о спортсменах из таблицы sportsman.
SELECT * FROM trainee.t_sportsman;

--Выдайте наименование и мировые результаты по всем соревнованиям.
SELECT discipline_description, world_record FROM trainee.t_discipline;

SELECT
    comp.competition_name,
    dis.discipline_description,
    dis.world_record,
    dis.set_date
FROM
    trainee.t_competitions_disciplines as comp_dis
       JOIN
    trainee.t_discipline AS dis ON comp_dis.discipline_id = dis.discipline_id
     JOIN
    trainee.t_competition AS comp ON comp_dis.competition_id = comp.competition_id;


--Выберите имена всех спортсменов, которые родились в 1990 году.
SELECT sportsman_name FROM trainee.t_sportsman WHERE year_of_birth = 1990;

--Выберите наименование и мировые результаты по всем соревнованиям, установленные 12-05-2010 или 15-05-2010.


SELECT discipline_description, world_record
FROM trainee.t_discipline
WHERE set_date = '2010-12-05' OR set_date = '2010-05-15';

SELECT
    c.competition_name,
    d.discipline_description,
    d.world_record,
    d.set_date
FROM
    trainee.t_discipline d
       JOIN
    trainee.t_competitions_disciplines cd ON d.discipline_id = cd.discipline_id
        JOIN
    trainee.t_competition c ON cd.competition_id = c.competition_id
WHERE
        d.set_date = '2010-05-12' OR d.set_date = '2010-05-15';

-- Выберите дату проведения всех соревнований, которые проводились в Москве и полученные на них результаты равны 10 секунд.
SELECT
	c.hold_date
FROM
	trainee.t_competition c
		JOIN
	trainee.t_result r ON c.competition_id = r.competition_id
WHERE
		c.city = 'Москва' AND r.result = 10.0;




--- Выберите имена всех спортсменов, у которых персональный рекорд не равен 25 с.
SELECT
    s.sportsman_name
FROM
    trainee.t_sportsman s
WHERE
    NOT EXISTS (
        SELECT 1
        FROM trainee.t_sportsman_record sr
        WHERE sr.sportsman_id = s.sportsman_id AND sr.record_value = 25
    );

--- Выберите названия всех соревнований, у которых мировой рекорд равен 15 с и дата установки рекорда не равна 12-02-2015.
SELECT
    c.competition_name
FROM
    trainee.t_competition c
        JOIN
    trainee.t_competitions_disciplines cd ON c.competition_id = cd.competition_id
        JOIN
    trainee.t_discipline d ON cd.discipline_id = d.discipline_id
WHERE
        d.world_record = 15 AND d.set_date != '2015-02-12';

-- Выберите города проведения соревнований, где результаты принадлежат множеству {13, 25, 17, 9}.
SELECT DISTINCT
	c.city
FROM
	trainee.t_competition c
		JOIN
	trainee.t_result r ON c.competition_id = r.competition_id
WHERE
		r.result IN (13, 25, 17, 9);
-- Выберите имена всех спортсменов, у которых год рождения 2000 и разряд не принадлежит множеству {3, 7, 9}.

SELECT
	sportsman_name
FROM
	trainee.t_sportsman
WHERE
		year_of_birth = 2000 AND rank NOT IN (3, 7, 9);

-- Выберите дату проведения всех соревнований, у которых город проведения начинается с буквы "М".

SELECT
	hold_date
FROM
	trainee.t_competition
WHERE
		UPPER(city) LIKE 'М%';


--Выберите имена всех спортсменов, у которых имена начинаются с буквы "М" и год рождения не заканчивается на "6".

SELECT
	sportsman_name
FROM
	trainee.t_sportsman
WHERE
		sportsman_name LIKE 'М%' AND CAST(year_of_birth AS VARCHAR) NOT LIKE '%6';

--Выберите наименования всех соревнований, у которых в названии есть слово "международные".

SELECT
	competition_name
FROM
	trainee.t_competition
WHERE
		LOWER(competition_name) LIKE '%международные%';

--Выберите годы рождения всех спортсменов без повторений.

SELECT
    DISTINCT
	year_of_birth
FROM
	trainee.t_sportsman;

--Найдите количество результатов, полученных 12-05-2014.

SELECT
    COUNT(world_record)
FROM
    trainee.t_discipline
WHERE
        set_date = '2015-05-12';


--Вычислите максимальный результат, полученный в Москве.

SELECT
    MAX(r.result) AS max_result
FROM
    trainee.t_result r
        JOIN
    trainee.t_competition c ON r.competition_id = c.competition_id
WHERE
        c.city = 'Москва';

--Вычислите минимальный год рождения спортсменов, которые имеют 1 разряд.


SELECT
    MIN(year_of_birth) AS min_year_of_birth
FROM
    trainee.t_sportsman
WHERE
    rank = 1;

--Определите имена спортсменов, у которых личные рекорды совпадают с результатами, установленными 12-04-2014.

SELECT
    s.sportsman_name
FROM
    trainee.t_sportsman s
        JOIN
    trainee.t_sportsman_record sr ON s.sportsman_id = sr.sportsman_id
        JOIN
    trainee.t_result r ON sr.record_value = r.result
        JOIN
    trainee.t_competition c ON r.competition_id = c.competition_id
WHERE
        c.hold_date = '2014-04-12';


-- Выведите наименования соревнований, у которых дата установления мирового рекорда совпадает с датой проведения соревнований в - Москве 20-04-2015.

SELECT
    c.competition_name
FROM
    trainee.t_competition c
        JOIN
    trainee.t_discipline d ON c.hold_date = d.set_date
WHERE
        c.city = 'Москва' AND c.hold_date = '2015-04-20';

--Вычислите средний результат каждого из спортсменов.

SELECT
    s.sportsman_name,
    AVG(r.result) AS average_result
FROM
    trainee.t_sportsman s
        JOIN
    trainee.t_result r ON s.sportsman_id = r.sportsman_id
GROUP BY
    s.sportsman_name;


-- Выведите годы рождения спортсменов, у которых результат, показанный в Москве выше среднего по всем спортсменам.

SELECT
    DISTINCT s.year_of_birth
FROM
    trainee.t_sportsman s
        JOIN
    trainee.t_result r ON s.sportsman_id = r.sportsman_id
        JOIN
    trainee.t_competition c ON r.competition_id = c.competition_id
WHERE
        c.city = 'Москва' AND r.result > (
    SELECT
        AVG(r2.result)
    FROM
        trainee.t_result r2
);

-- Выведите имена всех спортсменов, у которых год рождения больше, чем год установления мирового рекорда, равного 12 с.
SELECT
    s.sportsman_name
FROM
    trainee.t_sportsman s
WHERE
    EXTRACT(YEAR FROM s.year_of_birth) > (
        SELECT
            EXTRACT(YEAR FROM d.set_date)
        FROM
            trainee.t_discipline d
        WHERE
                d.world_record = 12
    );

--Выведите список спортсменов в виде 'Спортсмен ' ['имя спортсмена'] 'показал результат' ['результат'] 'в городе' ['город']

SELECT
   'Спортсмен ' || s.sportsman_name || ' показал результат ' || r.result || ' в городе ' || c.city as result_info
FROM
    trainee.t_sportsman s
        JOIN
    trainee.t_result r ON s.sportsman_id = r.sportsman_id
        JOIN
    trainee.t_competition c ON r.competition_id = c.competition_id;

-- Выведите имена всех спортсменов, у которых разряд ниже среднего разряда всех спортсменов, родившихся в 2000 году.
SELECT
    sportsman_name
FROM
    trainee.t_sportsman
WHERE  rank < (
        SELECT
            AVG(rank)
        FROM
            trainee.t_sportsman
        WHERE
                year_of_birth = 2000
    );

--Выведите данные о спортсменах, у которых персональный рекорд совпадает с мировым.
SELECT
    s.sportsman_name,
    s.year_of_birth,
    s.rank,
    sr.record_value AS personal_record,
    d.world_record,
    d.discipline_description
FROM
    trainee.t_sportsman s
        JOIN
    trainee.t_sportsman_record sr ON s.sportsman_id = sr.sportsman_id
        JOIN
    trainee.t_discipline d ON sr.discipline_id = d.discipline_id
WHERE
        sr.record_value = d.world_record;

-- Определите количество участников с фамилией Иванов, которые участвовали в соревнованиях с названием, содержащим слово 'Региональные'.
SELECT
    COUNT(*) as count
FROM
    trainee.t_sportsman s
        JOIN
    trainee.t_result r ON s.sportsman_id = r.sportsman_id
        JOIN
    trainee.t_competition c ON r.competition_id = c.competition_id
WHERE
        s.sportsman_name LIKE 'Иванов%'
  AND c.competition_name LIKE '%Региональные%';

-- Выведите города, в которых были установлены мировые рекорды.

SELECT DISTINCT
    c.city
FROM
    trainee.t_competition c
        JOIN
    trainee.t_result r ON c.competition_id = r.competition_id
        JOIN
    trainee.t_discipline d ON r.discipline_id = d.discipline_id
        AND r.result = d.world_record;

-- Найдите минимальный разряд спортсменов, которые установили мировой рекорд.

SELECT
    MIN(s.rank) as min_rank
FROM
    trainee.t_sportsman s
        JOIN
    trainee.t_sportsman_record sr ON s.sportsman_id = sr.sportsman_id
        JOIN
    trainee.t_discipline d ON sr.discipline_id = d.discipline_id
WHERE
        sr.record_value = d.world_record;

--Выведите названия соревнований, на которых было установлено максимальное количество мировых рекордов.
SELECT
    c.competition_name
FROM
    trainee.t_competition c
        JOIN
    trainee.t_discipline d ON c.hold_date = d.set_date
GROUP BY
    c.competition_name
ORDER BY
    COUNT(*) DESC
LIMIT 1;

-- Определите, спортсмены какой страны участвовали в соревнованиях больше всего.
SELECT
    s.country,
    COUNT(*) as participation_count
FROM
    trainee.t_sportsman s
        JOIN
    trainee.t_result r ON s.sportsman_id = r.sportsman_id
GROUP BY
    s.country
ORDER BY
    participation_count DESC
LIMIT 1;

-- Измените разряд на 1 тех спортсменов, у которых личный рекорд совпадает с мировым.
UPDATE trainee.t_sportsman s
SET rank = 1
FROM trainee.t_sportsman_record sr, trainee.t_discipline d
WHERE s.sportsman_id = sr.sportsman_id
  AND sr.discipline_id = d.discipline_id
  AND sr.record_value = d.world_record;


-- Вычислите возраст спортсменов, которые участвовали в соревнованиях в Москве.
SELECT
    s.sportsman_name,
    EXTRACT(YEAR FROM c.hold_date) - s.year_of_birth as age
FROM
    trainee.t_sportsman s
        JOIN
    trainee.t_result r ON s.sportsman_id = r.sportsman_id
        JOIN
    trainee.t_competition c ON r.competition_id = c.competition_id
WHERE
        c.city = 'Москва';

--- Измените дату проведения всех соревнований, проходящих в Москве на 4 дня вперед.

UPDATE trainee.t_competition
SET hold_date = hold_date + 4
WHERE city = 'Москва';

-- Измените страну у спортсменов, у которых разряд равен 1 или 2, с Италии на Россию.

UPDATE trainee.t_sportsman
SET country = 'Россия'
WHERE rank IN (1, 2) AND country = 'Италия';

--- Измените название соревнований с 'Бег' на 'Бег с препятствиями'
UPDATE trainee.t_competition
SET competition_name = 'Бег с препятствиями'
WHERE competition_name = 'Бег';


-- Увеличьте мировой результат на 2 с для соревнований ранее 20-03-2005.
UPDATE trainee.t_discipline
SET world_record = world_record + 2
WHERE set_date < '2005-03-20';

--- Уменьшите результаты на 2 с соревнований, которые проводились 20-05-2012 и показанный результат не менее 45 с.

UPDATE trainee.t_result
SET result = result - 2
WHERE competition_id IN (
    SELECT competition_id FROM trainee.t_competition WHERE hold_date = '2012-05-20'
) AND result >= 45;

-- Удалите все результаты соревнований в Москве, участники которых родились не позже 1980 г.

DELETE FROM trainee.t_result
WHERE competition_id IN (
    SELECT competition_id FROM trainee.t_competition WHERE city = 'Москва'
) AND sportsman_id IN (
    SELECT sportsman_id FROM trainee.t_sportsman WHERE year_of_birth <= 1980
);

--- Удалите все соревнования, у которых результат равен 20 с.
DELETE FROM trainee.t_competition
WHERE competition_id IN (
    SELECT competition_id FROM trainee.t_result WHERE result = 20
);

--- Удалите все результаты спортсменов, которые родились в 2001 году.

DELETE FROM trainee.t_result
WHERE sportsman_id IN (
    SELECT sportsman_id FROM trainee.t_sportsman WHERE year_of_birth = 2001
);
