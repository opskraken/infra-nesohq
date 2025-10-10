terraform {
  required_version = ">= 1.12.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

resource "github_repository" "default" {
  name                   = var.context.name
  description            = var.context.description
  visibility             = var.context.visibility
  has_issues             = true
  has_projects           = false
  has_wiki               = false
  has_discussions        = false
  has_downloads          = false
  allow_auto_merge       = true
  allow_squash_merge     = true
  allow_merge_commit     = false
  allow_rebase_merge     = false
  archive_on_destroy     = true
  auto_init              = true
  delete_branch_on_merge = true
}

resource "github_repository_topics" "default" {
  repository = github_repository.default.name
  topics     = sort(var.context.topics)
}

resource "github_branch_protection" "default" {
  repository_id    = github_repository.default.id
  pattern          = "main"
  enforce_admins   = false
  allows_deletions = false
}

resource "github_team" "default" {
  name        = var.context.name
  description = "${var.context.owner}/${var.context.name}"
  privacy     = "closed"
}

resource "github_team" "readonly" {
  name           = "${var.context.name}-readonly"
  description    = "Read-only team for ${var.context.owner}/${var.context.name}"
  privacy        = "closed"
  parent_team_id = github_team.default.id
}

resource "github_team" "maintainers" {
  name           = "${var.context.name}-maintainers"
  description    = "Maintainers team for ${var.context.owner}/${var.context.name}"
  privacy        = "closed"
  parent_team_id = github_team.default.id
}

resource "github_team_repository" "readonly" {
  team_id    = github_team.readonly.id
  repository = github_repository.default.name
  permission = "pull"
}

resource "github_team_membership" "readonly" {
  for_each = toset(var.context.codereaders)
  team_id  = github_team.readonly.id
  username = each.key
  lifecycle {
    ignore_changes = [
      role
    ]
  }
}

resource "github_team_repository" "maintainers" {
  team_id    = github_team.maintainers.id
  repository = github_repository.default.name
  permission = "maintain"
}

resource "github_team_membership" "maintainers" {
  for_each = toset(var.context.maintainers)
  team_id  = github_team.maintainers.id
  username = each.key
  lifecycle {
    ignore_changes = [
      role
    ]
  }
}

resource "github_repository_file" "roadmap" {
  repository          = github_repository.default.name
  file                = "ROADMAP_TEMP.md"
  content             = templatefile("${path.module}/../../templates/roadmap.md.tftpl", {
    repo_name        = var.context.name
    mvp_goal         = var.context.mvp_goal
    launch_timeline  = var.context.launch_timeline
    success_metrics  = var.context.success_metrics
    update_date      = formatdate("YYYY-MM-DD", timestamp())
  })
  commit_message      = "Add ROADMAP.md for ${var.context.name} MVP"
  commit_author       = "Terraform Bot"
  commit_email        = "terraform@nesohq.org"
  overwrite_on_create = true
}

resource "github_repository_file" "features" {
  repository          = github_repository.default.name
  file                = "FEATURES_TEMP.md"
  content             = templatefile("${path.module}/../../templates/features.md.tftpl", {
    repo_name        = var.context.name
    mvp_goal         = var.context.mvp_goal
    launch_timeline  = var.context.launch_timeline
    success_metrics  = var.context.success_metrics
    update_date      = formatdate("YYYY-MM-DD", timestamp())
  })
  commit_message      = "Add FEATURES.md for ${var.context.name} MVP"
  commit_author       = "Terraform Bot"
  commit_email        = "terraform@nesohq.org"
  overwrite_on_create = true
}

resource "github_repository_file" "feature_request" {
  repository          = github_repository.default.name
  file                = ".github/ISSUE_TEMPLATE/feature_request.yml"
  content             = templatefile("${path.module}/../../templates/feature_request.yml.tftpl", {
    repo_name        = var.context.name
    problem_example  = var.context.problem_example
    solution_example = var.context.solution_example
  })
  commit_message      = "Add feature request issue template for ${var.context.name}"
  commit_author       = "Terraform Bot"
  commit_email        = "terraform@nesohq.org"
  overwrite_on_create = true
}