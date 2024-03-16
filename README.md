# staff

[![Package Version](https://img.shields.io/hexpm/v/staff_ai)](https://hex.pm/packages/staff_ai)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/staff_ai/)

```sh
gleam add staff_ai
```
```gleam
import staff_ai.{Agent, create_agent}

pub fn main() {
  let agent: Agent =
    create_agent(
      "John Doe",
      "AI researcher",
      Some(
        "John is an AI researcher who is passionate about building AI agents that can accomplish tasks for people. He has a PhD in AI an has been working in the field for over 10 years. He is excited to be a part of the Staff-AI team.",
      ),
    )
  io.debug(agent)
}
```

Further documentation can be found at <https://hexdocs.pm/staff_ai>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
