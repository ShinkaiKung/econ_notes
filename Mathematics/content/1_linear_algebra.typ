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
  bold(A) = mat(a_11, a_12, a_13, ..., a_(1 n);
            a_21, a_22, a_23, ..., a_(2 n);
            dots.v, dots.v, dots.down, dots.v;
            a_(m 1), a_(m 2), a_(m 3), ..., a_(m n))
  "or"
  bold(A) = mat(delim: "[",
            a_11, a_12, a_13, ..., a_(1 n);
            a_21, a_22, a_23, ..., a_(2 n);
            dots.v, dots.v, dots.down, dots.v;
            a_(m 1), a_(m 2), a_(m 3), ..., a_(m n))
$
When the numbers represent coefficients of a system of linear equations, the matrix is called a #concept("coefficient matrix").

We can use #concept[Augmented Matrix] to represent a system of linear equations.
If we add the expressions on the right-hand side of the system of linear equations, we get the *augumented (coefficient) matrix*.
$
  hat(bold(A)) = mat(a_11, a_12, a_13, ..., a_(1 n), b_1;
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
  bold(A) = mat(0, 1, 2, 3;
          0, 0, 4, 5;
          0, 0, 0, 6),
  // 3 x 4 matrix
  bold(B) = mat(0, 1, 2, 3;
          0, 0, 4, 5;
          0, 0, 0, 6),
  // 4 x 3 matrix
  bold(C) = mat(0, 1, 2;
          0, 0, 4;
          0, 0, 0;
          0, 0, 0)

$

*Sepcial cases of Row Echelon Form:*

1. A square matrix in which all the elements of the principal diagonal are ones and all other elements are zeros is called the #concept[Identity Matrix]. The identity matrix of order $n$ is denoted by $bold(I)_n$.
  $
    bold(I)_n = mat(1, 0, 0, ..., 0;
                0, 1, 0, ..., 0;
                0, 0, 1, ..., 0;
                dots.v, dots.v, dots.v, dots.down;
                0, 0, 0, ..., 1)
  $

2. A matrix in which all the elements are zeros is called the #concept[Zero Matrix]. The zero matrix of order $m times n$ is denoted by $O_(m n)$.
  $
    bold(O)_(m n) = mat(0, 0, 0, ..., 0;
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
  Let $bold(A)$ be a coefficient matrix with $m$ rows and $n$ columns, and $hat(bold(A))$ be the augumented matrix. Then
  1. rank $bold(A)$ $<=$ rank $hat(bold(A))$.
  2. rank $bold(A)$ $<=$ $min(m, n)$.
]

#theorem("Fact 2 of Rank")[
  Let $bold(A)$ be a coefficient matrix f a system of linear equations of form $m times n$ and $hat(bold(A)) = (bold(A)|bold(b))$ the augumented matrix.
  n is the number of variables and m is the number of equations. Then the corresponding system of linear equations has
  1. no sollution if, rank $bold(A)$ $<$ rank $hat(bold(A))$.
  2. a unique solution if, rank $bold(A)$ $=$ rank $hat(bold(A))$ $=$ n.
  3. infinitely many solutions if, rank $bold(A)$ $=$ rank $hat(bold(A))$ $<$ n.
]


