variable "context" {
  type = object({
    owner            = string
    name             = string
    visibility       = string
    description      = string
    codereaders      = list(string)
    maintainers      = list(string)
    topics           = list(string)
    mvp_goal         = string
    launch_timeline  = string
    success_metrics  = string
    problem_example  = string
    solution_example = string
    tech_stack       = string
    platform         = string
  })
  default = {
    owner            = "NesoHQ"
    name             = "unnamed-repo"
    visibility       = "public"
    description      = "A NesoHQ repository for MVP development"
    codereaders      = []
    maintainers      = []
    topics           = ["oss"]
    mvp_goal         = "TBD: Define primary objective for MVP"
    launch_timeline  = "TBD: Set target launch date"
    success_metrics  = "TBD: Define measurable success criteria"
    problem_example  = "TBD: Example user pain point"
    solution_example = "TBD: Example solution description"
    tech_stack       = "TBD: Specify technologies (e.g., Terraform, Go)"
    platform         = "TBD: Specify platform (e.g., Web, CLI)"
  }
}