# Feature: hello

## Description

A minimal example of a marketplace node and pipeline. The user starts the pipeline with a name; it produces the greeting "Привет {name}", keeps a copy for the user on their machine and shows the greeting in the run. It demonstrates a launch-time parameter and ordinary access to the user's files.

## Business Rules

| # | Rule | Priority |
|---|------|----------|
| BR-1 | The greeting is the text "Привет" followed by a space and the supplied name. | MUST |
| BR-2 | The name comes from a parameter given when the pipeline is launched (CLI or dashboard). | MUST |
| BR-3 | The greeting is saved as a text file in the user's Vesslet folder; each run replaces the previous greeting. | MUST |
| BR-4 | The greeting is also returned as the run's result, so it is visible in the dashboard timeline and not only on disk. | MUST |
| BR-5 | If no name is supplied, the run still succeeds and the greeting contains an empty name. [ASSUMED] | SHOULD |
| BR-6 | The pipeline runs the greeting step exactly once, between its start and end steps. | MUST |
| BR-7 | The greeting step runs without asking the user for approval. [ASSUMED] | MAY |

## Use Cases

### UC-1: Greet by name
**Actor:** Pipeline user
1. The user launches the `hello` pipeline with a name.
2. The pipeline produces "Привет {name}".
3. The greeting is saved to the user's Vesslet folder and shown in the run timeline.

**Result:** the user sees the greeting in the run and finds it in the file.

### UC-2: Launch without a name
**Actor:** Pipeline user
1. The user launches the pipeline without a name.
2. The run completes with the greeting "Привет " (empty name).

**Result:** run succeeds; greeting has no name.

## Acceptance Criteria

- AC-1: Launching with name=Мир produces the greeting "Привет Мир" in the run timeline. (BR-1, BR-2, BR-4)
- AC-2: After the run, the Vesslet folder contains a text file with "Привет Мир". (BR-3)
- AC-3: A second run with another name leaves only the new greeting in the file. (BR-3)
- AC-4: Launching without a name completes successfully with an empty name in the greeting. (BR-5)
- AC-5: The run goes start → hello → end, and the hello step executes once. (BR-6)

## Uncertainties

- [NEEDS CLARIFICATION] The greeting word and its language are hardcoded in Russian; should it be configurable?
- [NEEDS CLARIFICATION] Names containing quotes or special characters: expected greeting is not defined.
- [ASSUMED] Missing name is acceptable rather than an error (BR-5).
