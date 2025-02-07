import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Book } from '../models/book';
import { Observable, catchError, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BookService {

  private url = environment.baseUrl + 'api/books';

  constructor(
    private http: HttpClient
  ) { }

  index() : Observable<Book[]> {
    return this.http.get<Book[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('BookService.index(): error retrieving book list: ' + err)
        );
      })
    );
  }

}
