let myObject;
myObject =
{
  a : 10,
  b : "abc"
};
console.log(myObject);
myObject.a = 11;
console.log(myObject);
myObject.c = true;
console.log(myObject);
delete myObject.b;
console.log(myObject);