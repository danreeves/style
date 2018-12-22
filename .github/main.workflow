workflow "Deploy" {
  on = "push"
  resolves = ["alias"]
}

action "deploy" {
  uses = "actions/zeit-now@master"
  secrets = [
    "ZEIT_TOKEN",
  ]
}

action "alias" {
  uses = "actions/zeit-now@9fe84d5"
  needs = ["deploy"]
  args = "alias"
  secrets = [
    "ZEIT_TOKEN",
  ]
}
