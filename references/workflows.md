# Workflows

## Purpose

This reference explains how to use local Chrome profiles as the authenticated browser layer for OpenClaw or other CDP-driven workflows across multiple businesses.

The key pattern is simple:

- one business
- one Chrome profile
- one debug port
- one clear workflow purpose

## Why This Pattern Works

Using a local Chrome profile lets the browser carry the authenticated session.

That means:

- the workflow can operate inside the signed-in browser
- credentials do not need to be pasted into prompts or scripts
- each business can stay isolated in its own local browser state

It does not mean:

- passwords are extracted
- cookies should be copied around
- profile folders are safe to publish

## Recommended Operating Model

### Option A: Dedicated automation profiles

Best for long-term multi-business use.

- create one local Chrome profile per business
- keep each profile focused on one brand or company
- assign one stable CDP port per profile
- use those profiles only for approved workflow sites

Example mapping:

| Business | Profile Label | CDP Port | Start URL | Notes |
|---|---|---:|---|---|
| business-a | Profile BusinessA | 18810 | `https://example-a.com/login` | Dedicated automation profile |
| business-b | Profile BusinessB | 18811 | `https://example-b.com/login` | Separate cookies and tabs |
| business-c | Profile BusinessC | 18812 | `https://example-c.com/login` | Use only for this business |

### Option B: Approved reuse of an existing local profile

Use this only when explicitly approved.

- connect automation to an already existing local profile
- confirm the signed-in account is the correct one
- avoid touching unrelated tabs or sites
- do not rename or publish the real profile identifier in public docs

## Generic Launch Command

macOS example:

```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  "--remote-debugging-port=18810" \
  "--remote-allow-origins=*" \
  "--user-data-dir=/path/to/chrome-user-data" \
  "--profile-directory=Profile BusinessA" \
  --no-first-run \
  --disable-default-apps \
  --new-window "https://example-a.com/login"
```

Notes:

- `user-data-dir` is the Chrome data root that contains profiles
- `profile-directory` is the specific local profile folder name
- the debug port must be unique per running browser session

## How OpenClaw Uses This

OpenClaw or any CDP-aware browser workflow can:

1. connect to the local debug port
2. inspect the list of open tabs
3. choose the target logged-in tab
4. automate actions inside that browser session

This lets the browser own the session state while the automation owns the workflow steps.

## Multi-Business Routing Rules

Use these routing rules to prevent account mix-ups:

1. Never share one profile across unrelated businesses unless explicitly approved.
2. Reserve a stable port per profile.
3. Keep a local-only mapping file for business, profile, port, and purpose.
4. Verify the active account after launch before running any action.
5. Shut down or separate sessions if the wrong account appears.

## Verification Checklist

Before running automation:

- correct business selected
- correct profile selected
- correct port selected
- correct site open
- correct logged-in account visible
- no unrelated sensitive tabs in scope

## Public Documentation Rule

If the workflow is being turned into a public skill or public guide:

- replace real profile names with placeholders
- replace real ports with example ports if needed
- replace real paths with generic paths
- describe the pattern, not the actual private browser state

