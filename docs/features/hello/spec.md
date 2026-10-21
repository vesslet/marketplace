# Feature: Hello greeting

## Summary

An example node and pipeline that greet a person by name. The name is supplied when a run is launched, and the greeting is made available both as run output and as a persistent record in the user's Vesslet home.

## Actors

- **Operator** — launches the pipeline and supplies the name.
- **Platform** — runs the pipeline and shows run output.

## Business Rules

| ID | Priority | Rule |
|----|----------|------|
| BR-1 | MUST | The greeting is the Russian word "Привет" followed by a space and the supplied name. |
| BR-2 | MUST | The name comes from a parameter given at launch. |
| BR-3 | SHOULD | If no name is supplied, the greeting is still produced, with an empty name. [ASSUMED] |
| BR-4 | MUST | The greeting is returned as run output so that it is visible in the run timeline. |
| BR-5 | SHOULD | The greeting is also saved in a file in the user's Vesslet home, replacing any greeting saved by an earlier run. |
| BR-6 | MAY | The pipeline runs the greeting once, between a start and an end step, with no branching. |

## Use Cases

### UC-1: Greet a person

**Actor:** Operator
**Precondition:** the hello pipeline is available.

1. The Operator launches the pipeline with a name.
2. The pipeline produces the greeting for that name.
3. The Operator sees the greeting in the run timeline and in the saved file.

**Alternative:** no name supplied → the greeting is produced with an empty name (BR-3).

## Acceptance Criteria

- AC-1: Launching with name "Анна" gives the output "Привет Анна" (BR-1, BR-2, BR-4).
- AC-2: After that run, the saved file contains "Привет Анна" (BR-5).
- AC-3: A second run with name "Иван" leaves only "Привет Иван" in the file (BR-5).
- AC-4: Launching without a name completes and gives "Привет " (BR-3).

## Open Questions

- [NEEDS CLARIFICATION] Is the fixed Russian greeting wording intended for all users, or should it be configurable?
- [NEEDS CLARIFICATION] Should a name containing quotes or special characters be handled? The current implementation may fail on them.