#example("Applications of Rank")[
  1. $"rank"(bold(A)) = 1 = "rank"(bold(A)|bold(b)) < 2$, has infinitely many solutions.
    $
      mat(1, 2, 3;
        2,4, 6;
        augment: #(-1))
      ->
      mat(1, 2, 3;
        0, 0, 0;
        augment: #(-1))
    $
  2. $1 = "rank"(bold(A)) < "rank"(bold(A)|bold(b)) = 2$, has no solution.
    $
      mat(1, 2, 3;
        1,2, 4;
        augment: #(-1))
      ->
      mat(1, 2, 3;
        0, 0, 1;
        augment: #(-1))
    $
  3. $"rank"(bold(A)) = 2 = "rank"(bold(A)|bold(b)) = 2$, has a unique solution.
    $
      mat(1, 2, 3;
        2, 5, 7;
        augment: #(-1))
      ->
      mat(1, 2, 3;
        0, 1, 1;
        augment: #(-1))
    $
  If $"rank"(bold(A)|bold(b))="rank"(bold(A))=n$ then the reduced echelon looks like
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
    bold(A) + bold(B) =
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
    bold(A) - bold(B) =
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
    c bold(A) =
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

  Define the matrix product $bold(A)bold(B)$ if and only if
  $ "number of columns of" bold(A) = "number of rows of" bold(B). $
  For the matrix product to exist, $bold(A)$ must be $k times m$ and $bold(B)$ must be $m times n$. The product $bold(A)bold(B)$ is a $k times n$ matrix. To obtain the $(i, j)$th entry of $bold(A)bold(B)$, we multiply the $i$th row of $bold(A)$ by the $j$th column of $bold(B)$ as follows:
  $
    mat(a_(i 1), a_(i 2), ..., a_(i m)) dot mat(b_(1 j); b_(2 j); ...; b_(m j)) = a_(i 1)b_(1 j) + a_(i 2)b_(2 j) + ... + a_(i m)b_(m j) = sum_(k=1)^m a_(i h)b_(h j).
  $
  Example:
  $
    mat(a, b; c, d; e, f) mat(bold(A), bold(B); bold(C), bold(D)) = mat(a bold(A) + b bold(C), a bold(B) + b bold(D); c bold(A) + d bold(C), c bold(B) + d bold(D); e bold(A) + f bold(C), e bold(B) + f bold(D))
  $

  Sepcially, we have $bold(A) = bold(A)bold(I)= bold(I)bold(A)$.

- #concept("Laws of Matrix Algebra")
  1. Associative Laws:
  $
    (bold(A) + bold(B)) + bold(C) = bold(A) + (bold(B) + bold(C))
  $
  $
    (bold(A) bold(B))bold(C) = bold(A) (bold(B) bold(C))
  $
  2. Commutative Law for Addition:
  $
    bold(A) + bold(B) = bold(B) + bold(A)
  $
  #attention("Attention")[The Commutative Law for Multiplication does not hold in general.]
  3. Distributive Laws:
  $
    bold(A) (bold(B) + bold(C)) = bold(A)bold(B) + bold(A)bold(C)
  $

5. #concept("Transpose")

  The transpose of a matrix $bold(A)$ is denoted by $bold(A)^T$. The transpose of a matrix is obtained by interchanging its rows and columns. If $bold(A)$ is an $m times n$ matrix, then $bold(A)^T$ is an $n times m$ matrix. The $(i, j)$th entry of $bold(A)^T$ is the $(j, i)$th entry of $bold(A)$. For example,
  $
    // 2 x 3
    bold(A) = mat(a_11, a_12, a_13;
            a_21, a_22, a_23)
    arrow
    // 3 x 2
    bold(A)^T = mat(a_11, a_21;
              a_12, a_22;
              a_13, a_23)
  $

  We have rules of transpose:
  1. $(bold(A)^T)^T = bold(A)$
  2. $(bold(A) + bold(B))^T = bold(A)^T + bold(B)^T$
  3. $(c bold(A))^T = c bold(A)^T$
  4. $(bold(A)bold(B))^T = bold(B)^T bold(A)^T$
  #proof("Proof of rule 4")[
    Matrix $bold(A)$ is $k times m$ and matrix $bold(B)$ is $m times n$. Then the $(i, j)$th entry of $bold(A)bold(B)$ is
    $
      (bold(A)bold(B))^T_(i j) = (bold(A)bold(B))_(j i) = sum_(h=1)^m bold(A)_(j h) bold(B)_(h i) = sum_(h=1)^m bold(B)^T_(i h) bold(A)^T_(h j) = (bold(B)^T bold(A)^T)_(i j)
    $
  ]

Formally, we can represent systems of linear equations in matrix form. Let $bold(A)$ be a coefficient matrix of a system of linear equations, $bold(x)$ be a vector of variables, and $bold(b)$ be a vector of constants. Then the system of linear equations can be written as:
$
  bold(A)bold(x) = bold(b)
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
  $bold(A)^2 = bold(A)$,
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

- *Type 1*: We get $bold(E)_(i j)$ from $bold(I)_n$ by exchanging row $i$ and $j$.
  $
  // 3 x 3 example
  bold(E)_12 bold(A) = mat(0, 1, 0;
              1, 0, 0;
              0, 0, 1)
          mat(a_11, a_12, a_13;
              a_21, a_22, a_23;
              a_31, a_32, a_33)
        = mat(a_21, a_22, a_23;
            a_11, a_12, a_13;
            a_31, a_32, a_33)
  $
- *Type 2*: We get $bold(E)_i (c)$ from $bold(I)_n$ by multiplying row $i$ by a non-zero number $c$.
  $
  // 3 x 3 example
  bold(E)_1 (c) bold(A)= mat(c, 0, 0;
                  0, 1, 0;
                  0, 0, 1)
              mat(a_11, a_12, a_13;
                  a_21, a_22, a_23;
                  a_31, a_32, a_33)
            = mat(c * a_11, c * a_12, c * a_13;
                a_21, a_22, a_23;
                a_31, a_32, a_33)
  $
- *Type 3*: We get $bold(E)_(i j)(c)$ from $bold(I)_n$ by adding $c$ times row $i$ to row $j$.
  $
  // 3 x 3 example
  bold(E)_12 (c) bold(A) = mat(1, 0, 0;
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
  For any $m times n$ matrix $bold(A)$, there exist elementory matrices $bold(E)_1, bold(E)_2, ..., bold(E)_k$ such that
  $
    bold(E)_k bold(E)_(k-1) ... bold(E)_2 bold(E)_1 bold(A) = bold(U)
  $,
  where $bold(U)$ is a matrix in row echelon form (or even in reduced echelon form).
]

#section("2.3. Inverse Matrix")

#concept("Inverse Matrix"): Let $bold(A)$ be a $n times n$ square matrix. If there exists a matrix $bold(B)$ such that
$
  bold(A) bold(B) = bold(B) bold(A) = bold(I)_n
$
, then $bold(B)$ is called the *Inverse Matrix* of $bold(A)$, denoted by $bold(A)^(-1)$.


#theorem("Fact 1 of Inverse Matrix")[
  There is at most one inverse matrix for a given square matrix.
  #proof("Proof of Fact 1")[
    Suppose $bold(A)bold(B) = bold(I)_n$ and $bold(A)bold(C) = bold(I)_n$. Then
    $
      bold(B) = bold(B) bold(I)_n = bold(B) (bold(A)bold(C)) = (bold(B) bold(A)) bold(C) = bold(I)_n bold(C) = bold(C)
    $
  ]
]

let $bold(A)$ be a $m times n$ matrx. $bold(B)$ ($n times m$ matrix) is called #concept("Right Inverse") of $bold(A)$ if $bold(A) bold(B) = bold(I)_m$. $bold(C)$ ($m times n$ matrix) is called #concept("Left Inverse") of $bold(A)$ if $bold(C)bold(A) = bold(I)_n$.

#theorem("Fact 2 of Inverse Matrix")[
  + If $bold(A)$ has a left and a right inverse, then they are equal.
  + A square matrix $bold(A)$ has an inverse if it has a left inverse and a right inverse.

  #proof("Proof of Fact 2")[
    + Suppose $bold(A)bold(B) = bold(I)_m$ and $bold(C)bold(A) = bold(I)_n$. Then
      $
        bold(C) = bold(C) bold(I)_n = bold(C) (bold(A)bold(B)) = (bold(C)bold(A)) bold(B) = bold(I)_n bold(B) = bold(B)
      $
    + Suppose $bold(A)$ has a left inverse $bold(C)$ and a right inverse $bold(B)$. Then
      $
        bold(A)bold(B) = bold(I)_n & = bold(C)bold(A) \
        & = bold(B)bold(A) space (<- "By Fact 2.1")
      $
      Hence, $bold(A)^(-1) = bold(B) = bold(C)$
  ]

]


#theorem("Fact 3")[
  For any $n times n$ matrix $bold(A)$, the following statements are equivalent:
  + $bold(A)$ is invertible.
  + $bold(A)$ is nonsingular, i.e. $A bold(x) = bold(b)$ has a unique solution.
  + $bold(A)$ has rank $n$.
]

