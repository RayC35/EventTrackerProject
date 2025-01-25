package com.skilldistillery.books.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.books.entities.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {

}
