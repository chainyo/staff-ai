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
import birl
import gleam/option.{type Option, None}
import ids/uuid

/// Represents a unique identifier, which is a string in the UUID format.
/// 
pub type UUID =
  String

/// The status of the task
/// 
pub type TaskStatus {
  /// The task is ready to be performed
  Ready
  /// The task is currently being performed
  InProgress
  /// The task has been completed
  Completed
  /// The task has been cancelled
  Cancelled
  /// The task has failed
  Failed
}

/// A task that can be performed by an agent
/// 
/// It represents the most simple unit of work that an Agent can perform.
/// The task can involve any input and output, but it is expected to be
/// a small unit of work that can be performed in a short amount of time.
/// 
pub type Task {
  Task(
    /// The unique identifier of the task
    id: UUID,
    /// A meaningful title of the task
    title: String,
    /// A description of the task, must be detailed enough to be performed
    description: String,
    /// The status of the task
    status: TaskStatus,
    /// The unique identifier of the agent that has been assigned to perform the task
    assigned_agent: Option(UUID),
    /// The time when the task was created
    created_at: birl.Time,
    /// The time when the task was last updated
    updated_at: birl.Time,
    /// The time when the task was completed
    completed_at: Option(birl.Time),
    /// The time when the task was cancelled
    cancelled_at: Option(birl.Time),
    /// The time when the task has failed
    failed_at: Option(birl.Time),
  )
}

/// Create a new task
/// 
pub fn create_task(
  title: String,
  description: String,
  assigned_agent: Option(UUID),
) -> Task {
  let assert Ok(id) = uuid.generate_v4()
  let created_at = birl.now()
  Task(
    id: id,
    title: title,
    description: description,
    status: Ready,
    assigned_agent: assigned_agent,
    created_at: created_at,
    updated_at: created_at,
    completed_at: None,
    cancelled_at: None,
    failed_at: None,
  )
}

/// Represents an AI worker in a staff system
/// 
/// It represents the most simple unit of you staff who can be assigned to a task.
/// Agent has a name, a list of skills and a list of tasks, which he is currently working on.
///
pub type Agent {
  Agent(
    /// Unique identifier of the agent
    id: UUID,
    /// Name of the agent, which is used to identify him in your system.
    /// It can be a real name or a nickname, e.g. "Jane Doe" or "jane_doe"
    name: String,
    /// Role of the agent, which is used to identify his skills and responsibilities in your system.
    /// It can be a real role or a nickname, e.g. "Software Developer" or "dev"
    role: String,
    /// Adding a context to an agent is optional, but it can be useful to store additional information about the agent.
    /// It can be used to store additional information about the agent as it will influence the way it reacts to tasks.
    /// E.g. "Jane Doe is a technical lead of the project X. She is responsible for the architecture and ..."
    context: Option(String),
  )
}

/// Creates a new agent with the given parameters.
/// 
pub fn create_agent(
  name: String,
  role: String,
  context: Option(String),
) -> Agent {
  let assert Ok(id) = uuid.generate_v4()
  Agent(id: id, name: name, role: role, context: context)
}

/// Squad is a group of agents that can are working together on a specific Objective.
/// 
/// It represents isolated groups of agents with diverse skills and responsibilities.
/// The squad has a name, an objective and a list of agents, which are part of the squad.
/// 
pub type Squad {
  Squad(
    /// Unique identifier of the squad
    id: UUID,
    /// Name of the squad, which is used to identify it in your system.
    /// It can be a real name or a nickname, e.g. "Software Development Team" or "dev_team"
    name: String,
    /// Objective of the squad, which is used to identify the goal of the squad in your system.
    /// It can be a real objective or a nickname, e.g. "Develop the new feature X" or "feature_x"
    /// The objective should be as clear as possible to be sub-divided into granular tasks.
    objective: String,
    /// The list of agents that are part of the squad, this list can evolve over time.
    agents: List(Agent),
    /// The list of tasks that are part of the squad, this list will evolve over time
    /// as tasks are created and completed.
    tasks: List(Task),
  )
}

/// Creates a new squad with the given parameters.
/// 
pub fn create_squad(
  name: String,
  objective: String,
  agents: List(Agent),
  tasks: List(Task),
) -> Squad {
  let assert Ok(id) = uuid.generate_v4()
  Squad(id: id, name: name, objective: objective, agents: agents, tasks: tasks)
}
