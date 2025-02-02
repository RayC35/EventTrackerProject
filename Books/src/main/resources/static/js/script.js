console.log('script.js loaded');


window.addEventListener('load', function(e){
	console.log('Document loaded.');
	init();	
});

function init() {
	console.log('In init()');
	loadBookList();
	document.getElementById('toggleForm').addEventListener('click',toggleForm);
	document.getElementById('addBookDiv').style.display = 'none';
	document.getElementById('editDiv').style.display = 'none';
	//event listeners for HTML form buttons, etc
	/* document.addBookForm.addBook.addEventListener('click', function(e){
		e.preventDefault();
		let newBook = {
			title : addBookForm.title.value,
			author :{
				//id: 1,
				name: addBookForm.author.value  
			},
			genre : {
				id: 1,
				name: addBookForm.genre.value
			},
			yearPublished : addBookForm.yearPublished.value,
			synopsis : addBookForm.synopsis.value,
			pages : addBookForm.pages.value,
		};
		console.log(newBook);
		createBook(newBook);
		addBookForm.reset();
		
	}); */
	
	//HOW TO TARGET EDIT BUTTON AND LAUNCH EDIT FORM, HIDE EVERYTHING ELSE
	//document.update.addEventListener('click', function(e){
	let edit = document.querySelector("button");
	edit.addEventListener('click', function(e){
		
	//document.tableBody.dataRow.edit.editButton.addEventListener('click', function(e) {
		e.preventDefault();
		hideList();
	//})
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
		
		/*let td = document.createElement('td')
		tbody.appendChild(td);
		let img = document.createElement('img');
		img.src = book.coverImageUrl;
		//img.alt =
		img.classList.add('w-25');
		td.appendChild(img); */
		
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
		editButton.addEventListener('click', toggleEditForm, function(e){
			console.log(e.target.bookId);
		});
		
		deleteButton.bookId = book.id;
		deleteButton.addEventListener('click', function(e){
			console.log(e.target.bookId);
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
	
	let details = document.createElement('ul');
	detailDiv.appendChild(details);
	
	let yearPublished = document.createElement('li');
	yearPublished.textContent = foundBook.yearPublished;
	details.appendChild(yearPublished);
	
	let synopsis = document.createElement('li');
	synopsis.textContent = foundBook.synopsis;
	details.appendChild(synopsis);
	
	let pages = document.createElement('li');
	pages.textContent = foundBook.pages;
	details.appendChild(pages);
	
	let review = document.createElement('li');
	review.textContent = foundBook.review.reviewText;
	details.appendChild(review);
	

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
	
function toggleForm() {
		let formDiv = document.getElementById('addBookDiv');
		let currentDisplayStatus = formDiv.style.display;
		console.log(formDiv.style);
		if (currentDisplayStatus === 'block') {
			formDiv.style.display = 'none';
		} else if (currentDisplayStatus === 'none') {
			formDiv.style.display = 'block';
		}
	}
function toggleEditForm() {
		let formDiv = document.getElementById('editDiv');
		let currentDisplayStatus = formDiv.style.display;
		console.log(formDiv.style);
		if (currentDisplayStatus === 'block') {
			formDiv.style.display = 'none';
		} else if (currentDisplayStatus === 'none') {
			formDiv.style.display = 'block';
		}
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

}