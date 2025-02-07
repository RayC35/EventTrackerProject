import { last } from "rxjs";
import { Author } from "./author";

export class Book {
  id: number;
  title: string;
  yearPublished: number;
  synopsis: string;
  pages: number;
  lastUpdate: string;
  createDate: string;
  coverImageUrl: string;
  enabled: boolean;
  author: Author;

  constructor(
    id: number = 0,
    title: string = '',
    yearPublished: number = 0,
    synopsis: string = '',
    pages: number = 0,
    lastUpdate: string = '',
    createDate: string = '',
    coverImageUrl: string = '',
    enabled: boolean = true,
    author: Author = new Author(),

  ) {
    this.id = id;
    this.title = title;
    this.yearPublished = yearPublished;
    this.synopsis = synopsis;
    this.pages = pages;
    this.lastUpdate = lastUpdate;
    this.createDate = createDate;
    this.coverImageUrl = coverImageUrl;
    this.enabled = enabled;
    this.author = author;
  }
}
