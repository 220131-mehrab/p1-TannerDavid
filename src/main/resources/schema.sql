CREATE TABLE "types" (
    "TypesId" INT PRIMARY KEY NOT NULL,
    "Type"    VARCHAR NOT NULL
);

CREATE TABLE "coloridentity" (
    "TypesId" INT NOT NULL PRIMARY KEY,
    "Type" VARCHAR NOT NULL
);

CREATE TABLE "rarity" (
    "TypesId" INT NOT NULL PRIMARY KEY,
    "Type" VARCHAR NOT NULL
);

CREATE TABLE "cards" (
    "TypeId" INT PRIMARY KEY NOT NULL,
    "ManaCost" VARCHAR NOT NULL,
    "Name" VARCHAR NOT NULL,
    "Artist" VARCHAR NOT NULL,
    "Multiverse" LONG NOT NULL,
    "Rarity" VARCHAR NOT NULL,
    "ScryfallId" VARCHAR NOT NULL

--     CONSTRAINT "FK_TypeId" FOREIGN KEY ("TypeId") REFERENCES "types" ("TypesId") ON DELETE NO ACTION ON UPDATE NO ACTION
--     CONSTRAINT "FK_Rarity" FOREIGN KEY ("Rarity") REFERENCES "rarity" ("TypesId") ON DELETE NO ACTION ON UPDATE NO ACTION
);

    CREATE INDEX "IFK_TypesId" ON "types" ("TypesId");


INSERT INTO "cards" VALUES (1,'3WB','Naomi Pillar of Order','Joshua Raphael',548542,2,'4400fd66-1a24-47fb-bc94-37e0aae0e610');
INSERT INTO "cards" VALUES (2,'1UB','Satoru Umezawa','Anna Pavleeva',548547,3,'8887f26d-b097-4fbc-9c48-bdc656409a32');
INSERT INTO "cards" VALUES (3,'1','Sol Ring','Mike Bierek',509343,2,'880711b0-da06-4c4f-aa4e-1be58fc0bc67');
INSERT INTO "cards" VALUES (4,'U','Fading Hope','Rovina Cai',534812,2,'c2fb1fff-12be-4bd5-8dba-c36e84d49651');
INSERT INTO "cards" VALUES (5,'8','Ugin, the Spirit Dragon','Raymond Swanland',485324,4,'9c017fa9-7021-417a-9c2e-3df409644fcf');
INSERT INTO "cards" VALUES (6,'U','Ruin Crab','Simon Dominic',491705,2,'738ce273-c938-42d2-83b2-c4f5f4000b0b');
INSERT INTO "cards" VALUES (7,'1U','Maddening Cacophony','Magali Villeneuve',491697,3,'10a79733-702c-4611-b073-71db7f1158b2');
INSERT INTO "cards" VALUES (8,'1WB','Greasefang, Okiba Boss','Victor Adame Minguez',548531,3,'56a0d43b-4d38-40a7-be6c-8324ab3bf773');
INSERT INTO "cards" VALUES (9,'2GU','Grolnok,The Omnivore','Simon Dominic',541112,3,'ac6bae00-e965-4664-b3c7-d160949245a1');
INSERT INTO "cards" VALUES (10,'4GG','Avabruck Caretaker','Heonhwa Choe',544749,4,'c0c358b4-5af2-438f-8bd5-beb0ee6b518b');
INSERT INTO "cards" VALUES (11,'2BB','Sorin, the Mirthless','Bastien L. Deharme',544414,4,'cc7ff5f4-a7cc-41a1-a22b-8cf67ad18707');
INSERT INTO "cards" VALUES (12,'L','Sokenzan, Crucible of Defiance','Lucas Staniec',551786,3,'aa548dcd-c1dd-492d-a69f-c65dfeef0633');
INSERT INTO "cards" VALUES (13,'L','Otawara, Soaring City','Alayna Danner',551785,3,'486d7edc-d983-41f0-8b78-c99aecd72996');
INSERT INTO "cards" VALUES (14,'WUBRG','Sanctum of All','Johannes Voss',488280,3,'ba91338c-1f6c-4b83-851f-98c3e9dea17b');
INSERT INTO "cards" VALUES (15,'GW','Satsuki, the Living Lore','domco',552273,3,'a0dd5813-8c6e-4fa3-b11d-e13f14ce8c4e');
INSERT INTO "cards" VALUES (16,'3GGUU','Koma, Cosmos Serpent','Jesper Ejsing',503837,4,'2de25ea4-284a-4c16-b823-048ff00c6a03');
INSERT INTO "cards" VALUES (17,'5BR','Tibalt, Cosmic Imposter','Grzegorz Rutkowski',507137,4,'ea7e4c65-b4c4-4795-9475-3cba71c50ea5');

INSERT INTO "types" VALUES (1, 'Creature');
INSERT INTO "types" VALUES (2, 'Artifact');
INSERT INTO "types" VALUES (3, 'Instant');
INSERT INTO "types" VALUES (4, 'Planeswalker');
INSERT INTO "types" VALUES (5, 'Sorcery');
INSERT INTO "types" VALUES (6, 'Enchantment');
INSERT INTO "types" VALUES (7, 'Land');

INSERT INTO "coloridentity" VALUES (0, 'X');
INSERT INTO "coloridentity" VALUES (1, 'White');
INSERT INTO "coloridentity" VALUES (2, 'Black');
INSERT INTO "coloridentity" VALUES (3, 'Red');
INSERT INTO "coloridentity" VALUES (4, 'Blue');
INSERT INTO "coloridentity" VALUES (5, 'Green');
INSERT INTO "coloridentity" VALUES (6, 'Gold');
INSERT INTO "coloridentity" VALUES (7, 'Colorless');
INSERT INTO "coloridentity" VALUES (8, 'Green/Blue');
INSERT INTO "coloridentity" VALUES (9, 'Black/Red');

INSERT INTO "rarity" VALUES (1, 'Common');
INSERT INTO "rarity" VALUES (2, 'Uncommon');
INSERT INTO "rarity" VALUES (3, 'Rare');
INSERT INTO "rarity" VALUES (4, 'Mythic');
