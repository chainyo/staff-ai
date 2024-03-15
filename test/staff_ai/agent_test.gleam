import gleam/option.{None}
import gleeunit/should
import staff_ai/agent.{type Agent, create}

pub fn agent_test() {
  let agent: Agent = create("Bob", "Developer", None)
  agent.name
  |> should.equal("Bob")
  agent.role
  |> should.equal("Developer")
  agent.context
  |> should.equal(None)
}
