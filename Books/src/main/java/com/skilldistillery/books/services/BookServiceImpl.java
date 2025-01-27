package com.skilldistillery.books.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.books.entities.Book;
import com.skilldistillery.books.repositories.AuthorRepository;
import com.skilldistillery.books.repositories.BookRepository;
import com.skilldistillery.books.repositories.GenreRepository;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookRepository bookRepo;
	@Autowired
	private AuthorRepository authorRepo;
	@Autowired
	private GenreRepository genreRepo;
	
	@Override
	public List<Book> findAll() {
		return bookRepo.findAll();
	}

	@Override
	public Book findById(int bookId) {
		Optional<Book> bookOpt = bookRepo.findById(bookId);
		Book book = null;
		if(bookOpt.isPresent()) {
			book = bookOpt.get();
		}
		return book; 
		
	}

	@Override
	public Book create(Book newBook) {
		return bookRepo.saveAndFlush(newBook);
	}

	//REMEMBER TO SAVE AND FLUSH!!
	@Override
	public Book update(int bookId, Book book) {
		Optional<Book> bookOpt = bookRepo.findById(bookId);
		Book bookToUpdate = null;
		if (bookOpt.isPresent()) {
			bookToUpdate = bookOpt.get();
		}
		bookToUpdate.setTitle(book.getTitle());
		bookToUpdate.setAuthor(book.getAuthor());
		bookToUpdate.setGenre(book.getGenre());
		bookToUpdate.setYearPublished(book.getYearPublished());
		bookToUpdate.setSynopsis(book.getSynopsis());
		bookToUpdate.setPages(book.getPages());
		bookToUpdate.setCoverImageUrl(book.getCoverImageUrl());
		Book updatedBook = bookToUpdate;
		bookRepo.saveAndFlush(updatedBook);
		return updatedBook;
	}

	@Override
	public boolean deleteById(int bookId) {
		boolean deleted = false;
//		if(bookRepo.existsById(bookId)) {
//			Optional<Book> bookOpt = bookRepo.findById(bookId);
//			if(bookOpt.isPresent()) {
//				Book disabledBook = bookOpt.get();
//				disabledBook.setEnabled(0);
//				deleted = true;
//			}
			bookRepo.deleteById(bookId);
			deleted = true;
		return deleted;
	}

	@Override
	public List<Book> findByAuthorId(int authorId) {
		List<Book> foundBooks = null;
		if(authorRepo.existsById(authorId)) {
			foundBooks = bookRepo.findByAuthorId(authorId);
		}
		return foundBooks;
	}

	@Override
	public List<Book> findByGenreId(int genreId) {
		List<Book> foundBooks = null;
		if(genreRepo.existsById(genreId)) {
			foundBooks = bookRepo.findByGenreId(genreId);
		}
		return foundBooks;
	}
	

}
