setTimeout(() => {
  clearInterval(sInter)
}, 12000);

let i = 1;
let sInter = setInterval(() => {
  console.log("Here is Message Number" + i);
  i = i + 1;
}, 2000);

