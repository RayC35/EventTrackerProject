package com.skilldistillery.books.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.books.entities.Author;
import com.skilldistillery.books.entities.Genre;
import com.skilldistillery.books.repositories.AuthorRepository;
import com.skilldistillery.books.repositories.GenreRepository;

@Service
public class GenreServiceImpl implements GenreService {

	@Autowired
	private GenreRepository genreRepo;

	@Override
	public List<Genre> findAll() {
		return genreRepo.findAll();
	}

	@Override
	public Genre findById(int genreId) {
		Optional<Genre> genreOpt = genreRepo.findById(genreId);
		Genre foundGenre = null;
		if(genreOpt.isPresent()) {
			foundGenre = genreOpt.get();
		}
		return foundGenre;
	}

	@Override
	public Genre create(Genre newGenre) {
		return genreRepo.saveAndFlush(newGenre);
		
	}

	@Override
	public boolean deleteById(int genreId) {
		boolean deleted = false;
		genreRepo.deleteById(genreId);
		deleted = true;
		return deleted;
	}

	@Override
	public Genre findByName(String name) {
		return genreRepo.findByName(name);
	}
}
