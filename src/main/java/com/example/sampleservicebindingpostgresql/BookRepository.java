package com.example.sampleservicebindingpostgresql;

import java.util.List;
import org.springframework.data.repository.CrudRepository;


public interface BookRepository extends CrudRepository<Book, Long> {

    List<Book> findByName(String name);

    Iterable<Book> findAll();
}