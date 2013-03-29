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

But does that save any time? What if we had `R` many divisions? We can do this with `log2(N)` (How many times we can divide N).

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
