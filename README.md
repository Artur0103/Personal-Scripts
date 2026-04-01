# Personal Scripts

Collection of penetration testing and red team automation scripts for security assessments.

---

## 📁 Repository Structure

```
Personal-Scripts/
├── build.sh          # Full Red Team tools installer
├── http.sh           # Simple Python HTTP server
└── README.md         # This file
```

---

## 🛠️ Scripts Description

### `build.sh` – Red Team Tools Installer

Automated installer for penetration testing and red team infrastructure tools on **Parrot OS / Kali Linux**.

#### 🔧 What gets installed:

| Category | Tools |
|----------|-------|
| **C2 Frameworks** | Sliver, Viper, Havoc |
| **Active Directory** | Impacket, NetExec, BloodHound, Mimikatz, PowerSploit, Kerbrute, Empire, CrackMapExec, SharpCollection |
| **Reconnaissance** | Subfinder, Httpx, Nuclei, Katana, Naabu, Dnsx, Gau, Waybackurls, Ffuf |
| **Web Application** | SQLMap, Commix, XSStrike, Dalfox, WhatWeb, Wfuzz, Kiterunner |
| **Cloud Security** | ScoutSuite, Prowler, Trivy (via installers) |
| **Wordlists** | SecLists, FuzzDB |
| **Utilities** | Gowitness, Chisel, Feroxbuster, Gobuster, Masscan, Nmap, John, Steghide, Tmux, Tor, Zmap |

> Note: Some cloud tools require separate setup after installation.

#### 📦 Installation

```bash
chmod +x build.sh
./build.sh
```

The script will:
- Update system packages
- Install Go and Python dependencies
- Download and compile tools into `~/tools`
- Save wordlists in `~/wordlists`
- Add Go binaries to `PATH`

---

### `http.sh` – Quick HTTP Server

Simple Python HTTP server for file transfer during engagements.

```bash
#!/bin/bash
python3 -m http.server 80
```

#### Usage

```bash
chmod +x http.sh
./http.sh
```

Then access files via: `http://<your-ip>:80/<filename>`

---

## 🚀 Quick Start

```bash
# Clone repository
git clone https://github.com/Artur0103/Personal-Scripts.git
cd Personal-Scripts

# Make scripts executable
chmod +x build.sh http.sh

# Install all tools (Parrot/Kali)
./build.sh

# Start HTTP server when needed
./http.sh
```

---

## 📂 Directories Created

After running `build.sh`:

| Path | Purpose |
|------|---------|
| `~/tools/` | Source code and binaries for all tools |
| `~/go/bin/` | Go-compiled binaries |
| `~/wordlists/` | SecLists, FuzzDB and other wordlists |
| `~/tools/NetExec/` | NetExec (post-exploitation) |
| `~/tools/Viper/` | Viper C2 (Docker) |
| `~/tools/Havoc/` | Havoc C2 |
| `~/tools/SharpCollection/` | Windows .NET payloads |
| `~/tools/mimikatz/` | Credential extraction |
| `~/tools/PowerSploit/` | PowerShell post-exploitation |
| `~/tools/sqlmap/` | SQL injection tool |
| `~/tools/commix/` | Command injection tool |

---

## 🧠 Notes

- Some C2 frameworks (Viper, Havoc) require **Docker** – ensure Docker is running before use.
- **BloodHound** and **Viper** use Docker Compose – start them separately if needed.
- Wordlists are downloaded to `~/wordlists` for use with tools like `ffuf`, `gobuster`, `hydra`.
- Go tools are added to `PATH` automatically in `~/.bashrc`.

---

## 📜 License

MIT License – feel free to use and modify for your own assessments.

---

## 🇷🇺 Русская версия

# Personal Scripts

Коллекция скриптов для автоматизации пентестов и Red Team операций.

---

## Структура репозитория

```
Personal-Scripts/
├── build.sh          # Установщик инструментов Red Team
├── http.sh           # Простой Python HTTP сервер
└── README.md         # Этот файл
```

---

## Описание скриптов

### `build.sh` – Установщик инструментов Red Team

Автоматическая установка инструментов для пентеста на **Parrot OS / Kali Linux**.

#### Что устанавливается:

| Категория | Инструменты |
|-----------|-------------|
| **C2 фреймворки** | Sliver, Viper, Havoc |
| **Active Directory** | Impacket, NetExec, BloodHound, Mimikatz, PowerSploit, Kerbrute, Empire, CrackMapExec, SharpCollection |
| **Разведка** | Subfinder, Httpx, Nuclei, Katana, Naabu, Dnsx, Gau, Waybackurls, Ffuf |
| **Веб-приложения** | SQLMap, Commix, XSStrike, Dalfox, WhatWeb, Wfuzz, Kiterunner |
| **Облачная безопасность** | ScoutSuite, Prowler, Trivy (отдельная настройка) |
| **Словари** | SecLists, FuzzDB |
| **Утилиты** | Gowitness, Chisel, Feroxbuster, Gobuster, Masscan, Nmap, John, Steghide, Tmux, Tor, Zmap |

#### Установка

```bash
chmod +x build.sh
./build.sh
```

Скрипт:
- Обновляет систему
- Устанавливает Go и Python зависимости
- Скачивает и компилирует инструменты в `~/tools`
- Сохраняет словари в `~/wordlists`
- Добавляет Go бинарники в `PATH`

---

### `http.sh` – Быстрый HTTP сервер

Простой Python HTTP сервер для передачи файлов.

```bash
#!/bin/bash
python3 -m http.server 80
```

#### Использование

```bash
chmod +x http.sh
./http.sh
```

Файлы доступны по адресу: `http://<ваш-ip>:80/<имя_файла>`

---

## Быстрый старт

```bash
git clone https://github.com/Artur0103/Personal-Scripts.git
cd Personal-Scripts
chmod +x build.sh http.sh
./build.sh          # установка всех инструментов
./http.sh           # запуск HTTP сервера при необходимости
```

---

## Создаваемые директории

| Путь | Назначение |
|------|-----------|
| `~/tools/` | Исходный код и бинарники инструментов |
| `~/go/bin/` | Скомпилированные Go бинарники |
| `~/wordlists/` | SecLists, FuzzDB и другие словари |
| `~/tools/NetExec/` | NetExec (пост-эксплуатация) |
| `~/tools/Viper/` | Viper C2 (Docker) |
| `~/tools/Havoc/` | Havoc C2 |
| `~/tools/SharpCollection/` | Windows .NET пейлоады |
| `~/tools/mimikatz/` | Извлечение учётных данных |
| `~/tools/PowerSploit/` | PowerShell пост-эксплуатация |
| `~/tools/sqlmap/` | Инструмент для SQL инъекций |
| `~/tools/commix/` | Инструмент для командных инъекций |

---

## Примечания

- Некоторые C2 фреймворки (Viper, Havoc) требуют **Docker** – убедитесь, что Docker запущен.
- **BloodHound** и **Viper** используют Docker Compose – запускаются отдельно при необходимости.
- Словари загружаются в `~/wordlists` для использования с `ffuf`, `gobuster`, `hydra`.
- Go инструменты добавляются в `PATH` автоматически в `~/.bashrc`.

---

## Лицензия

MIT License – свободное использование и модификация.
