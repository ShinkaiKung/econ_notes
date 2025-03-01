#import "@preview/cetz:0.3.2": *
#import "@preview/cetz-plot:0.1.1": *
#import "../lib.typ": *


#let title = [
  Linear Algebra
]

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#set page(
  paper: "us-letter",
  header: align(
    right + horizon,
    title,
  ),
  numbering: "1",
  columns: 1,
)

= Linear Algebra

== Chapter 1. System of Linear Equations

#note("GOAL")[*The goal of the chapter is to master the methods of solving a system of linear equations using Matrix.*]
A #concept[System of Linear Equations] is a set of two or more linear equations in the same variables.
$
  a_11 x_1 + a_12 x_2 + a_13 x_3 + ... + a_(1 n) x_n &= b_1; \
  a_21 x_1 + a_22 x_2 + a_23 x_3 + ... + a_(2 n) x_n &= b_2; \
  dots.v \
  a_(m 1) x_1 + a_(m 2) x_2 + a_(m 3) x_3 + ... + a_(m n) x_n &= b_m;
$
where $a_11, a_12, ..., a_(m n)$ are the coefficients of the variables $x_1, x_2, ..., x_n$ and $b_1, b_2, ..., b_m$ are the constants.


A rectangular array of real numbers is called #concept[Matrix]. It is put into parentheses (or brackets). The size of a matrix is its number of rows and columns, in signs of $m times n$.
$
  A = mat(a_11, a_12, a_13, ..., a_(1 n);
            a_21, a_22, a_23, ..., a_(2 n);
            dots.v, dots.v, dots.down, dots.v;
            a_(m 1), a_(m 2), a_(m 3), ..., a_(m n))
  "or"
  A = mat(delim: "[",
            a_11, a_12, a_13, ..., a_(1 n);
            a_21, a_22, a_23, ..., a_(2 n);
            dots.v, dots.v, dots.down, dots.v;
            a_(m 1), a_(m 2), a_(m 3), ..., a_(m n))
$
When the numbers represent coefficients of a system of linear equations, the matrix is called a #concept("coefficient matrix").

