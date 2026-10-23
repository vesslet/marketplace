# Feature Map

| Slug | Feature | Key components |
|------|---------|----------------|
| hello | Greeting example: produces a greeting for a given name | `nodes/hello`, `pipelines/hello.yaml` |

## hello

**Boundary:** the `hello` node (takes a name, produces a greeting and leaves a copy on the local machine) and the `hello` pipeline that runs it between the built-in start and end steps.

**Dependencies:** the Vesslet platform supplies the `name` launch parameter and runs the node.
