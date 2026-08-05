# Writing Contract (AUTO-APPLY)

One file. Every AI tool reads the same rules. Edit here; the change reaches all tools.

---

## Audience Calibration (AUTO-APPLY)

Before drafting anything, answer these three questions:

1. Who reads this? Name the person or role — not the group.
2. What decision or action do they need to take after reading?
3. What do they already know? Start after that point.

Write to the answer. Not to completeness.

If the same message reaches multiple audiences, structure it in layers.
The most senior reader's need goes in the first two sentences.
Detail for working teams goes last.
@~/.agents/policies/stakeholder-update.md

When the audience is a customer, remove every internal reference —
project names, team names, ticket numbers, org structure — unless the
customer specifically tracks them.
@~/.agents/policies/customer-communication.md

When the audience is a leader or executive, lead with the decision or
risk. Never build to the point.
@~/.agents/policies/executive-update.md

---

## First-Principles Reasoning (AUTO-APPLY)

Before proposing or writing anything:

1. State the outcome in plain language. Name who benefits and how.
2. List verified facts separately from assumptions.
3. Find the smallest structure that delivers the outcome.
4. For every added section or control, name the failure it prevents.
5. Treat existing patterns as evidence, not authority — check that their assumptions fit this problem.
6. When scope or audience is unknown, prefer a short reversible draft over a complete document.
7. Name the signal that would justify adding the next layer of detail.

---

## Writing for Humans (AUTO-APPLY)

Default to less, simpler, sooner.

Send-test: would a non-expert get the main point from a 30-second skim?

- Open with the change and the problem it solves — not with background.
- Name the actor. Write "the checker blocks the request", not "the request is blocked".
- One term per concept. Pick it early and keep it.
- Sentences under 20 words when practical.
- One topic per paragraph.
- Active voice throughout.

---

## Two-Sentence Opening (AUTO-APPLY)

For any document, post, or message longer than three paragraphs:

- Sentence 1: state the change in plain language and name the pain it removes.
- Sentence 2: state what the reader will understand after reading.

Do not use internal project names. Do not make sentence 2 a deadline or request.

---

## Simplified Technical English (AUTO-APPLY)

Apply ASD-STE100-style rules to all human-facing technical content:

- Use common words. Avoid jargon when a plain word works.
- Introduce a technical term only when it adds precision the plain word lacks.
- Define the term before the reader needs it.
- One term per concept — do not vary the name for style.
- Sentences 20 words or fewer when practical.
- Active voice. Name the system or person that acts.
- One topic per paragraph.

These rules remove colloquialisms, decorative language, and synonym variation.
They produce output that translates cleanly and reads the same on every re-read.

---

## Scannable Output (AUTO-APPLY)

Assume the reader is busy, distracted, or skimming. Structure output so the most
important information survives a partial read.

- Lead with the answer or decision. Put context after, not before.
- Use a heading for every major topic shift. Make the heading state the point,
  not just label the section.
- Bold the single most important term or number per paragraph. One bold item max.
- Bullet lists for three or more parallel items. Prose for fewer than three.
- Keep bullet items parallel in structure. Start each with the same part of speech.
- Break any paragraph longer than four sentences into two paragraphs.
- Put the action or next step last in the message, not buried in the middle.
- Never bury a blocker, risk, or open question inside a paragraph. Surface it
  as a standalone bullet or callout.

Apply this rule to Slack messages, PR descriptions, design docs, and any response
longer than three paragraphs.

---

## Length Limits by Surface (AUTO-APPLY)

Match length to the surface. Treat these as ceilings, not targets.

Slack post
  200 words or fewer. One paragraph per topic. Two topics at most.

Pull request description
  One paragraph: what changed and why. Follow with the test plan.

Work item or ticket
  Two or three sentences on the problem. Two or three on the fix.

Design document or incident review
  Two-sentence reader takeaway first. Supporting detail follows.

---

## Preserve Facts During Editing (AUTO-APPLY)

Edit the language. Do not change the meaning.

Preserve without alteration:
- Technical claims and decision boundaries
- Proposed versus deployed status
- Uncertainty markers and caveats
- Names, dates, owners, identifiers, and numbers
- Formulas, citations, tables, and diagram relationships
- Security controls, acceptance gates, and blockers

Unsafe edit — changes the meaning:
  Draft: The service will block the request after Phase 1 is complete.
  Edit:  The service blocks the request.

Safe edit — improves clarity without changing the meaning:
  Draft: The service will block the request after Phase 1 is complete.
  Edit:  After Phase 1, the service will block the request.

---

## Rule Lifecycle

Add a permanent rule only after you can name all four:

1. The failure it prevents
2. Evidence the failure repeats
3. A test that detects the failure
4. The condition for removing or narrowing the rule

Choosing the right change:

Tweak — the rule has the right goal but gives weak guidance.
  Before: Keep sentences short.
  After:  Keep sentences to 20 words or fewer when practical.

Addition — a repeated failure has no existing rule.
  Add the smallest rule that detects and prevents that failure.
  Route it to a policy or domain file instead of loading every session.

Correction — a rule is wrong, too broad, or makes output worse.
  Before: Remove headings.
  After:  Remove headings that only announce the text below them.

When a rule change fixes one failure but introduces another, revise it.
Do not add a second rule to hide a bad one.

---

## Change the Narrowest Rule

Do not copy a shared change into every tool's config. Edit the file that owns the scope.

Every tool needs it        → edit ~/.agents/AGENTS.md
One kind of task needs it  → edit a file under ~/.agents/policies/ or ~/.agents/domains/
One tool needs it          → edit that tool's own config
One repo needs it          → edit that repo's instructions

---

## Promoting a Correction to a Test

A correction is worth keeping when it names the failure, the replacement, and the check.

Observed failure
  Describe the bad output in one sentence.

Rule
  State the replacement behaviour. One or two sentences.

Test
  One observable check a reader can perform in under 30 seconds.

Escalation
  Where to put extra detail that does not belong in the parent message.
