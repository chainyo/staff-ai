/// Agent represents the most simple unit of you staff. It represents a person, who can be assigned to a task.
/// 
/// Agent has a name, a list of skills and a list of tasks, which he is currently working on.
///
import gleam/option.{type Option}
import ids/uuid

/// Represents a unique identifier of an agent, which is a string in the UUID format.
/// 
pub type UUID =
  String

/// Represents an AI worker in a staff system
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
pub fn create(name: String, role: String, context: Option(String)) -> Agent {
  let assert Ok(id) = uuid.generate_v4()
  Agent(id: id, name: name, role: role, context: context)
}