We can use #concept[Augmented Matrix] to represent a system of linear equations.
If we add the expressions on the right-hand side of the system of linear equations, we get the *augumented (coefficient) matrix*.
$
  hat(A) = mat(a_11, a_12, a_13, ..., a_(1 n), b_1;
            a_21, a_22, a_23, ..., a_(2 n), b_2;
            dots.v, dots.v, dots.down, dots.v;
            a_(m 1), a_(m 2), a_(m 3), ..., a_(m n), b_m;
            augment: #(-1)) ,
$


Normally, we use #concept("Gaussian-Jordan elimination") to solve a system of linear equations. This method uses *elementory equation operations* (1. swap two equations; 2. multiply an equation by a non-zero number; 3. add a multiple of one equation to another) to transform the linear equation system into a simpler form.

Similarly, we can use #concept("Elementary Row Operations") to transform a(n augmented) matrix into a simpler form. The goal is to get the matrix into *Row Echelon Form* or *Reduced Row Echelon Form*.



#concept[Row Echelon Form]: A row of a matrix is said to have $k$ leading zeros if the first k entries are zero and the ($k+1$)th element is non-zero. With this terminologym a matrix is in *row echelon form* if each row has _*more*_ leading zeros than the row above it.

Examples of Row Echelon Form:
$
  // 4 x 4 matrix
  A = mat(0, 1, 2, 3;
          0, 0, 4, 5;
          0, 0, 0, 6),
  // 3 x 4 matrix
  B = mat(0, 1, 2, 3;
          0, 0, 4, 5;
          0, 0, 0, 6),
  // 4 x 3 matrix
  C = mat(0, 1, 2;
          0, 0, 4;
          0, 0, 0;
          0, 0, 0)

$

*Sepcial cases of Row Echelon Form:*

1. A square matrix in which all the elements of the principal diagonal are ones and all other elements are zeros is called the #concept[Identity Matrix]. The identity matrix of order $n$ is denoted by $I_n$.
  $
    I_n = mat(1, 0, 0, ..., 0;
                0, 1, 0, ..., 0;
                0, 0, 1, ..., 0;
                dots.v, dots.v, dots.v, dots.down;
                0, 0, 0, ..., 1)
  $

2. A matrix in which all the elements are zeros is called the #concept[Zero Matrix]. The zero matrix of order $m times n$ is denoted by $O_(m n)$.
  $
    O_(m n) = mat(0, 0, 0, ..., 0;
              0, 0, 0, ..., 0;
              0, 0, 0, ..., 0;
              dots.v, dots.v, dots.v, dots.down, dots.v;
              0, 0, 0, ..., 0)
  $

#concept[Reduced Row Echelon Form]: A row echelon matrix in which each pivot is 1 and in which each column containing a pivot contains no other non-zero entries is said to be in *reduced row echelon form*.

Examples of reduced row echelon form:
$
    // 3 x 3 matrix
    mat(1, 0, 0;
        0, 1, 0;
        0, 0, 1),
    // 3 x 4 matrix
    mat(1, 0, 0, 4;
        0, 1, 0, 2;
        0, 0, 1, 3)
$
Obviously we can use the reduced row echelon form to solve a system of linear equations.

#example("Reduced Row Echelon Form and Solutions")[
  $
    mat(1, 2, 3;
        2, 5, 7;
        augment: #(-1))
    ->
    mat(1, 0, -1;
        0, 1, 1;
        augment: #(-1))
  $
  We can get the solution is $x_1 = -1, x_2 = 1$, which can be represented as $bold(x) = mat(-1; 1)$.
]

However, as we know, a linear equation system may have no solution, a unique solution or infinitely many solutions. We can use the following theorem to determine the number of solutions of a system of linear equations.

#concept[Rank]: The *rank* of a matrix is the number of non-zero rows in its row echelon form.

#theorem("Fact 1 of Rank")[
  Let $A$ be a coefficient matrix with $m$ rows and $n$ columns, and $hat(A)$ be the augumented matrix. Then
  1. rank $A$ $<=$ rank $hat(A)$.
  2. rank $A$ $<=$ $min(m, n)$.
]

#theorem("Fact 2 of Rank")[
  Let $A$ be a coefficient matrix f a system of linear equations of form $m times n$ and $hat(A) = (A|b)$ the augumented matrix.
  n is the number of variables and m is the number of equations. Then the corresponding system of linear equations has
  1. no sollution if, rank $A$ $<$ rank $hat(A)$.
  2. a unique solution if, rank $A$ $=$ rank $hat(A)$ $=$ n.
  3. infinitely many solutions if, rank $A$ $=$ rank $hat(A)$ $<$ n.
]


