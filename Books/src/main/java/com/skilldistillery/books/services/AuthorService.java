package com.skilldistillery.books.services;

import java.util.List;

import com.skilldistillery.books.entities.Author;

public interface AuthorService {
	List<Author> findAll();
	Author findById(int authorId);
	Author create(Author newAuthor);
	Author update(int authorId, Author author);
	boolean deleteById(int authorId);
	

}
