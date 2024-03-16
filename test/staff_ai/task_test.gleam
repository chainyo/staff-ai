import gleam/option.{None}
import gleeunit/should
import staff_ai/task.{type Task, create}

pub fn task_test() {
  let task: Task =
    create("Task for testing", "This task is only for testing", None)
  task.title
  |> should.equal("Task for testing")
  task.description
  |> should.equal("This task is only for testing")
  task.assigned_agent
  |> should.equal(None)
}