#example("Applications of Rank")[
  1. $"rank"(A) = 1 = "rank"(A|b) < 2$, has infinitely many solutions.
    $
      mat(1, 2, 3;
        2,4, 6;
        augment: #(-1))
      ->
      mat(1, 2, 3;
        0, 0, 0;
        augment: #(-1))
    $
  2. $1 = "rank"(A) < "rank"(A|b) = 2$, has no solution.
    $
      mat(1, 2, 3;
        1,2, 4;
        augment: #(-1))
      ->
      mat(1, 2, 3;
        0, 0, 1;
        augment: #(-1))
    $
  3. $"rank"(A) = 2 = "rank"(A|b) = 2$, has a unique solution.
    $
      mat(1, 2, 3;
        2, 5, 7;
        augment: #(-1))
      ->
      mat(1, 2, 3;
        0, 1, 1;
        augment: #(-1))
    $
  If $"rank"(A|b)="rank"(A)=n$ then the reduced echelon looks like
  $
    mat(1, 0, ..., 0, b_1;
        0, 1, ..., 0, b_2;
        dots.v, dots.v, dots.down, dots.v, dots.v;
        0, 0, ..., 1, b_n;
        0, 0, ..., 0, 0;
        dots.v, dots.v, dots.down, dots.v, dots.v;
        0, 0, ..., 0, 0;
  augment: #(-1))
  $
]


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#set page(
  paper: "us-letter",
  header: align(
    right + horizon,
    title,
  ),
  numbering: "1",
  columns: 1,
)

== Chapter 2. Matrix Algebra
#note("GOAL")[*The goal of the chapter is to master the matrix operations, some special kinds of matrix, and natures of inverse matrix.*]

#section("2.1. Matrix Operations")

1. #concept("Addition")
  $
    A + B =
    mat(a_11, ... , a_(1 n);
      a_21, ..., a_(2 n);
      dots.v, a_(i j), dots.v;
      a_(m 1), ..., a_(m n))
    +
    mat(b_11, ... , b_(1 n);
      b_21, ..., b_(2 n);
      dots.v, b_(i j), dots.v;
      b_(m 1), ..., b_(m n))
    = mat(a_11 + b_11,  ..., a_(1 n) + b_(1 n);
              a_21 + b_21, ..., a_(2 n) + b_(2 n);
              dots.v, a_(i j) + b_(i j), dots.v;
              a_(m 1) + b_(m 1), ..., a_(m n) + b_(m n))
  $

2. #concept("Subtraction")
  $
    A - B =
    mat(a_11, ... , a_(1 n);
      a_21, ..., a_(2 n);
      dots.v, a_(i j), dots.v;
      a_(m 1), ..., a_(m n))
    -
    mat(b_11, ... , b_(1 n);
      b_21, ..., b_(2 n);
      dots.v, b_(i j), dots.v;
      b_(m 1), ..., b_(m n))
    = mat(a_11 - b_11,  ..., a_(1 n) - b_(1 n);
              a_21 - b_21, ..., a_(2 n) - b_(2 n);
              dots.v, a_(i j) - b_(i j), dots.v;
              a_(m 1) - b_(m 1), ..., a_(m n) - b_(m n))
  $

3. #concept("Scalar Multiplication")
  $
    c A =
    c mat(a_11, ... , a_(1 n);
      a_21, ..., a_(2 n);
      dots.v, a_(i j), dots.v;
      a_(m 1), ..., a_(m n))
    = mat(c * a_11, ..., c * a_(1 n);
          c * a_21, ..., c * a_(2 n);
          dots.v, c * a_(i j), dots.v;
          c * a_(m 1), ..., c * a_(m n))
  $

4. #concept("Multiplication")

  Define the matrix product $A B$ if and only if
  $ "number of columns of" A = "number of rows of" B. $
  For the matrix product to exist, $A$ must be $k times m$ and $B$ must be $m times n$. The product $A B$ is a $k times n$ matrix. To obtain the $(i, j)$th entry of $A B$, we multiply the $i$th row of $A$ by the $j$th column of $B$ as follows:
  $
    mat(a_(i 1), a_(i 2), ..., a_(i m)) dot mat(b_(1 j); b_(2 j); ...; b_(m j)) = a_(i 1)b_(1 j) + a_(i 2)b_(2 j) + ... + a_(i m)b_(m j) = sum_(k=1)^m a_(i h)b_(h j).
  $
  Example:
  $
    mat(a, b; c, d; e, f) mat(A, B; C, D) = mat(a A + b C, a B + b D; c A + d C, c B + d D; e A + f C, e B + f D)
  $

  Sepcially, we have $A = A I = I A$.

- #concept("Laws of Matrix Algebra")
  1. Associative Laws:
  $
    (A + B) + C = A + (B + C)
  $
  $
    (A B)C = A (B C)
  $
  2. Commutative Law for Addition:
  $
    A + B = B + A
  $
  #attention("Attention")[The Commutative Law for Multiplication does not hold in general.]
  3. Distributive Laws:
  $
    A (B + C) = A B + A C
  $

5. #concept("Transpose")

  The transpose of a matrix $A$ is denoted by $A^T$. The transpose of a matrix is obtained by interchanging its rows and columns. If $A$ is an $m times n$ matrix, then $A^T$ is an $n times m$ matrix. The $(i, j)$th entry of $A^T$ is the $(j, i)$th entry of $A$. For example,
  $
    // 2 x 3
    A = mat(a_11, a_12, a_13;
            a_21, a_22, a_23)
    arrow
    // 3 x 2
    A^T = mat(a_11, a_21;
              a_12, a_22;
              a_13, a_23)
  $

  We have rules of transpose:
  1. $(A^T)^T = A$
  2. $(A + B)^T = A^T + B^T$
  3. $(c A)^T = c A^T$
  4. $(A B)^T = B^T A^T$
  #proof("Proof of rule 4")[
    Matrix $A$ is $k times m$ and matrix $B$ is $m times n$. Then the $(i, j)$th entry of $A B$ is
    $
      (A B)^T_(i j) = (A B)_(j i) = sum_(h=1)^m A_(j h) B_(h i) = sum_(h=1)^m B^T_(i h) A^T_(h j) = (B^T A^T)_(i j)
    $
  ]

Formally, we can represent systems of linear equations in matrix form. Let $A$ be a coefficient matrix of a system of linear equations, $x$ be a vector of variables, and $b$ be a vector of constants. Then the system of linear equations can be written as:
$
  bold(A x) = bold(b)
$

#upper[*Sepcial Kinds of Matrices*]

For $k times n$ Matrices:

#table(
  columns: (auto, auto, auto),
  table.header([*Matrix Type*], [*Definition*], [*Example*]),
  concept("Square Matrix"),
  $k = n$,
  $
    mat(a_11, a_12, a_13;
          a_21, a_22, a_23;
          a_31, a_32, a_33
  )
  $,

  concept("Column Matrix"),
  $n = 1$,
  $
    mat(a_11;
        a_21;
        a_31;)
  $,

  concept("Row Matrix"),
  $k = 1$,
  $
    mat(a_11, a_12, a_13)
  $,

  concept("Diagonal Matrix"),
  $k = n "and" a_(i j) = 0 "if" i eq.not j$,
  $
    mat(a_11, 0, 0;
        0, a_22, 0;
        0, 0, a_33)
    "and"
    mat(1, 0, 0;
        0, 2, 0;
        0, 0, 3)
  $,

  concept("Upper-Triangular Matrix"),
  $k = n "and" a_(i j) = 0 "if" i > j$,
  $
    mat(a_11, a_12, a_13;
        0, a_22, a_23;
        0, 0, a_33)
    "and"
    mat(1, 2, 3;
        0, 4, 5;
        0, 0, 6)
  $,

  concept("Lower-Triangular Matrix"),
  $k = n "and" a_(i j) = 0 "if" i < j$,
  $
    mat(a_11, 0, 0;
        a_21, a_22, 0;
        a_31, a_32, a_33)
    "and"
    mat(1, 0, 0;
        2, 3, 0;
        4, 5, 6)
  $,

  concept("Symmetric Matrix"),
  $k = n "and" a_(i j) = a_(j i)$,
  $
    mat(a_11, a_12, a_13;
        a_12, a_22, a_23;
        a_13, a_23, a_33)
    "and"
    mat(1, 2, 3;
        2, 4, 5;
        3, 5, 6)
  $,

  concept("Idempotent Matrix"),
  $A^2 = A$,
  $
    mat(1, 0, 0;
        0, 1, 0;
        0, 0, 1)
    "and"
    mat(5, -5; 4, -4)
  $,

  concept("Permutation Matrix"),
  "A square matrix of 0s and 1s in which each row and each column contains exactly one 1.",
  $
    mat(0, 1, 0;
        1, 0, 0;
        0, 0, 1)
  $,

  concept("Nonsingular Matrix"),
  "A square matrix whose rank equals its order.",
  $
    mat(1, 2, 3;
        0, 1, 4;
        5, 6, 0)
  $,
)

#section("2.2. Elementary Matrices")

There are three types of #concept("Elementary Matrices") which express the transformation of the Gaussian-Jordan elimination.

- *Type 1*: We get $E_(i j)$ from $I_n$ by exchanging row $i$ and $j$.
  $
  // 3 x 3 example
  E_12 A = mat(0, 1, 0;
              1, 0, 0;
              0, 0, 1)
          mat(a_11, a_12, a_13;
              a_21, a_22, a_23;
              a_31, a_32, a_33)
        = mat(a_21, a_22, a_23;
            a_11, a_12, a_13;
            a_31, a_32, a_33)
  $
- *Type 2*: We get $E_i (c)$ from $I_n$ by multiplying row $i$ by a non-zero number $c$.
  $
  // 3 x 3 example
  E_1 (c) A = mat(c, 0, 0;
                  0, 1, 0;
                  0, 0, 1)
              mat(a_11, a_12, a_13;
                  a_21, a_22, a_23;
                  a_31, a_32, a_33)
            = mat(c * a_11, c * a_12, c * a_13;
                a_21, a_22, a_23;
                a_31, a_32, a_33)
  $
- *Type 3*: We get $E_(i j)(c)$ from $I_n$ by adding $c$ times row $i$ to row $j$.
  $
  // 3 x 3 example
  E_12 (c) A = mat(1, 0, 0;
                    c, 1, 0;
                    0, 0, 1)
              mat(a_11, a_12, a_13;
                  a_21, a_22, a_23;
                  a_31, a_32, a_33)
            = mat(a_11, a_12, a_13;
                a_21 + c a_11, a_22 + c a_12, a_23 + c a_13;
                a_31, a_32, a_33)
  $

#theorem("Gaussian-Jordan Elimination Theorem")[
  For any $m times n$ matrix $A$, there exist elementory matrices $E_1, E_2, ..., E_k$ such that
  $
    E_k E_(k-1) ... E_2 E_1 A = U
  $,
  where $U$ is a matrix in row echelon form (or even in reduced echelon form).
]

#section("2.3. Inverse Matrix")

#concept("Inverse Matrix"): Let $A$ be a $n times n$ square matrix. If there exists a matrix $B$ such that
$
  A B = B A = I_n
$
, then $B$ is called the *Inverse Matrix* of $A$, denoted by $A^(-1)$.


#theorem("Fact 1 of Inverse Matrix")[
  There is at most one inverse matrix for a given square matrix.
  #proof("Proof of Fact 1")[
    Suppose $A B = I_n$ and $A C = I_n$. Then
    $
      B = B I_n = B (A C) = (B A) C = I_n C = C
    $
  ]
]

