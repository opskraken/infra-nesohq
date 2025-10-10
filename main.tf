provider "github" {
  owner = local.org_name
}

locals {
  org_name = "NesoHQ"
  nesohq_default_homepage = "https://nesohq.org"
}

module "org" {
  source        = "./github/org"
  org_name      = local.org_name
  org_members   = []
}

# Introduction repository
module "intro" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "introduction-to-nesohq"
    visibility       = "public"
    description      = "Introductory hub for NesoHQ, providing an overview of the organization's mission and projects, managed by Terraform for community onboarding"
    codereaders      = []
    maintainers      = ["saadrupai"]
    topics           = ["terraform", "infrastructure-as-code", "iac", "github", "automation", "nesohq", "introduction", "community", "onboarding"]
    mvp_goal         = "Create a welcoming hub for new contributors"
    launch_timeline  = "Q1 2026"
    success_metrics  = "100+ stars, 10+ contributors"
    problem_example  = "New contributors lack a clear entry point to NesoHQ projects"
    solution_example = "A centralized repo with guides and project overviews"
    tech_stack       = "Markdown, GitHub Pages"
    platform         = "Web"
  }
}

# Infrastructure repository
module "infra" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "infra"
    visibility       = "public"
    description      = "Centralized repository for managing NesoHQ's infrastructure configurations using Terraform, ensuring consistency and scalability"
    codereaders      = []
    maintainers      = ["saadrupai"]
    topics           = ["terraform", "infrastructure-as-code", "iac", "github", "automation", "managed", "infrastructure", "devops", "cloud"]
    mvp_goal         = "Automate infrastructure setup for all NesoHQ repos"
    launch_timeline  = "Q1 2026"
    success_metrics  = "100% of repos managed via Terraform"
    problem_example  = "Manual infrastructure setup is error-prone"
    solution_example = "Automated Terraform scripts for repo creation"
    tech_stack       = "Terraform, GitHub API"
    platform         = "Cloud"
    branch_protection = {
      main = {
        require_signed_commits = true
        required_pull_request_reviews = {
          required_approving_review_count = 2
        }
      }
    }
  }
}

# Laundry service repository
module "laundry" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "laundry-service"
    visibility       = "public"
    description      = "Online laundry service platform for ordering and tracking laundry with location-aware features, managed by Terraform"
    codereaders      = ["itnishad", "gowaliullah"]
    maintainers      = ["enghasib"]
    topics           = ["laundry-service", "e-commerce", "online-service", "location-based", "rest-api", "user-management", "order-tracking"]
    mvp_goal         = "Enable users to order and track laundry services"
    launch_timeline  = "Q2 2026"
    success_metrics  = "1000+ orders processed, 90% user satisfaction"
    problem_example  = "Users struggle to find reliable laundry services"
    solution_example = "A platform to order and track laundry with location-based search"
    tech_stack       = "React, Node.js, MongoDB"
    platform         = "Web, Mobile"
  }
}

# Judge Not Zero repository
module "judge_not_zero" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "judge-not-zero"
    visibility       = "public"
    description      = "Open-source online judging platform for competitive programming with a scalable microservices architecture, Next.js frontend, and Go backend"
    codereaders      = []
    maintainers      = ["cy-r0x"]
    topics           = ["online-judge", "competitive-programming", "microservices", "nextjs", "golang", "rabbitmq", "postgresql", "sandbox"]
    mvp_goal         = "Support automated code judging for 5+ programming languages"
    launch_timeline  = "Q3 2026"
    success_metrics  = "10,000+ submissions, 99% uptime"
    problem_example  = "Manual code judging is slow and error-prone"
    solution_example = "Automated judging with microservices"
    tech_stack       = "Next.js, Go, PostgreSQL, RabbitMQ"
    platform         = "Web"
  }
}

# BGCE Bot repository
module "bgce_bot" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "bgce-bot"
    visibility       = "public"
    description      = "Python-based chatbot for streamlining project discussions by linking pull requests and issues in development channels"
    codereaders      = []
    maintainers      = ["twfksh"]
    topics           = ["chatbot", "automation", "python", "github-api", "collaboration", "discord-bot", "development-tools"]
    mvp_goal         = "Automate PR and issue linking in Discord"
    launch_timeline  = "Q2 2026"
    success_metrics  = "50+ active users, 100+ linked PRs/issues"
    problem_example  = "Developers miss important PR updates"
    solution_example = "A bot that notifies teams of PRs and issues"
    tech_stack       = "Python, Discord API"
    platform         = "Discord"
  }
}

