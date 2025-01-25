package com.skilldistillery.books.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.books.entities.Book;
import com.skilldistillery.books.services.BookService;

@RestController
@RequestMapping("api")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@GetMapping("books")
	public List<Book> listBooks() {
		return bookService.findAll();
	}
	
	@GetMapping("books/{bookId}")
	public Book findBook(@PathVariable("bookId") int bookId) {
		Book foundBook = bookService.findById(bookId);
		return foundBook;
	}
	

}
