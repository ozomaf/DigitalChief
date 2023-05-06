package com.azatkhaliullin.digitalchief.repository;

import com.azatkhaliullin.digitalchief.dto.Book;
import org.springframework.data.repository.CrudRepository;

public interface BookRepository
        extends CrudRepository<Book, Long> {
}