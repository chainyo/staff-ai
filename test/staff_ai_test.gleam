import gleam/option.{None}
import gleeunit
import gleeunit/should
import staff_ai.{
  type Agent, type Squad, type Task, create_agent, create_squad, create_task,
}

pub fn main() {
  gleeunit.main()
}

pub fn agent_test() {
  let agent: Agent = create_agent("Bob", "Developer", None)
  agent.name
  |> should.equal("Bob")
  agent.role
  |> should.equal("Developer")
  agent.context
  |> should.equal(None)
}

pub fn squad_test() {
  let squad: Squad =
    create_squad(
      "Testing Squad",
      "The objective is to test Squad instance",
      [],
      [],
    )
  squad.name
  |> should.equal("Testing Squad")
  squad.objective
  |> should.equal("The objective is to test Squad instance")
  squad.agents
  |> should.equal([])
  squad.tasks
  |> should.equal([])
}

pub fn task_test() {
  let task: Task =
    create_task("Task for testing", "This task is only for testing", None)
  task.title
  |> should.equal("Task for testing")
  task.description
  |> should.equal("This task is only for testing")
  task.assigned_agent
  |> should.equal(None)
}
