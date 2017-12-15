First, let's assume that we've defined our currency as follows:
-Quarter: 25
-Dime: 10
-Nickel: 5
-Penny: 1

Write a function that accepts a non-negative amount of money as input. This function should tell us a way to make change for that amount of money. Some examples:

> change_for(25)
{quarters: 1}

> change_for(41)
{quarters: 1, dimes: 1, nickels: 1, pennies: 1}

Your submission should demonstrated the following:
* Input Validation
* Exception Handling
* Bonus points if the function is not dependent on a specific currency.
* Bonus points if you could solve using recursion.

We are looking for something that could potentially be used as a robust, production-quality solution. So, please take your time before submitting your solution. Be preapred to talk about your code during the next round of interviews.