[![BuildStatus](https://travis-ci.org/mlitchard/swiftfizz.svg?branch=master)](https://travis-ci.org/mlitchard/swiftfizz)
swiftfizz
==========

Swiftfizz is an implementation of FizzBuzz, using the specification given in  
https://gist.github.com/mookerji/ef85e76e8bbfb6539643

#To Use:  
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