# GW2Style repository
module "gw_two_style" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "gw2style"
    visibility       = "public"
    description      = "Community-driven fashion archive for Guild Wars 2 players to share and discover character outfits, hosted on Netlify with MongoDB"
    codereaders      = []
    maintainers      = ["hazratali-uydevelopers"]
    topics           = ["guild-wars-2", "fashion-archive", "community-platform", "netlify", "mongodb", "api-integration", "social-hub"]
    mvp_goal         = "Enable outfit sharing and browsing"
    launch_timeline  = "Q2 2026"
    success_metrics  = "500+ user uploads, 1000+ monthly visitors"
    problem_example  = "Players lack a platform to share GW2 outfits"
    solution_example = "A web app for uploading and browsing outfits"
    tech_stack       = "React, MongoDB, Netlify"
    platform         = "Web"
  }
}

# Lazy CLI repository
module "lazy_cli" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "lazy-cli"
    visibility       = "public"
    description      = "Bash-based CLI tool to automate development workflows, initializing projects and configuring environments across multiple languages"
    codereaders      = []
    maintainers      = ["iammhador"]
    topics           = ["cli-tool", "automation", "bash", "developer-tools", "project-initialization", "cross-platform", "workflow"]
    mvp_goal         = "Automate project setup for 3+ languages"
    launch_timeline  = "Q1 2026"
    success_metrics  = "100+ downloads, 90% setup success rate"
    problem_example  = "Setting up dev environments is time-consuming"
    solution_example = "A CLI to automate project initialization"
    tech_stack       = "Bash"
    platform         = "CLI"
  }
}

# Code Echo repository
module "code_echo" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "code-echo"
    visibility       = "public"
    description      = "CLI tool to scan repositories and package them into AI-friendly files for documentation, refactoring, and security scanning"
    codereaders      = []
    maintainers      = ["Sadik-Sami"]
    topics           = ["cli-tool", "automation", "golang", "ai-integration", "documentation", "code-analysis", "refactoring"]
    mvp_goal         = "Generate AI-friendly code summaries"
    launch_timeline  = "Q3 2026"
    success_metrics  = "100+ repos scanned, 95% accuracy"
    problem_example  = "Manual code documentation is tedious"
    solution_example = "A CLI to auto-generate documentation"
    tech_stack       = "Go"
    platform         = "CLI"
  }
}

# BGCE Stream repository
module "bgce_stream" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "bgce-stream"
    visibility       = "public"
    description      = "One-click music streaming service for communities, enabling high-quality audio sharing with noise filtering and music mode"
    codereaders      = ["twfksh"]
    maintainers      = ["rahim-jr"]
    topics           = ["music-streaming", "audio", "community", "real-time", "collaboration", "streaming-service"]
    mvp_goal         = "Enable seamless music streaming for communities"
    launch_timeline  = "Q3 2026"
    success_metrics  = "1000+ streams, 90% user retention"
    problem_example  = "Communities lack easy music sharing tools"
    solution_example = "A one-click streaming platform"
    tech_stack       = "Node.js, WebRTC"
    platform         = "Web"
  }
}

# Archive Infrastructure repository
module "archive_infra" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "archive-infra"
    visibility       = "public"
    description      = "Repository for archived NesoHQ infrastructure configurations, managed via Terraform for traceability and recovery"
    codereaders      = []
    maintainers      = ["saadrupai"]
    topics           = ["infrastructure", "archive", "terraform", "infrastructure-as-code", "devops", "backup"]
    mvp_goal         = "Archive infrastructure configs for recovery"
    launch_timeline  = "Q1 2026"
    success_metrics  = "100% configs archived"
    problem_example  = "Lost configs hinder recovery"
    solution_example = "A repo for archived Terraform configs"
    tech_stack       = "Terraform"
    platform         = "Cloud"
    branch_protection = {
      main = {
        require_signed_commits = true
        required_pull_request_reviews = {
          required_approving_review_count = 1
        }
      }
    }
  }
}

# VPS Study repository
module "vps_study" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "vps-study"
    visibility       = "private"
    description      = "Private repository for managing VPS configurations and conducting R&D studies for NesoHQ's infrastructure and projects"
    codereaders      = []
    maintainers      = ["saadrupai"]
    topics           = ["vps", "research", "development", "infrastructure", "prototyping", "private"]
    mvp_goal         = "Prototype VPS configurations"
    launch_timeline  = "Q2 2026"
    success_metrics  = "5+ prototypes tested"
    problem_example  = "VPS setups lack standardization"
    solution_example = "A repo for testing VPS configs"
    tech_stack       = "Terraform, Docker"
    platform         = "Cloud"
  }
}

