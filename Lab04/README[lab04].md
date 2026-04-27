# Lab 04: Pipeline Hazard Analysis

## Overview

This lab uses the pipelined ARM processor in `Lab4_simple_pipeline` and the
worksheet in `Lab04_analysis.docx`. Your job is to run the simulation, inspect
the waveform in Surfer, and complete the analysis questions about a
read-after-write (RAW) hazard.

This README matches the current worksheet and should be used alongside
`Lab04_analysis.docx`.

## Files You Will Use

- `test_lab04.s`
- `Lab04_analysis.docx`
- `dump.vcd`

## Prerequisites

- Complete Labs 00-03 first.
- Start from the `ARM_Codespaces` repo root when running `make sim_lab04`.
- Make sure the Lab 04 files match the current Week 15 Brightspace version.

## Running the Lab

From the `ARM_Codespaces` repo root:

```bash
make sim_lab04
```

Then open `dump.vcd` in Surfer and use the waveform to complete the worksheet.

## Surfer Setup

The worksheet refers to the following register signals by their exact names:

| Register Signal | Meaning |
|---|---|
| `test_Educore.educore.register_file.rX00` | `X0` |
| `test_Educore.educore.register_file.rX01` | `X1` |
| `test_Educore.educore.register_file.rX02` | `X2` |
| `test_Educore.educore.register_file.rX03` | `X3` |
| `test_Educore.educore.register_file.rX04` | `X4` |
| `test_Educore.educore.register_file.rX05` | `X5` |
| `test_Educore.educore.register_file.rX06` | `X6` |
| `test_Educore.educore.register_file.rX07` | `X7` |
| `test_Educore.educore.register_file.rX09` | `X9` |
| `test_Educore.educore.register_file.rX10` | `X10` |
| `test_Educore.educore.register_file.rX11` | `X11` |
| `test_Educore.educore.register_file.rX12` | `X12` |

For the hazard explanation in Part B, the worksheet also suggests these signals:

| Signal | What It Shows |
|---|---|
| `test_Educore.educore.clk` | Clock cycles |
| `test_Educore.educore.PC` | Program Counter in Fetch |
| `test_Educore.educore.ID_PC` | Program Counter for Decode-stage instruction |
| `test_Educore.educore.instruction_memory_v` | Instruction currently being fetched from instruction memory |
| `test_Educore.educore.instruction` | Instruction currently being decoded |
| `test_Educore.educore.EX_exec_n` | One Execute-stage operand |
| `test_Educore.educore.EX_exec_m` | Second Execute-stage operand or immediate |
| `test_Educore.educore.alu_out` | ALU result in Execute |
| `test_Educore.educore.WB_write_en` | Whether Writeback writes a register this cycle |
| `test_Educore.educore.WB_rd_addr` | Which register number is written in Writeback |
| `test_Educore.educore.WB_ex_out` | Value being written back |

## Part A: Baseline Register Values

1. Update the files in `Lab04` with the current Week 15 Brightspace files if
   needed.
2. Run:

   ```bash
   make sim_lab04
   ```

3. Open `dump.vcd` in Surfer.
4. Fill in the Part A table in `Lab04_analysis.docx`.

Expected values listed in the worksheet:

| Register | Expected Value |
|---|---|
| `X0` | `0xF (15)` |
| `X1` | `0xE (14)` |
| `X2` | `0xD (13)` |
| `X3` | `0xC (12)` |
| `X4` | `0xB (11)` |
| `X5` | `0x10 (16)` |
| `X6` | `0x1B (27)` |
| `X7` | `0x1 (1)` |
| `X9` | `0x1B (27)` |
| `X10` | likely `UNDEF` due to RAW hazard |
| `X11` | likely `UNDEF` due to RAW hazard |
| `X12` | likely `UNDEF` due to RAW hazard |

## Part B: Insert Two NOPs

In `test_lab04.s`, replace only the code inside Part 3 with:

```asm
_test2:
    ADD     X9, X1, X2          // X9 = X1 + X2 = 27
    NOP                         // first NOP command
    NOP                         // second NOP command
    AND     X10, X9, X3         // X10 = X9 AND X3
    ORR     X11, X5, X9         // X11 = X5 OR X9
    SUB     X12, X9, X7         // X12 = X9 - X7
```

Then:

1. Rerun `make sim_lab04`.
2. Open the new `dump.vcd` in Surfer.
3. Fill in the Part B table in `Lab04_analysis.docx`.
4. Answer this worksheet question:

   Why is `X10` still `UNDEF` while `X11` and `X12` completed?

Expected worksheet guidance for Part B:

| Register | Expected Value |
|---|---|
| `X9` | `0x1B (27)` |
| `X10` | likely `UNDEF` due to RAW hazard |
| `X11` | `x5 = 16` or `x9 = 27` which one? |
| `X12` | `0x1A (26)` |

## Part C: Insert a Third NOP

In `test_lab04.s`, replace only the code inside Part 3 with:

```asm
_test2:
    ADD     X9, X1, X2          // X9 = X1 + X2 = 27
    NOP                         // first NOP command
    NOP                         // second NOP command
    NOP                         // third NOP command
    AND     X10, X9, X3         // X10 = X9 AND X3
    ORR     X11, X5, X9         // X11 = X5 OR X9
    SUB     X12, X9, X7         // X12 = X9 - X7
```

Then:

1. Rerun `make sim_lab04`.
2. Open the new `dump.vcd` in Surfer.
3. Fill in the Part C table in `Lab04_analysis.docx`.
4. Answer this worksheet question:

   Explain why adding the third `NOP` allowed register `X10` to be updated.

Expected worksheet value for Part C:

| Register | Expected Value |
|---|---|
| `X10` | `0x1B (27)` |

## What You Are Turning In

Complete `Lab04_analysis.docx` with your observed values and explanations.

If your instructor asks for a markdown or PDF export in addition to the Word
file, follow the course submission instructions. The primary analysis document
for this lab is the Word worksheet in this folder.

## Push Your Work to GitHub

After you finish the worksheet and any required edits in `test_lab04.s`, save
your work and push it from the `ARM_Codespaces` repo root:

```bash
git add .
git commit -m "Complete Lab 04"
git push
```

If you already have other unrelated local changes, stage and commit only the
Lab 04 files required by your instructor.
