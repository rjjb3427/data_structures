# Comparative Programming Final

# Langauges
Most languages are classified as **declarative** or **imperative**.
Declarative languages are usually called higher level languages and focus on what the computer is told to do.
Delcarative languages are more in tune with a programmer's point of view and less concerned with about how to do it.
Imperative languages, for performance reasons, are concerned with the lower level implementation.

### Examples
**Declarative:**

* Functional such as Lisp, Scheme, and Haskell.
* Dataflow such as Id and Val.
* Logic such as Prolog and spreadsheets.
* Template based such as XSLT.

**Imperative:**

* Von Neumann such as C, Ada, and Fortran.
* Scripting such as Python, Perl, PHP.
* Object oriented such as Smalltalk, Eiffel, and Java.

**Functional** languages use a computation model based on recursion. This is done by adapting lambda calculus, a formal computational model.
A program is considered funtional from its inputs and outputs.
Refinement is typically done by defining the functions in terms of simpler functions.

**Logic** or **constraint based** languages are based on predicate logic (this does that).
This model of computation attempts to find values that satisfy certain relationshis, usually through certain logic rules.

**Von Neumann** languages are the most familiar and typical programming languages.
The means of computation is the modiciation of variables. Von Neumann langauges are based on statements such as *assignment*. The side effects influence the next line of code since the values in memory have changed.

**Scripting** languages are subsets of **Von Neumann** languages.
Tools such as Bash and Awk use multiple components that were originally used separately.

**Object oriented** languages are closely related to **Von Neumann** languages, but are more structured.

Many languages are used for special purposes. Lisp is good for manipulating symbolic and complex data structures.
C is good for low-level system programming such as in an operating system.
Prolog is good for reasoning about logical relationships among data.

## Compilation and interpretation
**Compilation** and **interpretation** are not the opposite of each other.
There isn't a clear cut distinction between the two, however the major differences are that interpreted languages have a greater flexibility and better diagnostic messages.
Compiled languages are known for their better performance.

Some language features are impossible to implement without interpretation.
In Lisp and Prolog, programs can write new pieces of themselves and execute them on the fly.
Some scripting languages such as Python and Ruby have this ability as well.

## Binding
Delaying decisions about implementation until run time is called **late-binding**.
A decision made at compile time doesn't need to be reevaluated at run time.
For instance, if a compiler guarantees a variable location is at location XYZ, the generated machine language would use that address whenever the variable is used.
On the contrary, an interpreter needs to look up variables in a table everytime there is a use; this less efficient.

## Implementation
Many compilers are self hosting whiching means that they are written in the same langauge that they compile to. **Bootstrapping** is the process of compiling a compiler.

**Parsers** are the heart of most compilers.
Parsers assemble **tokens** into a **syntax tree**, then pass subroutines one by one for analysis, code generation, and improvement.
This kind of compiler is known as a **syntax-directed-translation**.
Parsers are generally in charge of the entire compilation process.

After parsing in a typical compiler, the next two phases are **semantic analysis** and **intermediate code generation**. The interface between the semantic analysis and intermediate code generation is the boundry between the front and back end.

# Reduced Instruction Set Computing (RISC)
The relationship between hardware and compilers was fundamentally changed when RISC processors were created.
Prior to RISC, the hardware was responsible for low-level performance details.
Compilers were usually doing language translation and optimizations.
However, with RISC processors, compilers were suited to exploiting the performance features of the hardware. Hardware relies on smart compilers to generate highly optimized code.

Without high quality compilers, RISC architectures don't make much sense.
RISC tries to move the architecture/implementation boundry down, closer to the hardware for the sake of showing key performance features to the compiler; the notion of a **pipeline** is a product of this.

One of the most important concerns in a program is the order in which the code is executed; this is known as **control flow**.
The ordering mechanisms can be divided into 8 categories: **Sequencing**, **Selection**, **Iteration**, **Procedural Abstraction**, **Recursion**, **Concurrency**, **Exception Handling and Speculation**, and **Non-determinacy**.


## Miscellaneous
**Subroutines** are a **control abstraction** that programmers use to modulize (hide) code behind an interface.
**Classes** are a **data abstraction** that programmers use to hide a data representation behind a simple set of operations.



