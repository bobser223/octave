A = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
B = [0 2 4 6 8 10 12 14 ]

# a
AUB = union(A, B)
AinterB = intersect(A, B)
AsleshB = setdiff(A, B)
BsleshA = setdiff(B, A)
BdeltaA = union(AsleshB, BsleshA)
BdeltaA2 = setxor(A, B)
