# Hello

## Context

The marketplace needs a minimal working example that new authors can copy. The hello node greets a person by name, using a value supplied at launch, and shows that a node can leave a result both in the run's visible output and on the local machine.

## Business Rules

- **[BR-1]** (MUST): The greeting is the Russian word "Привет" followed by a space and the supplied name.
- **[BR-2]** (MUST): The name comes from the launch-time parameter `name`.
- **[BR-3]** (MUST): The greeting is returned as the node's result so it is visible in the run timeline.
- **[BR-4]** (SHOULD): The greeting is also saved on the local machine in the Vesslet home folder, replacing the previous greeting.
- **[BR-5]** (SHOULD) [ASSUMED: the example is meant to work without extra setup]: When no name is supplied, the node still succeeds and greets with an empty name.
- **[BR-6]** (MUST): The example pipeline runs the greeting once between its start and end steps.
- **[BR-7]** (MAY) [NEEDS CLARIFICATION: the Vesslet home folder is assumed to already exist; behavior when it is missing is undefined]: The node does not require approval to run when installed globally.

## Use Cases

### [UC-1]: Greet a person

- **Actor:** Pipeline user.
- **Action:** Launches the hello pipeline with `name` set.
- **Result:** The run shows the greeting "Привет {name}" and the same text is saved locally.
- **Constraints:** Without a name, the greeting is "Привет " (empty name).

## Acceptance Criteria

- **[AC-1]**: Launching with name "Анна" produces the greeting "Привет Анна" in the run result.
- **[AC-2]**: After that run, the local greeting file contains "Привет Анна".
- **[AC-3]**: A second run with another name leaves only the new greeting in the local file.
- **[AC-4]**: Launching without a name completes successfully with the greeting "Привет ".
- **[AC-5]**: The pipeline run passes through start, hello, end in that order.

## Out of Scope (business)

- Sandboxing or restricting what a node may access on the machine.
- Greetings in languages other than Russian.
