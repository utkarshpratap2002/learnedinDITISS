## `mkdir` 

Use `-p` to create complete tree of file system within one command, you need to specify the intermediate path (i.e., parent directories) for this command and you'll be able to create the intermediate directories without any errors.

```
❯ mkdir -p fruit/apple fruit/banana vegetables/broccoli vegetables/capsicum vegetables/spinach
❯ ls
fruit      vegetables
❯ tree
.
├── fruit
│   ├── apple
│   └── banana
└── vegetables
    ├── broccoli
    ├── capsicum
    └── spinach

8 directories, 0 files
```

If you don't specify the `-p` then if you try `mkdir /home/usr/docs/project`, if `/homeusr/docs` aren't created already, this will throw an error, so with `-p` you can specify the complete path.


## `rmdir`
Use `rmdir` along with the `-p` to recursively delete the directories. For example, if you do `rmdir -p /monkey/cow/snake`, then the directories till the monkey will be deleleted, if `snake`, `cow`, and `monkey` are empty directory. 

But if the monkey is not a empty directory, then the deletion will happen only till `lion`. Remember that this deletion happens in reverse order, deletion happens from the very last directory that is empty till the directory is found **non-empty**.

```
❯ mkdir -p monkey/cow/snake monkey/lion
❯ ls
monkey     
❯ tree monkey
monkey
├── cow
│   └── snake
└── lion

4 directories, 0 files
```

When we have a directory **monkey**, we have a non-empty directory containing the cow and lion. When we use the `-p` to **`rmdir`** with the path `monkey/cow/snake` .......

```
❯ rmdir -p monkey/cow/snake
rmdir: monkey: Directory not empty
❯ ls
monkey    
❯ ls monkey
lion
❯ tree monkey
monkey
└── lion

2 directories, 0 files
```