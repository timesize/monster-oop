// Solutions - Array Manipulation

/* Challenge Set A */
console.log("\nChallenge Set A");

/* Challenge 1
Use your chrome console `ctrl+opt+j` to perform the following activities.
Each of the following tasks can be accomplished using a single Array method in 1 line of code.
*/
console.log("\nChallenge 1.0");

var cacti = ['barrel', 'columnar', 'hedgehog', 'cluster', 'prickly pear'];
console.log(cacti[2]);  // => hedgehog
console.log(cacti.length);  // => 5
console.log(cacti.length - 1); // => prickly pear
cacti.push('epiphytic');
cacti.indexOf('columnar'); // => 1
cacti.shift();  // => barrel
cacti.unshift('barrel');
cacti.splice(3,1)   // => ["cluster"]


/* Challenge 2 */
console.log("\nChallenge 2.0");

var fruits = ["Apple", "Banana", "Cherry", "Durian", "Elderberry",
"Fig", "Guava", "Huckleberry", "Ice plant", "Jackfruit"];

for (var i=0; i<fruits.length; i++) {
  console.log( fruits[i] );
} 
/*
 Apple
 Banana
 Cherry
 Durian
 Elderberry
 Fig
 Guava
 Huckleberry
 Ice plant
 Jackfruit
*/


/* Challenge 3 */
console.log("\nChallenge 3.0");


for (var i=0; i<fruits.length; i++) {
   var index = fruits.length - 1 - i;
   console.log( fruits[index] ); 
}

/* prints:
  Jackfruit
  Ice plant
  Huckleberry
  Guava
  Fig
  Elderberry
  Durian
  Cherry
  Banana
  Apple
*/


/* Challenge 4 */
console.log("\nChallenge 4.0");

for (var i=2; i<fruits.length; i = i+3) {
   console.log( fruits[i] );
}

/* prints:
 Cherry
 Fig
 Ice plant
*/





/* ////////////////////////////////////////////////////////
/* Challenge Set B
*/ ////////////////////////////////////////////////////////
console.log("\nChallenge Set B");

console.log("\nChallenge 1a");

/* Challenge 1a (forEach) */

var dogs = ['Snoopy', 'Scooby', 'Pluto', 'Goofy', 'Astro', 'Mr. Peabody', 'Odie', "Santa's Little Helper", 'Brian'];
dogs.forEach(function print(element, index) {
  console.log(element)
});

/* Challenge 1b (forEach) */

console.log("\nChallenge 1b");

var dogs = ['Snoopy', 'Scooby', 'Pluto', 'Goofy', 'Astro', 'Mr. Peabody', 'Odie', "Santa's Little Helper", 'Brian'];

dogs.forEach(function(element, index) {
    dogs[index] = element.toUpperCase();
});



/* Challenge 2

Curry up now has a line wrapped around the truck!
It takes about two minutes per delicious curry burrito.
Output the customer's name & their expected wait time.
*/

console.log("\n\nChallenge 2.0");


var customers = ["Ali", "Ilias", "Alex", "Mercedes", "Sarah", "Ben", "Ayinde", "Dani", "Jamey", "Jessie"];

// forEach solution
customers.forEach(function callback(element, index) {
  var waitTime = 2 + 2*index;
  console.log(element + ": " + waitTime + " minutes");
});

// for loop solution
var waitTime;
for (var i=0; i<customers.length; i++){
  waitTime = 2 + 2*i;
  console.log(customers[i] + ": " + waitTime + " minutes");
}

