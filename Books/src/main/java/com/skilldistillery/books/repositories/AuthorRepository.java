package com.skilldistillery.books.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.books.entities.Author;

public interface AuthorRepository extends JpaRepository<Author, Integer> {

	Author findByName(String name);
}
