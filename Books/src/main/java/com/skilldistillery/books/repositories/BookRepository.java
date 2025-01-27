package com.skilldistillery.books.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.books.entities.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {

	List<Book> findByAuthorId(int authorId);
	List<Book> findByGenreId(int genreId); 
	
}
