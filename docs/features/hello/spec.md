# Feature: hello

## Description

An example feature that demonstrates a launch-time parameter and ordinary local file access. Given a name, it produces the greeting "Привет {name}", records it on the local machine and makes it visible as a result of the run.

## Business Rules

| # | Rule | Priority |
|---|------|----------|
| BR-1 | The greeting is the word "Привет", a space, then the supplied name. | MUST |
| BR-2 | The name is taken from the `name` parameter provided at launch. | MUST |
| BR-3 | The greeting is returned as the run's `greeting` result, so it is visible in the run's timeline. | MUST |
| BR-4 | A copy of the greeting is saved on the local machine in the user's Vesslet data location, replacing any previously saved greeting. | MUST |
| BR-5 | If no name is supplied, the greeting is produced with an empty name ("Привет ") and the run still succeeds. [ASSUMED] | SHOULD |
| BR-6 | The `hello` pipeline runs the greeting step once, between its start and end steps. | MUST |

## Use Cases

### UC-1: Greet a person
**Actor:** Platform user
**Precondition:** The `hello` pipeline is available.
**Flow:**
1. The user launches the pipeline with a `name` parameter.
2. The greeting step produces "Привет {name}".
3. The greeting is saved locally and shown as the run's `greeting` result.
**Result:** The user sees the greeting in the run and finds it saved locally.

### UC-2: Launch without a name
**Actor:** Platform user
**Precondition:** The `hello` pipeline is available.
**Flow:**
1. The user launches the pipeline without a `name` parameter.
2. The greeting step produces "Привет " with an empty name.
**Result:** The run completes successfully with the greeting for an empty name.

## Acceptance Criteria

- [ ] AC-1: Launching with `name=Анна` yields the result `greeting` = "Привет Анна" (BR-1, BR-2, BR-3).
- [ ] AC-2: After a run, the local saved greeting contains exactly "Привет Анна" (BR-4).
- [ ] AC-3: A second run with another name replaces the previously saved greeting (BR-4).
- [ ] AC-4: Launching without a name completes successfully with the greeting "Привет " (BR-5).
- [ ] AC-5: The pipeline run goes start → greeting → end and completes (BR-6).

## Uncertainties

- [ASSUMED] BR-5: behavior without a name is not a deliberate decision; it follows from the implementation.
- [NEEDS CLARIFICATION] The fixed Russian wording "Привет" — should the language be configurable?
