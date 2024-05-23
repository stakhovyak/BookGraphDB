-- Найти все книги, написанные Львом Толстым
SELECT b.title
FROM Books b
JOIN Wrote w ON b.book_id = w.book_id
JOIN Authors a ON w.author_id = a.author_id
WHERE a.name = 'Лев Толстой';
GO

-- Найти всех авторов, которые написали книги в жанре "Драма"
SELECT a.name
FROM Authors a
JOIN Wrote w ON a.author_id = w.author_id
JOIN BelongsToGenre bg ON w.book_id = bg.book_id
JOIN Genres g ON bg.genre_id = g.genre_id
WHERE g.name = 'Драма';
GO

-- Найти книги, которые рекомендует Фёдор Достоевский
SELECT b.title
FROM Books b
JOIN Recommends r ON b.book_id = r.book_id
JOIN Authors a ON r.author_id = a.author_id
WHERE a.name = 'Фёдор Достоевский';
GO

-- Найти все жанры, к которым принадлежат книги Льва Толстого
SELECT g.name
FROM Genres g
JOIN BelongsToGenre bg ON g.genre_id = bg.genre_id
JOIN Wrote w ON bg.book_id = w.book_id
JOIN Authors a ON w.author_id = a.author_id
WHERE a.name = 'Лев Толстой';
GO

-- Найти авторов, которые рекомендуют книги в жанре "Фантастика"
SELECT DISTINCT a1.name
FROM Authors a1
JOIN Recommends r ON a1.author_id = r.author_id
JOIN Books b ON r.book_id = b.book_id
JOIN BelongsToGenre bg ON b.book_id = bg.book_id
JOIN Genres g ON bg.genre_id = g.genre_id
WHERE g.name = 'Фантастика';
GO
