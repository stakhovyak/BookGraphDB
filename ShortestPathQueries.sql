---- Найти кратчайший путь между книгами "Война и мир" и "Преступление и наказание" через авторов, которые рекомендуют эти книги (шаблон "+")
--SELECT *
--FROM SHORTEST_PATH(
--    (SELECT book_id FROM Books WHERE title = 'Война и мир'),
--    (SELECT book_id FROM Books WHERE title = 'Преступление и наказание'),
--    (
--        MATCH (b1:Books) -[:Recommends]-> (a:Authors) -[:Recommends]-> (b2:Books)
--        WHERE b1.title = 'Война и мир' AND b2.title = 'Преступление и наказание'
--    )
--);
--GO

---- Найти кратчайший путь между авторами Лев Толстой и Фёдор Достоевский через книги и жанры (шаблон "{1,2}")
--SELECT *
--FROM SHORTEST_PATH(
--    (SELECT author_id FROM Authors WHERE name = 'Лев Толстой'),
--    (SELECT author_id FROM Authors WHERE name = 'Фёдор Достоевский'),
--    (
--        MATCH (a1:Authors) -[:Wrote]-> (b:Books) -[:BelongsToGenre]-> (g:Genres) <-[:BelongsToGenre]- (b2:Books) <-[:Wrote]- (a2:Authors)
--        WHERE a1.name = 'Лев Толстой' AND a2.name = 'Фёдор Достоевский'
--    )
--    UP TO 2 EDGES
--);
--GO

-- Найти кратчайший путь от книги "Война и мир" до книги "Преступление и наказание" через авторов и их рекомендации
WITH RECURSIVE BookPath AS (
    SELECT
        b1.book_id AS start_book,
        b1.title AS start_title,
        r.book_id AS recommended_book,
        b2.title AS recommended_title,
        1 AS level
    FROM Books b1
    JOIN Recommends r ON b1.book_id = r.book_id
    JOIN Books b2 ON r.book_id = b2.book_id
    WHERE b1.title = 'Война и мир'
    UNION ALL
    SELECT
        bp.start_book,
        bp.start_title,
        r.book_id,
        b.title,
        bp.level + 1
    FROM BookPath bp
    JOIN Recommends r ON bp.recommended_book = r.book_id
    JOIN Books b ON r.book_id = b.book_id
    WHERE bp.level < 5
)
SELECT *
FROM BookPath
WHERE recommended_title = 'Преступление и наказание';
GO

-- Найти кратчайший путь между авторами через книги, которые они написали и рекомендуют (до 3 шагов)
WITH RECURSIVE AuthorPath AS (
    SELECT
        a1.author_id AS start_author,
        a1.name AS start_name,
        w.book_id AS book_written,
        r.book_id AS book_recommended,
        a2.author_id AS next_author,
        a2.name AS next_name,
        1 AS level
    FROM Authors a1
    JOIN Wrote w ON a1.author_id = w.author_id
    JOIN Recommends r ON w.book_id = r.book_id
    JOIN Authors a2 ON r.author_id = a2.author_id
    WHERE a1.name = 'Лев Толстой'
    UNION ALL
    SELECT
        ap.start_author,
        ap.start_name,
        w.book_id,
        r.book_id,
        a2.author_id,
        a2.name,
        ap.level + 1
    FROM AuthorPath ap
    JOIN Wrote w ON ap.next_author = w.author_id
    JOIN Recommends r ON w.book_id = r.book_id
    JOIN Authors a2 ON r.author_id = a2.author_id
    WHERE ap.level < 3
)
SELECT *
FROM AuthorPath
WHERE next_name = 'Фёдор Достоевский';
GO
