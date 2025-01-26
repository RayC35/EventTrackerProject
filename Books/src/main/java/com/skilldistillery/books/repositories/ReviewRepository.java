package com.skilldistillery.books.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.books.entities.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer> {

	Review findReviewByBookId(int bookId);
	
}
