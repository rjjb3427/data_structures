# Chapter 8: Graphs
A graph is very simple. The components are the verticies (circles) and edges (lines).

`A ----AB---- B ==  A ----BA---- B`. `AB = BA` Unless there are arrow heads on the graph.
This is called **Adjacency**. When a vertex has an edge that points back to itself, it's called **cyclic**;
the opposite is **acyclic**. Basically, any vertex that can be gotten back to labels the entire graph as cyclic.

How many edges can you have for V verticies? `2(V(V - 1)/2) = V(V-1)`
A graph is known as **Sparce** if it has less edges than is possible.

## Representing Graphs in Computers
There are two ways: one that sucks, another that works well.
Two dimensional arrays could work, but they waste a lot of memory. The big O would be V^2.
What about an **adjaceny** list? The big O would be V+E. If E is maximum, then E = (V)(V-1).
However, if all the possible edges are taken in the adjacency list, the big O (number of possible edges) would be V^2

## Topographical Sort
You can read more about this on page 343.
You cannot topographically sort a cyclic graph because it will never end.
If all paths are present, the size is V factorial (V!).

### Dijkstra's algorithm
Basically, you try and find the "greediest" path.
Greedy Algorithms picks a vertex over another if the path is shorter.
It doesn't matter if it's wrong; it help you but not hurt you. However, negative edges will return a wrong path.
O ElogV using a heap
