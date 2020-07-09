⍝ WEYL-BRAUER MATRICES IN APL

⍝ Weyl-Brauer matrices are higher dimensional versions of Pauli spin matrices.
⍝ They can be built up using the Pauli spin matrices as blocks. The building up
⍝ can be done by making a mega-array of Pauli matrices then collapsing it down
⍝ by taking the outer/Kronecker product along one of its dimensions - perfect
⍝ for APL!

⎕IO←0⋄⎕PW←210                   ⍝ Set index origin, console width

a←2 2⍴1 0 0 1                   ⍝ Identity matrix
b←2 2⍴1 0 0 ¯1                  ⍝ Pauli matrices
p←2 2⍴0 1 1 0
q←2 2⍴0 0J1 0J¯1 0

v←p q b                         ⍝ Vector of Pauli matrices
e←v∘.(+.×)v                     ⍝ Products of Pauli matrices
e+⍉e                            ⍝ Anticommutators of Pauli matrices

n←3                             ⍝ Number of vector space dimensions is 2×n
                                ⍝ Dimension of matrices is 2 2*n

u←(⍳n)∘.>⍳n                     ⍝ Upper triangular matrix of ones

k←{⊃⍪/,/⍺∘.×⊂⍵}                 ⍝ Kronecker product of matrices

v←,k/((p q),2 2⍴a b)[;u+2×⍉u]   ⍝ Weyl-Brauer matrices
e←v∘.(+.×)v                     ⍝ Products of Weyl-Brauer matrices
0 0⍉e                           ⍝ Check matrices square to the identity
e+⍉e                            ⍝ Anticommutators of Weyl-Brauer matrices

I←+.×/v                         ⍝ Pseudo-scalar I
m←2*n
n m
II←⊃I+.×I
((⍳m)∘.=⍳m)≡II                  ⍝ I squares to identity for even n
((⍳m)∘.=⍳m)≡-II                 ⍝ or -identity for odd n
