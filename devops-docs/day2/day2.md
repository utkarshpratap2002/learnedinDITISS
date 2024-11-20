# Git 

## config : `.gitconfig`

There are global and local configuration, which is stored inside thr **.gitconfig** file that has the basic information of the user, or about the repository, if you want to show that kind of infrmation it is just like a description of the git repository. 

## hooks : 

It can be triggered with the action files, such `.action` file. It is something that gets triggered on an action, when you do **commit** the code, there is an action file for the commit. These are for the automation purpose where you need to start working on **tickets**, the product owner takes the responsibilty of working on particular story and **Jira** is through which all these things are done.

- Go to Atlassian, login in to the atlassian, this is the JIRA inrtrface.
- Git hooks are used to automate the tasks and 

## Info 


## Objects

There are four basic objects that git provides, one is **commit**, **tree**, **blob**, and **stash** object. 

- A blob object is created when you go for a `git add .` and this blob object has something like 32 characters, it first creates directory (something like 8c or blah blah blah) and then you can also go tfore looking for all the 38 characters name of the file, the content of the file will be displayed. Remember, becuase the git stores data in encrypted format, therefore you can't open the file directly, you need to do that using the following command.

```
git cat-file -p <file-id>
```

- When you commit the repository or any changes, another two files are created, one is tree that is pointing to th blob object that was created earlier, and another file tht got creted is commut object. So eventally there are three object are created when you create a commit. 

- But remember the root commit id and parent commit id when you do a commit, therefore, thre is root commit and then there is parent commit. And when you do a change in the file and commit it, it won't again create another tree and commit object, instead, it will only create one blob object on `git add .` and on commit, it will create a one commit and one tree object, if any new folder is not added, the tree object will remain same. 

## Refs

When you do a commit, it create a new refs to the latest commit 

# Brancing 

Branching is done in order to create another instance of the project, in order to make the feature code for the same code base or within the same project, so you can create a branch, also called **feature branch**. 

```
# Implement the code, that is being used.
```

# Merging by 'ort' Strategy

If you have a change in your branch and the commit is pointing to the latest change in your working directory, but when you move to main branch and then create a new file then there is another changein teh amain branch as well, then in that case if you tried making a merge there will another kind of commit, called speacial commit, because this time the merge is causing the commit, becaue this time there is changein the main branch as well.

This is caused when the main branch has different parent and that the branch that you were working on has different parent, in that case it is called merger commit.

Blob file's content is the one that matters, therefore you need understand that even if you created two different file and that if you tried making the **same** change on the same file but in two different branch, there will be problem, as the content of the blob file will be same, as thus, the merge commit will be rejected.

# Local Repository

The Repository contains remote object that is used for syncing the changes with remote machine, and therefore, people use Github where you can provide you code to other developers and therefore you can use the following command to get which repository you are working with.

```
git remote -v
```

If you want




