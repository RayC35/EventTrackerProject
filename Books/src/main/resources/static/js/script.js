console.log('script.js loaded');

window.addEventListener('load', function(e){
	console.log('Document loaded.');
	init();	
});

function init() {
	console.log('In init()');
	
	loadBookList();
	
	//event listeners for HTML form buttons, etc
}

function loadBookList(){
	let xhr = new XMLHttpRequest();
	
	xhr.open('GET', 'api/books');
	
	xhr.onreadystatechange = function() {
		if(xhr.readyState === xhr.DONE) {
			if(xhr.status === 200) {
				//console.log(xhr.responseText);
				let bookList = JSON.parse(xhr.responseText);
				console.log(bookList);
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
	tbody.textContent = '';
	
	for(let book of bookList){
		let trow = document.createElement('tr');
		tbody.appendChild(trow);
		
		let td = document.createElement('td')
		tbody.appendChild(td);
		let img = document.createElement('img');
		img.src = book.coverImageUrl;
		//img.alt =
		img.classList.add('w-25');
		td.appendChild(img);
		
		let title = document.createElement('td');
		title.textContent = book.title;
		trow.appendChild(title);
		
		let author = document.createElement('td');
		author.textContent = book.author.name;
		trow.appendChild(author);	
		
		trow.bookId = book.id;
		
		trow.addEventListener('click', function(e){
		console.log(e.target.parentElement);
		bookId = e.target.parentElement.bookId;
		console.log(bookId);
		// getBook(bookId);
		});
	}
	
}

function getBook(bookId) {
	// xhr to get book
}
	
function displayBook(book){
	
}
	
