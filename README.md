[![BuildStatus](https://travis-ci.org/mlitchard/swiftfizz.svg?branch=master)](https://travis-ci.org/mlitchard/swiftfizz)
swiftfizz
==========

Swiftfizz is an implementation of FizzBuzz, using the following specification:

In the programming language of your choice, write a program
generating the first n Fibonacci numbers F(n), printing ...
* "Buzz" when F(n) is divisible by 3.
* "Fizz" when F(n) is divisible by 5.
* "BuzzFizz" when F(n) is prime.
* the value F(n) otherwise.


#To Use: 
Follow these first three instructions and then either the secton for Docker
or Stack.
 
`cd $HOME`  
`git clone git@github.com:mlitchard/swiftfizz.git`  
`cd swiftfizz`  

##With Docker

`docker build -t swiftfizz .`  
`sudo docker run -t --name swiftfizz_run swiftfizz $FOO`  
where foo is the nth Fibonacci number. I've gone as high as 5000th.  

##With Stack  

`stack install`   
`$HOME/.local/bin/swiftfizz-exe $FOO`  

#Testing  

Included are the following files from the results of various tests  

###Criterion    - swiftfizz-benchmark.html  
###GHC profiler - swiftfizz-exe.hp swiftfizz-exe.prof  

You may follow the Travis CI link to see the results of some property  
and unit tests. Or, to play with the tests yourself, start with:  

`stack test`
