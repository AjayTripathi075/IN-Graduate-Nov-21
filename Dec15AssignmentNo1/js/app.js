// Object using constructor
function Book(bookid,bookName,authorname){
  this.bookid=bookid;
  this.bookName=bookName;
  this.authorname=authorname;
  this.displayDetails=function (){
  return "BookId :- "+" "+this.bookid +"<br>"+"BookName :- "+this.bookName +"<br>"+"AuthorName :- "+this.authorname;
  }
  }
  
  const Books=new Book("01","Thinking fast and slow","Deniel Kahneman");
  const result=document.getElementById("result");
  result.innerHTML=Books.displayDetails();