let A be a $m times n$ matrx. $B$ ($n times m$ matrix) is called #concept("Right Inverse") of $A$ if $A B = I_m$. $C$ ($m times n$ matrix) is called #concept("Left Inverse") of $A$ if $C A = I_n$.

#theorem("Fact 2 of Inverse Matrix")[
  + If $A$ has a left and a right inverse, then they are equal.
  + A square matrix $A$ has an inverse if it has a left inverse and a right inverse.

  #proof("Proof of Fact 2")[
    + Suppose $A B = I_m$ and $C A = I_n$. Then
      $
        C = C I_n = C (A B) = (C A) B = I_n B = B
      $
    + Suppose $A$ has a left inverse $C$ and a right inverse $B$. Then
      $
        A B = I_n & = C A \
        & = B A space (<- "By Fact 2.1")
      $
      Hence, $A^(-1) = B = C$
  ]

]


#theorem("Fact 3")[
  For any $n times n$ matrix $A$, the following statements are equivalent:
  + $A$ is invertible.
  + $A$ is nonsingular, i.e. $A bold(x) = bold(b)$ has a unique solution.
  + $A$ has rank $n$.
]

*Algebra of Inverse Matrices*: Let $A$ and $B$ be invertible $n times n$ matrices. Then
1. $(A^(-1))^(-1) = A$
2. $(A^T)^(-1) = (A^-1)^T$
3. $(A B)^(-1) = B^(-1) A^(-1)$


