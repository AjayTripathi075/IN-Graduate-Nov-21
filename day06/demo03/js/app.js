let x = 10;
const y = true;
const myObject = {
  a : x,
  b : y
}
console.log(myObject);

x=20;
const anotherObject = 
{
  newA : x,
  b : y,
  c : myObject,
}

console.log(anotherObject);