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
// > 0
int c = 0;
for(int i = 0; i < N; i++) {
  c++;
}
```

The value of c is N

```
// N > 0
// Two levels of nesting
int c = 0;
for(int i = 0; i < N; i++) {
  for(int j = 0; j < N; j++) {
    c++;
  }
}
```

The value of c is N^2

### Loops increase `T`
Assuming our simple performance function is `T = N^3`.

```
N = 10 -> T = 1,000
N = 100 -> T = 100,000,000
```

**This is bad scalability**

## Reference functions
Common functions like: