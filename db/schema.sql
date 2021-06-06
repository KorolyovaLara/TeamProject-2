DROP DATABASE IF EXISTS gg_db;
CREATE DATABASE gg_db;
USE gg_db;

CREATE TABLE users (
	id INTEGER NOT NULL INTEGER NOT NULL PRIMARY KEY,
	firstName VARCHAR(30) DEFAULT NULL,
	lastName VARCHAR(30) DEFAULT NULL,
	username VARCHAR(30) NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE,
	password VARCHAR(32) NOT NULL,
	registeredAt DATETIME DEFAULT NULL,
	lastLogin DATETIME DEFAULT NULL,
	intro TINYTEXT,
);

CREATE TABLE games (
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	gameTitle VARCHAR(50) NOT NULL
);
    
CREATE TABLE game_collections (
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	gameId INTEGER NOT NULL,
	userId INTEGER NOT NULL ,
    CONSTRAINT fk_user FOREIGN KEY (userId) REFERENCES users(id),
    CONSTRAINT fk_game FOREIGN KEY (gameId) REFERENCES games(id)
);
    
CREATE TABLE posts (
	id INTEGER NOT NULL AUTO_INCREMENT,
	authorId INTEGER NOT NULL REFERENCES users(id),
	title VARCHAR(75) NOT NULL,
	slug VARCHAR(100) NOT NULL,
	summary TINYTEXT,
	createdAt DATETIME NOT NULL,
	updatedAt DATETIME DEFAULT NULL,
	publishedAt DATETIME DEFAULT NULL,
	content TEXT  ,
	PRIMARY KEY (id),
	UNIQUE KEY uq_slug (slug),
	CONSTRAINT fk_post_user FOREIGN KEY (authorId) REFERENCES users(id)
); 

CREATE TABLE comments (
	id INTEGER NOT NULL AUTO_INCREMENT,
	postId INTEGER NOT NULL,
	title VARCHAR(100) NOT NULL,
	createdAt DATETIME NOT NULL,
	publishedAt DATETIME DEFAULT NULL,
	content TEXT,
	PRIMARY KEY (id),
	CONSTRAINT fk_comment_post FOREIGN KEY (postId) REFERENCES posts(id)
); 

CREATE TABLE tags (
	id INTEGER NOT NULL AUTO_INCREMENT,
	title VARCHAR(75) NOT NULL,
	slug VARCHAR(100) NOT NULL,
	content TEXT,
	PRIMARY KEY (id)
);

CREATE TABLE post_tag (
	postId INTEGER NOT NULL,
	tagId INTEGER NOT NULL,
	PRIMARY KEY (postId, tagId),
	CONSTRAINT fk_pt_post FOREIGN KEY (postId) REFERENCES posts(id),
	CONSTRAINT fk_pt_tag FOREIGN KEY (tagId) REFERENCES tags(id)
);