terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.3.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "gitlab" {
  token = "glpat-rG5-Wfho_pCNL8Etuipx"
}

provider "github" {
  token = "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"
}
resource "github_repository" "smith" {
  name = "smith"
}

resource "null_resource" "gitlab_to_github_migration" {
  provisioner "local-exec" {
    command = "git clone git@gitlab.com:nare3/migrate.git && cd migrate && git remote set-url origin git@github.com:pasem-narendra4/smith.git && git push -u origin main"
  }
}
