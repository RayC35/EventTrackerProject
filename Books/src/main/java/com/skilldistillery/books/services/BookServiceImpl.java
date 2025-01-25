package com.skilldistillery.books.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.books.entities.Book;
import com.skilldistillery.books.repositories.BookRepository;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookRepository bookRepo;
	
	@Override
	public List<Book> findAll() {
		return bookRepo.findAll();
	}

	@Override
	public Book findById(int bookId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book create(Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book update(int bookId, Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(int bookId) {
		// TODO Auto-generated method stub
		return false;
	}

}
