DROP TABLE IF EXISTS pokemon;
CREATE TABLE IF NOT EXISTS pokemon(
pokemonId INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT
);

DROP TABLE IF EXISTS types;
CREATE TABLE IF NOT EXISTS types(
typeId INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT
);

DROP TABLE IF EXISTS moves;
CREATE TABLE IF NOT EXISTS moves(
moveId INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
power TEXT
);

DROP TABLE IF EXISTS effectiveness;
CREATE TABLE IF NOT EXISTS effectiveness(
efffectivenessId INTEGER PRIMARY KEY AUTOINCREMENT,
attackTypeId INTEGER,
 defenseTypeId INTEGER,
 multiplier INTEGER
);

DROP TABLE IF EXISTS pokemon_moves;
CREATE TABLE IF NOT EXISTS pokemon_moves(
pokemonMoveId INTEGER PRIMARY KEY AUTOINCREMENT,
pokemonId INTEGER,
moveId INTEGER
);

DROP TABLE IF EXISTS pokemon_types;
CREATE TABLE IF NOT EXISTS pokemon_types(
pokemontypesId INTEGER PRIMARY KEY AUTOINCREMENT,
pokemonId INTEGER,
typeId INTEGER
);
 
DROP VIEW IF EXISTS pokedex;
CREATE VIEW IF NOT EXISTS pokedex
AS
SELECT
pokemon.pokemonId,
pokemon.name AS "PokemonName",
moves.moveId,
moves.name AS "MoveName",
types.typeId,
moves.power AS "Power",
types.name AS "Type"

FROM pokemon
JOIN pokemon_moves USING (pokemonId)
JOIN moves USING (moveId)
JOIN pokemon_types USING (pokemonId)
JOIN types USING (typeId);

DROP VIEW IF EXISTS battle;
CREATE VIEW IF NOT EXISTS battle
AS
SELECT 
effectiveness. *,
attack.name AS "attackType",
defense.name AS "defenseType"
FROM effectiveness
JOIN types AS attack ON attack.typeId = effectiveness.attackTypeId
JOIN types AS defense ON defense.typeId = effectiveness.defenseTypeId;