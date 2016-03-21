# Intro To Basic Objects (Hashes)

### Reference Data Types in JavaScript

Objects are a *reference data type* that allow us to group data together. There often isn't enough room in a variable to store an entire complex Object; instead, we store a reference to another location in memory, and the computer looks it up when needed.

You should recognize **object literals**, which are enclosed in curly braces:

  ```
  var car = { make: "Tesla", model: "S", year: 2015 };
  ```
  ```
  var shirt = { size: "L", color: 'green' };
  ```

`Object` is the most basic reference type in JavaScript. Every other non-primitive we'll use -- `Array`, `Function`, `Date` -- is actually built out from the basic `Object` type.

## Objects

Objects are composed of key-value pairs.  Keys usually represent properties of an object type.   An object representing a person, for instance, might have keys like `name`, `height`, `age`.  Values are the actual value of a key for a particular object, like `'Bill'`, `'5 feet, 9 inches'`, `34`. In JavaScript Objects, keys are always converted to strings.


#### Object Method Basics

**Creating** an object literal:

```js
var person = { name: 'Bill', height: '5 feet, 9 inches', age: 34 };
```

Accessing the **age** value:

```js
// this is called bracket notation:
person['age']; // 34
// this is called dot notation:
person.age;    // 34
```

**Adding** a key-value pair:

```js
person["hairColor"] = 'blonde';
person.hairColor = 'blonde';
// { name: 'Bill', height: '5 feet, 9 inches', age: 34, hairColor: 'blonde' }
```

**Changing** the value for a key:

```js
person.hairColor = 'green';
// { name: 'Bill', height: '5 feet, 9 inches', age: 34, hairColor: 'green' }
```


**Semi-removing** a value:  

There's not a way to remove just a value. Use `null` as a marker for an empty value.

```js
person.hairColor = null;
``` 


**Fully removing** a key-value pair:

```js
delete person.height;
// { name: 'Bill', age: 34, hairColor: 'green' }
```

**Checking** if the object has a certain key:

```js
person['height'];  // undefined
// undefined means the key doesn't exist
```

Finding **keys** in the object:

```js
var keys = Object.keys(person);
// ['name', 'age', 'hairColor']
```