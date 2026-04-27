// =============================================================================
// CS 271 Computer Architecture - Lab 04: Pipeline Hazards
// Purdue University Fort Wayne
// =============================================================================
// STUDENT NAME: Henry Richhart
// DATE:         04-27-2026
// =============================================================================
// OBJECTIVE:
//   Understand how pipelining affects instruction execution and learn to
//   identify data hazards. You will observe how the pipelined processor
//   handles dependencies between instructions.
//
// IMPORTANT:
//   This lab uses a PIPELINED processor (not the single-cycle from Labs 00-03)!
//   The pipeline has stages: Fetch → Decode → Execute → Memory → Writeback
//
// =============================================================================

    .text
    .global _start

_start:
    // =========================================================================
    // PART 1: Independent Instructions (No Hazards)
    // =========================================================================
    // These instructions don't depend on each other's results.
    // They can flow through the pipeline efficiently.
    
    MOVZ    X0, #0xf            // X0 = 15
    MOVZ    X1, #0xe            // X1 = 14
    MOVZ    X2, #0xd            // X2 = 13
    MOVZ    X3, #0xc            // X3 = 12
    MOVZ    X4, #0xb            // X4 = 11
    
    // =========================================================================
    // PART 2: Simple Dependencies
    // =========================================================================
    // These instructions use results from previous instructions.
    // Q: Does the pipeline need to stall?
    
    ADD     X5, X0, #1          // X5 = X0 + 1 = 16
    ADD     X6, X1, X2          // X6 = X1 + X2 = 27
    SUBS    X7, X0, X1          // X7 = X0 - X1 = 1, sets flags
    
    // =========================================================================
    // PART 3: Read-After-Write (RAW) Hazard
    // =========================================================================
    // This is a DATA HAZARD: X9 is written then immediately read!
    //
    // Clock 1: ADD X9, X1, X2  - computes X9
    // Clock 2: AND X10, X9, X3 - needs X9 (but X9 isn't written back yet!)
    // In this naive design, the dependent instructions may therefore show
    // UNDEF in the waveform rather than clean numeric values.
    //
    // TODO: Observe in the waveform how the processor handles this.
    
_test2:
    ADD     X9, X1, X2          // X9 = X1 + X2 = 27
    NOP                         // first NOP command
    NOP                         // second NOP command
    NOP                         // third NOP command!
    AND     X10, X9, X3         // X10 = X9 AND X3
    ORR     X11, X5, X9         // X11 = X5 OR X9
    SUB     X12, X9, X7         // X12 = X9 - X7
    
    // =========================================================================
    // PART 4: NOPs for Pipeline Timing
    // =========================================================================
    // NOP (No Operation) instructions can be used to:
    // 1. Delay execution while waiting for data
    // 2. Align code for branch targets
    // 3. Observe pipeline behavior in waveforms
    
    NOP
    NOP
    NOP
    NOP
    
    // =========================================================================
    // COMPLETION
    // =========================================================================
    YIELD

// Record your analysis and answers in analysis.md