*Algebra of Inverse Matrices*: Let $bold(A)$ and $bold(B)$ be invertible $n times n$ matrices. Then
1. $(bold(A)^(-1))^(-1) = bold(A)$
2. $(bold(A)^T)^(-1) = (bold(A)^(-1))^T$
3. $(bold(A)bold(B))^(-1) = bold(B)^(-1) bold(A)^(-1)$


#theorem("Fact 4")[
  Any matrix can be written as a product of elementary matrices and a reduced row echelon matrix.
  $
    bold(A) =& bold(E)_1^(-1) bold(E)_2^(-1) ... bold(E)_k^(-1) U
    =& bold(F)_1 bold(F)_2 ... bold(F)_k U
  $
  where $bold(F)_i = bold(E)_i^(-1)$ is an elementary matrix and $bold(U)$ is a reduced row echelon matrix.
  Sepcially, when $bold(A)$ is nonsingular, $bold(U)$ is an identity matrix.

  For different types of elementary matrices, we have
  1. Type 1 $bold(E)_(i j)$: $bold(E)_(i j)^(-1) = bold(E)_(j i)$.
  2. Tpye 2 $bold(E)_i(c)$: $bold(E)_i^(-1) = bold(E)_i (1/c)$ .
  3. Type 3 $bold(E)_(i j)(c)$: $bold(E)_(i j)^(-1)(c) = bold(E)_(i j) (-c)$.
]

*How to calculate the inverse of a matrix?*

Equation $bold(A) bold(A)^(-1) = bold(I)_n$ can be decomposed into $bold(A) bold(x)_i = bold(e)_i$, where $bold(e)_i$ is the $i$th column of $bold(I)_n$. Then we can get $bold(A)^(-1) = mat(bold(x)_1, bold(x)_2, ..., bold(x)_n)$.

