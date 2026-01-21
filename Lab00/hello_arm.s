// =============================================================================
// CS 271 Computer Architecture - Lab 00: Introduction to ARM Assembly
// Purdue University Fort Wayne
// =============================================================================
// STUDENT NAME: Henry Richhart
// DATE:         01-21-2026
// =============================================================================
//
// LEARNING OBJECTIVES:
//   After completing this lab, you will be able to:
//   1. Use the development workflow: Edit → Assemble → Simulate → Verify
//   2. Write basic ARM64 instructions (MOV, ADD, SUB)
//   3. Understand register naming (X0-X30 for 64-bit values)
//   4. Verify your code using waveform analysis
//   5. Use the YIELD instruction to signal program completion
//
// =============================================================================
// PART 1: EXAMPLE CODE (Read and understand this section)
// =============================================================================
//
// ARM64 uses registers X0 through X30 to store 64-bit values.
// The MOV instruction copies a value INTO a register.
// The ADD instruction adds two values and stores the result.
//
// Syntax examples:
//   MOV  X0, #42       ; X0 = 42 (the # symbol indicates an immediate value)
//   ADD  X2, X0, X1    ; X2 = X0 + X1
//   SUB  X3, X0, X1    ; X3 = X0 - X1
//
// =============================================================================

    .text
    .global _start

_start:
    // -------------------------------------------------------------------------
    // EXAMPLE: Basic arithmetic
    // -------------------------------------------------------------------------
    MOV     X0, #10         // X0 = 10
    MOV     X1, #5          // X1 = 5
    ADD     X2, X0, X1      // X2 = 10 + 5 = 15

    // =========================================================================
    // PART 2: YOUR TURN! Complete the exercises below.
    // =========================================================================

    // -------------------------------------------------------------------------
    // EXERCISE 1: Load a value into X3
    // -------------------------------------------------------------------------
    // TODO: Use MOV to load the value 25 into register X3
    // After this instruction, X3 should equal 25
    //
    // YOUR CODE HERE:
    
    MOV X3, #25 // x3 = 25

    // -------------------------------------------------------------------------
    // EXERCISE 2: Perform addition
    // -------------------------------------------------------------------------
    // TODO: Add X2 and X3, store the result in X4
    // After this instruction, X4 should equal 40 (because 15 + 25 = 40)
    //
    // YOUR CODE HERE:

    ADD X4, X2, X3 // X4 = X2 + X3

    // -------------------------------------------------------------------------
    // EXERCISE 3: Perform subtraction
    // -------------------------------------------------------------------------
    // TODO: Subtract X1 from X0, store the result in X5
    // Hint: The syntax is SUB destination, source1, source2
    // After this instruction, X5 should equal 5 (because 10 - 5 = 5)
    //
    // YOUR CODE HERE:

    SUB X5, X1, X0 // X5 = X1 - X0

    // -------------------------------------------------------------------------
    // EXERCISE 4: Create your own calculation
    // -------------------------------------------------------------------------
    // TODO: Use any combination of MOV, ADD, and SUB to make X6 equal 100
    // There are many ways to do this! Be creative.
    // After your code, X6 MUST equal exactly 100 for the autograder to pass.
    //
    // YOUR CODE HERE:

    // I'll first move X5 to X8, then add that with itself and store in X7.
    MOV X5, X8      // X8 = X5
    ADD X7, X8, X8  // X7 = X8 + X8

    // =========================================================================
    // PROGRAM TERMINATION
    // =========================================================================
    // The YIELD instruction signals to the simulator that your program
    // has completed successfully. DO NOT REMOVE THIS LINE!
    YIELD

// =============================================================================
// VERIFICATION CHECKLIST
// =============================================================================
// After running 'make sim_lab00', open the waveform viewer (Surfer) and verify:
//
//   [ ] X0 = 10  (0x0A in hexadecimal)
//   [ ] X1 = 5   (0x05)
//   [ ] X2 = 15  (0x0F)
//   [ ] X3 = 25  (0x19)  ← Your Exercise 1
//   [ ] X4 = 40  (0x28)  ← Your Exercise 2
//   [ ] X5 = 5   (0x05)  ← Your Exercise 3
//   [ ] X6 = 100 (0x64)  ← Your Exercise 4
//
// If you see "[EDUCORE LOG]: Apollo has landed" in the terminal,
// your program executed without errors!
//
// =============================================================================
// SUBMISSION
// =============================================================================
// When you're done, commit and push your changes:
//
//   git add .
//   git commit -m "Completed Lab 00"
//   git push
//
// The autograder will verify that your program runs successfully.
// =============================================================================
