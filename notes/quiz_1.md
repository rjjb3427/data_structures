# Quiz 1
**Chapter 2, 3, 5**

Bring Blue Book

## Growth Rates
* Big O: `f(n) <= g(n)`
* Little o: `f(n) < g(n)`
* Theta: `f(n) = g(n)`
* Omega: `f(n) >= g(n)`

* Bucket sort: `O(n)`
* Radix sort: `(P+N)` (p is passes.)

## Stacks
Big O of a stack: O(1)

Push operator: stack[i++] = 100
Pop operator: stack[i--] = 100

Recursive uses stacks.

LIFO: Last in, first out.
FIFO: First in, first out.

## Linked Lists
* Forward access
* Double linked lists can go backwards.
* Can't go random.
* Uses more memory than an array due to pointers.
* Can grow unbounded.
* Easy to edit, just change the head or tail.


## Hashing
**Hashing allows storage and retrieval of data with minimal searching.** We're not doing separate chaining(linked list) in this chapter. Radix sort covers it.

We want `O(1)` but we tend to get `O(1) + n`

## collision resolution
* Separate chaining (linked list)
* Open addresses (probing)
* Quadratic probing
* Linear probing

`Ts` = table size
### Linear
```
k = 1
(x % Ts + i^k) % Ts
```

### Quadratic
```
k = 2
(x % Ts + i^k) % Ts
```

### Double Hashing
```
R = Prime smaller than Ts
x % Ts + i(R - x % R) % Ts
```

```ruby
t =
r =
x = 69; (x % t + 0 * (r - x % r)) % t
```

### Searching
Hash function H(x) = x (desired location) % s + ? (searching term).
(x % + i) % S (to go back around the array)

f(i) = i * hash_2(x)
hash1(x) + i(hash2)(x)




