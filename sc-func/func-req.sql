----  Транзакционные  ----
-- 1. Добавить дискуссию
INSERT INTO public.posts(content, "idUser", text)
	VALUES (null, 33, 'I like new skin, it gorgeous!');

INSERT INTO public.discussions(theme, marks, date, "idPost", "idComment")
	VALUES ('Last update', 'skins update', '2020-07-11 22:00:02.0474381', 4, null);

-- 2. Добавить новый проект
INSERT INTO public.projects(name, marks, content, cost, "releaseDate", "idUser")
	VALUES ('JoJo', 'nohomo', '../JoJo.zip', '40', '2020-11-11 11:10:02.0474381', 33);

-- 3. Редактировать проект
UPDATE public.projects 
    SET marks=null, cost='37'
	WHERE id=17;

-- 4. Редактировать страницу проекта
UPDATE public."projectPages" 
    SET description='This game is about JoJo adventure.', preview='http://dummyimage.com/146x150.jpg/ff4444/ffffff'
	WHERE idProject=17;

----  Справочные  ----
-- 5. Показать проекты, добавленные пользователем в библиотеку
SELECT favorites FROM public.libraries
    WHERE id=1;

-- 6. Показать проекты с определенной ценной
SELECT cost FROM public.projects
    WHERE cost>=10;

-- 7. Показать пользователей, имена которых начинаются с 'M'
SELECT name FROM public.users
    WHERE name LIKE 'M%';

-- 8. Показать проекты с определенной меткой
SELECT marks FROM public.projects
    WHERE marks LIKE '%shooter%';

-- 9. Показать дискуссии с определенной темой
SELECT theme FROM public.discussions
    WHERE theme LIKE 'morbi%';

-- 10. Показать дискуссии за последний месяц
SELECT id FROM public.discussions
    WHERE date BETWEEN CURRENT_TIMESTAMP - interval '30 day' AND CURRENT_TIMESTAMP;

-- 11. Показать среднюю цену проектов
SELECT AVG(cost) FROM public.projects;

----  Аналитические  ----
-- 12. Рассчитать общий доход проекта
UPDATE public.dashboards 
    SET revenue=(SELECT count(purchases) FROM public.libraries WHERE purchases LIKE 'DoomBoy') * (SELECT cost FROM public.projects WHERE id=21) + (SELECT SUM(sum) FROM public.donations WHERE "idProject"=21)
    WHERE "idProject"=21;

-- 13. Рассчитать доход проекта с продаж
UPDATE public.dashboards 
    SET revenue=(SELECT count(purchases) FROM public.libraries WHERE purchases LIKE 'DoomBoy') * (SELECT cost FROM public.projects WHERE id=21)
    WHERE "idProject"=21;

-- 14. Рассчитать доход проекта с пожертвований
UPDATE public.dashboards 
    SET revenue=(SELECT SUM(sum) FROM public.donations WHERE "idProject"=21)
    WHERE "idProject"=21;

-- 15. Показать комментарии с высокими оценками (больше 3).
SELECT text, rating FROM public.comments
    WHERE rating>3;

----  SELECT, DISTINCT, WHERE, AND/OR/NOT, IN, BETWEEN, IS NULL, AS (15+) ----
-- 16. Показать проекты, которые имеют трейлер
SELECT name AS "Проект", trailer AS "Трейлер" FROM public.projects, public."projectPages"
    WHERE trailer IS NOT NULL AND "projectPages"."idProject"=projects.id;

-- 17. Показать роли с уровнем доступа 2 или больше
SELECT name AS "Роль", access AS "Уровень доступа" FROM public.role
    WHERE access >= 2;

-- 18. Показать всех пользователей
SELECT DISTINCT id AS "ID", name AS "Имя" FROM public.users;

-- 19. Рассчитать кол-во пользователей
SELECT DISTINCT count(id) AS "Пользователей" FROM public.users;

-- 20. Показать проекты без меток
SELECT id AS "ID", name AS "Проект" FROM public.projects
    WHERE marks IS NULL;

