// =============================================================================
// CS 271 Computer Architecture - Lab 03: Instruction Exploration
// Purdue University Fort Wayne
// =============================================================================
// STUDENT NAME: Henry Richhart
// DATE:         04-04-2026
// =============================================================================
// OBJECTIVE:
//   Explore various ARM64 instruction types by predicting and verifying
//   their behavior. You will trace through the code and predict register
//   values, then verify using the waveform viewer.
//
// THIS LAB IS DIFFERENT:
//   Instead of writing code, you will ANALYZE existing code and predict
//   the values in each register after execution.
//
// =============================================================================

    .text
    .global _start

_start:
    // =========================================================================
    // PART 1: Move Immediate
    // =========================================================================
    MOVZ    X0, #0xff           // X0 = ?
    
    // =========================================================================
    // PART 2: Unconditional Branch
    // =========================================================================
    B       _TEST               // Jump over the next instructions
    
    // These should NOT execute if branch works correctly:
    MOVZ    X0, #0xffff         // Should be skipped
    AND     X1, X0, #0x1        // Should be skipped
    AND     X1, X0, #0x2        // Should be skipped
    
_TEST:
    // =========================================================================
    // PART 3: Logical AND with Immediate
    // =========================================================================
    AND     X1, X0, #0x00003ffc00003ffc    // X1 = X0 AND mask = ?
    
    // =========================================================================
    // PART 4: Bit Manipulation
    // =========================================================================
    LSL     X2, X1, #1          // X2 = X1 << 1 (shift left by 1) = ?
    
    MOV     X24, #-252          // X24 = -252 (signed)
    ASR     X25, X24, #3        // X25 = X24 >> 3 (arithmetic shift right) = ?
    
    // =========================================================================
    // PART 5: Arithmetic with Shifted Operand
    // =========================================================================
    ADD     X4, X1, X0          // X4 = X1 + X0 = ?
    ADD     X23, X1, X0, LSL #2 // X23 = X1 + (X0 << 2) = ?
    
    // =========================================================================
    // PART 6: Subtract and Set Flags
    // =========================================================================
    MOVZ    X5, #0x0            // X5 = 0
    SUBS    X6, X5, #0x1        // X6 = X5 - 1 = ? (also sets condition flags)
    
    // =========================================================================
    // PART 7: Memory Store and Load
    // =========================================================================
    MOVZ    X10, #0             // X10 = 0 (address)
    STUR    X0, [X10]           // Store X0 to memory[0]
    LDUR    X11, [X10]          // Load from memory[0] into X11
                                // X11 should equal X0
    
    // =========================================================================
    // PART 8: Advanced Bit Field Operations
    // =========================================================================
    UBFM    X20, X1, #2, #3     // Unsigned bit field move
    UBFM    X21, X1, #3, #2     // Different bit field parameters
    EXTR    X22, X0, X1, #2     // Extract and rotate
    
    // =========================================================================
    // COMPLETION
    // =========================================================================
    YIELD

// =============================================================================
// PREDICTION WORKSHEET
// =============================================================================
// Fill in your predictions, then verify with the waveform viewer:
//
// Register | Your Prediction    | Actual Value       | Correct?
// ---------|--------------------|--------------------|----------
// X0       | 0x00000000000000FF | 0x00000000000000FF | Yes!
// X1       | 0x00000000000000FC | 0x00000000000000FC | Yes!
// X2       | 0x00000000000001F8 | 0x00000000000001F8 | Yes!
// X4       | 0x00000000000001FB | 0x00000000000001FB | Yes!
// X5       | 0x0000000000000000 | 0x0000000000000000 | Yes!
// X6       | 0xFFFFFFFFFFFFFFFF | 0xFFFFFFFFFFFFFFFF | Yes!
// X10      | 0x0000000000000000 | 0x0000000000000000 | Yes!!
// X11      | 0x00000000000000FF | 0x00000000000000FF | Yes!!
// X20      | 0x0000000000000003 | 0x0000000000000003 | Yes!!
// X21      | 0x8000000000000000 | 0x8000000000000000 | Yes!!!
// X22      | 0xC00000000000003F | 0xC00000000000003F | Yes!!!
// X23      | 0x00000000000004F8 | 0x00000000000004F8 | Yes!!!!
// X24      | 0xFFFFFFFFFFFFFF04 | 0xFFFFFFFFFFFFFF04 | Yes!!!!
// X25      | 0xFFFFFFFFFFFFFFE0 | 0xFFFFFFFFFFFFFFE0 | Yes!!!!!
//
// =============================================================================