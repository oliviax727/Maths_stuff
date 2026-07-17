# Maths Stuff

Just some little mathematics projects.

## Base Converter

Written in Perl, it can convert any number in any complex-valued base to another. The program seeks to run in pure Perl, with no additional modules. Meaning that all complex numbers are evaluated natively in the code.

There are three inputs required. In order, they are:
- The base of the provided number (“Input Base”)
- The base you want to convert to (“Output Base”)
- The number you want to convert (“Input Number”)

The input and output base must be specified in the decimal base. Here are some regexes for the various valid decimal base options:
``` perl
$BASE_N =   /\s*[0-9]+\s*/ 

$BASE_Z =/-?$BASE_N/                                                                    # e.g. 0, 021, - 40, -2, 12903210
$BASE_Q =/-?\s*[0-9]+\s*\/-?\s*[0-9]+\s*/                                                    # e.g. -1/2, - 3 /  6, 12/3
$BASE_R =/-?\s*([0-9]+\.[0-9]*(\([0-9]+\))?)\s*\/\s*-?\s*([0-9]+\.[0-9]*(\([0-9]+\))?)/      # e.g. - 09302.333 / 33.45(210)
$BASE_Zi=
```

WORK IN PROGRESS!


## Old Code (2019)

In the `old stuff` directory is some older python code files including:
- A rudimentary base calculator
- Approximating the golden ratio using the Fibonacci sequence
- A prime calculator
- A series of sorting algorithms

These are combined into one `maths.py` file.

There's also an incomplete attempt at remaking the base calculator in C++ until I decided to switch to using Perl.
