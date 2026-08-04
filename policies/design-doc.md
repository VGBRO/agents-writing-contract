# Design Document Writing Policy

Route here from AGENTS.md when writing design docs or incident reviews.

## Structure

Opening (two sentences, required)
  Sentence 1: state the change and the problem it removes.
  Sentence 2: state what the reader will understand after reading.

Body sections
  One topic per section. Lead each section with the conclusion.
  Supporting detail follows. A reader who stops after the first sentence should still have the answer.

## Limits

Opening: two sentences exactly.
Each section: under 150 words before escalating to a linked appendix.

## Fact preservation

Do not soften or sharpen status claims during editing.
Proposed is not the same as approved. Will is not the same as does.
Keep uncertainty markers: "expected", "pending", "not yet measured".

## What to avoid

- An abstract or executive summary that repeats the opening.
- Section headings that only announce what follows ("Background", "Overview").
  Replace with a heading that states the point ("Why the current design fails under load").
- Passive voice for decisions. Name who decided and when.
