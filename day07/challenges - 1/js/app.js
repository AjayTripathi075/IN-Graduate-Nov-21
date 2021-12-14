function Mult(a,b,c)
{
   const M = a * b* c;
   console.log(M);
   document.write("Multiplication :- " + M);
};
Mult(1,2,3);//6
console.log(Mult(1,2,3));//undefine
Mult();//NaN
Mult(2,3,"ABC");//Nan