#theorem("Fact 4")[
  Any matrix can be written as a product of elementary matrices and a reduced row echelon matrix.
  $
    A =& E_1^(-1) E_2^(-1) ... E_k^(-1) U
    =& F_1 F_2 ... F_k U
  $
  where $F_i = E_i^(-1)$ is an elementary matrix and $U$ is a reduced row echelon matrix.
  Sepcially, when $A$ is nonsingular, $U$ is an identity matrix.

  For different types of elementary matrices, we have
  1. Type 1 $E_(i j)$: $E_(i j)^(-1) = E_(j i)$.
  2. Tpye 2 $E_i(c)$: $E_i^(-1) = E_i (1/c)$ .
  3. Type 3 $E_(i j)(c)$: $E_(i j)^(-1)(c) = E_(i j) (-c)$.
]

*How to calculate the inverse of a matrix?*

Equation $A A^(-1) = I_n$ can be decomposed into $A bold(x)_i = bold(e)_i$, where $bold(e)_i$ is the $i$th column of $I_n$. Then we can get $A^(-1) = mat(bold(x)_1, bold(x)_2, ..., bold(x)_n)$.

We have mastered the method of solving a system of linear equations like $A bold(x)_i = bold(e)_i$: construct the augmented matrix $hat(A) = (A|bold(e)_i)$, and use the Gaussian-Jordan elimination to get the reduced echelon form. If $A$ is nonsingular, then we can get $bold(x)_i = A^(-1) bold(e)_i$.

