# Safety Boundaries

## This Skill Is For

- local browser profile routing
- CDP port assignment
- authenticated browser workflow setup
- multi-business session isolation
- public-safe documentation of the pattern

## This Skill Is Not For

- password extraction
- cookie dumping
- secret harvesting
- syncing browser profiles into git
- publishing real profile folders
- sharing human browsing state between unrelated businesses

## Never Publish

- `Local State`
- `Login Data`
- `Cookies`
- `Web Data`
- copied profile folders
- real email addresses
- real account handles that are not already public
- browser session exports
- screenshots that expose private tabs or account state

## Safe Public Repo Content

Allowed:

- `SKILL.md`
- generic launch scripts with placeholders
- example JSON mappings with fake business names
- workflow notes and safety rules
- `.gitignore`
- `LICENSE`

Not allowed:

- raw Chrome support files
- real user profile names if sensitive
- real disk paths tied to a person or machine unless intentionally public
- anything that would recreate or expose live session state

## Safe Language

Prefer wording like:

- "reuse existing local authenticated browser state"
- "attach automation to a local Chrome profile"
- "keep profile data local-only"

Avoid wording like:

- "extract passwords"
- "dump cookies"
- "pull saved credentials"

## Multi-Business Hygiene

To reduce cross-account mistakes:

1. keep one profile per business whenever possible
2. keep one port per profile
3. verify the visible account before any write action
4. avoid mixing personal browsing with business automation
5. use dedicated automation profiles for long-term repeatable workflows

