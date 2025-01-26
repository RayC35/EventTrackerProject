package com.skilldistillery.books.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.books.entities.Genre;
import com.skilldistillery.books.services.GenreService;

@RestController
@RequestMapping("api")
public class GenreController {
	
	@Autowired
	private GenreService genreService;
	
	//WORKS!
	@GetMapping("genres")
	public List<Genre> listGenres() {
		return genreService.findAll();
	}
	//WORKS!
	@GetMapping("genres/{genreId}")
	public Genre findGenreById(@PathVariable("genreId") int genreId) {
		return genreService.findById(genreId);
	}
	//WORKS!
	@PostMapping("genres")
	public Genre createGenre(@RequestBody Genre newGenre) {
		return genreService.create(newGenre);
	}
	//WORKS!
	@DeleteMapping("genres/{genreId}")
	public void deleteGenre(@PathVariable("genreId") int genreId) {
		genreService.deleteById(genreId);
	}
}
