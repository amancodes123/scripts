# Python Scripting for DevOps 🐍

A practical, beginner-friendly collection of Python notes, examples, and hands-on scripts for DevOps, Cloud, and automation.

> **Goal:** Learn Python scripting to automate repetitive tasks, work with files and processes, consume APIs, parse configuration, and build cloud/DevOps utilities.

## 📚 Table of Contents

1. [Introduction](#1-introduction)
2. [Running Python](#2-running-python)
3. [Variables and Data Types](#3-variables-and-data-types)
4. [Operators](#4-operators)
5. [Input and Output](#5-input-and-output)
6. [Conditions](#6-conditions)
7. [Loops](#7-loops)
8. [Data Structures](#8-data-structures)
9. [Strings](#9-strings)
10. [Functions](#10-functions)
11. [Modules and Packages](#11-modules-and-packages)
12. [File Handling](#12-file-handling)
13. [Exception Handling](#13-exception-handling)
14. [Working with Paths and Directories](#14-working-with-paths-and-directories)
15. [OS and Environment Variables](#15-os-and-environment-variables)
16. [Running System Commands with subprocess](#16-running-system-commands-with-subprocess)
17. [Logging](#17-logging)
18. [JSON](#18-json)
19. [YAML](#19-yaml)
20. [Regular Expressions](#20-regular-expressions)
21. [Date and Time](#21-date-and-time)
22. [HTTP Requests and APIs](#22-http-requests-and-apis)
23. [Command-Line Arguments](#23-command-line-arguments)
24. [Virtual Environments and pip](#24-virtual-environments-and-pip)
25. [Testing with unittest](#25-testing-with-unittest)
26. [DevOps Automation Scripts](#26-devops-automation-scripts)
27. [AWS Automation Basics](#27-aws-automation-basics)
28. [Best Practices and Security](#28-best-practices-and-security)
29. [Common Errors](#29-common-errors)
30. [Practice Tasks](#30-practice-tasks)
31. [Interview Revision Questions](#31-interview-revision-questions)
32. [Useful Commands](#32-useful-commands)

---

## 1. Introduction

Python is a high-level programming language used for scripting, automation, backend development, data processing, and cloud operations.

### Why Python for DevOps?

- Automate repetitive operational tasks.
- Read and process log files.
- Check service or endpoint availability.
- Work with JSON, YAML, and configuration files.
- Call REST APIs.
- Automate AWS tasks with the AWS SDK (`boto3`).
- Build deployment helpers and maintenance scripts.
- Write tests and health checks.

### Python vs. Bash

| Python | Bash |
|---|---|
| Good for structured logic and larger scripts | Good for shell commands and command chaining |
| Strong libraries for APIs, JSON, YAML, and cloud SDKs | Convenient for native Linux administration |
| Easier to maintain as automation grows | Often simpler for short shell tasks |
| Runs on Linux, Windows, and macOS with Python installed | Most common on Linux/Unix-like systems |

Use the simplest tool that safely solves the task. Python and Bash often work well together.

## 2. Running Python

Check whether Python is installed:

```bash
python3 --version
```

Start the interactive interpreter:

```bash
python3
```

Run a script:

```bash
python3 script.py
```

Create a script:

```bash
mkdir python-devops
cd python-devops
nano hello.py
```

`hello.py`:

```python
print("Hello, DevOps!")
```

Run it:

```bash
python3 hello.py
```

### Comments

```python
# This is a single-line comment

"""
This is a multiline string.
It is often used as a module or function docstring.
"""
```

### Indentation

Python uses indentation to define code blocks:

```python
if True:
    print("Indented block")
```

Use consistent indentation, usually four spaces.

## 3. Variables and Data Types

Variables store values:

```python
name = "Aman"
experience_years = 0
learning_python = True
temperature = 28.5

print(name)
print(experience_years)
print(learning_python)
print(temperature)
```

### Common data types

| Type | Example | Meaning |
|---|---|---|
| `str` | `"Linux"` | Text |
| `int` | `10` | Integer |
| `float` | `3.14` | Decimal number |
| `bool` | `True` | Boolean value |
| `list` | `[1, 2, 3]` | Ordered, mutable collection |
| `tuple` | `(1, 2, 3)` | Ordered, immutable collection |
| `set` | `{1, 2, 3}` | Collection of unique values |
| `dict` | `{"name": "Aman"}` | Key-value mapping |
| `NoneType` | `None` | No value |

Check a value's type:

```python
port = 8080
print(type(port))
```

Convert between types:

```python
port_text = "8080"
port_number = int(port_text)

cpu_usage = float("42.7")
message = str(port_number)

print(port_number + 1)
```

Conversion can fail if the input is invalid:

```python
# int("hello") raises ValueError
```

### Naming conventions

```python
server_name = "web-01"
max_retries = 3
AWS_REGION = "ap-south-1"  # Convention for constants
```

Use descriptive `snake_case` names for variables and functions.

## 4. Operators

### Arithmetic

```python
a = 10
b = 3

print(a + b)   # 13
print(a - b)   # 7
print(a * b)   # 30
print(a / b)   # 3.333...
print(a // b)  # 3
print(a % b)   # 1
print(a ** b)  # 1000
```

### Comparison

```python
print(10 == 10)  # True
print(10 != 5)   # True
print(10 > 5)    # True
print(10 <= 5)   # False
```

### Logical

```python
cpu = 65
memory = 72

if cpu < 80 and memory < 80:
    print("Resource usage is below the threshold")
```

Other logical operators are `or` and `not`.

### Membership

```python
services = ["nginx", "docker", "ssh"]

print("nginx" in services)       # True
print("apache" not in services)  # True
```

## 5. Input and Output

```python
username = input("Enter username: ")
print(f"Welcome, {username}")
```

`input()` returns a string. Convert numeric input when necessary:

```python
retry_count = int(input("Enter retry count: "))
print(f"Retries configured: {retry_count}")
```

### f-strings

```python
service = "nginx"
status = "running"

print(f"Service {service} is {status}")
```

## 6. Conditions

```python
disk_usage = 82

if disk_usage >= 90:
    print("CRITICAL: Disk usage is high")
elif disk_usage >= 75:
    print("WARNING: Disk usage is elevated")
else:
    print("OK: Disk usage is within the expected range")
```

### Example: Check a port number

```python
port = 8080

if 1 <= port <= 65535:
    print("Valid TCP/UDP port number")
else:
    print("Invalid port number")
```

This checks the numeric range only; it does not prove that a service is listening.

## 7. Loops

### `for` loop

```python
services = ["nginx", "docker", "ssh"]

for service in services:
    print(f"Checking {service}")
```

### `range()`

```python
for number in range(1, 6):
    print(number)
```

### `while` loop

```python
attempt = 1

while attempt <= 3:
    print(f"Attempt {attempt}")
    attempt += 1
```

### `break` and `continue`

```python
for number in range(1, 6):
    if number == 3:
        continue  # Skip 3
    if number == 5:
        break     # Stop at 5
    print(number)
```

### `enumerate()`

```python
servers = ["web-01", "web-02", "db-01"]

for index, server in enumerate(servers, start=1):
    print(index, server)
```

### `zip()`

```python
servers = ["web-01", "db-01"]
ips = ["10.0.1.10", "10.0.2.10"]

for server, ip in zip(servers, ips):
    print(f"{server}: {ip}")
```

## 8. Data Structures

### Lists

Lists are ordered and mutable.

```python
services = ["nginx", "docker"]
services.append("ssh")
services.remove("docker")

print(services)
print(services[0])
print(len(services))
```

Useful operations:

```python
numbers = [4, 1, 3, 2]
numbers.sort()
print(numbers)  # [1, 2, 3, 4]
```

### Tuples

Tuples are ordered and immutable.

```python
server = ("web-01", "10.0.1.10", 80)
name, ip, port = server

print(name, ip, port)
```

### Sets

Sets hold unique values:

```python
regions = {"ap-south-1", "us-east-1", "ap-south-1"}
print(regions)  # Duplicate removed; order is not guaranteed
```

### Dictionaries

Dictionaries store key-value pairs:

```python
server = {
    "name": "web-01",
    "ip": "10.0.1.10",
    "port": 80,
    "active": True,
}

print(server["name"])
print(server.get("environment", "not-set"))

server["environment"] = "development"

for key, value in server.items():
    print(f"{key}: {value}")
```

Use `.get()` when a key may be absent.

### List comprehension

```python
numbers = [1, 2, 3, 4, 5]
squares = [number ** 2 for number in numbers if number % 2 == 0]
print(squares)  # [4, 16]
```

## 9. Strings

```python
message = "Python for DevOps"

print(message.lower())
print(message.upper())
print(message.title())
print(message.replace("DevOps", "Automation"))
print(message.startswith("Python"))
print(message.split())
```

### Joining values

```python
services = ["nginx", "docker", "ssh"]
print(", ".join(services))
```

### Removing whitespace

```python
line = "  ERROR: service failed  \n"
clean_line = line.strip()
print(clean_line)
```

### Slicing

```python
text = "deployment"
print(text[0:4])   # depl
print(text[-4:])   # ment
```

## 10. Functions

Functions package reusable logic.

```python
def greet(name):
    return f"Hello, {name}!"

print(greet("Aman"))
```

### Default arguments

```python
def connect(host, port=22):
    return f"Connecting to {host}:{port}"

print(connect("server.example"))
print(connect("server.example", 2222))
```

### Keyword arguments

```python
def create_server(name, region):
    print(f"Server: {name}, Region: {region}")

create_server(region="ap-south-1", name="web-01")
```

### `*args` and `**kwargs`

```python
def show_services(*services):
    for service in services:
        print(service)

show_services("nginx", "docker", "ssh")
```

```python
def show_config(**config):
    for key, value in config.items():
        print(f"{key}={value}")

show_config(region="ap-south-1", environment="dev")
```

### Docstrings and main guard

```python
def add(a, b):
    """Return the sum of two values."""
    return a + b


def main():
    print(add(2, 3))


if __name__ == "__main__":
    main()
```

The `if __name__ == "__main__":` guard prevents the main routine from running when the module is imported.

## 11. Modules and Packages

A module is a Python file that can be imported.

`utils.py`:

```python
def check_status():
    return "OK"
```

`main.py`:

```python
from utils import check_status

print(check_status())
```

Run:

```bash
python3 main.py
```

Useful standard-library modules include:

- `os` — environment and operating-system interfaces.
- `sys` — interpreter and command-line information.
- `pathlib` — filesystem paths.
- `subprocess` — external commands.
- `json` — JSON encoding and decoding.
- `logging` — application logs.
- `datetime` — date and time.
- `argparse` — command-line arguments.
- `re` — regular expressions.
- `shutil` — file operations.
- `unittest` — tests.

## 12. File Handling

Use `with open(...)` so files are closed automatically.

### Write a file

```python
with open("app.log", "w", encoding="utf-8") as file:
    file.write("Application started\n")
```

Mode `"w"` overwrites an existing file.

### Append to a file

```python
with open("app.log", "a", encoding="utf-8") as file:
    file.write("Health check completed\n")
```

### Read a file

```python
with open("app.log", "r", encoding="utf-8") as file:
    content = file.read()

print(content)
```

### Read line by line

```python
with open("app.log", "r", encoding="utf-8") as file:
    for line in file:
        if "ERROR" in line:
            print(line.rstrip())
```

### Common modes

| Mode | Meaning |
|---|---|
| `r` | Read; file must exist |
| `w` | Write; creates or truncates |
| `a` | Append; creates if missing |
| `x` | Create new file; fail if it exists |
| `b` | Binary mode modifier |
| `+` | Read and write modifier |

## 13. Exception Handling

Handle expected errors so scripts can report useful information.

```python
try:
    number = int("123")
except ValueError as error:
    print(f"Invalid number: {error}")
else:
    print(f"Number: {number}")
finally:
    print("Operation finished")
```

### File error example

```python
try:
    with open("missing.txt", "r", encoding="utf-8") as file:
        print(file.read())
except FileNotFoundError:
    print("The file does not exist")
except PermissionError:
    print("Permission denied")
```

Avoid broad `except Exception` unless you have a clear reason and log or handle the error appropriately. Do not silently hide failures.

## 14. Working with Paths and Directories

Prefer `pathlib` for filesystem paths.

```python
from pathlib import Path

log_file = Path("logs/app.log")
print(log_file.name)
print(log_file.suffix)
print(log_file.exists())
```

Create directories:

```python
Path("logs").mkdir(parents=True, exist_ok=True)
```

Find `.log` files:

```python
for file_path in Path(".").glob("*.log"):
    print(file_path)
```

Read a text file:

```python
path = Path("app.log")

if path.exists() and path.is_file():
    print(path.read_text(encoding="utf-8"))
```

Copy and archive files using `shutil`:

```python
import shutil
from pathlib import Path

source = Path("app.log")
destination = Path("backup/app.log")

destination.parent.mkdir(parents=True, exist_ok=True)

if source.exists():
    shutil.copy2(source, destination)
    print("Backup copied")
else:
    print("Source file not found")
```

## 15. OS and Environment Variables

### Current working directory and listing

```python
import os

print(os.getcwd())
print(os.listdir("."))
```

For new code, `pathlib.Path.iterdir()` is often convenient for directory traversal.

### Environment variables

```python
import os

environment = os.getenv("APP_ENV", "development")
print(environment)
```

Set a variable in Linux for one command:

```bash
APP_ENV=production python3 app.py
```

Read a secret from an environment variable:

```python
import os

api_token = os.getenv("API_TOKEN")

if not api_token:
    raise RuntimeError("API_TOKEN is not configured")
```

Do not commit real credentials, access keys, or tokens to GitHub. Environment variables are one option, but use a secrets manager for production workloads where appropriate.

## 16. Running System Commands with subprocess

Use `subprocess.run()` rather than building shell command strings.

```python
import subprocess

result = subprocess.run(
    ["python3", "--version"],
    capture_output=True,
    text=True,
    check=True,
)

print(result.stdout.strip())
```

### Check a Linux command

```python
import subprocess

try:
    result = subprocess.run(
        ["systemctl", "is-active", "nginx"],
        capture_output=True,
        text=True,
        timeout=10,
        check=False,
    )

    print(f"nginx status: {result.stdout.strip() or result.stderr.strip()}")
except FileNotFoundError:
    print("systemctl command was not found")
except subprocess.TimeoutExpired:
    print("The status check timed out")
```

`systemctl` is available on systemd-based Linux distributions; it may not be available in containers or all environments. Checking status does not automatically restart a failed service.

### Important subprocess rules

- Prefer argument lists such as `["ls", "-l"]`.
- Avoid `shell=True` with user-controlled input.
- Use timeouts for commands that might hang.
- Check return codes and capture useful error output.
- Run commands with the minimum permissions required.

## 17. Logging

Logging is more useful than `print()` for long-running automation.

```python
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s",
)

logging.debug("Detailed diagnostic information")
logging.info("Automation started")
logging.warning("Disk usage is elevated")
logging.error("Deployment failed")
```

Log levels, from least to most severe:

1. `DEBUG`
2. `INFO`
3. `WARNING`
4. `ERROR`
5. `CRITICAL`

Avoid logging passwords, access tokens, private keys, or other secrets.

## 18. JSON

JSON is widely used in REST APIs and configuration.

### Python dictionary to JSON

```python
import json

server = {
    "name": "web-01",
    "port": 8080,
    "enabled": True,
}

json_text = json.dumps(server, indent=2)
print(json_text)
```

Write JSON to a file:

```python
import json

config = {"environment": "dev", "replicas": 2}

with open("config.json", "w", encoding="utf-8") as file:
    json.dump(config, file, indent=2)
```

Read JSON from a file:

```python
import json

with open("config.json", "r", encoding="utf-8") as file:
    config = json.load(file)

print(config["environment"])
```

### `json` functions

| Function | Purpose |
|---|---|
| `json.dumps()` | Python object → JSON string |
| `json.dump()` | Python object → JSON file |
| `json.loads()` | JSON string → Python object |
| `json.load()` | JSON file → Python object |

## 19. YAML

YAML is commonly used in Ansible, Kubernetes, Docker Compose, and CI/CD configuration.

Install PyYAML in your virtual environment:

```bash
python3 -m pip install PyYAML
```

Example `config.yaml`:

```yaml
app:
  name: task-manager
  environment: development
  port: 5000

replicas: 2

services:
  - nginx
  - redis
```

Read YAML safely:

```python
import yaml

with open("config.yaml", "r", encoding="utf-8") as file:
    config = yaml.safe_load(file)

print(config["app"]["name"])
print(config["services"])
```

Use `yaml.safe_load()` for untrusted or ordinary configuration input rather than `yaml.load()` with unsafe loaders.

## 20. Regular Expressions

Regular expressions help find patterns in text and logs.

```python
import re

log_line = "2026-10-30 ERROR Database connection failed"

if re.search(r"\bERROR\b", log_line):
    print("Error found")
```

Extract an IPv4-looking pattern from text:

```python
import re

text = "Server address: 10.0.1.25"
match = re.search(r"\b(?:\d{1,3}\.){3}\d{1,3}\b", text)

if match:
    print(match.group())
```

This pattern finds IPv4-shaped text but does not validate every octet's range. Use a dedicated IP-address parser for strict validation.

Useful functions:

- `re.search()` — find a match anywhere.
- `re.match()` — match at the beginning.
- `re.findall()` — return all matches.
- `re.sub()` — replace matching text.

## 21. Date and Time

```python
from datetime import datetime, timezone

now = datetime.now(timezone.utc)
print(now.isoformat())
```

Format a timestamp:

```python
from datetime import datetime

now = datetime.now()
print(now.strftime("%Y-%m-%d %H:%M:%S"))
```

Parse a known timestamp format:

```python
from datetime import datetime

date = datetime.strptime("2026-10-30", "%Y-%m-%d")
print(date.date())
```

For distributed systems, prefer timezone-aware timestamps and document which timezone is used.

## 22. HTTP Requests and APIs

Install `requests`:

```bash
python3 -m pip install requests
```

### GET request

```python
import requests

url = "https://httpbin.org/get"

try:
    response = requests.get(url, timeout=10)
    response.raise_for_status()
    print(response.status_code)
    print(response.json())
except requests.RequestException as error:
    print(f"Request failed: {error}")
```

### Health endpoint check

```python
import requests

def check_endpoint(url):
    try:
        response = requests.get(url, timeout=5)
        if response.ok:
            print(f"UP: {url} ({response.status_code})")
        else:
            print(f"UNHEALTHY: {url} ({response.status_code})")
    except requests.RequestException as error:
        print(f"UNREACHABLE: {url} ({error})")


if __name__ == "__main__":
    check_endpoint("https://example.com")
```

Replace the example URL with an endpoint you are authorized to test.

### POST JSON

```python
import requests

payload = {"name": "demo", "status": "active"}

response = requests.post(
    "https://httpbin.org/post",
    json=payload,
    timeout=10,
)
response.raise_for_status()
print(response.json())
```

Do not send secrets to example endpoints. For authenticated APIs, follow the provider's authentication method and keep credentials out of source code.

## 23. Command-Line Arguments

`argparse` makes scripts reusable without editing the source each time.

```python
import argparse

parser = argparse.ArgumentParser(description="Print a service name")
parser.add_argument("--service", required=True, help="Service to check")
args = parser.parse_args()

print(f"Checking service: {args.service}")
```

Run:

```bash
python3 check_service.py --service nginx
python3 check_service.py --help
```

### Boolean flag

```python
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--verbose", action="store_true")
args = parser.parse_args()

if args.verbose:
    print("Verbose mode enabled")
```

## 24. Virtual Environments and pip

Virtual environments isolate project dependencies.

Create and activate one on Linux:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

On Windows PowerShell:

```powershell
py -m venv .venv
.\.venv\Scripts\Activate.ps1
```

Install packages:

```bash
python -m pip install requests PyYAML
```

Save dependencies:

```bash
python -m pip freeze > requirements.txt
```

Install from a dependency file:

```bash
python -m pip install -r requirements.txt
```

Deactivate:

```bash
deactivate
```

Do not commit the `.venv/` directory. Commit the dependency file appropriate to your project's workflow.

## 25. Testing with unittest

Python includes a testing framework.

`test_math_utils.py`:

```python
import unittest


def add(a, b):
    return a + b


class TestMathUtils(unittest.TestCase):
    def test_add_two_numbers(self):
        self.assertEqual(add(2, 3), 5)

    def test_add_negative_number(self):
        self.assertEqual(add(-2, 2), 0)


if __name__ == "__main__":
    unittest.main()
```

Run:

```bash
python3 -m unittest -v
```

Test expected behavior, edge cases, invalid inputs, and failure scenarios.

## 26. DevOps Automation Scripts

The examples below are starting points. Test them in a safe environment before using them on production systems.

### 26.1 Check CPU, memory, and disk

Install `psutil`:

```bash
python3 -m pip install psutil
```

`system_health.py`:

```python
import shutil
import psutil

cpu_percent = psutil.cpu_percent(interval=1)
memory_percent = psutil.virtual_memory().percent
disk = shutil.disk_usage("/")

disk_percent = disk.used / disk.total * 100

print(f"CPU usage: {cpu_percent:.1f}%")
print(f"Memory usage: {memory_percent:.1f}%")
print(f"Disk usage: {disk_percent:.1f}%")

if cpu_percent >= 80:
    print("WARNING: CPU usage is high")
if memory_percent >= 80:
    print("WARNING: Memory usage is high")
if disk_percent >= 80:
    print("WARNING: Disk usage is high")
```

Run:

```bash
python3 system_health.py
```

### 26.2 Find large files

`find_large_files.py`:

```python
from pathlib import Path

root = Path(".")
minimum_size_mb = 10

for path in root.rglob("*"):
    try:
        if path.is_file() and path.stat().st_size >= minimum_size_mb * 1024 * 1024:
            size_mb = path.stat().st_size / (1024 * 1024)
            print(f"{size_mb:.2f} MB  {path}")
    except (PermissionError, FileNotFoundError, OSError):
        # A file can disappear or become inaccessible during traversal.
        continue
```

Use a specific directory instead of `Path("/")` when scanning a system.

### 26.3 Search errors in log files

`search_errors.py`:

```python
from pathlib import Path

log_path = Path("app.log")
keywords = ("ERROR", "CRITICAL", "Traceback")

if not log_path.is_file():
    raise SystemExit(f"Log file not found: {log_path}")

with log_path.open("r", encoding="utf-8", errors="replace") as file:
    for line_number, line in enumerate(file, start=1):
        if any(keyword in line for keyword in keywords):
            print(f"{line_number}: {line.rstrip()}")
```

### 26.4 Back up a directory

`backup_directory.py`:

```python
from pathlib import Path
from datetime import datetime
import shutil

source = Path("data")
backup_root = Path("backups")

if not source.is_dir():
    raise SystemExit(f"Source directory does not exist: {source}")

backup_root.mkdir(parents=True, exist_ok=True)
timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
archive_base = backup_root / f"data_{timestamp}"

archive_path = shutil.make_archive(
    str(archive_base),
    "gztar",
    root_dir=source,
)

print(f"Backup created: {archive_path}")
```

This creates a compressed archive of the source directory's contents. For production, define retention, encryption, restore testing, permissions, and off-host storage.

### 26.5 Check whether a TCP port is reachable

`check_port.py`:

```python
import socket
import sys

if len(sys.argv) != 3:
    raise SystemExit("Usage: python3 check_port.py HOST PORT")

host = sys.argv[1]

try:
    port = int(sys.argv[2])
    if not 1 <= port <= 65535:
        raise ValueError
except ValueError:
    raise SystemExit("PORT must be an integer from 1 to 65535")

try:
    with socket.create_connection((host, port), timeout=3):
        print(f"REACHABLE: {host}:{port}")
except (OSError, TimeoutError) as error:
    print(f"NOT REACHABLE: {host}:{port} ({error})")
    raise SystemExit(1)
```

Run against a host you are authorized to test:

```bash
python3 check_port.py example.com 443
```

A reachable port does not guarantee the application is healthy or correctly configured.

### 26.6 Validate required environment variables

`validate_env.py`:

```python
import os
import sys

required = ["APP_ENV", "DATABASE_HOST"]
missing = [name for name in required if not os.getenv(name)]

if missing:
    print("Missing environment variables: " + ", ".join(missing))
    sys.exit(1)

print("Required environment variables are configured")
```

Run:

```bash
APP_ENV=dev DATABASE_HOST=localhost python3 validate_env.py
```

### 26.7 Check multiple URLs

`check_urls.py`:

```python
import requests

urls = [
    "https://example.com",
    "https://www.python.org",
]

for url in urls:
    try:
        response = requests.get(url, timeout=10)
        print(f"{url} -> HTTP {response.status_code}")
    except requests.RequestException as error:
        print(f"{url} -> FAILED: {error}")
```

For production monitoring, define acceptable status codes, retries, timeouts, and alerting behavior. Avoid treating every HTTP status as healthy.

### 26.8 Create a deployment timestamp file

`deployment_marker.py`:

```python
from datetime import datetime, timezone
from pathlib import Path

marker = Path("deployment.txt")
timestamp = datetime.now(timezone.utc).isoformat()

marker.write_text(
    f"Deployment marker created at {timestamp}\n",
    encoding="utf-8",
)

print(f"Created {marker}")
```

This is a simple example of recording deployment metadata, not a complete deployment system.

## 27. AWS Automation Basics

AWS automation with Python commonly uses **Boto3**, the AWS SDK for Python.

Install it in your virtual environment:

```bash
python3 -m pip install boto3
```

Configure credentials using an approved method, such as an IAM role on an AWS compute resource or a local AWS CLI profile. Never hard-code access keys in scripts or commit them to GitHub.

### 27.1 Check the AWS identity

```python
import boto3

session = boto3.Session(region_name="ap-south-1")
sts = session.client("sts")

identity = sts.get_caller_identity()
print("Account:", identity["Account"])
print("ARN:", identity["Arn"])
```

Run:

```bash
python3 aws_identity.py
```

The AWS identity must have permission to call `sts:GetCallerIdentity` as required by the environment's credential setup.

### 27.2 List S3 buckets

```python
import boto3

s3 = boto3.client("s3", region_name="ap-south-1")

response = s3.list_buckets()

for bucket in response.get("Buckets", []):
    print(bucket["Name"])
```

This requires suitable IAM permissions. S3 buckets are global in naming, but bucket operations and locations have region-specific details.

### 27.3 List EC2 instances

```python
import boto3

ec2 = boto3.client("ec2", region_name="ap-south-1")

paginator = ec2.get_paginator("describe_instances")

for page in paginator.paginate():
    for reservation in page.get("Reservations", []):
        for instance in reservation.get("Instances", []):
            print(
                instance["InstanceId"],
                instance["State"]["Name"],
                instance.get("InstanceType", "unknown"),
            )
```

This is read-only inventory. It requires permission for `ec2:DescribeInstances`.

### AWS safety checklist

- Use least-privilege IAM policies.
- Prefer IAM roles over long-lived access keys.
- Choose the correct region and account.
- Review costs before creating billable resources.
- Add pagination for APIs that return multiple pages.
- Use dry-run or non-production testing where supported.
- Confirm resource IDs before destructive operations.
- Never automate deletion or shutdown without safeguards and authorization.

## 28. Best Practices and Security

1. Use descriptive variable and function names.
2. Break large scripts into small functions.
3. Use `pathlib` for paths and `subprocess.run()` for commands.
4. Set timeouts for network calls and external processes.
5. Handle expected errors and return useful exit codes.
6. Use logging instead of relying only on `print()`.
7. Keep secrets out of source code and logs.
8. Validate user input before using it.
9. Use virtual environments and track dependencies.
10. Add tests for important logic.
11. Use least-privilege permissions.
12. Make automation safe to rerun where possible (idempotency).
13. Review destructive operations and require explicit confirmation.
14. Document prerequisites, usage, expected output, and limitations.
15. Run formatters and linters as a project grows.

### Example `.gitignore`

```gitignore
# Python bytecode
__pycache__/
*.py[cod]

# Virtual environments
.venv/
venv/

# Environment files and secrets
.env
.env.*
!.env.example

# Test and coverage output
.coverage
htmlcov/
.pytest_cache/

# Editor and OS files
.vscode/
.idea/
.DS_Store
```

Only commit `.env.example` with placeholder values, never real secrets.

## 29. Common Errors

| Error | Common cause | How to investigate |
|---|---|---|
| `SyntaxError` | Invalid Python syntax | Read the reported line and nearby lines |
| `IndentationError` | Inconsistent indentation | Use consistent four-space indentation |
| `NameError` | Variable or name not defined | Check spelling and scope |
| `TypeError` | Operation used with incompatible types | Check types and function arguments |
| `ValueError` | Correct type expected but invalid value | Validate input before conversion |
| `FileNotFoundError` | File or executable not found | Check the path and current directory |
| `PermissionError` | Insufficient filesystem permission | Check owner, permissions, and execution context |
| `ModuleNotFoundError` | Package/module unavailable to interpreter | Activate the correct venv and install dependencies |
| `Timeout` | Operation exceeded allowed time | Check network/service health and timeout settings |
| HTTP 401/403 | Authentication/authorization issue | Check credentials, token, and permissions |
| HTTP 404 | Endpoint/resource not found | Check URL, route, or resource identifier |
| AWS `AccessDenied` | IAM or resource policy denies action | Review identity, resource, and policy conditions |

## 30. Practice Tasks

Try solving these tasks without looking at a solution first.

### Beginner

- [ ] Print your name, role, and learning goals.
- [ ] Read two numbers and calculate their sum.
- [ ] Check whether a number is even or odd.
- [ ] Print numbers from 1 to 20.
- [ ] Store five Linux commands in a list and print them.
- [ ] Create a dictionary describing an EC2 instance.
- [ ] Write a function that converts minutes to seconds.

### Intermediate

- [ ] Read a log file and count `ERROR` lines.
- [ ] Find all `.log` files in a directory.
- [ ] Read a JSON configuration file.
- [ ] Read a YAML configuration file.
- [ ] Write a script with `argparse` arguments.
- [ ] Call a public test API and handle timeouts.
- [ ] Write unit tests for a utility function.
- [ ] Create a timestamped backup archive.

### DevOps-focused

- [ ] Report CPU, memory, and disk usage.
- [ ] Check a list of service health endpoints.
- [ ] Check whether a TCP port is reachable.
- [ ] Validate required environment variables before deployment.
- [ ] Parse errors from an application log.
- [ ] Write an AWS script that reports the current identity.
- [ ] List EC2 instances across a chosen region.
- [ ] Build a read-only inventory report for S3 buckets.
- [ ] Add logging, input validation, and meaningful exit codes to a script.
- [ ] Run a Python test suite in a CI pipeline.

## 31. Interview Revision Questions

### 1. What is Python scripting?

Using Python programs to automate tasks such as file processing, system checks, API calls, and cloud operations.

### 2. Why is Python useful in DevOps?

It has readable syntax and libraries for APIs, configuration files, testing, system automation, and cloud SDKs.

### 3. What is the difference between a list and a tuple?

A list is mutable; a tuple is immutable. Both are ordered collections.

### 4. What is a dictionary?

A mapping that stores key-value pairs, such as `{"environment": "dev"}`.

### 5. What is a virtual environment?

An isolated Python environment that keeps a project's installed packages separate from other projects.

### 6. Why use `with open()`?

It manages the file context and closes the file automatically when the block exits.

### 7. What is exception handling?

Using constructs such as `try`, `except`, `else`, and `finally` to handle errors and cleanup.

### 8. What is the purpose of `subprocess`?

It lets Python launch and interact with external programs and system commands.

### 9. Why avoid `shell=True` with untrusted input?

Interpolating untrusted input into shell commands can allow command injection. Prefer argument lists.

### 10. What is logging?

A standard way to record diagnostic messages with severity levels and timestamps.

### 11. What is JSON used for?

Exchanging structured data between applications and APIs, and storing configuration.

### 12. Why use `yaml.safe_load()`?

It loads ordinary YAML data without enabling arbitrary Python object construction from untrusted YAML.

### 13. What is an API health check?

A request to an endpoint to determine whether it responds as expected; a successful HTTP response alone may not prove all dependencies are healthy.

### 14. What is Boto3?

The AWS SDK for Python, used to interact with AWS services programmatically.

### 15. What is idempotency in automation?

An operation is idempotent when repeating it produces the same intended state rather than creating unintended additional changes.

### 16. How should scripts handle secrets?

Avoid hard-coding and committing secrets; use an approved secret store, IAM roles, or secure credential mechanisms.

### 17. How can a Python script be used in CI/CD?

A pipeline can run scripts for validation, tests, artifact checks, API checks, and approved deployment tasks.

### 18. Why add timeouts to network calls?

Timeouts prevent a script from waiting indefinitely when a server or network is unresponsive.

### 19. What is the difference between `json.load()` and `json.loads()`?

`json.load()` reads JSON from a file-like object; `json.loads()` parses a JSON string.

### 20. How do you debug a failed automation script?

Reproduce the issue, inspect the traceback and logs, verify inputs and permissions, check external dependencies, and add tests for the failure case.

## 32. Useful Commands

| Task | Command |
|---|---|
| Check Python | `python3 --version` |
| Run a script | `python3 script.py` |
| Start interpreter | `python3` |
| Create venv | `python3 -m venv .venv` |
| Activate venv (Linux/macOS) | `source .venv/bin/activate` |
| Install a package | `python -m pip install requests` |
| Install dependencies | `python -m pip install -r requirements.txt` |
| List installed packages | `python -m pip list` |
| Export dependencies | `python -m pip freeze > requirements.txt` |
| Run unittest discovery | `python3 -m unittest -v` |
| Get help | `python3 script.py --help` |
| Exit venv | `deactivate` |

---

## Suggested Learning Order

1. Variables, data types, operators, and conditions.
2. Loops, collections, strings, and functions.
3. Files, exceptions, modules, and paths.
4. Environment variables, `subprocess`, and logging.
5. JSON, YAML, regular expressions, and dates.
6. APIs, command-line arguments, virtual environments, and testing.
7. System health, log analysis, backups, and endpoint checks.
8. Boto3 and read-only AWS inventory scripts.
9. CI/CD integration, security, testing, and maintainability.

## References

- [Official Python Tutorial](https://docs.python.org/3/tutorial/)
- [Python Standard Library](https://docs.python.org/3/library/)
- [Python `subprocess` Documentation](https://docs.python.org/3/library/subprocess.html)
- [Python `logging` Documentation](https://docs.python.org/3/library/logging.html)
- [Requests Documentation](https://requests.readthedocs.io/)
- [PyYAML Documentation](https://pyyaml.org/wiki/PyYAMLDocumentation)
- [Boto3 Documentation](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)

---

**Keep practicing:** Start with small scripts, test them safely, and gradually add error handling, logging, tests, and cloud automation.
