================================================================================
SOC INCIDENT TRIAGE & PHISHING ANALYSIS: CASE NOTES & INVESTIGATION BOOK
Analyst: Amadou Barry
Repository: Phishing-Incident-Triage-Lab
Method: Inbound Email Security Alert Triage & SIEM Log Correlation
================================================================================

/*
--------------------------------------------------------------------------------
1. ALERT ASSESSMENT: INITIAL INBOUND EMAIL TRIAGE (Case #8814 - False Positive)
--------------------------------------------------------------------------------
* Context: Alert triggered for an external email containing a link from "hrconnex.thm".
* Triage Workflow: 
  - Queried mail server logs for external sender headers.
  - Cross-referenced internal communications and discovered a verified third-party 
    onboarding partnership with the sending organization.
  - Confirmed the payload and links were benign and verified by internal business units.
* Resolution: Classified as a False Positive (FP). Closed ticket with documented 
  justification to prevent unnecessary alert fatigue.
--------------------------------------------------------------------------------
*/


/*
--------------------------------------------------------------------------------
2. ALERT ASSESSMENT: SUSPICIOUS URL & REDIRECT SERVICE (Case #8815 - True Positive)
--------------------------------------------------------------------------------
* Context: Alert triggered for an outbound click to a URL shortener / redirect service.
* Triage Workflow:
  - Checked proxy and web gateway logs to trace endpoint connection history.
  - Ran reputation checks on destination indicators of compromise (IOCs).
  - Confirmed the user successfully navigated to a malicious landing page designed 
    for credential harvesting.
* Resolution: Classified as a True Positive (TP). Escalated case, triggered endpoint 
  isolation protocol, and logged IOCs for firewall blacklisting.
--------------------------------------------------------------------------------
*/


/*
--------------------------------------------------------------------------------
3. ALERT ASSESSMENT: LOOK-ALIKE DOMAIN & CREDENTIAL THEFT (Case #8816 - True Positive)
--------------------------------------------------------------------------------
* Context: Inbound email mimicking an enterprise software provider support ticket 
  (e.g., "no-reply@m1crosoftsupport.co") utilizing psychological urgency.
* Triage Workflow:
  - Analyzed sender SPF/DKIM/DMARC headers; noticed authentication failures.
  - Checked firewall and web proxy logs for downstream traffic.
  - Verified that the corporate firewall successfully blocked the outbound 
    connection attempt before user interaction.
* Resolution: Classified as a True Positive (TP) mitigated by preventive controls. 
  Documented block-rule efficacy and updated global domain blocklists.
--------------------------------------------------------------------------------
