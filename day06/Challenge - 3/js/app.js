let objectWithNestedObject = {};
objectWithNestedObject.NestedObject = {};
objectWithNestedObject.NestedObject.a = null;
objectWithNestedObject.NestedObject["b"] = true;
console.log(objectWithNestedObject);