#note($bold(x) = A^(-1) bold(b)$)[
  $bold(x) = A^(-1) bold(b)$ is an important equation. It directly tells us how to get the solution of a system of linear equations. If $A$ is nonsingular, then we can get the unique solution $bold(x) = A^(-1) bold(b)$.

  If $bold(b)$ changes and $A$ does not, we can simply get the new solution $bold(x) = A^(-1) bold(b)'$.
]

So we can calculate the inverse matrix $A^(-1)$ in a similar way. We construct the augmented matrix $hat(A) = (A|I_n)$, and use the Gaussian-Jordan elimination to get the reduced echelon form. If $A$ is nonsingular, then we can get $A^(-1) = mat(bold(x)_1, bold(x)_2, ..., bold(x)_n)$.

#example("Calculate Inverse Matrix")[
  $
    A =& mat(1, 1, 1;
            12, 2, -3;
            3, 4, 1) \
    (A | I) =& mat(1, 1, 1, 1, 0, 0;
                  12, 2, -3, 0, 1, 0;
                  3, 4, 1, 0, 0, 1;
                  augment: #(-3) )
    ->& mat(1, 1, 1, 1, 0, 0;
           0, -10, -15, -12, 1, 0;
           0, 0, -3.5, -4.2, 0.1, 1;
           augment: #(-3) )
    ->& mat(1, 0, 0, 0.4, 3/35, -1/7;
           0, 1, 0, -0.6, -2/35, 3/7;
           0, 0, 1, 1.2, -1/35, -2/7;
           augment: #(-3) ) \
    A^(-1) =& mat(0.4, 3/35, -1/7;
                 -0.6, -2/35, 3/7;
                 1.2, -1/35, -2/7)
  $
]

#section("2.4. Partitioned Matrices")

#concept("Partitioned Matrix"): A matrix is said to be partitioned if it is divided into blocks. For example, a $m times n$ matrix $A$ can be partitioned into four blocks as follows:
$
  A = mat(A_(11), A_(12);
          A_(21), A_(22))
$
where $A_(11)$ is a $k times l$ matrix, $A_(12)$ is a $k times (n-l)$ matrix, $A_(21)$ is a $(m-k) times l$ matrix, and $A_(22)$ is a $(m-k) times (n-l)$ matrix.

If $A$ is a square matrix which has been partitioned as
$
  A = mat(A_11, 0, dots, 0;
          0, A_22, dots, 0;
          dots.v, dots.v, dots.down, dots.v;
          0, 0, dots, A_(k k))
$
where each $A_(i j)$ is a square matrix, then $A$ is called a #concept("Block Diagonal Matrix").

Suppose that $A$ and $B$ are $m times n$ matrices, which are partitioned the same way; that is
$
  A = mat(A_11, A_12, A_13;
          A_21, A_22, A_23)
  "and"
  B = mat(B_11, B_12, B_13;
          B_21, B_22, B_23)
$
. Then $A$ and $B$ can be added or subtracted as follows:
$
  A + B = mat(A_11 + B_11, A_12 + B_12, A_13 + B_13;
              A_21 + B_21, A_22 + B_22, A_23 + B_23)
  \ "and" \
  A - B = mat(A_11 - B_11, A_12 - B_12, A_13 - B_13;
              A_21 - B_21, A_22 - B_22, A_23 - B_23)
$
Similarly, two partitioned matrices $A$ and $C$ can be multiplied. For example, if
$
  A = mat(A_11, A_12;
          A_21, A_22)
  "and"
  C = mat(C_11, C_12, C_13;
          C_21, C_22, C_23)
$,
then
$
  A C = mat(A_11 C_11 + A_12 C_21, A_11 C_12 + A_12 C_22, A_11 C_13 + A_12 C_23;
          A_21 C_11 + A_22 C_21, A_21 C_12 + A_22 C_22, A_21 C_13 + A_22 C_23)
$

#section("2.5. Decomposing Matrices")
// TODO:

To be continued...



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#set page(
  paper: "us-letter",
  header: align(
    right + horizon,
    title,
  ),
  numbering: "1",
  columns: 1,
)

== Chapter 3. Determinants
