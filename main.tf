terraform {  
    required_providers {  
        harness = {  
            source = "harness/harness"  
            version = "0.35.6"  
        }  
    }  
}

provider "harness" {  
    endpoint   = "https://app.harness.io/gateway"  
    account_id = "2452IT9_R3-nbB2gMz64jw"  
    platform_api_key    = "pat.2452IT9_R3-nbB2gMz64jw.682dad531ef99c3416e35a45.wMyDiIaCKXH3sWGVXasS"  
}
resource "harness_platform_pipeline" "pipelines" {
  identifier = "identifier"
  org_id     = "default"
  project_id = "Helix"
  name       = "Helix CI"
  git_details {
    branch_name    = "main"
    commit_message = "commitMessage"
    file_path      = "filePath"
    connector_ref  = "connectorRef"
    store_type     = "REMOTE"
    repo_name      = "repoName"
  }
  yaml = <<-EOT
      pipeline:
  name: CD
  identifier: CD
  projectIdentifier: Helix
  orgIdentifier: default
  tags: {Helix CI}
  properties:
    ci:
      codebase:
        repoName: account.harness-filestore
        build: <+input>
  stages:
    - stage:
        name: Deploy
        identifier: Deploy
        type: CI
        spec:
          cloneCodebase: true
          caching:
            enabled: true
            override: true
          platform:
            os: Linux
            arch: Arm64
          runtime:
            type: Docker
            spec: {}
          execution:
            steps:
              - step:
                  type: Run
                  name: Echo Deploy Stage
                  identifier: Echo_Deploy
                  spec:
                    shell: Sh
                    command: |
                      echo "This is the Deploy stage"
    - stage:
        name: Notify
        identifier: Notify
        type: CI
        spec:
          cloneCodebase: true
          caching:
            enabled: true
            override: true
          execution:
            steps:
              - step:
                  type: Run
                  name: Echo Notify Stage
                  identifier: Echo_Notify
                  spec:
                    shell: Sh
                    command: |
                      echo "This is the Notify stage"
          infrastructure:
            type: VM
            spec:
              type: Pool
              spec:
                poolName: CI
                os: Linux
  EOT
}
