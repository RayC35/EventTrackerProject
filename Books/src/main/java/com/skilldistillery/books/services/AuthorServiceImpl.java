package com.skilldistillery.books.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.books.entities.Author;
import com.skilldistillery.books.repositories.AuthorRepository;

@Service
public class AuthorServiceImpl implements AuthorService {

	@Autowired
	private AuthorRepository authorRepo;

	@Override
	public List<Author> findAll() {
		return authorRepo.findAll();
	}

	@Override
	public Author findById(int authorId) {
		Optional<Author> authorOpt = authorRepo.findById(authorId);
		Author foundAuthor = null;
		if(authorOpt.isPresent()) {
			foundAuthor = authorOpt.get();
		}
		return foundAuthor;
	}

	@Override
	public Author create(Author newAuthor) {
		return authorRepo.saveAndFlush(newAuthor);
	}

	@Override
	public Author update(int authorId, Author author) {
		Optional<Author> authorOpt = authorRepo.findById(authorId);
		Author authorToUpdate = null;
		if(authorOpt.isPresent()) {
			authorToUpdate = authorOpt.get();
		}
			authorToUpdate.setName(author.getName());
			authorToUpdate.setNationality(author.getNationality());
			authorToUpdate.setBirthYear(author.getBirthYear());
			authorToUpdate.setDeathYear(author.getDeathYear());
			authorToUpdate.setImageUrl(author.getImageUrl());
			Author updatedAuthor = authorToUpdate;
			authorRepo.saveAndFlush(updatedAuthor);
			return updatedAuthor;
		}

	@Override
	public boolean deleteById(int authorId) {
		boolean deleted = false;
		authorRepo.deleteById(authorId);
		deleted = true;
//		if(authorRepo.existsById(authorId)) {
//			authorRepo.;
//		}
		return deleted;
	}

	@Override
	public Author findByName(String name) {
		return authorRepo.findByName(name);
		
	}
}
