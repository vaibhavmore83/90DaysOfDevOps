# Introduction to Git

1. What is the difference between git add and git commit?
Ans: **git add** tracks the file under staging area of your repository whereas **git commit** commits the changes with meaningful commit message to your local repository.
 
2. What does the staging area do? Why doesn't Git just commit directly?
Ans: The staging area is the working directory being tracked under git. To track changes under git, the changed files needs to be staged under git using **git add** and then commit the tracked changed files using **git commit**.

4. What information does git log show you?  
Ans: git log shows history of your commits with details like unique commit ID, the committer name and email, the date and timestamp, file committed under that commit and commit message.

5. What is the .git/ folder and what happens if you delete it?
Ans: .git folder tells that the directory is being tracked under git and work as repository. If .git is deleted, then the directory will not be considered as repository under git and all commit history will be deleted.
   
6. What is the difference between a working directory, staging area, and repository?
Ans: A working directory is the local directory on the machine, whereas staging area is being tracked under git. The repository is the collection of changes tracked under version control management tool like git.
  
