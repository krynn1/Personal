terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.36.1"
    }
  }
}

provider "tfe" {
 token = "vA0osO4lPDwdLg.atlasv1.yXaBLrI9OERFBRqPsJF2fP6mjalKtzXdLWLm5birqzHFqoNJ816yO9yOyjz66MovVpk" # Configuration options
}