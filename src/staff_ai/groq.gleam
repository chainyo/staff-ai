/// This module regroups all the functions and structures used to manage Groq interactions.
/// 
/// It's the entrypoint to the Groq API and any LLM's interaction with it.
/// 
import envoy
import gleam/dynamic.{type Dynamic}
import gleam/httpc
import gleam/http
import gleam/http/request
import gleam/http/response.{type Response}
import gleam/result

pub fn llm_prompt() -> Result(Response(String), Dynamic) {
  let assert Ok(api_key) = envoy.get("GROQ_API_KEY")

  let assert Ok(req) =
    request.to("https://api.groq.com/openai/v1/chat/completions")

  req
  |> request.set_method(http.Post)
  |> request.set_header("Authorization", "Bearer " <> api_key)
  |> request.set_header("Content-Type", "application/json")
  |> request.set_body(
    "{\"messages\": [{\"role\": \"user\", \"content\": \"Explain the importance of low latency LLMs\"}], \"model\": \"mixtral-8x7b-32768\"}",
  )

  use resp <- result.try(httpc.send(req))

  Ok(resp)
}
