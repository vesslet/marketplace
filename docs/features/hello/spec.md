# Feature: hello — Greeting example

## Description
A minimal example that shows how a run-time parameter reaches a node and how a node produces a result. Given a person's name, it produces a Russian-language greeting for that person.

## Business Rules

- **BR-1 (MUST)** The greeting is the word "Привет" followed by a space and the supplied name.
- **BR-2 (MUST)** The name is supplied by the user when the run is launched.
- **BR-3 (MUST)** The greeting is available as a result of the run, visible in the run's progress view.
- **BR-4 (SHOULD)** The greeting is also left in a place on the user's machine under the platform's home folder, so it can be seen outside the run. The latest run replaces the previous greeting. [ASSUMED: purpose is to demonstrate that nodes have ordinary file access]
- **BR-5 (SHOULD)** When no name is supplied, the run still completes and the greeting contains an empty name. [ASSUMED]
- **BR-6 (MAY)** The feature is delivered as a ready pipeline that starts, greets, and ends, so it can be launched as is.

## Use Cases

### UC-1: Greet a named person
**Actor:** User
1. The user launches the hello pipeline with a name, e.g. "Анна".
2. The run completes.
3. The user sees "Привет Анна" in the run results and in the saved greeting.

### UC-2: Launch without a name
**Actor:** User
1. The user launches the pipeline without a name.
2. The run completes with the greeting "Привет " (empty name).

## Acceptance Criteria

- AC-1: Launching with name "Анна" yields the greeting "Привет Анна" (BR-1, BR-2, BR-3).
- AC-2: After a successful run, the greeting is readable under the platform's home folder (BR-4).
- AC-3: Two consecutive runs with different names leave only the second greeting saved (BR-4).
- AC-4: Launching without a name completes successfully (BR-5).
- AC-5: The pipeline can be launched without any additional setup (BR-6).

## Open Questions

- [NEEDS CLARIFICATION] Should names containing quotes or special characters be supported? Currently they may break the result.
