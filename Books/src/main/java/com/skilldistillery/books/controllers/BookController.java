package com.skilldistillery.books.controllers;

import java.util.List;

import org.hibernate.boot.model.source.spi.HibernateTypeSource;
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
	public Book findBook(@PathVariable("bookId") int bookId, HttpServletResponse res) {
		Book foundBook = bookService.findById(bookId);
		if(foundBook == null) {
			res.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		return foundBook;
	}
	
	//WORKS!
	@PostMapping("books")
	public Book createBook(@RequestBody Book newBook, HttpServletResponse res) {
		try {
			newBook = bookService.create(newBook);
			if(newBook != null) {
			res.setStatus(HttpServletResponse.SC_CREATED);
			} else {
				res.setStatus(HttpServletResponse.SC_NOT_FOUND);
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		return newBook;
	}
	
	//WORKS!
	@PutMapping("books/{bookId}")
	public Book updateBook(@PathVariable("bookId") int bookId, @RequestBody Book revisedBook, HttpServletResponse res) {
		try {
			revisedBook = bookService.update(bookId, revisedBook);
			if(revisedBook == null) {
				res.setStatus(HttpServletResponse.SC_NOT_FOUND);//404
			} else {
				res.setStatus(HttpServletResponse.SC_OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		return revisedBook;
	}

	//WORKS!
	@DeleteMapping("books/{bookId}")
	public void deleteBook(@PathVariable("bookId") int bookId, HttpServletResponse res) {
		try {
//			boolean wasDeleted = bookService.deleteById(bookId);
			if(bookService.deleteById(bookId)) {
			res.setStatus(HttpServletResponse.SC_NO_CONTENT);
			} else {
				res.setStatus(HttpServletResponse.SC_NOT_FOUND);
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
	}
	//WORKS!
	@GetMapping("authors/{authorId}/books")
	public List<Book> findBooksByAuthor(@PathVariable("authorId") int authorId) {
		List<Book> foundBooks = bookService.findByAuthorId(authorId);
		return foundBooks;
	}
	//WORKS!
	@GetMapping("genres/{genreId}/books")
	public List<Book> findBooksByGenre(@PathVariable("genreId") int genreId) {
		List<Book> foundBooks = bookService.findByGenreId(genreId);
		return foundBooks;
	}
}
