@test median([1.]) == 1.
@test median([1.,3]) == 2.
@test median([1.,3,2]) == 2.

@test median([1,3,2]) == 2.0
@test median([1,3,2,4]) == 2.5

@test mean([1,2,3]) == 2.
@test var([1,2,3]) == 1.
@test std([1,2,3]) == 1.
@test hist([1,2,3],10) == [1,0,0,0,0,1,0,0,0,1]
@test histc([1,2,3],[0,2,4]) == [1,2,0]

@test quantile([1,2,3,4],0.5) == 2.5
@test quartile([1., 3])[2] == median([1., 3])
@test decile([0.:100.])[1] == 10.0

@test abs(autocor([1, 2, 3, 4, 5]) - 1.0) < 10e-8

@test iqr([1, 2, 3, 4, 5]) == [2.0, 4.0]

z = [true, true, false, false, true, false, true, true, true]
values, lengths = rle(z)
@test values == [true, false, true, false, true]
@test lengths == [2, 2, 1, 1, 3]
@test inverse_rle(values, lengths) == z

z = [true, true, false, false, true, false, true, true, true, false]
values, lengths = rle(z)
@test values == [true, false, true, false, true, false]
@test lengths == [2, 2, 1, 1, 3, 1]
@test inverse_rle(values, lengths) == z

m = [1 0; 0 1]
d = [0.0 sqrt(2); sqrt(2) 0.0]
@test norm(dist(m) - d) < 10e-8

m = [3.0 1.0; 5.0 1.0]
d = [0.0 2.0; 2.0 0.0]
@test norm(dist(m) - d) < 10e-8

m = [1 0 0; 0 1 0 ; 1 0 1]
d = [0.0 sqrt(2) 1.0; sqrt(2) 0.0 sqrt(3); 1.0 sqrt(3) 0.0]
@test norm(dist(m) - d) < 10e-8
