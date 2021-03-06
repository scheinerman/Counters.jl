using Counters
using Test

# write your own tests here
@test 1 == 1
c = Counter{String}()
c["alpha"] = 1
incr!(c, "bravo")
c["charlie"] += 1

@test c["alpha"] == 1
@test c["bravo"] == 1
@test c["charlie"] == 1

c = c + c

@test c["alpha"] == 2
@test nnz(c) == 3
@test sum(c) == 6

c["delta"] = 2
c["delta"] += -10
@test c["delta"] == 0

d = deepcopy(c)
clean!(d)
@test c == d

@test nnz(c) == 3
@test sum(c) == 6
@test length(c) == 4
@test length(d) == 3

X = Set(1:3)
c = counter(X)
Y = BitSet(1:3)
d = counter(Y)
@test c == d

c = counter([1, 1, 2, 3])
@test mean(c) == 1.75

x = [mod(t, 10) for t in rand(Int, 100)]
c = counter(x)
xx = collect_by_counts(c)
top = xx[1]
@test c[top] == maximum(values(c))
