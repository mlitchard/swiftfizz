[![BuildStatus](https://travis-ci.org/mlitchard/swiftfizz.svg?branch=master)](https://travis-ci.org/mlitchard/swiftfizz)
swiftfizz
==========

Swiftfizz is an implementation of FizzBuzz, using the specification given in
https://gist.github.com/mookerji/ef85e76e8bbfb6539643

To Use:

With Docker


With Stack


Testing

        Tue May 10 23:29 2016 Time and Allocation Profiling Report  (Final)

           swiftfizz-exe +RTS -N -p -RTS 1000

        total time  =        0.11 secs   (107 ticks @ 1000 us, 1 processor)
        total alloc =  65,533,288 bytes  (excludes profiling overheads)

COST CENTRE      MODULE                                         %time %alloc

powerModInteger' Math.NumberTheory.Moduli                        72.0   63.8
lucasTest        Math.NumberTheory.Primes.Testing.Probabilistic   9.3    9.3
isStrongFermatPP Math.NumberTheory.Primes.Testing.Probabilistic   5.6    5.7
isPrime          Math.NumberTheory.Primes.Testing.Probabilistic   4.7    2.4
main             Main                                             1.9    7.1
fizzbuzz         FizzBuzz                                         1.9    5.7
unstream/resize  Data.Text.Internal.Fusion                        1.9    0.7
fizzWrapper      FizzWrapper                                      0.9    4.1
