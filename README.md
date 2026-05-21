# DevEnv-Optimizer 🚀

> **A zero-dependency Windows batch utility designed to instantly optimize your development environment, clear system bottlenecks, and enforce high-performance power states.**

## 📖 Extended Description
Setting up and maintaining a clean Windows environment for heavy development workloads (like compiling C++, running local Node.js servers, or handling large Java projects) can be resource-intensive. Default Windows background services and aggressive power-saving protocols often throttle CPU performance and eat up valuable RAM.

**DevEnv-Optimizer** is a lightweight, strictly native batch script that requires no third-party installations. It automatically analyzes your hardware, purges system cache, resolves DNS latency, verifies your core development stack (Git, Java, Python, Node.js), and forces the OS into a High-Performance state. It is built specifically for developers who need maximum throughput without the overhead of heavy, ad-filled optimization software.

## ✨ Core Features
* **Hardware Profiling:** Instantly queries `wmic` to log your current CPU and GPU configuration.
* **Network & DNS Reset:** Flushes the DNS resolver cache to prevent local routing issues during API development and testing.
* **Deep Cache Cleaning:** Safely forcefully purges `%temp%` and `C:\Windows\Temp` directories to free up I/O overhead.
* **Stack Verification:** Checks the system `PATH` for essential runtimes and compilers.
* **Power State Override:** Uses `powercfg` to enforce the High-Performance power plan, preventing CPU underclocking during active compilation.

## 🚀 Usage
1. Download or clone this repository.
2. Locate `start-optimizer.bat`.
3. **Right-click** and select **"Run as administrator"** (The script will automatically halt and warn you if admin rights are missing).
4. Wait for the terminal to complete the 5-step optimization process.

## 🤝 Contributing
Pull requests are welcome. For major changes (like adding bash support for Linux/WSL), please open an issue first to discuss what you would like to change.

## 📄 License
Distributed under the MIT License. See `LICENSE` for more information.
