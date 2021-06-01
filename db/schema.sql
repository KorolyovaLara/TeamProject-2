DROP DATABASE IF EXISTS gg_db;
CREATE DATABASE gg_db;
USE gg_db;

CREATE TABLE users (
	user_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30),
    username VARCHAR(30) NOT NULL
);

CREATE TABLE games (
	game_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    game_title VARCHAR(30) NOT NULL,
    users_playing INTEGER
    );
    

CREATE TABLE games_info (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	game_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL
    );