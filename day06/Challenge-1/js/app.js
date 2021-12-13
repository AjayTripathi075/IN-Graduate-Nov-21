let myPost = {};
myPost.postTitle = "Object is References Types";
console.log(myPost);
myPost.postLikes = 0;
console.log(myPost);
myPost.Shared = true;
console.log(myPost);
myPost.postLikes= myPost.postLikes + 1;
console.log(myPost);
delete myPost.Shared
console.log(myPost);