/// Task represents the most simple unit of work that an Agent can perform.
/// The task can involve any input and output, but it is expected to be
/// a small unit of work that can be performed in a short amount of time.
/// 
import birl.{type Time, now}
import gleam/option.{type Option, None}
import ids/uuid

/// Represents a unique identifier of a task, which is a string in the UUID format.
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
    created_at: Time,
    /// The time when the task was last updated
    updated_at: Time,
    /// The time when the task was completed
    completed_at: Option(Time),
    /// The time when the task was cancelled
    cancelled_at: Option(Time),
    /// The time when the task has failed
    failed_at: Option(Time),
  )
}

pub fn create(
  title: String,
  description: String,
  assigned_agent: Option(UUID),
) -> Task {
  let assert Ok(id) = uuid.generate_v4()
  let created_at = now()
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
