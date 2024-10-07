# Tenderduty Custom i.e. Tenderdutory (for Story Validators)

This is a customized version of the **Tenderdutory** third-party tool, designed specifically for monitoring validator signing activities within the **STORY ecosystem**. The project provides enhanced monitoring capabilities to help validator operators maintain their nodes effectively and prevent potential issues like slashing due to missed signatures.

## Overview

**Tenderdutory** is a monitoring tool tailored for validator nodes in the COSMOS ecosystem. Its primary role is to monitor validators' signing behavior, alert operators to any issues, and help prevent penalties such as slashing. This repository contains a customized version of the tool with additional features and configurations suited for specific validator needs.

### Key Features:

1. **Validator Signing Monitoring**:

   - Real-time tracking of validator nodes' signing behavior within the STORY ecosystem.
   - Detects when a validator misses a block signing opportunity.

2. **Slashing Prevention**:

   - Notifies operators immediately if the validator fails to sign a block, helping to prevent slashing penalties.
   - Critical for maintaining validator uptime and participation in block production.

3. **Hex Address <> Moniker Matching**:
   - Continuously collects data from validator team members, including hex addresses, peers, network information, and monikers.
   - Based on this information, the code has been modified to allow easier identification of nodes by their moniker, instead of using only hex addresses.
   - This modification enables teams to quickly and easily monitor the status of their nodes, improving operational efficiency.

## Use Case

This custom version of **Tenderdutory** is especially useful for:

- Validator operators within the STORY ecosystem who want to ensure their nodes are participating in block signing without missing opportunities.
- Teams aiming to reduce the risk of slashing by proactively monitoring validator performance.
- Network administrators who need a reliable tool to monitor the health and performance of validator nodes in real-time.

```bash
git clone https://github.com/choihocheol/tenderduty-custom.git
cd tenderduty-custom
git checkout for-story
go install

tenderduty
```

For more information, visit the [original Tenderduty project](https://github.com/blockpane/tenderduty) for additional context and features.
