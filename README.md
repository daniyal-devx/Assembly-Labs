# 🖥️ Computer Organization & Assembly Language (COAL) Labs

![Assembly](https://img.shields.io/badge/Language-x86_Assembly-red) ![Assembler](https://img.shields.io/badge/Assembler-MASM-blue) ![Environment](https://img.shields.io/badge/Environment-DOSBox-orange)

This repository contains a comprehensive collection of my lab assignments and projects for the **Computer Organization and Assembly Language (COAL)** course. All programs are written in **x86 Assembly** using **MASM** (Microsoft Macro Assembler) and are designed to run in a 16-bit DOS environment (DOSBox).

## 📂 Repository Structure

The labs cover low-level programming concepts ranging from basic arithmetic to complex memory manipulation.

| Topic | Description | Key Concepts |
| :--- | :--- | :--- |
| **Basic Arithmetic** | Simple addition, subtraction, multiplication, and division. | `ADD`, `SUB`, `MUL`, `DIV`, Registers (`AX`, `BX`...) |
| **Bitwise Operations** | Logic gates and bit manipulation. | `AND`, `OR`, `XOR`, `TEST`, Bit masking |
| **Data Conversion** | Converting between number systems. | Hex to Decimal, ASCII to Binary, ASCII Conversions |
| **Flow Control** | Decision making and loops. | `CMP`, `JMP`, `JE`, `JNE`, `LOOP` |
| **String Manipulation** | Efficient string handling and memory blocks. | `MOVSB`, `CMPSB`, `SCASB`, `REP`, `STD`, `CLD` |
| **Encryption** | Data encryption using lookup tables. | `XLAT`, Substitution Ciphers |
| **Procedures & Macros** | Modular programming. | `PROC`, `ENDP`, Stack operations (`PUSH`, `POP`) |

## 🛠️ Tools & Technologies

* **Language:** 8086 Assembly Language
* **Assembler:** MASM (Microsoft Macro Assembler 5.0 / 6.11)
* **Linker:** Microsoft Overlay Linker
* **Emulator:** DOSBox 0.74 (for running 16-bit applications on modern OS)
* **Debugger:** DOS Debug.exe

## 🚀 How to Run

To run these codes on a modern Windows/Mac/Linux machine, you will need **DOSBox**.

### 1. Prerequisites
Ensure you have the `MASM.EXE` and `LINK.EXE` binaries in a folder (e.g., `C:\ASM`).

### 2. Mounting Drive
Open DOSBox and run the following commands to mount your directory:
```bash
mount c c:\asm
c:
