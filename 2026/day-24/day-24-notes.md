# Git Merge, Rebase, Stash & Cherry Pick  

## Git Merge  

- What is a fast-forward merge?

Ans: The fast-forward merge occurs during **git merge** when target branch has not diverged from the source branch since it is created. Fast-forward merge results in clean and linear commit history.  

- When does Git create a merge commit instead?

Ans: The merge commit is created when target and/or source branches have diverged. Also you can force Git to create a merge commit even if a fast-forward merge would be possible by using the --no-ff option.  

- What is a merge conflict?

Ans: The merge conflict occurs when similar file is modified at same part of the file under different branches meant to be merged.  

---  

## Git Rebase  

- What does rebase actually do to your commits?
  
Ans: The rebase rewrites project history by moving, combining, or deleting a sequence of commits to a new base commit, creating entirely new commits.  

- How is the history different from a merge?

Ans: A **merge** preserves all original commit IDs, has two parents, shows exactly when the branches joined. A **rebase** reapplies commits from feature to main branch creating new, distinct commits. The original history is lost in favour of a straight line.  

- Why should you never rebase commits that have been pushed and shared with others?

Ans: Rebasing creates new commits making the old commits disappear, which confuses Git and collaborators who already pulled the original commits. This results in merge conflicts which requires manual, complex, and error-prone conflict resolution.  

- When would you use rebase vs merge?

Ans: **Rebase** local, unpushed branches to clean up history. For shared branches, use **git merge** to preserve history safely.  

---  

## Squash vs Merge Commit  

- What does squash merging do?

Ans: The **squash** combines all commits from feature branch and compresses them into single new commit on the main branch during PR. This results in one tidy commit per feature.  

- When would you use squash merge vs regular merge?

Ans: For a short lived feature branches, if you want to treat an entire PR as one unti of work and you want tidy, readable main branch without additional commit histories from feature branches, you can use **squash merge**.  
But if you want a complete tracability of every commit for a long running complex feature branches, you can use regular **merge**.  

- What is the trade-off of squashing?

Ans: **Clean and tidy** commit history under main branch. Also commits are combined and squashed to single new commit, it will be **difficult to debug** a specific small commit.  
Squashing may result in **merge conflicts** down the line because unsquashed commits under feature wont be present under main branch. Squashing may potentially lose individual contributor attribution for the intermediate steps.  

---  

## Git Stash  

- What is the difference between git stash pop and git stash apply?

Ans: **git stash pop** applies the stashed changes and then removes the stash entry from the list; whereas **git stash apply** applies the changes but leaves the stash in the stash list for reuse.  

- When would you use stash in a real-world workflow?

Ans: It can be used during **urgent bug fixes** on another branch, **pulling remote changes**, or **testing functinality** without affecting the commit history.  

---  

## Cherry Picking  

- What does cherry-pick do?

Ans: **git cherry-pick** is a command that applies a specific commit from one branch onto your current HEAD branch.  

- When would you use cherry-pick in a real project?

Ans: cherry-pick can be used to select individual, targeted changes (like a hotfix) rather than merging or rebasing an entire branch.  

- What can go wrong with cherry-picking?

Ans: The most common issue that can arise is **merge conflict**. With cherry-pick, duplicate commit IDs for a same change are created results in **confusing commit history**. Cherry-pick may result in **missed dependencies** too.  
