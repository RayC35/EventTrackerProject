package com.skilldistillery.books.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.books.entities.Book;
import com.skilldistillery.books.entities.Review;
import com.skilldistillery.books.repositories.BookRepository;
import com.skilldistillery.books.repositories.ReviewRepository;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewRepository reviewRepo;
	@Autowired
	private BookRepository bookRepo;

//	@Override
//	public Review findReviewForBook(int bookId) {
//		if(!bookRepo.existsById(bookId)) {
//			return null;
//		}
//		return reviewRepo.findReviewByBookId(bookId);
//	}

	@Override
	public Review createForBook(int bookId, Review newReview) {
		Optional<Book> bookOpt = bookRepo.findById(bookId);
		if(bookOpt.isPresent()) {
//			newReview.setBook(bookOpt.get());
		}
		return reviewRepo.saveAndFlush(newReview);
	}

	@Override
	public Review update(int reviewId, Review review) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(int reviewId) {
		// TODO Auto-generated method stub
		return false;
	}

}
