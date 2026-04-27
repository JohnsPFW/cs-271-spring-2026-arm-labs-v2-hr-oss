# Lab 02 Answers
**Student Name:** YOUR NAME HERE

---

## How to decode an instruction encoding

For each question below, find the hex encoding in your disassembly log, convert it to 32-bit binary, then fill in each field using the bit layout diagram.

**Worked Example: `MOVZ X1, #1` (encoding: `d2800021`)**

Step 1 — Convert hex to binary (4 bits per digit):
```
d    2    8    0    0    0    2    1
1101 0010 1000 0000 0000 0000 0010 0001
```

Step 2 — Map bits to the MOVZ field layout:

| 31 | 30-29 | 28-23  | 22-21 | 20-5             | 4-0   |
|----|-------|--------|-------|------------------|-------|
| sf | 10    | 100101 | hw    | imm16            | Rd    |
| 1  | 10    | 100101 | 00    | 0000000000000001 | 00001 |

Step 3 — Identify each field:
- `sf` = 1 → 64-bit register
- `hw` = 00 → no shift (LSL #0)
- `imm16` = 0000000000000001 = 1
- `Rd` = 00001 = X1

---

## Section 3.2 — Interpreting Instruction Encodings

---

**1. `MOVZ X0, #5`**

Hex encoding (from disassembly log): `0x`

Binary (32-bit):
```
_    _    _    _    _    _    _    _
____ ____ ____ ____ ____ ____ ____ ____
```

| 31 | 30-29 | 28-23  | 22-21 | 20-5  | 4-0 |
|----|-------|--------|-------|-------|-----|
| sf | 10    | 100101 | hw    | imm16 | Rd  |
|    |       |        |       |       |     |

- `sf` =
- `hw` =
- `imm16` =
- `Rd` =

---

**2. `ADD X4, X4, X0`**

Hex encoding (from disassembly log): `0x`

Binary (32-bit):
```
_    _    _    _    _    _    _    _
____ ____ ____ ____ ____ ____ ____ ____
```

| 31 | 30 | 29 | 28-24 | 23-22 | 20-16 | 15-10 | 9-5 | 4-0 |
|----|----|----|-------|-------|-------|-------|-----|-----|
| sf | op | S  | 01011 | shift | Rm    | imm6  | Rn  | Rd  |
|    |    |    |       |       |       |       |     |     |

- `Rm` (binary) =
- `Rn` (binary) =
- `Rd` (binary) =

---

**3. `SUBS X0, X0, X1`**

Hex encoding (from disassembly log): `0x`

Binary (32-bit):
```
_    _    _    _    _    _    _    _
____ ____ ____ ____ ____ ____ ____ ____
```

| 31 | 30 | 29 | 28-24 | 23-22 | 20-16 | 15-10 | 9-5 | 4-0 |
|----|----|----|-------|-------|-------|-------|-----|-----|
| sf | op | S  | 01011 | shift | Rm    | imm6  | Rn  | Rd  |
|    |    |    |       |       |       |       |     |     |

Compare the `op` and `S` bits to `ADD` above:
- How does the encoding differ to signal that condition flags should be updated?

---

**4. `B.NE sum_loop`**

Hex encoding (from disassembly log): `0x`

Binary (32-bit):
```
_    _    _    _    _    _    _    _
____ ____ ____ ____ ____ ____ ____ ____
```

| 31-24    | 23-5  | 4 | 3-0  |
|----------|-------|---|------|
| 01010100 | imm19 | 0 | cond |
|          |       |   |      |

- `imm19` (binary) =
- `imm19` as a two's complement integer =
- Byte offset (imm19 × 4) =
- `B.NE` address (from disassembly) =
- `sum_loop` address (from disassembly) =
- Do they match?

---

## Section 4.1 — Logical Immediate Values

`MOVZ` and `MOVK` each write a 16-bit immediate into one of four slots in a 64-bit register. The `LSL` shift selects which slot:

| bits 63-48 | bits 47-32 | bits 31-16 | bits 15-0 |
|------------|------------|------------|-----------|
| LSL #48    | LSL #32    | LSL #16    | LSL #0    |

`MOVZ` writes the selected slot and **zeros** all others.
`MOVK` writes the selected slot and **keeps** all other bits unchanged.

Use this layout to trace the value of X5 step by step before answering.

---

**X5** (after `MOVZ` + `MOVK`):
`X5 = 0x`

**X6** (after `AND X6, X5, #0x00003ffc00003ffc`):
`X6 = 0x`

**X7** (after `ORR X7, X5, #0x00003ffc00003ffc`):
`X7 = 0x`

---

## Section 5 — Instruction Aliases

- What is the base instruction that `CMP X0, X1` translates to?
- What is the full expanded form (including all operands)?
