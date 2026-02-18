---

# SuperSwap

A simple **Bash script** designed to automate **swap space management** in Linux systems.  
This project provides an easy way to create, configure, and enable swap files, improving system performance under heavy memory usage.

---

## Features
- Create a **swap file** of custom size.  
- Set correct **permissions** for security.  
- Format and activate the swap file.  
- Automatically update `/etc/fstab` for persistence across reboots.  
- Lightweight and easy to use.  

---

## Technologies Used
- **Bash (Shell scripting)** → Core logic.  
- **Linux utilities** → `dd`, `chmod`, `mkswap`, `swapon`.  

---

## Project Structure
```
SuperSwap/
│── SuperSwap.bash     # Main script
│── LICENSE            # MIT License
└── README.md          # Documentation
```

---

## How to Use
### Prerequisites
- Linux system with root privileges.  

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/GabrielSantana1996sp/SuperSwap.git
   cd SuperSwap
   ```
2. Make the script executable:
   ```bash
   chmod +x SuperSwap.bash
   ```
3. Run the script:
   ```bash
   sudo ./SuperSwap.bash
   ```
4. Follow the prompts to configure swap size and enable it.  

---

## Purpose
The goal of this project is to:
- Simplify **swap file creation** on Linux.  
- Provide a **secure and automated** method for system administrators.  
- Strengthen understanding of **shell scripting and system configuration**.  

---

## License
This project is licensed under the **MIT License**.  
See the `LICENSE` file for details.  

---

## Author
Developed by **Gabriel Santana**  
Contact: GabrielSantana1996sp on GitHub (github.com) [(github.com in Bing)](https://www.bing.com/search?q="https%3A%2F%2Fgithub.com%2FGabrielSantana1996sp")

---
