# Mid-Term: Assembly Language

## Task

## Challenges
For this Mid-Term I worked through three very different tasks, each with its own learning
curves. 



###  1.) Write an x86-compatible assembly code that calculates
# result = (var1 + 2) / (var3 - var2)
For this problem, I repeatedly hit errors because I was overwriting the wrong registers 
in my sys_write and sys_exit sequences, such as overwriting EAX instead of ECX for the 
buffer. Once I understood that AX (AH:AL) behaves as a sixteen‑bit dividend, with AH 
needing to be zeroed before executing `div`, I was able to correctly compute var1 plus two,
subtract var3 minus var2, load the divisor into CL, perform `div`, convert AL to its ASCII 
code, and invoke write to print my result to the console.

### 2.) Using a K-map, simplify the following equation
# Y = a.b + a'.b + a. b'
[K-map chart](docs/flowchart.jpg)
At first I had to recall how a two by two K-map groups adjacent ones. By ploting the three
minterms and boxing the bottom row where `a` equals one to get implicant `a` and the right 
column where `b` equals one to get implicant `b` I saw from there how easily the enitre
equaition simplifed down to two terms. y = a + b


### 3.) Write code that identifies an odd or an even number
For problem three I devised a divide‑by‑2 strategy while avoiding any `AND/OR logic`. 
The idea behind my method was to leverage the way the ax(ah:al) registers behaved after 
using the `div` operations. Since I couldn't use `test` or any other AND/OR logic. I realized
I can just compare the registers with the `cmp` operation to determine after a `div` 
operation if the dividen is negative or postive by using a jump operation `je` to check 
the ZF flag and jump to the appropriate block for printing. 
