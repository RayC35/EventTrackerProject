package com.skilldistillery.books.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class BookTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Book book;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAbooks");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		book = em.find(Book.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_Book_Entity_mapping() {
		assertNotNull(book);
		assertEquals("The Winter of Our Discontent", book.getTitle());
	}
	@Test
	void test_Book_Review_OneToOne_mapping() {
		assertNotNull(book);
		assertNotNull(book.getReview());
		assertEquals(1, book.getReview().getId());
	}
	
	@Test
	void test_Book_Author_ManyToOne_mapping() {
		assertNotNull(book);
		assertNotNull(book.getAuthor());
		assertEquals("John Steinbeck", book.getAuthor().getName());
	}

	@Test
	void test_Book_Genre_ManyToOne_mapping() {
		assertNotNull(book);
		assertNotNull(book.getGenre());
		assertEquals("Fiction", book.getGenre().getName());
	}
	
}
