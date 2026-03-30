// =============================================================================
// CS 271 Computer Architecture - Lab 02: Post-Increment Addressing
// Purdue University Fort Wayne
// =============================================================================
// STUDENT NAME: Henry Richhart
// DATE:         03-29-2026
// =============================================================================
// OBJECTIVE:
//   Implement a more efficient string copy using post-increment addressing.
//   This version uses fewer instructions than Lab 01 by incrementing the
//   pointer automatically with each load/store.
//
// NEW CONCEPTS:
//   - Post-increment addressing: [X0], #1 (access memory, then add 1 to X0)
//   - STURB: Store byte (alternative to STRB)
//   - CMP/BNE: Compare and branch if not equal
//
// EXPECTED OUTCOME:
//   - The string at 0x50 should be copied to 0x13C
//   - Simulation output: "[EDUCORE LOG]: Apollo has landed"
//
// =============================================================================

    .text
    .global _start

_start:
    // =========================================================================
    // STEP 1: Initialize Pointers and Data (Already done for you)
    // =========================================================================
    MOVZ    X0, #0x0050         // X0 = source pointer
    MOVZ    X1, #0x013C         // X1 = destination pointer
    
    // Store test string "ef" at address 0x50 (simulating data in memory)
    MOVZ    X5, #0x65           // ASCII 'e' = 0x65
    MOVZ    X6, #0x66           // ASCII 'f' = 0x66
    STURB   W5, [X0]            // Store 'e' at address 0x50
    STURB   W6, [X0, #1]        // Store 'f' at address 0x51
    STURB   WZR, [X0, #2]       // Store null terminator at 0x52

    // =========================================================================
    // STEP 2: Implement the Copy Loop with Post-Increment (YOUR CODE)
    // =========================================================================
    // 
    // In Lab 01, you used separate ADD instructions to increment pointers.
    // Now you'll use POST-INCREMENT addressing which does it automatically!
    //
    // Syntax: LDRB W2, [X0], #1
    //         This loads from [X0], THEN adds 1 to X0 afterward.
    //
    // The loop should:
    //   1. Load byte from source with post-increment
    //   2. Store byte to destination with post-increment
    //   3. Compare the byte to zero
    //   4. If not zero, loop back
    
_strcpyloop:
    // -------------------------------------------------------------------------
    // TODO #1: Load byte from [X0] into W2, then increment X0 by 1
    // Syntax: LDRB Wt, [Xn], #1
    // -------------------------------------------------------------------------
    
    LDRB    W2, [X0], #1
    
    // -------------------------------------------------------------------------
    // TODO #2: Store byte from W2 to [X1], then increment X1 by 1
    // Syntax: STRB Wt, [Xn], #1
    // -------------------------------------------------------------------------
    
    STRB    W2, [X1], #1
    
    // -------------------------------------------------------------------------
    // TODO #3: Compare X2 to zero
    // Syntax: CMP Xn, #imm
    // Note: Use X2 (not W2) for the comparison
    // -------------------------------------------------------------------------
    
    CMP     X2, #0
    
    // -------------------------------------------------------------------------
    // TODO #4: Branch back to _strcpyloop if NOT equal to zero
    // Syntax: BNE label
    // -------------------------------------------------------------------------
    
    BNE     _strcpyloop

YIELD