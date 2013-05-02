# Big O
Chapter 2: A standardize notation for measuring performance vs. processing load.

What makes one algorithm better than another?

* Speed
* Memory use
* Price
* Scalability

Performance is defined as **the time it takes to execute the algorithm given the data set upon which it operates has a size of `N`**. `N` is load and `T` is the time needed to process `N` items. `T = f(N)`, `f` being the algorithm.

* Doubling `N` doesn't necessarily double `T`!

**The relationship between `N` and `T` is what Big-O is all about. Big-O gives us a standardized way to compare an algorithm's performance as `N` increases.**

## Examples
```c++
// N > 0
int c = 0;
for(int i = 0; i < N; i++) {
  c++;
}
```

The value of c is N

```c++
// N > 0
// Two levels of nesting
int c = 0;
for(int i = 0; i < N; i++) {
  for(int j = 0; j < N; j++) {
    c++;
  }
}
```

The value of c is `N^2`

```c++
// N > 0
int c = 0;

for(int i = 0; i < N; i++) {
  for(int j = i; j < N; j++) {
    // j starts at i
    c++;
}
```

```ruby
k = 0 -> N – 1
Sum = N + (N - 1) + (N - 2) + ... = 0.5 * (N + 1) * (N) = 0.5 * (N^2 - N)
```

### Loops increase `T`
Assuming our simple performance function is `T = N^3`.

```
N = 10 -> T = 1,000
N = 100 -> T = 100,000,000
```

**This is bad scalability**

## Reference functions
Common functions like: `N`, `N^2`, `N^3`,`NlogN`, `logN`.

## Notation
When we say `f(N) = O(g(N))`, we are saying the Big-O of `f(n)` is `g(N)`.

* **This does not mean that f(N) = g(N)! Although it could.**
* This means that the growth rate of `f(N)` as `N` increase is less than or equal to the growth rate of g(N).

### Symbols
```
O (Big-O):    O means <=
o (Little O): o means <
Ω (Omega):    Ω means >=
Θ (Theta):    Θ means ==
```

* `f(N) = O(g(N))`: `f(N) <= *` the growth rate of `g(N)`.
* `f(N) = o(g(N))`: `f(N) <  *` the growth rate of `g(N)`.
* `f(N) = Ω(g(N))`: `f(N) >= *` the growth rate of `g(N)`.
* `f(N) = Θ(g(N))`: `f(N) =  *` the growth rate of `g(N)`.

**The values of `g(N)` vs `f(N)` don’t matter**, it is the growth rate. `g(N)` could be growing faster but have a smaller value that `f(N)` at a particular `N`, but you can just multiply `g(N)` by a constant, then it’s value will always be greater than `f(N)` from `N >= n0` and beyond as N -> infinity.

* If `f(x)` is a sum of several terms, the one with the largest growth rate is kept, and all others omitted.
* If `f(x)` is a product of several factors, any constants (terms in the product that do not depend on x) are omitted.

`f(x) = 6x^4 - 2x^3 = 5` -> `f(x) = O(x^4)`

## Final notes
Knowing an algorithm's Big-O is not enough information for you to make a choice as to which algorithm you want for your application. Assume all other factors are equal.
You need to know what the operating point (range of N) is before you can decide.

## Misc
Stacks and queues are O(1) because they are already sorted.
