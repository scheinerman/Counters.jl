using Counters
using Base.Test

# write your own tests here
@test 1 == 1
c = Counter{String}()
c["alpha"] = 1
incr!(c,"bravo")
c["charlie"] += 1

@test c["alpha"] == 1
@test c["bravo"] == 1
@test c["charlie"] == 1

c = c+c

@test c["alpha"] == 2
@test nnz(c) == 3  
@test sum(c) == 6
