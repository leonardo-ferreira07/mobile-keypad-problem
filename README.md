# Mobile keypad problem

A standard phone number pad has the following layout
```
   123 
   456 
   789 
    0
```
Using this layout and a starting digit we can generate numbers as follows: The first digit is the starting digit and each subsequent digit is directly left, right, above or below the previous digit on the number pad. For example if the starting digit is 1, 1256 is a valid number, but 1289 is not valid because 8 is not directly next to 2. Write a function that takes a starting digit d and an integer n as input and returns a list of all unique numbers of length n generated in this way.

Test cases:

 `f(5, 1) = [5]`
 
`f(1, 3) = [121, 123, 125, 141, 145, 147]`
