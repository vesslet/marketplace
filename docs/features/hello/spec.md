# Hello — Specification

## Goal

Provide a minimal example of a marketplace node and pipeline: a user supplies a name at launch and receives a greeting for that name. The example shows how a launch-time parameter reaches a node and how a node returns a result.

## Business Rules

| ID | Priority | Rule |
|----|----------|------|
| BR-1 | MUST | The feature accepts one launch-time input, a name, and produces a greeting for that name. |
| BR-2 | MUST | The greeting is the Russian word "Привет" followed by a space and the name. [ASSUMED] The language and wording are fixed. [NEEDS CLARIFICATION] Should the greeting language be configurable? |
| BR-3 | MUST | The greeting is returned as the node's result, so it is visible in the run timeline. |
| BR-4 | SHOULD | The greeting is also kept as a persistent record in the user's Vesslet home area, where each run replaces the previous greeting. |
| BR-5 | SHOULD | If no name is supplied, the run still succeeds and greets an empty name ("Привет "). [ASSUMED] |
| BR-6 | MUST | The pipeline runs the greeting step once, between a start and an end step, and finishes after it. |
| BR-7 | MAY | The node is a global example: it runs without asking the user for approval. |

## Use Cases

### UC-1: Greet a user at launch
**Actor:** User launching the pipeline.
**Flow:**
1. The user launches the pipeline with a name.
2. The greeting step produces "Привет {name}".
3. The greeting appears in the run results and is recorded in the user's Vesslet home area.
4. The pipeline finishes.

**Constraints:** BR-1, BR-2, BR-3, BR-4, BR-6.

### UC-2: Launch without a name
**Actor:** User launching the pipeline.
**Flow:**
1. The user launches the pipeline without a name.
2. The run succeeds with the greeting for an empty name.

**Constraints:** BR-5.

## Acceptance Criteria

- AC-1: Launching with name "Анна" returns greeting "Привет Анна" in the run results. (BR-1, BR-2, BR-3)
- AC-2: After a run, the user's Vesslet home area holds that same greeting. (BR-4)
- AC-3: A second run with another name replaces the stored greeting. (BR-4)
- AC-4: Launching without a name completes successfully. (BR-5)
- AC-5: The pipeline passes through start, greeting and end in that order. (BR-6)

## Uncertainties

- Greeting language and wording are fixed in the example; whether this is intended is unconfirmed (BR-2).
- No feature map exists in the repository; the whole repository was treated as a single feature, "hello".
