console.log('script.js loaded');


window.addEventListener('load', function(e){
	console.log('Document loaded.');
	init();	
});

function init() {
	console.log('In init()');
	loadBookList();
	document.getElementById('toggleAddForm').addEventListener('click',toggleAddForm);
	document.getElementById('addBookDiv').style.display = 'none';
	document.getElementById('editDiv').style.display = 'none';
	//event listeners for HTML form buttons, etc
  //ADD FORM
	 document.addBookForm.addBook.addEventListener('click', function(e){
		e.preventDefault();
		let newBook = {
			title : addBookForm.title.value,
			author :{
				//id: 1,
				name: addBookForm.author.value  
			},
			genre : {
				name: addBookForm.genre.value
			},
			yearPublished : addBookForm.yearPublished.value,
			synopsis : addBookForm.synopsis.value,
			pages : addBookForm.pages.value,
		};
		console.log(newBook);
		createBook(newBook);
		addBookForm.reset();
		toggleAddForm();
	}); 
  //EDIT FORM
	document.editBookForm.submitEdit.addEventListener('click', function(e){
		e.preventDefault();
		
		let form = document.editBookForm;
		let bookId = form.dataset.bookId;
		
		let editedBook = {
			title : form.title.value,
			author : {
				name: form.author.value,
			},
			genre : {
				name : form.genre.value,
			},
			yearPublished : form.yearPublished.value,
			synopsis : form.synopsis.value,
			pages : form.pages.value,
		};
		console.log('Updating book with ID: ' + bookId, editedBook);
		editBook(bookId, editedBook);
		form.reset();
		toggleEditForm();
		loadBookList();
	});


function loadBookList(){
	let xhr = new XMLHttpRequest();
	
	xhr.open('GET', 'api/books');
	
	xhr.onreadystatechange = function() {
		if(xhr.readyState === xhr.DONE) {
			if(xhr.status === 200) {
				//console.log(xhr.responseText);
				let bookList = JSON.parse(xhr.responseText);
				//console.log(bookList);
				displayBookList(JSON.parse(xhr.responseText))

			} else {
				console.error(xhr.status);
				console.error("No books found.");
			}
		}
	};
	xhr.send();
	//XHR to hit my list API endpoint
	
};

function displayBookList(bookList) {
	//DOM to build table rows, append to tbody
	let tbody = document.getElementById('bookListTbody');
	tbody.setAttribute('name','tableBody');
	tbody.textContent = '';
	
	for(let book of bookList){
		let trow = document.createElement('tr');
		trow.setAttribute('name','dataRow');
		tbody.appendChild(trow);
		
		let title = document.createElement('td');
		title.textContent = book.title;
		trow.appendChild(title);
		
		let author = document.createElement('td');
		author.textContent = book.author.name;
		trow.appendChild(author);	
		
		let edit = document.createElement('td');
		edit.setAttribute('name','edit');
		trow.appendChild(edit);
		let editButton = document.createElement('button');
		editButton.setAttribute('name','editButton');
		editButton.textContent = 'Edit Info';
		edit.appendChild(editButton);
		
		let del = document.createElement('td');
		trow.appendChild(del);
		let deleteButton = document.createElement('button');
		deleteButton.textContent = 'Delete Book';
		edit.appendChild(deleteButton);
		
		editButton.bookId = book.id;
		editButton.addEventListener('click',function(e){
			console.log(e.target.bookId);
			populateEditForm(book);
			toggleEditForm();
		});
		
		deleteButton.bookId = book.id;
		deleteButton.addEventListener('click', function(e){
			console.log(e.target.bookId);
			if(confirm("Are you sure you want to delete this book?")) {
				//deleteBookConfirm(book);
				bookId = book.id;
				deleteBook(bookId);
				console.log("Action confirmed.");
			} else {
				console.log("Action cancelled.");
			}
		});
		
		//ASSIGNS ID TO TITLE, CLICKING TITLE FIRES getBook();
		title.bookId = book.id;
		title.addEventListener('click', function(e) {
		bookId = e.target.bookId;
		getBook(bookId);
		});
	}
};


function getBook(bookId) {
	
	let xhr = new XMLHttpRequest();
		
	xhr.open('GET', 'api/books/' + bookId);
		
	xhr.onreadystatechange = function() {
		if(xhr.readyState === xhr.DONE) {
			if(xhr.status === 200) {
					//console.log(xhr.responseText);
			  let foundBook = JSON.parse(xhr.responseText);
				console.log(foundBook);
				displayBook(foundBook);
			} else {
				console.error(xhr.status);
				console.error("No book found.");
			} 
		}
	};
	xhr.send();
		//XHR to hit my list API endpoint
		
	};
	// xhr to get book

	
function displayBook(foundBook){
	let detailDiv = document.getElementById('bookDetailsDiv');
	detailDiv.textContent = '';
	
	let title = document.createElement('h2');
	title.textContent = foundBook.title;
	detailDiv.appendChild(title);
	
	let img = document.createElement('img')
		img.src = foundBook.coverImageUrl;
		img.classList.add('w-25');
		detailDiv.appendChild(img); 
	
	let author = document.createElement('h3');
	author.textContent = foundBook.author.name;
	detailDiv.appendChild(author);
	
	let yearPublished = document.createElement('span');
	yearPublished.textContent = 'Published: ' + foundBook.yearPublished;
	detailDiv.appendChild(yearPublished);
	detailDiv.appendChild(document.createElement('br'));
	
	let pages = document.createElement('span');
	pages.textContent = 'Page Count: ' + foundBook.pages;
	detailDiv.appendChild(pages);
	detailDiv.appendChild(document.createElement('br'));
	
	
	let synopsisHeader = document.createElement('h4');
	synopsisHeader.textContent = 'Synopsis:'
	detailDiv.appendChild(synopsisHeader);
	
	let synopsisText = document.createElement('blockquote');
	synopsisText.textContent = foundBook.synopsis;
	detailDiv.appendChild(synopsisText);
	
	if (foundBook.review && foundBook.review.reviewText) {
	let reviewHeader = document.createElement('h4');
		reviewHeader.textContent = 'Review:'
		detailDiv.appendChild(reviewHeader);
	
	let reviewText = document.createElement('blockquote');
	    reviewText.textContent = foundBook.review.reviewText;
	    detailDiv.appendChild(reviewText);
	}
	

	let backButton = document.createElement('button');
	backButton.textContent = 'Back to List';
	backButton.classList.add('btn', 'btn-primary');
	backButton.addEventListener('click', function(e){
		showList();
		});
	bookDetailsDiv.appendChild(backButton);
	
	showDetails();
	
};

function showList() {
	let booksDiv = document.getElementById('bookListDiv');
		let detailsDiv = document.getElementById('bookDetailsDiv');
		booksDiv.style.display = 'block';
		detailsDiv.style.display = 'none';
}

function hideList() {
	let booksDiv = document.getElementById('bookListDiv');
	let detailsDiv = document.getElementById('bookDetailsDiv')
	booksDiv.style.display = 'none';
	detailsDiv.style.display = 'none';
}

function showDetails() {
	let booksDiv = document.getElementById('bookListDiv');
	let detailsDiv = document.getElementById('bookDetailsDiv');
	booksDiv.style.display = 'none';
	detailsDiv.style.display = 'block';
}

function hideDetails() {
	let booksDiv = document.getElementById('bookListDiv');
	let detailsDiv = document.getElementById('bookDetailsDiv')
	booksDiv.style.display = 'none';
	detailsDiv.style.display = 'none';
	}
	
function toggleAddForm() {
		let formDiv = document.getElementById('addBookDiv');
		let currentDisplayStatus = formDiv.style.display;
		//console.log(formDiv.style);
		if (currentDisplayStatus === 'block') {
			formDiv.style.display = 'none';
		} else if (currentDisplayStatus === 'none') {
			formDiv.style.display = 'block';
		}
	}
function toggleEditForm() {
		let formDiv = document.getElementById('editDiv');
		let currentDisplayStatus = formDiv.style.display;
		//console.log(formDiv.style);
		if (currentDisplayStatus === 'block') {
			formDiv.style.display = 'none';
		} else if (currentDisplayStatus === 'none') {
			formDiv.style.display = 'block';
		}
	}
function populateEditForm(book) {
	let form = document.editBookForm;
	form.title.value = book.title;
	form.author.value = book.author.name;
	form.genre.value = book.genre.name;
	form.yearPublished.value = book.yearPublished;
	form.synopsis.value = book.synopsis;
	form.pages.value = book.pages;
	
	form.dataset.bookId = book.id;
}


 function createBook(newBook) {
	
	let xhr = new XMLHttpRequest();
			
	xhr.open('POST', 'api/books');
					
	xhr.onreadystatechange = function() {
		if(xhr.readyState === xhr.DONE) {
			if(xhr.status === 200 || xhr.status ===201) {
				console.log(xhr.responseText);
				let createdBook = JSON.parse(xhr.responseText);
					console.log(createdBook);
					alert('Book Added!');
					loadBookList();
				} else {
					console.error("POST request failed.");
					console.error(xhr.status + ': ' + xhr.responseText);
				}
			}
		};
	xhr.setRequestHeader("Content-type", "application/json"); // Specify JSON request body	
		
			
	let newBookJson = JSON.stringify(newBook);		
			
	xhr.send(newBookJson);	
};	

function editBook(bookId, editedBook) {
	let xhr = new XMLHttpRequest();
	xhr.open('PUT','api/books/' + bookId);
	
	xhr.onreadystatechange = function() {
			if(xhr.readyState === xhr.DONE) {
				if(xhr.status === 200 || xhr.status ===201) {
						console.log('Book updated: ', xhr.responseText);
					//let updatedBook = JSON.parse(xhr.responseText);
						alert('Book Updated!');
						loadBookList();
					} else {
						console.error("PUT request failed.");
						console.error(xhr.status + ': ' + xhr.responseText);
					}
				}
			};
	xhr.setRequestHeader("Content-type", "application/json"); // Specify JSON request body	
	
	let updatedBookJson = JSON.stringify(editedBook);
	
	xhr.send(updatedBookJson);		
};

function deleteBook(bookId) {
	let xhr = new XMLHttpRequest();
		xhr.open('DELETE','api/books/' + bookId);
		
		xhr.onreadystatechange = function() {
				if(xhr.readyState === xhr.DONE) {
					if(xhr.status === 200 || xhr.status === 204) {
							console.log('Book deleted: ', xhr.responseText);
						//let updatedBook = JSON.parse(xhr.responseText);
							loadBookList();
						} else {
							console.error("DELETE request failed.");
							console.error(xhr.status + ': ' + xhr.responseText);
						}
					}
				};
	xhr.send();
};
}