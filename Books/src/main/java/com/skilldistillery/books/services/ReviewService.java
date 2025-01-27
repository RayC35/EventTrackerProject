package com.skilldistillery.books.services;

import com.skilldistillery.books.entities.Review;

public interface ReviewService {
	Review findReviewForBook(int bookId);
//	Review findById(int reviewId);
	Review createForBook(int bookId, Review newReview);
	Review update(int reviewId, Review review);
	boolean deleteById(int reviewId);
	

}
