# Personal Scripts

Collection of penetration testing and red team automation scripts for security assessments.

## Scripts

### `build.sh`
Automated installer for Red Team / Pentesting tools on Parrot OS / Kali Linux.

**Installs:**
- C2 Frameworks: Sliver, Viper, Havoc
- Active Directory: Impacket, NetExec, BloodHound, Mimikatz, PowerSploit, Kerbrute
- Reconnaissance: Subfinder, Httpx, Nuclei, Katana, Naabu, Gau, Waybackurls
- Web Application: SQLMap, Commix, XSStrike, Dalfox, Wfuzz, Ffuf
- Cloud Security: ScoutSuite, Prowler, Trivy
- Wordlists: SecLists, Probable-Wordlists, FuzzDB
- Utilities: Gowitness, Chisel, Feroxbuster, Metasploit modules

### `http.sh`
Simple Python HTTP server for file transfer during engagements.

```bash
python3 -m http.server 80
