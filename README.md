# agents-writing-contract

One `AGENTS.md` file gives every AI coding tool the same writing rules. Claude Code, Codex, and OpenCode each read it automatically. Edit once — the change reaches all tools.

## The problem

Each AI tool gets writing guidance in a different config file. You end up maintaining three copies of the same rules. They drift. The tools produce inconsistent output for the same request.

## The solution

One source of truth at `~/.agents/AGENTS.md`. Claude Code imports it. Codex and OpenCode pick it up through symlinks at their normal paths.

```
~/.agents/AGENTS.md          ← edit here
        |
        +-- imported by ~/.claude/CLAUDE.md     (Claude Code)
        +-- symlinked at ~/.codex/AGENTS.md     (Codex)
        +-- symlinked at ~/.config/opencode/AGENTS.md  (OpenCode)
```

The narrower rule wins. A repo-level `CLAUDE.md` overrides the shared file for that repo. The shared file handles everything else.

## Install

```bash
git clone https://github.com/VGBRO/agents-writing-contract
cd agents-writing-contract
chmod +x setup.sh
./setup.sh
```

`setup.sh` is safe to re-run. It never overwrites an existing file or symlink.

## What's in AGENTS.md

| Block | What it does |
|-------|-------------|
| First-Principles Reasoning | Forces outcome-first thinking before any draft |
| Writing for Humans | Defines what "clear" and "human" actually mean |
| Two-Sentence Opening | Required opener for any doc longer than three paragraphs |
| Simplified Technical English | Word-level rules: active voice, one term per concept, 20-word sentences |
| Length Limits by Surface | Ceilings for Slack, PRs, work items, design docs |
| Scannable Output | Lead with the answer, bold one key item, surface blockers explicitly |
| Preserve Facts During Editing | Stops edits from softening or sharpening status and certainty |
| Rule Lifecycle | When to add, tweak, or remove a rule |
| Change the Narrowest Rule | Which file to edit depending on scope |
| Promoting a Correction to a Test | How to turn a one-off fix into a permanent rule |

## Policies

Surface-specific rules live in `policies/` and are routed from `AGENTS.md` when needed. They stay out of the shared file so every session does not load them.

| File | Coverage |
|------|---------|
| `policies/slack.md` | Slack post and thread limits |
| `policies/pull-request.md` | PR description structure |
| `policies/design-doc.md` | Design docs and incident reviews |

## Adding a rule

Only add a permanent rule when you can name all four:

1. The failure it prevents
2. Evidence the failure repeats
3. A test that detects the failure
4. The condition for removing or narrowing the rule

A rule with a repeatable test is easier to trust, teach, and remove.

## Verify the setup

```bash
# Check symlinks resolve to the shared file
readlink ~/.codex/AGENTS.md
readlink ~/.config/opencode/AGENTS.md

# Check Claude Code import is present
grep '@~/.agents/AGENTS.md' ~/.claude/CLAUDE.md

# Check content matches
cmp ~/.agents/AGENTS.md ~/.codex/AGENTS.md
cmp ~/.agents/AGENTS.md ~/.config/opencode/AGENTS.md
```

## License

MIT
