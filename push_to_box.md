# Push scraped files from remote server to Box account
(Adapted from [BRC directions](https://github.com/ucberkeley/brc-draft-documentation/wiki/Transferring-Data-Between-Savio-and-Your-UC-Berkeley-Box-Account) to transfer from Savio)

First zip together all the files you want to push to Box, you can't (or don't want to) `put` a file structure.

```
zip -r name_of_zip.zip scraped_files/
```

If your zip file will exceeds the allotted maximum file size, you can split your zip file. For 1GB files:

```
zip -r -s 1000m name_of_zip.zip scraped_files/
```

Now we use [LFTP](http://lftp.tech) to push the zip file to Box:

```
lftp ftp.box.com
```

For encryption:

```
set ssl-allow true
```

Then enter you username and password.

```
user your_name@berkeley.edu
```

You can now use basic bash commands to navigate the file structure of your Box account. Use `pwd`, `cd`, `ls`, and `mkdir` to create a new directory and navigate into it. Then to transfer the file into the working directory of your Box account we use `put`: 

```
put name_of_zip.zip
```