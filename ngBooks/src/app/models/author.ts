import { NumberValueAccessor } from "@angular/forms";

export class Author {
  id: number;
  name: string;
  nationality: string;
  birthYear: number;
  deathYear: number;
  imageUrl: string;
  enabled: boolean;

constructor(
  id: number = 0,
  name: string = '',
  nationality: string = '',
  birthYear: number = 0,
  deathYear: number = 0,
  imageUrl: string = '',
  enabled: boolean = true,
) {
  this.id = id;
  this.name = name;
  this.nationality = nationality;
  this.birthYear = birthYear;
  this.deathYear = deathYear;
  this.imageUrl = imageUrl;
  this.enabled = enabled;
}
}
