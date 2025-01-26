package com.skilldistillery.books.services;

import java.util.List;

import com.skilldistillery.books.entities.Genre;

public interface GenreService {
	List<Genre> findAll();
	Genre findById(int genreId);
	Genre create(Genre newGenre);
//	Genre update(int genreId, Genre genre);
	boolean deleteById(int genreId);
	

}
