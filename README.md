# 🎣 SOC Incident Triage & Phishing Investigation Lab

## 📌 Executive Summary
This project documents a simulated Security Operations Center (SOC) tier-1 alert triage workflow using **Splunk SIEM** and open-source threat intelligence lookup tools (`TryDetectThis`). The scenario focuses on handling inbound email security alerts, analyzing suspicious URLs and sender domains, differentiating between **True Positives (TP)** and **False Positives (FP)**, and writing professional incident response reports.

---

## 🛠️ Tools & Technologies
- **SIEM / Log Analysis:** Splunk Enterprise / ELK Stack
- **Threat Intelligence:** URL/IP Reputation Lookups (`TryDetectThis`)
- **Telemetry Sources:** Inbound Mail Server Logs, Firewall / Web Proxy Logs
- **Frameworks:** MITRE ATT&CK (Initial Access via Phishing)

---

## 🔍 Investigation Workflow & Triage Methodology

### Step 1: Alert Queue Monitoring & Ownership
- **Action:** Monitored incoming security alerts (e.g., *Inbound Email Containing Suspicious External Link* and *Access to Blacklisted External URL Blocked by Firewall*).
- **Process:** Took ownership of alerts in the SIEM queue to prevent ticket duplication and initiate structured case reporting.

### Step 2: Indicator Analysis & Context Gathering
- **Sender & Domain Verification:** Queried sender email headers and domains in Splunk to check for look-alike domains (typosquatting) or unexpected external vendors.
- **Cross-Departmental Correlation:** Verified whether external third-party communications (e.g., HR partner onboarding emails like `hrconnex.thm`) were pre-approved or verified by internal business units before flagging as malicious.
- **Firewall Log Correlation:** Checked proxy and firewall logs to determine whether endpoints successfully connected to suspicious URLs or if outbound requests were successfully blocked.

---

## 📋 Case Study Scenarios Handled

| Alert ID | Alert Type / Description | Evidence & Log Findings | Classification | Remediation Action |
| :--- | :--- | :--- | :--- | :--- |
| **#8814** | Inbound Email with External Link (`hrconnex.thm`) | SIEM query showed internal HR verification email confirming legitimate third-party onboarding partnership. | **False Positive** | Closed alert; no escalation required. |
| **#8815** | Suspicious External Link & Shortener (`bit.ly`) | Reputation check flagged malicious URL; proxy logs confirmed user click attempt. | **True Positive** | Documented indicators, isolated endpoint, and issued user security reminder. |
| **#8816** | Blacklisted External URL Blocked | Microsoft look-alike domain (`no-reply@m1crosoftsupport.co`) attempting urgency/credential theft; firewall successfully blocked traffic. | **True Positive** | Confirmed firewall block rule efficacy; logged IOCs for blocking. |

---

## 💡 Key Analyst Takeaways
1. **Avoiding Alert Fatigue:** Not every alert containing "suspicious" keywords is an active breach; thorough cross-referencing with internal communications (like HR policies) prevents unnecessary business disruption.
2. **Proactive Log Correlation:** Validating firewall blocks against user click telemetry ensures that preventative controls successfully mitigated risk before escalation.
3. **Structured Reporting:** Maintaining clear, timestamped case notes and incident reports aids Tier 2/3 handoffs and audit compliance.

---

## 📁 Repository Structure
```text
├── README.md                 # Incident Triage Lab Overview & Case Notes
└── reports/                  # Sample structured SOC incident report templates
