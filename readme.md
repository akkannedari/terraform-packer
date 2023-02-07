
$Env:AWS_ACCESS_KEY_ID=""
$Env:AWS_SECRET_ACCESS_KEY=""

DevOps Note:

Debugging Shell scripts 

#!/bin/bash -xv

Azure provider code for terraform.
 # Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

Specify service principal credentials in environment variables

WINDOWS:
$env:ARM_CLIENT_ID="<service_principal_app_id>"
$env:ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
$env:ARM_TENANT_ID="<azure_subscription_tenant_id>"
$env:ARM_CLIENT_SECRET="<service_principal_password>"

# dir env:   

LINUX:
export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
export ARM_TENANT_ID="<azure_subscription_tenant_id>"
export ARM_CLIENT_ID="<service_principal_appid>"
export ARM_CLIENT_SECRET="<service_principal_password>"

Git Ignore File.
 
Configure the git account:
# git config --global user.name "akkannedari"
#  git config --global user.email aravindakumar.kannedari@hotmail.com

Know the branch;
# git branch
Files add to git
# git add
Commit files to git
git –m “commit name” 
Rename the branch in GIT;
git –m existing branch name new branch name.
# git –m master development
Check the remote location
# git remote –v

Add the remote
git remote add origin URL of git remote repository 

# git remote add origin git@github.com/SeeVeeraDevOps/devopsb28-git-terrafom-azure.git
Push code to remote location
git push remote branch name local branch name
# git push origin development
Check the difference before commit.
git diff file name
# git diff provider.tf

It’ll show the logs of the commits
git log --oneline
Git revert is a Git command 
that allows you to undo a previous commit by creating a new commit with the opposite changes. It's a safe way to undo changes because it doesn't destroy any previous history. Instead, it creates a new commit that undoes the changes
Delete the commits:
git revert    # non destructible
git reset 
-	Soft
-	Hard
-	Mixed (default)
 

git push origin development --force



git commit –amend

 is a command in Git that allows you to modify the most recent commit in the current branch by updating its message or adding new changes to it. This command is useful when you realize that there is an error in the most recent commit or if you forgot to include important changes in the commit. Note that using git commit --amend re-writes the commit history, so it should be used with caution.
git switch –c:

is a command in Git that allows you to create a new branch and switch to it in one command. The -c option stands for "create", and it creates a new branch with the specified name and switches to it.
For example, to create a new branch called "feature-x" and switch to it
$ git switch -c feature-x





git merge:

is a command in Git that allows you to combine changes from multiple branches into a single branch. It is used to integrate changes from one branch into another branch.
For example, to merge changes from the "feature-x" branch into the current branch, you would run the following command:
If there are no conflicts between the changes in the two branches, the merge will be performed automatically. If there are conflicts, Git will ask you to resolve them before the merge can be completed.


Delete the branch 
git branch –D brath_nname

Restore the deleted Branch
To restore a deleted branch in Git, you need to find the branch in the reflog and then create a new branch pointing to the same commit. Here are the steps to restore a deleted branch:
1.	Run the following command to view the reflog, which is a log of all references in your Git repository:
$ git reflog
2.	Look for the commit hash associated with the deleted branch. It should be listed with a message indicating that the branch was deleted.
3.	Once you have found the commit hash, create a new branch pointing to that commit:
$ git branch restored-branch <commit-hash>
4.	Switch to the newly created branch:
$ git switch restored-branch
Note that this will only restore the branch and its code, but the branch's commit history will be lost. The reflog is only kept for a limited time, so it's important to restore the branch as soon as possible after it's been deleted.
The reflog is only kept for a limited time by default, usually around 30 days. The exact amount of time that the reflog is kept can be configured through the gc.reflogExpire setting in the Git configuration file. The purpose of the reflog is to allow you to recover references that have been deleted, so it is important to act quickly if you need to restore a deleted branch.

$ git config --get gc.reflogExpire


If you need to keep the reflog for a longer time, you can change the value of gc.reflogExpire to a different time interval, such as 180 days:

$ git config --global gc.reflogExpire 180.days


 

git merge and git rebase are two different methods in Git for combining changes from multiple branches.

git merge creates a new merge commit in the target branch that combines the changes from the source branch. This results in a linear history of the repository, with each commit representing a change that was made. Merging is the default method for integrating changes in Git, and it is a good choice for most use cases.

