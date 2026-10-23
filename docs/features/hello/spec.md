# Feature: hello

## Summary
An example feature that greets a person by name. The name is supplied when a run is launched; the greeting is shown in the run's results and also kept for the user as a file in their Vesslet home folder.

## Business Rules

| # | Rule | Priority |
|---|------|----------|
| BR-1 | The greeting MUST be the Russian word «Привет» followed by a space and the supplied name. | MUST |
| BR-2 | The name MUST come from the launch-time parameter `name`. | MUST |
| BR-3 | The greeting MUST be available as the run's `greeting` result, visible in the run timeline. | MUST |
| BR-4 | The greeting MUST also be stored for the user as a text file `hello.txt` in their Vesslet home folder, replacing any earlier greeting. | MUST |
| BR-5 | If no name is supplied, the greeting SHOULD still be produced, with an empty name. [ASSUMED] | SHOULD |
| BR-6 | The feature MUST be runnable as a pipeline that goes from start, through the greeting step, to end. | MUST |
| BR-7 | The greeting step MAY be run without an approval prompt, because it is installed globally rather than project-locally. | MAY |

## Use Cases

### UC-1: Greet a person
**Actor:** user launching a run
**Flow:** the user launches the `hello` pipeline with `name=Анна` → the greeting step runs → the run reports `greeting = "Привет Анна"` and the file `hello.txt` contains the same text.

### UC-2: Launch without a name
**Actor:** user launching a run
**Flow:** the user launches the pipeline without `name` → the run completes and the greeting is "Привет " (empty name). [ASSUMED]

## Acceptance Criteria

- [ ] AC-1: Launching with `name=Анна` yields the result `greeting` = "Привет Анна". (BR-1, BR-2, BR-3)
- [ ] AC-2: After a run, `hello.txt` in the Vesslet home folder contains "Привет Анна". (BR-4)
- [ ] AC-3: A second run with another name leaves only the new greeting in `hello.txt`. (BR-4)
- [ ] AC-4: Launching without a name completes successfully. (BR-5)
- [ ] AC-5: The pipeline runs start → hello → end and finishes. (BR-6)

## Open Questions
- [NEEDS CLARIFICATION] Is the fixed Russian greeting word intended, or should it depend on the user's language?
- [NEEDS CLARIFICATION] Should an empty name be rejected instead of producing "Привет "?
