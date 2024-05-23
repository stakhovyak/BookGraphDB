-- Inserting data into the Books table
INSERT INTO Books (book_id, title, publication_year, isbn)
VALUES
(1, 'War and Peace', 1869, '978-3-16-148410-0'),
(2, 'Crime and Punishment', 1866, '978-1-23-456789-7'),
(3, 'Anna Karenina', 1877, '978-5-17-118367-4'),
(4, 'The Brothers Karamazov', 1880, '978-5-04-111307-7'),
(5, 'The Idiot', 1869, '978-5-17-118427-5'),
(6, 'The Master and Margarita', 1966, '978-5-04-111308-4'),
(7, 'Doctor Zhivago', 1957, '978-5-04-111309-1'),
(8, 'And Quiet Flows the Don', 1940, '978-5-17-118428-2'),
(9, 'Father Goriot', 1835, '978-5-04-111310-7'),
(10, 'Gone with the Wind', 1936, '978-5-17-118429-9');
GO

-- Inserting data into the Authors table
INSERT INTO Authors (author_id, name, birthdate, nationality)
VALUES
(1, 'Leo Tolstoy', '1828-09-09', 'Russian'),
(2, 'Fyodor Dostoevsky', '1821-11-11', 'Russian'),
(3, 'Mikhail Bulgakov', '1891-05-15', 'Russian'),
(4, 'Boris Pasternak', '1890-02-10', 'Russian'),
(5, 'Mikhail Sholokhov', '1905-05-24', 'Russian'),
(6, 'Honoré de Balzac', '1799-05-20', 'French'),
(7, 'Margaret Mitchell', '1900-11-08', 'American'),
(8, 'Antoine de Saint-Exupéry', '1900-06-29', 'French'),
(9, 'Alexander Pushkin', '1799-06-06', 'Russian'),
(10, 'Nikolai Gogol', '1809-03-31', 'Russian');
GO

-- Inserting data into the Genres table
INSERT INTO Genres (genre_id, name)
VALUES
(1, 'Classics'),
(2, 'Drama'),
(3, 'Science Fiction'),
(4, 'Novel'),
(5, 'Historical Novel'),
(6, 'Psychological Novel'),
(7, 'Social Novel'),
(8, 'Poetry'),
(9, 'Adventure'),
(10, 'Philosophy');
GO
