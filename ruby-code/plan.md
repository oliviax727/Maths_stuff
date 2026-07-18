# The Plan

I don't need to natively make my own integer, rational, real, and complex numbers I can use ruby's `to_{i,r,f,c}` strings on their own. But I will need to manually remove whitespace AND convert between bases before turning them into the desired objects.

So what I need to do:
- Polynomial solver
- Polynomial number
- Interpret valid base string
- De-convert base
- Re-convert base

## Solving Polynomials

Use an eigenvalue algorithm — $(A-\lambda I)\vec{v}=\vec{0}$.

The eigenvalues are the roots of the polynomial so the matrix A follows the rule:

$
\begin{bmatrix}
0 & 0 & 0 & ... & -c_0 \\
1 & 0 & 0 & ... & -c_1 \\
\end{bmatrix}
$