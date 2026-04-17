---
name: openclaw-local-chrome-profile
description: Safely reuse local Google Chrome profiles for authenticated OpenClaw browser workflows, CDP port mapping, and multi-business profile isolation without exporting passwords, cookies, or private session data.
---

# OpenClaw Local Chrome Profile

Use this skill when the task involves:

- connecting OpenClaw or CDP browser automation to a local Chrome profile
- reusing existing logged-in browser state for a workflow
- assigning Chrome profiles and ports across multiple businesses
- documenting a safe profile-to-business mapping
- launching Chrome with a dedicated local profile for authenticated automation

Do not use this skill to extract passwords, dump cookies, export secrets, or publish private browser data.

## What This Skill Does

- explains how to point OpenClaw-style browser automation at a local Chrome profile
- standardizes one profile and one debug port per business workflow
- helps keep business accounts isolated from each other
- uses the browser's existing local login state instead of hardcoding credentials

## What This Skill Does Not Do

- it does not read or export saved passwords
- it does not copy cookies into code or text files
- it does not publish `Local State`, `Cookies`, `Login Data`, or profile folders
- it does not merge multiple businesses into one shared browser profile
- it does not assume a real profile should be committed, synced, or uploaded anywhere

## Core Rules

1. Prefer one dedicated Chrome profile per business.
2. Prefer one dedicated CDP port per business.
3. Treat the browser profile as local-only sensitive state.
4. Never commit raw profile data or profile copies to git.
5. If a human profile is reused, do it only with explicit approval and avoid changing unrelated tabs or accounts.
6. When publishing docs, replace all real business names, profile names, paths, emails, and ports with placeholders unless they are already intentionally public.

## Default Workflow

1. Identify the target business, site, and purpose.
2. Choose a dedicated local Chrome profile for that business.
3. Assign a unique remote debugging port.
4. Launch Chrome with that profile and port.
5. Verify the browser session is logged into the intended account.
6. Attach OpenClaw or CDP automation to that browser session.
7. Keep the mapping documented in a local-only profile map, not in public repo secrets.

## Launch Pattern

For reusable launch conventions and profile mapping patterns, read [references/workflows.md](references/workflows.md).

For privacy, publishing, and boundary rules, read [references/safety-boundaries.md](references/safety-boundaries.md).

For a sanitized example mapping file, read [examples/profile-map.example.json](examples/profile-map.example.json).

For a generic macOS launcher, use [scripts/launch-profile.sh](scripts/launch-profile.sh).

## Output Expectations

When using this skill, produce:

- a clear business-to-profile-to-port mapping
- launch commands with placeholders or approved local values
- a safety note explaining what remains local-only
- workflow instructions that avoid exposing credentials or session artifacts

