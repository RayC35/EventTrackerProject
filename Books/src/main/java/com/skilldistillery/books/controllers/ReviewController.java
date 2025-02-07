package com.skilldistillery.books.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.books.entities.Review;
import com.skilldistillery.books.services.ReviewService;

@CrossOrigin({"*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
//	ALREADY IN THE BOOK CONTROLLER, UNNECESSARY HERE?
	@GetMapping("books/{bookId}/review")
	public Review findReview(@PathVariable("bookId") int bookId) {
		return reviewService.findReviewForBook(bookId);
	}
	
	@PostMapping("books/{bookId}/review")
	public Review createReview(@PathVariable("bookId") int bookId, @RequestBody Review newReview) {
		return reviewService.createForBook(bookId, newReview);
	}
	
}
