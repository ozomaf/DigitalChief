create table if not exists public.library
(
    id              bigint  not null
    primary key,
    address         varchar(255),
    name            varchar(255) UNIQUE,
    number_of_books integer,
    open_hours      varchar(255)
    );

create table if not exists public.book
(
    id                  bigint  not null
    primary key,
    author              varchar(255),
    genre               varchar(255),
    number_of_pages     integer,
    title               varchar(255) UNIQUE,
    year_of_publication integer
    );

create table if not exists public.library_books
(
    library_id bigint not null
    constraint fkcwjjd1vlba8vwjrjkvyaaomqw
    references public.library,
    books_id   bigint not null
    constraint uk_7m4iivmk0hwb7eiy8da1s9ep6
    unique
    constraint fk2tq0q7jfgg3w5mgeqxjl24mej
    references public.book
);

create sequence public.book_seq
    increment by 50;

create sequence public.library_seq
    increment by 50;

WITH central_lib AS (
INSERT INTO library (id, address, name, number_of_books, open_hours)
VALUES (nextval('library_seq'), '123 Main Street', 'Central Library', 1000, '9:00AM-5:00PM')
    RETURNING id
    ),
    book_1 AS (
INSERT INTO book (id, author, genre, number_of_pages, title, year_of_publication)
VALUES (nextval('book_seq'), 'F. Scott Fitzgerald', 'Novel', 180, 'The Great Gatsby', 1925)
    RETURNING id
    ),
    book_2 AS (
INSERT INTO book (id, author, genre, number_of_pages, title, year_of_publication)
VALUES (nextval('book_seq'), 'Harper Lee', 'Novel', 281, 'To Kill a Mockingbird', 1960)
    RETURNING id
    ),
    branch_lib AS (
INSERT INTO library (id, address, name, number_of_books, open_hours)
VALUES (nextval('library_seq'), '456 Oak Street', 'Branch Library', 500, '10:00AM-6:00PM')
    RETURNING id
    ),
    book_3 AS (
INSERT INTO book (id, author, genre, number_of_pages, title, year_of_publication)
VALUES (nextval('book_seq'), 'George Orwell', 'Dystopian fiction', 328, '1984', 1949)
    RETURNING id
    ),
    book_4 AS (
INSERT INTO book (id, author, genre, number_of_pages, title, year_of_publication)
VALUES (nextval('book_seq'), 'Jane Austen', 'Romance novel', 279, 'Pride and Prejudice', 1813)
    RETURNING id
    )
INSERT INTO library_books (library_id, books_id)
VALUES
    ((SELECT id FROM central_lib), (SELECT id FROM book_1)),
    ((SELECT id FROM central_lib), (SELECT id FROM book_2)),
    ((SELECT id FROM branch_lib), (SELECT id FROM book_3)),
    ((SELECT id FROM branch_lib), (SELECT id FROM book_4));