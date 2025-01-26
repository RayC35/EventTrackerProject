package com.skilldistillery.books.services;

import java.util.List;

import com.skilldistillery.books.entities.Book;

public interface BookService {
	List<Book> findAll();
	Book findById(int bookId);
	Book create(Book newBook);
	Book update(int bookId, Book book);
	boolean deleteById(int bookId);
	

}
