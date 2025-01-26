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

import com.skilldistillery.books.entities.Author;
import com.skilldistillery.books.services.AuthorService;

import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("api")
public class AuthorController {
	
	@Autowired
	private AuthorService authorService;
	
	//WORKS!
	@GetMapping("authors")
	public List<Author> listAuthors() {
		return authorService.findAll();
	}
	//WORKS!
	@GetMapping("authors/{authorId}")
	public Author findAuthorById(@PathVariable("authorId") int authorId) {
		return authorService.findById(authorId);
	}
	//WORKS!
	@PostMapping("authors")
	public Author createAuthor(@RequestBody Author newAuthor) {
		return authorService.create(newAuthor);
	}
	//WORKS!
	@PutMapping("authors/{authorId}")
	public Author updateAuthor(@PathVariable("authorId") int authorID, @RequestBody Author authorToUpdate, HttpServletResponse res) {
		Author updatedAuthor = authorService.update(authorID, authorToUpdate);
		if(updatedAuthor == null) {
			res.setStatus(HttpServletResponse.SC_NOT_FOUND);//404
		}
		return updatedAuthor;
	}
	//WORKS!
	@DeleteMapping("authors/{authorId}")
	public void deleteAuthor(@PathVariable("authorId") int authorId) {
		boolean wasDeleted = authorService.deleteById(authorId);
	}
	
	
}
