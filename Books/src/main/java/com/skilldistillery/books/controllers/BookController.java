package com.skilldistillery.books.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.books.entities.Book;
import com.skilldistillery.books.services.BookService;

import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("api")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	//WORKS!
	@GetMapping("books")
	public List<Book> listBooks() {
		return bookService.findAll();
	}
	
	//WORKS!
	@GetMapping("books/{bookId}")
	public Book findBook(@PathVariable("bookId") int bookId) {
		Book foundBook = bookService.findById(bookId);
		return foundBook;
	}
	
	//WORKS!
	@PostMapping("books")
	public Book createBook(@RequestBody Book newBook) {
		return bookService.create(newBook);
	}
	
	//WORKS!
	@PutMapping("books/{bookId}")
	public Book updateBook(@PathVariable("bookId") int bookId, @RequestBody Book revisedBook, HttpServletResponse res) {
		revisedBook = bookService.update(bookId, revisedBook);
		if(revisedBook == null) {
			res.setStatus(HttpServletResponse.SC_NOT_FOUND);//404
		}
		return revisedBook;
	}

	//WORKS!
	@DeleteMapping("books/{bookId}")
	public void deleteBook(@PathVariable("bookId") int bookId) {
		boolean wasDeleted = bookService.deleteById(bookId);
	}
}
