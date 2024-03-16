/// Staff-AI is the easiest and most scalable way to build and deploy AI agents for accomplishing tasks for you.
/// Define your employees, their tasks, and the environment they work in, and let Staff-AI handle the rest.
/// 
/// Staff-AI is built on top of the Gleam programming language, and is designed to be easy to use, easy to understand,
/// and easy to extend. With Staff-AI, you can build AI agents that can do anything from simple data entry to complex
/// research and development tasks.
/// 
/// Why not Python? Python is a great language, but it's not designed for building scalable, concurrent, and distributed
/// systems. Gleam is built on top of the Erlang VM, which is designed for building scalable, concurrent, and distributed
/// systems. This makes it the perfect language for building AI agents that can work together to accomplish tasks.
/// 
/// We don't want you to run maximum 3 agents at a time, we want you to run as many agents as you need to accomplish
/// your tasks as quickly as possible. Imagine being the CEO of a company with 1000 AI agents working for you, all
/// accomplishing tasks for you on a low-cost cloud infrastructure. That's the power of Staff-AI.
/// 
/// Copyright (c) 2024 Staff-AI - All rights reserved
/// 
import gleam/io
import gleam/option.{Some}
import staff_ai/agent.{create as create_agent}
import staff_ai/task.{create as create_task}

pub fn main() {
  let agent =
    create_agent(
      "John Doe",
      "AI researcher",
      Some(
        "John is an AI researcher who is passionate about building AI agents
        that can accomplish tasks for people. He has a PhD in AI and has been
        working in the field for over 10 years.
        He is excited to be a part of the Staff-AI team.",
      ),
    )
  io.debug(agent)
  let task =
    create_task(
      "Research",
      "Research AI algorithms",
      Some(
        "Research AI algorithms to find the best algorithms for building AI
        agents that can accomplish tasks for people.",
      ),
    )
  io.debug(task)
}
