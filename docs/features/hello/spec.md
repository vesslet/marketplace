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
| BR-7 | The run reports success even when the local copy could not be saved (for example, the Vesslet data location does not exist); the greeting is still returned. [ASSUMED] | SHOULD |

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

### Edge cases (observed in the code)

- A name containing an apostrophe (e.g. `O'Brien`) or a line break: the local copy is written (replacing the previous one), but the greeting step fails and returns no `greeting` result. The spec does not allow this — see Uncertainties.
- A `name` supplied as `null` produces "Привет None".

## Acceptance Criteria

- [ ] AC-1: Launching with `name=Анна` yields the result `greeting` = "Привет Анна" (BR-1, BR-2, BR-3).
- [ ] AC-2: After a run, the local saved greeting is the single line "Привет Анна" (BR-4).
- [ ] AC-3: A second run with another name replaces the previously saved greeting (BR-4).
- [ ] AC-4: Launching without a name completes successfully with the greeting "Привет " (BR-5).
- [ ] AC-5: The pipeline run goes start → greeting → end and completes (BR-6).
- [ ] AC-6: When the Vesslet data location does not exist, the run still completes with `greeting` = "Привет {name}" and no local copy is saved (BR-7).

## Uncertainties

- [ASSUMED] BR-5: behavior without a name is not a deliberate decision; it follows from the implementation.
- [NEEDS CLARIFICATION] The fixed Russian wording "Привет" — should the language be configurable?
- [ASSUMED] BR-7: success despite a failed local save follows from the implementation (the write error is not checked); it is not a stated decision.
- [NEEDS CLARIFICATION] Names with an apostrophe or a line break make the greeting step fail, while UC-1 implies any name works. Is this a defect to fix in `nodes/hello/run.sh`, or should names be restricted?
- [NEEDS CLARIFICATION] Should a `null` name give "Привет " like a missing name (BR-5), instead of "Привет None"?
- Gap: `arch.md` and `test.md` for this feature do not exist, and the repository has no automated tests, so no rule is covered by a test.

<!-- synced: 2026-10-23 -->