-- 21. Показать донаты >= 100 с комментариями
SELECT id AS "ID", comment AS "Комментарий", sum AS "Сумма" FROM donations
    WHERE sum>=100 AND comment IS NOT NULL;

-- 22. Показать проекты стоимостью от 5 до 10
SELECT name AS "Проект", cost AS "Цена" FROM public.projects
    WHERE cost BETWEEN 5 AND 10;

-- 23. Показать проекты с определенными метками
SELECT name AS "Проект", marks AS "Метки" FROM public.projects
    WHERE marks LIKE '%shooter%' OR marks LIKE '%retro%';

-- 24. Показать девлоги с рейтингом от 1 до 3
SELECT theme AS "Девлог", rating AS "Рейтинг" FROM public.devlogs
    WHERE rating BETWEEN 1 AND 3;

-- 25. Показать проекты с определенными метками
SELECT name AS "Проект", marks AS "Метки" FROM public.projects
    WHERE marks SIMILAR TO '%(shooter|retro)%';

-- 26. Показать бесплатные проекты
SELECT name AS "Проект" FROM public.projects
    WHERE cost=0;

-- 27. Показать платные проекты
SELECT name AS "Проект", cost "Цена" FROM public.projects
    WHERE cost>0;

-- 28. Показать донаты от пользователя
SELECT comment AS "Комментарий", sum AS "Сумма" FROM public.donations
    WHERE "idUser"=35;

-- 28. Показать донаты от пользователя с комментариями
SELECT comment AS "Комментарий", sum AS "Сумма" FROM public.donations
    WHERE "idUser"=35 AND comment NOT NULL;

-- 29. Показать пользователей с именем
SELECT name AS "Имя" FROM public.users
    WHERE name IN ('Max M', 'Max Vist');

-- 30. Показать проекты которые не стоят 9.99, 0, 5
SELECT name AS "Проект", cost AS "Цена" FROM public.projects
    WHERE cost NOT IN ('0', '5', '9.99');

----  LIKE (5+)  ----
-- 31. Показать проекты у которых есть метки
SELECT name AS "Проект", marks AS "Метки" FROM public.projects
    WHERE marks LIKE '%shooter%' AND marks LIKE '%platformer%';

-- 32. Показать проекты, название которых начинается на "J"
SELECT name FROM public.projects
    WHERE name LIKE 'J%';

-- 33. Показать комментарии содержащие слово "non"
SELECT text AS "Комментарий" FROM public.comments
    WHERE text LIKE '%non%';

-- 34. Рассчитать доход проекта с продаж
UPDATE public.dashboards 
    SET revenue=(SELECT count(purchases) FROM public.libraries WHERE purchases LIKE 'Sanic') * (SELECT cost FROM public.projects WHERE id=16)
    WHERE "idProject"=16;

-- 35. Показать пользователей, у которых имя начинается на "Max"
SELECT name AS "Имя" FROM public.users
    WHERE name LIKE 'Max%';

----  COUNT, MAX, MIN, SUM, AVG (5+)  ----
-- 36. Показать кол-во проектов, которые имеют трейлер
SELECT COUNT(trailer) AS "Проектов с трейлером" FROM public."projectPages"
    WHERE trailer IS NOT NULL;

-- 37. Показать самый дешевый проект
SELECT name AS "Проект", cost AS "Цена" FROM public.projects
    WHERE cost=(SELECT MIN(cost) FROM public.projects WHERE cost>0);

-- 38. Показать самый дорогой проект
SELECT name AS "Проект", cost AS "Цена" FROM public.projects
    WHERE cost=(SELECT MAX(cost) FROM public.projects WHERE cost>0);

-- 39. Показать среднюю цену на проекты
SELECT AVG(cost) AS "Цена" FROM public.projects;

-- 40. Показать кол-во пользователей портала
SELECT COUNT(id) AS "Кол-во пользователей" FROM public.users;