git rebase reapplies the changes from the source branch onto the target branch one by one. This results in a linear history, with the source branch appearing as if it was created after the target branch. Rebasing can be useful for keeping the history of a branch clean and concise, but it can also be risky as it rewrites the commit history.
In general, merging is the preferred method for integrating changes between branches, as it is easier to understand and less prone to errors. Rebasing should be used with caution and only when you have a good understanding of how it works and the potential risks involved.

git squash:
is a technique in Git for combining multiple commits into a single commit. This can be useful for simplifying the commit history of a branch, making it easier to understand and manage.
To squash multiple commits into a single commit, you need to use the git rebase command with the --interactive or -i option. This will open an editor where you can specify the desired actions for each commit, including squashing multiple commits into a single commit.




$ git rebase -i HEAD~2

This will open an editor showing the last two commits, and you can change the pick command for one or both commits to squash. Then save and exit the editor. Git will then combine the changes from the squashed commits into a single commit, and you will be prompted to provide a commit message for the new, combined commit.
It's important to note that squashing commits changes the commit history of your branch, so it should only be used with caution and when you are sure that it is appropriate for your particular use case.
git drop: 
is a command in Git that is used to drop or remove a commit or series of commits from the current branch. When you drop a commit, it is deleted from the branch, and the changes it made are discarded.



Terraform:
Implicit dependency in terraform
Implicit dependency in Terraform refers to the dependencies between resources that are not explicitly defined in Terraform code. These dependencies can be inferred from the resource properties and can result in unintended dependencies between resources. Terraform automatically determines the order in which resources should be created and managed to ensure correct behaviour.
Example:
An example of implicit dependency in Terraform is a resource that is using an attribute from another resource. For example, if you have a resource A and B, and resource B is using the "id" attribute from resource A, then resource B is implicitly dependent on resource A. Terraform will automatically manage the order of resource creation, so that resource A is created before resource B, ensuring that resource B has the required "id" attribute from resource A.

Don’t repeated a code in terraform for create a same resource for multiple times.
It’s called DRY don’t use repeat code.
For that we can use count functions, in terraform.


Terraform mv command for resources rename

terraform state mv  resources_old_name  resources_new_name


Terraform Advantages:


Terraform is an open-source infrastructure as code software tool created by HashiCorp. It allows users to define and manage infrastructure resources, such as virtual machines, DNS entries, and databases, using high-level configuration language.

In recent years, Terraform has advanced in several areas including:

Improved support for cloud services: Terraform now supports more cloud providers and has added features to manage cloud-native services like Kubernetes clusters.

Modules: Terraform modules enable users to encapsulate and share infrastructure as code resources across projects.

Workspaces: Workspaces enable users to manage multiple instances of infrastructure that share the same Terraform codebase, making it easier to use Terraform for multi-environment deployment scenarios.

Improved Collaboration: Terraform Cloud and Terraform Enterprise provide shared state management, collaboration, and governance features that make it easier for teams to use Terraform together.

Overall, Terraform has become a more comprehensive and versatile tool for managing infrastructure as code.

AWS Provides & backend file code:
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
  backend "s3" {
  bucket = "devops09022023state"
  key    = "devenv/devops09022023.tfstate"
  region = "us-east-1"
}
}



When mentioned the backend block it’ll search for environmental variables credentials or role of the instance.


Variable Definition Precedence:
Terraform loads variables in the following order, with later sources taking precedence over earlier ones:
•	Environment variables
•	The terraform.tfvars file, if present.
•	The terraform.tfvars.json file, if present.
•	Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
•	Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

Terraform Disadvantages:
Despite its many advantages, Terraform also has some disadvantages or limitations:

Steep learning curve: Terraform's syntax and structure can be complex and challenging to learn for new users.

Performance: Terraform's performance can be slow, especially for large infrastructure deployments or when making frequent changes to the infrastructure.

State management: Terraform state management can be a challenge, especially for teams working together on the same infrastructure. If not handled properly, state conflicts can occur that prevent Terraform from running successfully.

Immature ecosystem: Terraform's ecosystem of modules and providers is still relatively young and may not have the level of support and stability as other tools.

Limited rollback capabilities: Terraform does not have built-in rollback capabilities, which can make it difficult to recover from failures.

Not designed for highly-dynamic infrastructure: Terraform is designed for static infrastructure, so it may not be the best choice for highly dynamic infrastructure environments that require real-time updates.

Despite these limitations, Terraform remains a popular tool for managing infrastructure as code and many organizations are using it to automate their infrastructure deployment and management processes.
 

 