# Lok Lagbe repository
module "lok_lagbe" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "lok-lagbe"
    visibility       = "public"
    description      = "Web-based platform connecting skilled workers with employers for project-based or contract work, featuring user profiles, advanced search filters, secure communication, and a rating system"
    codereaders      = []
    maintainers      = ["itsrmizanur"]
    topics           = ["freelancing", "job-platform", "user-management", "search", "messaging", "contract-work", "employment", "social-impact", "web-app"]
    mvp_goal         = "Connect 1000+ workers with employers"
    launch_timeline  = "Q3 2026"
    success_metrics  = "1000+ matches, 90% user satisfaction"
    problem_example  = "Workers struggle to find contract jobs"
    solution_example = "A platform for job matching with search and ratings"
    tech_stack       = "React, Node.js, MongoDB"
    platform         = "Web"
  }
}

# Blood Donation repository
module "blood_donation" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "blood-donation"
    visibility       = "public"
    description      = "Platform to connect blood donors with those in need, allowing user registration, donor updates, and location-based searches for specific blood groups"
    codereaders      = []
    maintainers      = ["shojib116"]
    topics           = ["blood-donation", "health", "user-management", "search", "social-impact", "donor-platform", "location-based", "community", "medical"]
    mvp_goal         = "Enable 500+ donor connections"
    launch_timeline  = "Q2 2026"
    success_metrics  = "500+ donations facilitated"
    problem_example  = "Finding blood donors is challenging"
    solution_example = "A platform for location-based donor matching"
    tech_stack       = "React, Node.js, PostgreSQL"
    platform         = "Web, Mobile"
  }
}

# EduSphere repository
module "edusphere" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "edusphere"
    visibility       = "public"
    description      = "Centralized platform for educational institutions to manage student enrollment, exam results, courses, news, and more, with role-based access and optional payment integration"
    codereaders      = []
    maintainers      = ["sabbirn53"]
    topics           = ["education", "management-platform", "user-management", "analytics", "payment", "enrollment", "exam-results", "institution-management", "dashboard"]
    mvp_goal         = "Manage enrollment and results for 10+ institutions"
    launch_timeline  = "Q3 2026"
    success_metrics  = "1000+ users, 95% uptime"
    problem_example  = "Institutions lack centralized management tools"
    solution_example = "A platform for enrollment and result management"
    tech_stack       = "React, Node.js, MongoDB"
    platform         = "Web"
  }
}

# Volunteering Match repository
module "volunteering_match" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "volunteering-match"
    visibility       = "public"
    description      = "Platform to match volunteers with NGOs based on skills, availability, and interests, using an algorithm to connect the right people to impactful projects"
    codereaders      = []
    maintainers      = ["kabirhiking"]
    topics           = ["volunteering", "ngo", "matching-algorithm", "social-impact", "community", "skills-based", "non-profit", "collaboration", "app"]
    mvp_goal         = "Match 500+ volunteers with NGOs"
    launch_timeline  = "Q2 2026"
    success_metrics  = "500+ matches, 90% satisfaction"
    problem_example  = "Volunteers struggle to find relevant NGOs"
    solution_example = "A platform with a matching algorithm"
    tech_stack       = "React, Python, MongoDB"
    platform         = "Web"
  }
}

# E-Chat repository
module "e_chat" {
  source = "./github/repo"
  context = {
    owner            = local.org_name
    name             = "e-chat"
    visibility       = "public"
    description      = "Free, unlimited AI voice tool for learning and practicing languages (starting with English), offering real-time corrections, offline mode, and progress tracking"
    codereaders      = []
    maintainers      = ["Anika1111122222"]
    topics           = ["ai", "voice-tool", "language-learning", "education", "real-time", "offline-mode", "progress-tracking", "free-access", "multilingual"]
    mvp_goal         = "Enable language practice for 1000+ users"
    launch_timeline  = "Q3 2026"
    success_metrics  = "1000+ active users, 90% retention"
    problem_example  = "Language learners lack affordable practice tools"
    solution_example = "An AI-powered voice tool for language practice"
    tech_stack       = "Python, TensorFlow"
    platform         = "Web, Mobile"
  }
}