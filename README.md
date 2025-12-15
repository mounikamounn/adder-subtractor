➕ Addition Mode
When the control signal is 0 (Add mode), the circuit performs binary addition:

Inputs:
A[4:0] → First 5-bit operand
B[4:0] → Second 5-bit operand
Add/Sub = 0 → Selects addition

Operation:
Each bit of A and B is fed into a chain of full adders.
The carry-out of each stage ripples into the next stage.
The least significant bit (LSB) adder receives a carry-in of 0.
The final output is the 5-bit sum plus a carry-out flag.

Outputs:
SUM[4:0] → Result of A + B
Carry → Indicates overflow if the result exceeds 5 bits

Example:
A = 01011 (decimal 11)
B = 00101 (decimal 5)
Result = 10000 (decimal 16)
Carry = 0

➖ Subtraction Mode
When the control signal is 1 (Sub mode), the circuit performs binary subtraction using the 2’s complement method:

Inputs:
A[4:0] → First 5-bit operand
B[4:0] → Second 5-bit operand
Add/Sub = 1 → Selects subtraction

Operation:

Each bit of B is XORed with the control signal, effectively inverting B when subtraction is selected.
A 1 is added to the least significant carry-in, completing the 2’s complement of B.
The chain of full adders then computes A + (2’s complement of B) which equals A – B.

Outputs:

sum[4:0] → Result of A – B
Borrow/Carry → Indicates overflow or borrow condition

Example:

A = 01011 (decimal 11)
B = 00101 (decimal 5)
Result = 00110 (decimal 6)
Borrow = 0

⚙️ Summary

Control = 0 → Addition (A + B)
Control = 1 → Subtraction (A – B using 2’s complement)
Same set of full adders is reused for both operations, making the design efficient and versatile.
