package com.azatkhaliullin.digitalchief.repository;

import com.azatkhaliullin.digitalchief.dto.Library;
import org.springframework.data.repository.CrudRepository;

public interface LibraryRepository
        extends CrudRepository<Library, Long> {
}