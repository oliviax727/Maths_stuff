# Maths Stuff

Just some little mathematics projects.

## Base Converter

Written in Perl, it can convert any number in any complex-valued base to another. The program seeks to run in pure Perl, with no additional modules. Meaning that all complex numbers are evaluated natively in the code.

There are three inputs required. In order, they are:
- The base of the provided number (“Input Base”)
- The base you want to convert to (“Output Base”)
- The number you want to convert (“Input Number”)

The input and output base must be specified in the decimal base. Bases can be of the following format:
| Type | Format | Examples | Examples (Non-decimal) |
|--|--|--|--|
| N | Natural number | `45`, `0`, `00121` | `aF45`, `[34][12][22][1]`, `1000101` |
| Z | Integer | `-34`, `30` | `-FF0`, `23a6b`, `-[-3][-2]` |
| Q | Rational number | `1/`, `2/3`, `-4/6` | `abF/xy1`, `[-3][-60]/[22]` |
| R | Real number | `-654.`, `2.3(4)`, `00891.(23)` | `GgH.`, `[12].[34][36]([-2])` |
| C | Complex number | `12.2+1j`, `-.4(2)i`, `081.108i-2` | `.+.:i`, `:j-afh/34` |
| P | Polynomial Number | `x^2+4x+2.1:2`, `(x-2)x:1` | `x^ef-aJjx-z`, `(:j-afh/34)x^3` |

## Polynomial solver

In addition to the base converter there is also a polynomial solver. This polynomial solver allows you to create an instance of a `Polynomial` object by either providing an array of coefficients i.e. $[c_0, c_1, ..., c_n] : P(x)=c_n x^n + ... + c_1 x + c_0$; or an array of roots $[x_1, ..., x_n] : P(x_k)=0, 1\leq k \leq n$.

On initialisation the polynomial solver will automatically calculate the corresponding coefficients and roots from the given input.

You can also get a specific root from the polynomial using an index, assuming that the polynomial roots are sorted by magnitude (ascending) and then argument (descending).

A polynomial can also be interpreted from a string, and the `P` object defines a specific numerical solution to a polynomial.

## Old Code (2019)

In the `old stuff` directory is some older python code files including:
- A rudimentary base calculator
- Approximating the golden ratio using the Fibonacci sequence
- A prime calculator
- A series of sorting algorithms

These are combined into one `maths.py` file.

There's also an incomplete attempt at remaking the base calculator in C++ until I decided to switch to using Perl.
