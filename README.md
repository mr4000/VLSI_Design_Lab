# 🧠 EE705: VLSI Design Lab 2025 – Assignment Submissions

> This repository contains my submissions for **EE705: VLSI Design Lab (Spring 2025)** at IIT Bombay. It includes Verilog designs, Vivado projects, reports, and final documentation for Assignments 1–4.

---

## 📁 Repository Structure

VLSI-Design-Lab/
├── Assign-1/
├── Assign-2/
├── Assign-3/
└── Assign-4/


---

## 📌 Assignments Overview

### 🔧 Assignment 1: 32-bit Brent-Kung Adder
- ✅ **Components**:
  - Structural Brent-Kung adder vs behavioral `+` operator
  - BRAM controller with VIO and ILA-based debugging
- 📦 **Deliverables**:
  - Synthesized bitstream for PYNQ
  - Post-implementation utilization report

### ⚙️ Assignment 2: Dadda Multiplier & Barrel Shifter
- ✅ **Designs**:
  - 16-bit multiplier (HA/FA-based)
  - 8-bit logarithmic (barrel) shifter – structural Verilog
- 🔬 **Validation**:
  - RTL vs behavioral (`*`, `<<`) results
  - BRAM-based testbench environment

### 🧩 Assignment 3: AXI-BRAM Integration
- 🔄 **Workflow**:
  - AXI4-Lite BRAM controller
  - COE-based BRAM initialization
  - Integration with Dadda multiplier
- 🛠️ **Debugging**:
  - ILA probes for AXI transactions

### 🧱 Assignment 4: OpenRAM to GDSII Layout
- 🧬 **Steps**:
  - Generated ICACHE/DCACHE macros using OpenRAM
  - Hierarchical macro placement using OpenLane
  - DRC/LVS clean layout generation
- 📤 **Outputs**:
  - `.gds` Magic-compatible layouts
  - Setup/Hold STA reports

📂 Directory Descriptions
Each assignment directory contains:

Codes/ – Verilog design and testbench files

Report.pdf – Lab report with methodology, simulation waveforms, and results

Vivado_Project/ – Full Xilinx Vivado project for synthesis & implementation

Assignment-X.pdf – Original assignment brief

📎 License
This repository is meant for academic use under the MIT License.

👨‍💻 Author
Manish Ranjan
M.Tech ICS, IIT Bombay
Email: manishranjan4000@gmail.com
GitHub: @mr4000

