import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Book } from '../../models/book';
import { BookService } from '../../services/book.service';

@Component({
  selector: 'app-home',
  imports: [
    CommonModule,
    FormsModule,
  ],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent implements OnInit {

  books: Book[] = [];

  constructor(
    private bookService: BookService,
  ){}

  ngOnInit(): void {
    this.loadBooks();
  }

  loadBooks(): void {
    this.bookService.index().subscribe({
      next: (bookList) => {
        this.books = bookList;
      } ,
      error: (someError) => {
        console.error('HomeComponent.loadBooks: error');
        console.error(someError);
      } ,
    });
  }

}
