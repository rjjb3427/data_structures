# Chapter 7, Efficient sorting

Bucket Sort O(N)
Radix sort: `O(PxN)` -> `O(NLog(N)`
NLog(N) is the best possible Big O for a **general sorting** algorithm.
The workst comparison sort is `O(N^2)`

Bucket sort is O(N) which is better than NLog(N), so why is it worse? Bucket sort doesn't compare anything.


### Typical sort `O(N^2)`
The function below swaps the numbers in a typical bubble sort fashion. We're comparing pairs of data.

```ruby
  if(m1 > m2)
    temp = m1
    m1 = m2
    m2 = temp
  end
```

Look at every pair. If # of elements = N. How many pairs are there?
`NCR = N! \/ (N-R)!R!)`

`N(N-1) \/ 2` == `N^2 - N / 2`

## Proof
Take the numbers `9,8,7,6,5,4,3,2,1`, the worse case scenario.

`N = 9`, pairs = `9x8 / 2 = 36`: 9,8; 9,7; 9,6;....3,2; 3,1, 2,1.

You should see a triangle shape; these pairs are known as inversions.
It's the worst case scenario if the number of inversions are equal to the number of pairs.
If the number of inversions are 0, then the data is already sorted.

## Optimize
Instead of looking for neighbors, look for entries that are far apart. By flipping `1` and `9`, we fix 15 inversions.
The most inversions we can fix are `2g - 1`, `g = Distance between numbers.` The least is at least 1.


# Insertion Sort `Θ(N^2)` (Theta Θ means ==)
The general idea of Insertion sort is that multiple passes are done to efficiently remove inversions.

`gap = 1`; This is assumed.

```
  V
9,8,7,6,5,4,3,2,1`
```

```
  V
8,9,7,6,5,4,3,2,1`
```

```
      V
7,8,9,6,5,4,3,2,1`
```

# Shell Sort `O(N^2)`
*The insertion sort with shell increments.*
Created by Donald Shell. If we have N items, the gap sequence is `N/2, N/4, N/8.... I`


## Hibbard Sequence O(N^5/4)
`2^k -1`. Let `k=6`; `2^6 -1 = 63, 2^5 - 1 = 31...`. The sequence would be `63, 31, 13, 7, 3, 1`.

## Sedgewich O(N^7/6)
Sedwich is better becuase most of the numbers are odd and/or prime.
The distance between the gaps is a factor which is related to number theory.

1. `9 * 4^i - 9 * 2^1 + 1`
2. `4^i - 3 * 2^i + 1 `

`109, 41, 19, 5, 1`: Runs faster than NLog(N) in practice. NLog(N) will eventually be better at 10^9 (billions) records.

# Merge Algorithm: divide and conquor
If we took N items and separated them into `N/2`, we'd get:

`N^2 > (N^2)/2 + f(N)`

But does that save any time? What if we had `R` many divisions? We can do this with `log2(N)`
(How many times we can divide N).

`N^2 > (N^2)/R + Rf(N)`

```ruby
N = 64
log2(64) = 6
```

* 32 groups of 2
* 16 groups of 4
* 8 groups of 8
* 4 groups of 16
* 2 groups of 32
* 1 group of 64

# Quick Sort
We start by picking the median as a pivot. We split the data between what is greater than or equal to P and less than P.
We still use insertion sort at our arbitrary split point despite it's poor growth (N^2) because the data is small. The differences are inconsiquential.
Quick sort is the fastest sort but it should not be used for everything. Hundreds of thousands of records would be appropriate. It's possible that quick sort can be exploited.

Sort time is proportial to `N^2`.

## Picking the median pivot
We can't know the median without having the list sorted already, so what do we do?
Just pick the middle number from three random numbers that are sorted. 3 is a decent amount for most purposes.

### How to mess up on a test
* Just picking the middle number.
* Taking the index instead of the value. You need to use the values at the locations. Locations: 0, N-1, N/2.
* It's not the middle number, it's the median of the three.

# Recursive Relationship
How do you find the big O of a recursive relationship?
1. `T(1) = 1`

2. `T(N) = 2T(N/2) + N)`. As we expand this, we form a tree.
We need an equation for the last level. Let's replace N with N/2.

3. `T(N/2) = 2T(N/2/2) + N/2`

4. `T(N) = 4T(N/4) + 2N`. This equation relates the top level to the bottom level.
This still isn't good enough. We can see that `2N` shows that it is taking longer to put back together.

5. `T(N) = k(T)(N/k) + k/2 * N`. This is similar to the mathematical induction we did in Discrete Math.

6. `T(N) = 8T(N/8) + 3N` == **NOT TRUE**.

What about this?
7. `T(N) = 2^k * T(N/2 * k) + k * N`.

k = Number of layers = logN

`T(N) = 2^logN * T(N / 2^logN) + NlogN`

`N + NlogN`. Our big O is (NlogN)

### Protips
* Don't use the telescope method.
* This is method is much more difficult with quick sort.
* What to do for log of any base? k = log_b((b - 1)N + 1)

