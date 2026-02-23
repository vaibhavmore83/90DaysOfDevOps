# Git Reset vs Revert & Branching Strategies  

## Git Reset  

- What is the difference between `--soft`, `--mixed`, and `--hard`?

Ans:  
**git reset --soft** - This uncommits the changes but file changes will be under staged track  
**git reset --mixed** - This is the default command. This uncommits and unstages the changes, but working copy is not touched.  
**git reset --hard** - This needs to be used cautiously. As this uncommits, unstages and delete working copy changes too.  

- Which one is destructive and why?

Ans: **git reset --hard** - This needs to be used cautiously. As this uncommits, unstages and delete working copy changes too.  
  
- When would you use each one?

Ans:  
Use **--soft** when you want to undo commits by keeping all the changes in your staging area, ready to be re-committed.  
Use **--mixed** when you want to undo commits and unstage the changes, but keep the changes in your working directory, so that you can selectively re-eview and re-stage the changes.  
Use **--hard** cautiously, as it undo all uncommitted changes in both the staging area and the working directory. This is one of the few Git commands that can cause permanent data loss.  
  
- Should you ever use `git reset` on commits that are already pushed?

Ans: No, as **git reset** rewrites the commit history, which can cause significant problems and conflicts for other team members who have already based their work on those commits. It can lead to confusing merge conflicts and potentially lost work.  
  
---  
  
## Git revert  

- How is `git revert` different from `git reset`?
  
Ans: The **git reset** rewrites history by actually moving the branch pointer backwords; whereas **git revert** moves the branch pointer forward by creating a new commit to undo changes while preserving commit history.  

- Why is revert considered **safer** than reset for shared branches?
  
Ans: As **git revert** moves forward to undo changes while preserving the commit history rather than rewriting the history with **git reset**, which prevents breaking the shared branches in repository for team members in collaborative work.  

- When would you use revert vs reset?
  
Ans: In collaborative share branches repository, you should use **git revert**; whereas use **git reset** for cleaning up the local work.   
  
---    

## Reset vs Revert — Summary  
  
| | `git reset` | `git revert` |
|---|---|---|
| What it does | Rewrites the commit history for undoing the chnages | Preserves the commit history by creating a new commit for undoing the changes |
| Removes commit from history? | Yes | No |
| Safe for shared/pushed branches? | No | Yes |
| When to use | In your personal local | In shared branches repository |  

---  

## Branching Strategy  

- Which strategy would you use for a startup shipping fast?

Ans: **GitHub Flow** - using a single main branch with short-lived feature branches.  

- Which strategy would you use for a large team with scheduled releases?

Ans: **GitFlow** - using different branches like main (prod code), develop (development cycle), release (deployable), feature (isolating changes) etc. allowing features to be merged, tested, and polished in dedicated release/ branches without disrupting the next development cycle.  

- Which one does your favorite open-source project use? (check any repo on GitHub)

Ans: **GitHub Flow** for medium sized projects; whereas **GitFlow** for larger, complex projects needing strict release cycles.  
