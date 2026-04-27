// Henry Richhart
// 03-07-2026
.text
    .global _start

_start:
    // =========================================================================
    // STEP 1: Initialize Registers
    // =========================================================================
    MOV     X0, 5       // Loop counter starts at 5
    MOV     X1, 1       // Constant value 1 for increment/decrement
    MOV     X4, 0       // Running sum starts at 0
    MOV     X5, 0       // Iteration count starts at 0

    // =========================================================================
    // STEP 2: The Counted Loop
    // =========================================================================
sum_loop:
    ADD     X4, X4, X0  // Add counter (X0) into running sum (X4)
    ADD     X5, X5, X1  // Increment iteration count (X5) by 1 (using X1)
    SUBS    X0, X0, X1  // Decrement counter (X0) by 1 (using X1) AND set flags
    B.NE    sum_loop    // Branch back to sum_loop if Zero flag is not set (X0 != 0)

    // =========================================================================
    // STEP 3: Signal Completion
    // =========================================================================
done:
    YIELD