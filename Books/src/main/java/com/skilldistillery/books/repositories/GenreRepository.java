package com.skilldistillery.books.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.books.entities.Genre;

public interface GenreRepository extends JpaRepository<Genre, Integer> {

}
