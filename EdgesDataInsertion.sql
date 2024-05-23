-- Вставка данных в таблицу Wrote
INSERT INTO Wrote (book_id, author_id)
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 2),
(6, 3),
(7, 4),
(8, 5),
(9, 6),
(10, 7);
GO

-- Вставка данных в таблицу BelongsToGenre
INSERT INTO BelongsToGenre (book_id, genre_id)
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 2),
(6, 3),
(7, 4),
(8, 5),
(9, 6),
(10, 7);
GO

-- Вставка данных в таблицу Recommends
INSERT INTO Recommends (author_id, book_id, recommendation_date)
VALUES
(1, 2, '2024-05-01'),
(2, 1, '2024-05-02'),
(3, 4, '2024-05-03'),
(4, 5, '2024-05-04'),
(5, 3, '2024-05-05'),
(6, 10, '2024-05-06'),
(7, 8, '2024-05-07'),
(8, 9, '2024-05-08'),
(9, 6, '2024-05-09'),
(10, 7, '2024-05-10');
GO

select * from Authors