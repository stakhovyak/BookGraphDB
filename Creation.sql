USE master;
GO

-- Создание новой базы данных
CREATE DATABASE BookGraphDB;
GO

-- Переход к созданной базе данных
USE BookGraphDB;
GO

-- Создание таблицы узлов для книг
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title NVARCHAR(255),
    publication_year INT,
    isbn NVARCHAR(20)
);
GO

-- Создание таблицы узлов для авторов
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name NVARCHAR(255),
    birthdate DATE,
    nationality NVARCHAR(100)
);
GO

-- Создание таблицы узлов для жанров
CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    name NVARCHAR(100)
);
GO

-- Создание таблицы рёбер для связей "Написал"
CREATE TABLE Wrote (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
GO

-- Создание таблицы рёбер для связей "Принадлежит к жанру"
CREATE TABLE BelongsToGenre (
    book_id INT,
    genre_id INT,
    PRIMARY KEY (book_id, genre_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
GO

-- Создание таблицы рёбер для связей "Рекомендует"
CREATE TABLE Recommends (
    author_id INT,
    book_id INT,
    recommendation_date DATE,
    PRIMARY KEY (author_id, book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
GO