----  GROUP BY, HAVING (5+)  ----
-- 41. Показать цену на самый дорогой проект разработчика
SELECT "idUser", MAX(cost) FROM public.projects
    GROUP BY "idUser";

-- 42. Показать кол-во проектов разработчиков
SELECT "idUser", count(name) FROM public.projects
    GROUP BY "idUser";

-- 43. Показать сумму донатов пользователя
SELECT "idUser", SUM(sum) FROM public.donations
    GROUP BY "idUser";

-- 44. Показать пользователей, которые пожертвовали в сумме больше 100
SELECT "idUser", SUM(sum) FROM public.donations
    GROUP BY "idUser" HAVING SUM(sum)>100;

-- 45. Показать пользователей, которые пожертвовали в сумме больше 15 но меньше 50
SELECT "idUser", SUM(sum) FROM public.donations
    GROUP BY "idUser" HAVING SUM(sum)>15 AND SUM(sum)<50;

----  ORDER BY, ASC|DESC (5+)  ----
-- 46. Отсортировать проекты по цене (возрастание)
SELECT name AS "Проект", cost "Цена" FROM public.projects
    ORDER BY cost;

-- 47. Отсортировать проекты по цене (убывание)
SELECT name AS "Проект", cost "Цена" FROM public.projects
    ORDER BY cost DESC;

-- 48. Отсортировать проекты по имени (возрастание)
SELECT name AS "Проект" FROM public.projects
    ORDER BY name;

-- 49. Отсортировать проекты по имени (убывание)
SELECT name AS "Проект" FROM public.projects
    ORDER BY name DESC;

-- 50. Показать платные проекты и отсортировать по цене (возрастание)
SELECT name AS "Проект", cost "Цена" FROM public.projects
    WHERE cost>0
    ORDER BY cost;

----  Вложенные SELECT'ы (1-2)  ----
-- 51. Рассчитать доход проекта с продаж
UPDATE public.dashboards 
    SET revenue=(SELECT count(purchases) FROM public.libraries WHERE purchases LIKE 'Sanic') * (SELECT cost FROM public.projects WHERE id=16)
    WHERE "idProject"=16;

-- 52. Показать самый дешевый проект
SELECT name AS "Проект", cost AS "Цена" FROM public.projects
    WHERE cost=(SELECT MIN(cost) FROM public.projects WHERE cost>0);

-- 53. Рассчитать общий доход проекта
UPDATE public.dashboards 
    SET revenue=(SELECT count(purchases) FROM public.libraries WHERE purchases LIKE 'DoomBoy') * (SELECT cost FROM public.projects WHERE id=21) + (SELECT SUM(sum) FROM public.donations WHERE "idProject"=21)
    WHERE "idProject"=21;

----  SELECT INTO (1-2)  ----
-- 54. Создать пост из комментария
SELECT content, "idUser", text INTO public.posts FROM public.comments
    WHERE "idUser"=34;

----  UNION, EXCEPT, INTERCEPT (3-6)  ----
-- 55. Показать доход проекта с продаж и донатов
SELECT revenue FROM public.projects
    WHERE "idProject"=21
UNION
SELECT sum FROM public.donations
    WHERE "idProject"=21;

-- 56. Показать трейлеры проектов
SELECT trailer FROM public."projectPages"
EXCEPT
SELECT NULL;

----  UPDATE (5+)  ----
-- 60. Редактировать проект
UPDATE public.projects 
    SET marks=null, cost='37'
	WHERE id=17;

-- 61. Рассчитать общий доход проекта
UPDATE public.dashboards 
    SET revenue=(SELECT count(purchases) FROM public.libraries WHERE purchases LIKE 'DoomBoy') * (SELECT cost FROM public.projects WHERE id=21) + (SELECT SUM(sum) FROM public.donations WHERE "idProject"=21)
    WHERE "idProject"=21;

