# Maths Stuff

Just some little mathematics projects.

## Base Converter

Written in Haskell, it can convert any number in any complex-valued base to another.

There are three inputs required. In order, they are:

- The base of the provided number (“Input Base”)
- The base you want to convert to (“Output Base”)
- The number you want to convert (“Input Number”)

The input and output base must be specified in the decimal base. Bases can be of the following format:

- Integer
- Rational
- Real/Float
- Complex Number
- Polynomial Number (i.e. a polynomial string (see below) followed by a :k where k is the specific root)

For bases with magnitude less than 36, and whose radix values are all positive, any number in said base can be written using the characters 0-9 and A-Z. I purposefully did not use lowercase characters as they are reserved for special characters (including i, various transcendental numbers, and balanced ternary/mixed radix systems).

If the magnitude of the base is between 36 and 64, to use special characters you must prepend a colon to indicate that the following letter is not a value. For example, to write a complex number in base 62 you write something like: `eff.0:r6 + As1.0A:i`.

For bases with non-mixed radices whose radix values are greater than 64 OR include multiple negative-values, use `[k]` to indicate any one character where k is a decimal base integer e.g. `[59][11][0]` in sexagesimal is 213060 in decimal.

### Standard Base characters

<table>
    <tr>
        <th>Bases</th>
        <th>Charater</th>
        <th>Numerical Value</th>
    </tr>
    <tr>
        <th rowspan="3">Bases 1–62</th>
        <td>0–9</td>
        <td>0–9</td>
    </tr>
    <tr>
        <td>A–Z</td>
        <td>10–35</td>
    </tr>
    <tr>
        <td>a–z</td>
        <td>36–61</td>
    </tr>
    <tr>
        <th rowspan="4">Bases 63 and 64</th>
        <td>A–Z</td>
        <td>0–25</td>
    </tr>
    <tr>
        <td>a–z</td>
        <td>26–51</td>
    </tr>
    <tr>
        <td>0–9</td>
        <td>52–61</td>
    </tr>
    <tr>
        <td>_ and /</td>
        <td>62 and 63</td>
    </tr>
    <tr>
        <th>Base 1</th>
        <td>0 (null)</td>
        <td>l</td>
    </tr>
    <tr>
        <th>Base 11 and 12</th>
        <td>X and E</td>
        <td>10 and 11</td>
    </tr>
    <tr>
        <th>Base bal3</th>
        <td>t or T</td>
        <td>-1</td>
    </tr>
</table>

### Special characters

| Char | Use                    | Example                                                                                             |
| ---- | ---------------------- | --------------------------------------------------------------------------------------------------- |
| \|   | Mixed radix base       | `[45][0\|60]` seconds is `45` minutes                                                               |
| i    | Imaginary number       | `4+i`                                                                                               |
| j    | Hyperbolic number      | `4+i+j`                                                                                             |
| k    | Dual number            | `4e-2`                                                                                              |
| i    | Imaginary number       | `4+i`                                                                                               |
| r    | Recurring value        | `1/3 = 0.r3`                                                                                        |
| e    | Euler's Number         | `e = 2.71`                                                                                          |
| p    | Pi                     | `p = 3.14`                                                                                          |
| t    | Balanced ternary digit | `t = -1`                                                                                            |
| l    | Null Character (Unary) | `l = 0`                                                                                             |
| d    | Degree separator       | `33[45\|60][0\|60].r6` = `33d45d0.r6d` (33°45'00.666…")                                             |
| c    | Calendar separator     | `2026[8\|12][20\|31][15\|24][45\|60][0\|60].r6` = `2026c12c20c3d45d0.r6d` (2026-8-20 15:45:00:666…) |

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