We have mastered the method of solving a system of linear equations like $bold(A) bold(x)_i = bold(e)_i$: construct the augmented matrix $hat(bold(A)) = (bold(A)|bold(e)_i)$, and use the Gaussian-Jordan elimination to get the reduced echelon form. If $bold(A)$ is nonsingular, then we can get $bold(x)_i = bold(A)^(-1) bold(e)_i$.

#note($bold(x) = bold(A)^(-1) bold(b)$)[
  $bold(x) = bold(A)^(-1) bold(b)$ is an important equation. It directly tells us how to get the solution of a system of linear equations. If $bold(A)$ is nonsingular, then we can get the unique solution $bold(x) = bold(A)^(-1) bold(b)$.

  If $bold(b)$ changes and $bold(A)$ does not, we can simply get the new solution $bold(x) = bold(A)^(-1) bold(b)'$.
]

So we can calculate the inverse matrix $bold(A)^(-1)$ in a similar way. We construct the augmented matrix $hat(bold(A)) = (bold(A)|bold(I)_n)$, and use the Gaussian-Jordan elimination to get the reduced echelon form. If $bold(A)$ is nonsingular, then we can get $bold(A)^(-1) = mat(bold(x)_1, bold(x)_2, ..., bold(x)_n)$.

#example("Calculate Inverse Matrix")[
  $
    bold(A) =& mat(1, 1, 1;
            12, 2, -3;
            3, 4, 1) \
    (bold(A) | bold(I)) =& mat(1, 1, 1, 1, 0, 0;
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
    bold(A)^(-1) =& mat(0.4, 3/35, -1/7;
                 -0.6, -2/35, 3/7;
                 1.2, -1/35, -2/7)
  $
]

#section("2.4. Partitioned Matrices")

#concept("Partitioned Matrix"): A matrix is said to be partitioned if it is divided into blocks. For example, a $m times n$ matrix $bold(A)$ can be partitioned into four blocks as follows:
$
  bold(A) = mat(bold(A)_(11), bold(A)_(12);
          bold(A)_(21), bold(A)_(22))
$
where $bold(A)_(11)$ is a $k times l$ matrix, $bold(A)_(12)$ is a $k times (n-l)$ matrix, $bold(A)_(21)$ is a $(m-k) times l$ matrix, and $bold(A)_(22)$ is a $(m-k) times (n-l)$ matrix.

If $bold(A)$ is a square matrix which has been partitioned as
$
  bold(A) = mat(bold(A)_11, 0, dots, 0;
          0, bold(A)_22, dots, 0;
          dots.v, dots.v, dots.down, dots.v;
          0, 0, dots, bold(A)_(k k))
$
where each $bold(A)_(i j)$ is a square matrix, then $bold(A)$ is called a #concept("Block Diagonal Matrix").

Suppose that $bold(A)$ and $bold(B)$ are $m times n$ matrices, which are partitioned the same way; that is
$
  bold(A) = mat(bold(A)_11, bold(A)_12, bold(A)_13;
          bold(A)_21, bold(A)_22, bold(A)_23)
  "and"
  bold(B) = mat(bold(B)_11, bold(B)_12, bold(B)_13;
          bold(B)_21, bold(B)_22, bold(B)_23)
$
. Then $bold(A)$ and $bold(B)$ can be added or subtracted as follows:
$
  bold(A) + bold(B) = mat(bold(A)_11 + bold(B)_11, bold(A)_12 + bold(B)_12, bold(A)_13 + bold(B)_13;
              bold(A)_21 + bold(B)_21, bold(A)_22 + bold(B)_22, bold(A)_23 + bold(B)_23)
  \ "and" \
  bold(A) - bold(B) = mat(bold(A)_11 - bold(B)_11, bold(A)_12 - bold(B)_12, bold(A)_13 - bold(B)_13;
              bold(A)_21 - bold(B)_21, bold(A)_22 - bold(B)_22, bold(A)_23 - bold(B)_23)
$
Similarly, two partitioned matrices $bold(A)$ and $bold(C)$ can be multiplied. For example, if
$
  bold(A) = mat(bold(A)_11, bold(A)_12;
          bold(A)_21, bold(A)_22)
  "and"
  bold(C) = mat(bold(C)_11, bold(C)_12, bold(C)_13;
          bold(C)_21, bold(C)_22, bold(C)_23)
$,
then
$
  bold(A)bold(C) = mat(bold(A)_11 bold(C)_11 + bold(A)_12 bold(C)_21, bold(A)_11 bold(C)_12 + bold(A)_12 bold(C)_22, bold(A)_11 bold(C)_13 + bold(A)_12 bold(C)_23;
          bold(A)_21 bold(C)_11 + bold(A)_22 bold(C)_21, bold(A)_21 bold(C)_12 + bold(A)_22 bold(C)_22, bold(A)_21 bold(C)_13 + bold(A)_22 bold(C)_23)
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
