<p align="center">
  <a href="#"><img title="Open Source" src="https://img.shields.io/badge/Open%20Source-%E2%9D%A4-green?style=for-the-badge"></a>
  <a href="https://www.python.org/"><img title="Python" src="https://img.shields.io/badge/Python-3.9%2B-blue?style=for-the-badge"></a>
  <a href="https://github.com/iamunixtz/BugLazy/stargazers"><img title="Stars" src="https://img.shields.io/github/stars/iamunixtz/BUgLazy?style=for-the-badge"></a>
  <a href="https://github.com/iamunixtz/BugLazy/issues"><img title="Total Issues" src="https://img.shields.io/github/issues/iamunixtz/BugLazy?style=for-the-badge"></a>
</p>

BugLazy is an A beginners friendly, Automated BugHunting Recon tool 

```
 _____         __                
| __  |_ _ ___|  |   ___ ___ _ _ 
| __ -| | | . |  |__| .'|- _| | |
|_____|___|_  |_____|__,|___|_|
          |___|             |___|   v1.0   by bughunter

usage: Buglazy.py [-h] (-d DOMAIN | -l LIST)

Automated bug hunting tool

options:
  -h, --help           show this help message and exit
  -d, --domain DOMAIN  Single domain to scan
  -l, --list LIST      File containing list of domains

```


## Features

| Feature                         | Description                                                                                                                                                     |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Subdomain Hunting**           | Uses tools like **subdominator** to enumerate subdomains from a target domain or a list of domains.                                                               |
| **Live Domain Detection**       | Leverages **httpx-toolkit** to identify active subdomains from the discovered list.                                                                              |
| **URL Crawling**                | Utilizes **katana** to crawl live URLs for deeper analysis.                                                                                                      |
| **JavaScript Analysis**         | Extracts JavaScript file URLs and uses **jsninja** to hunt for secrets and API keys within those files.                                                            |
| **Parameter Hunting (New Era)** | Automatically extracts potential XSS and SQLi parameters from live URLs using modern filtering tools (e.g., **gf**).                                                 |
| **Parameter Hunting (Old School)** | Collects historical URLs using **gau**, then filters and analyzes them for vulnerabilities using traditional techniques.                                         |
| **Comprehensive Reporting**     | Provides summary counts for subdomains, alive hosts, URLs, and parameters found during the scan, ensuring you have an overview of the target’s exposure.       |



## Installation
```bash
git clone https://github.com/iamunixtz/BugLazy.git
cd BugLazy
chmod +x installer.sh
./installer.sh
sudo cp bulazy /usr/local/bin
chmod +x /usr/local/bin
buglazy -h
```

