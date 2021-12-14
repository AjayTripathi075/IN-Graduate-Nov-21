function outerFunction(a , b)
{
 
 function innerfunction(c)
  {
     return c * c;
  }
  const Sum =  a + b;
  const Result = innerfunction(Sum);
  console.log(Result);
};

console.log(outerFunction(2,3));