-- 62. Рассчитать доход проекта с продаж
UPDATE public.dashboards 
    SET revenue=(SELECT count(purchases) FROM public.libraries WHERE purchases LIKE 'DoomBoy') * (SELECT cost FROM public.projects WHERE id=21)
    WHERE "idProject"=21;

-- 63. Рассчитать доход проекта с пожертвований
UPDATE public.dashboards 
    SET revenue=(SELECT SUM(sum) FROM public.donations WHERE "idProject"=21)
    WHERE "idProject"=21;

-- 64. Редактировать страницу проекта
UPDATE public."projectPages" 
    SET description='This game is about JoJo adventure.', preview='http://dummyimage.com/146x150.jpg/ff4444/ffffff'
	WHERE idProject=17;

----  INSERT SELECT (1-2)  ----
-- 65. Превратить комментарий в пост
INSERT INTO public.posts(content, "idUser", text)
    SELECT content, "idUser", text FROM public.comments
    WHERE id=6;

-- 66. Превратить пост в комментарий
INSERT INTO public.comments(content, "idUser", text)
    SELECT content, "idUser", text FROM public.posts
    WHERE id=6;

----  JOIN (20+)  ----
-- 67. Показать пользователей и их роли
SELECT users.name AS "Пользователь", role.name AS "Роль" FROM users
    INNER JOIN role
    ON users."idRole"=role.id;

-- 68. Показать любимые проекты пользователей
SELECT users.name AS "Пользователь", libraries.favorites AS "Избранное" FROM users
    LEFT JOIN libraries
    ON users.id=libraries."idUser";

-- 69. Показать все пожертвования
SELECT users.name AS "Пользователь", donations.sum AS "Пожертвовал" FROM users
    RIGHT JOIN donations
    ON users.id=donations."idUser";

-- 70. Показать все пожертвования пользователей
SELECT users.name AS "Пользователь", donations.sum AS "Пожертвовал" FROM users
    FULL OUTER JOIN donations
    ON users.id=donations."idUser";

-- 72. Показать все проекты и их страницы
SELECT projects.name AS "Проект", "projectPages"."URL" AS "Страница" FROM projects
    CROSS JOIN "projectPages"
    WHERE projects.id="projectPages"."idProject";

-- 73. Показать статистику и страницу проекта
SELECT * FROM dashboards
    NATURAL JOIN "projectPages";

-- 74. Показать библиотеки пользователей
SELECT users.name AS "Пользователь", libraries.favorites AS "Избранное", libraries.purchases AS "Купленное" FROM users
    INNER JOIN libraries
    ON users.id=libraries."idUser";

-- 75. Показать пользователей, которые покупали проекты
SELECT users.name AS "Пользователь", libraries.purchases AS "Купленное" FROM users
    INNER JOIN libraries
    ON users.id=libraries."idUser"
    WHERE libraries.purchases IS NOT NULL;

-- 76. Показать всю информацию о проектах
SELECT * FROM projects 
    INNER JOIN "projectPages" ON projects.id="projectPages"."idProject"
    INNER JOIN dashboards ON "projectPages"."idProject"=dashboards."idProject";

-- 77. Показать девлоги проектов
SELECT projects.name AS "Проект", devlogs.theme AS "Девлог" FROM projects
    INNER JOIN devlogs
    ON projects.id=devlogs."idProject";

-- 78. Показать посты, которые являются девлогами
SELECT posts.id, devlogs.theme FROM posts
    INNER JOIN devlogs
    ON posts.id=devlogs."idPost";

-- 79. Показать посты, которые являются дискуссиями
SELECT posts.id, discussions.theme FROM posts
    INNER JOIN discussions
    ON posts.id=discussions."idPost";

-- 80. Показать посты, которые являются дискуссиями и девлогами
SELECT posts.id, discussions.theme, devlogs.theme FROM posts 
    INNER JOIN discussions ON posts.id=discussions."idPost"
    INNER JOIN devlogs ON discussions."idPost"=devlogs."idPost"

----  OTHER  ----
-- 81. Показать метрики портала