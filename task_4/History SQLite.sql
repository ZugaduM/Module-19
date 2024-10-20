--- 20-10-2024 14:44:35
--- DJANGO
CREATE TABLE "task1_buyer" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL, "age" integer NOT NULL, "balance" decimal NOT NULL);

--- 20-10-2024 14:45:07
--- DJANGO
CREATE TABLE "task1_game" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(100) NOT NULL, "size" decimal NOT NULL, "description" text NOT NULL, "age_limited" bool NOT NULL, "cost" decimal NOT NULL);

--- 20-10-2024 14:45:26
--- DJANGO
CREATE TABLE "task1_game_buyer" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "game_id" bigint NOT NULL REFERENCES "task1_game" ("id") DEFERRABLE INITIALLY DEFERRED, "buyer_id" bigint NOT NULL REFERENCES "task1_buyer" ("id") DEFERRABLE INITIALLY DEFERRED);

--- 20-10-2024 14:48:22
--- DJANGO
INSERT INTO "main"."task1_buyer" ("id", "name", "age", "balance") VALUES ('1', 'Крокодил Гена', '50', '1000');
INSERT INTO "main"."task1_buyer" ("id", "name", "age", "balance") VALUES ('2', 'Чебурашка', '7', '300');
INSERT INTO "main"."task1_buyer" ("id", "name", "age", "balance") VALUES ('3', 'Старуха Шапокляк', '73', '2000');

--- 20-10-2024 14:48:44
--- DJANGO
INSERT INTO "main"."task1_game" ("id", "title", "size", "description", "age_limited", "cost") VALUES ('1', 'Крестики-нолики', '100', 'Игра в крестики-нолики.', '0', '100');
INSERT INTO "main"."task1_game" ("id", "title", "size", "description", "age_limited", "cost") VALUES ('2', 'Dungeon and Dragons', '1000', 'Фантастическая игра "Подземелья и драконы"!', '1', '1000');
INSERT INTO "main"."task1_game" ("id", "title", "size", "description", "age_limited", "cost") VALUES ('3', 'Шпион', '1000', 'Увлекательная игра "Шпион, выйди вон!". Почувствуй себя настоящим секретным агентом!', '1', '500');

--- 20-10-2024 14:50:50
--- DJANGO
SELECT * FROM task1_buyer;

--- 20-10-2024 14:52:46
--- DJANGO
/***** ERROR ******
SQLITE_ERROR: sqlite3 result code 1: near "*": syntax error
 ----- 
DELETE * FROM task1_game WHERE(title="Dungeon and Dragons");
*****/

--- 20-10-2024 14:54:39
--- DJANGO
/***** ERROR ******
SQLITE_ERROR: sqlite3 result code 1: no such column: "Dungeon and Dragons" - should this be a string literal in single-quotes?
 ----- 
DELETE FROM task1_game WHERE(title="Dungeon and Dragons");
*****/

--- 20-10-2024 14:55:25
--- DJANGO
/***** ERROR ******
SQLITE_ERROR: sqlite3 result code 1: no such column: "Dungeon and Dragons" - should this be a string literal in single-quotes?
 ----- 
DELETE FROM task1_game WHERE title="Dungeon and Dragons";
*****/

--- 20-10-2024 14:56:23
--- DJANGO
/***** ERROR ******
SQLITE_ERROR: sqlite3 result code 1: no such column: "Dungeon and Dragons" - should this be a string literal in single-quotes?
 ----- 
DELETE FROM task1_game WHERE title= "Dungeon and Dragons";
*****/

--- 20-10-2024 14:58:44
--- DJANGO
select * from task1_game;

--- 20-10-2024 14:59:27
--- DJANGO
/***** ERROR ******
SQLITE_ERROR: sqlite3 result code 1: no such column: "Шпион" - should this be a string literal in single-quotes?
 ----- 
delete from task1_game WHERE title="Шпион";
*****/

--- 20-10-2024 15:01:41
--- DJANGO
delete from task1_game WHERE cost=1000;

--- 20-10-2024 15:01:49
--- DJANGO
select * from task1_game;

--- 20-10-2024 15:03:51
--- DJANGO
SELECT * from task1_buyer where balance > 500;

