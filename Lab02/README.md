# Lab 02: Instruction Encoding and Logical Operations

## Overview

In this lab, you will learn how ARMv8-A instructions and immediate values are encoded into 32-bit machine code, and how ARM handles the limited space available for constants in a fixed-width instruction set.

**Prerequisites:** Complete Lab 00 and Lab 01 first.

**Estimated Time:** 30-45 minutes

---

## Learning Objectives

After completing this lab, you will be able to:
1. Use the GNU Toolchain (`objdump`) to obtain instruction encodings in a human-readable format.
2. Decode the bit fields of common AArch64 instructions (`MOVZ`, `ADD`, `SUBS`, `B.NE`).
3. Understand how Armv8-A encodes immediate values for move operations and logical bitmasks.
4. Recognize instruction aliases (e.g., `CMP` vs `SUBS`).

---

## Instructions

Read **`CA_lab_2.md`** in this folder. It contains all tasks, exercises, and questions for this lab.

Record all of your answers in **`answers.md`**.

To build and simulate:
```bash
make sim_lab02
```

---

## Submission

```bash
git add .
git commit -m "Completed Lab 02"
git push
```
