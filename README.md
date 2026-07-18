# Forensic Monitor — FM Test

**Copyright (c) 2026 Thomas D. Kraemer / Kraemer Inc. All Rights Reserved.**
Licensed under the Eclipse Public License 2.0.

---

## What It Does

Forensic Monitor reads Apple's native `rapportd` and `sharingd` system daemons in real time and captures every instance of a foreign device authenticating as the owner of your Apple ID account.

Every captured event is a machine-generated, cryptographically timestamped log entry written by Apple's own software. No inference. No interpretation. The log is the evidence.

---

## Requirements

- macOS (any version supporting `log stream`)
- Terminal
- Full Disk Access granted to Terminal

**To grant Full Disk Access:**
System Settings → Privacy & Security → Full Disk Access → add Terminal

---

## How to Run

1. Download the `app` file from this repository and save it to your **Documents** folder
2. Open Terminal
3. Run:

```bash
bash ~/Documents/app
```

4. To stop: press **Ctrl+C**

---

## Output

All captured events are written to:

```
~/Documents/forensic_monitor/LIVE_STREAM.log
```

Each line is timestamped and contains the full Apple daemon output including:

- `SameAccountDevice` — foreign device authenticated as owner of your Apple ID
- `DeviceAuthTag` — device authentication tag with MAC address
- `DirectLink` — BLE proximity authentication (within 33 feet)
- `AcLv` — active service tier (Screen, Keyboard, Camera, File Sharing)
- `RPRemoteDisplayDaemon` — camera capability requests

---

## What the Output Means

A `DirectLink` entry means a physical device was within 33 feet of your Mac and authenticated as the owner of your Apple ID. This cannot happen remotely. It requires physical proximity.

An `AcLv = Screen (7)` entry means screen sharing was active on that connection.

---

## This Is a Test Release

FM Test is the capture layer only — no alerts, no dashboard, no swarm detection. The full Forensic Monitor system is available at:

**[kraemerinc.com/forensicmonitor](https://www.kraemerinc.com/forensicmonitor/)**

---

## Legal

This software is provided for forensic documentation purposes. Output constitutes self-authenticating machine-generated records under Federal Rules of Evidence 902(13) and 902(14).
