<h1>qnd-blog - Quick and Dirty Blogging Shell Script</h1>

There are two main shell script files. One responsible for creating the blog posts itself and the other responsible for updating the main index.html file which contains all the blog posts. The base itself was generated using ChatGPT (because I am lazy as fuck) but heavy modifications were carried out to implement certain features such as images and a general styling rebrand to fit my own personal website (doggoli.mooo.com).

<h2>Installation:</h2>

It's a shell script. Just download it and use ```chmod +x``` dummy!

<h2>Usage:</h2> 


Simply run *"qndblog.sh"* which will prompt you with some basic info about creating a blog post such as the title, date and whether or not you want to include images within your post.

<h4>To include an image input the link to the image hosted on your website (e.g. http://doggoli.mooo.com/blog/images/git.png), or if you're running the script locally you can simply input the path to the images that you want to include. You can include multiple images by separating them with spaces</h4>

```
andrija@leliel:~$ ./qndblog.sh
Enter the title of your blog post:
Enter the date of the post (e.g., 2024-11-05):
Do you want to include an image in your post? (y/n):
```

Once you've finished with the basic information, you will be bounced into nano which is the editor in which you can write your blog post. Maybe I'll implement a nicer way to select editors maybe not, we'll see, I like nano a lot. But for now you can just modify the script to replace nano with vim or ed or emacs or whatever the fuck you'd like. Once you're done just save it and it will automatically generate an HTML file with the title *"blog_post_YYYYMMDDHHMMSS"* in the current working directory.

After that just run the update script:

```
andrija@leliel:~$ ./update_qnd_blog.sh
Do you want to run the script in debug mode? (y/n): 
```
You will be prompted to choose if you want to run the script in debug mode which will automatically display the contents of the newly indexed blog posts.
Once you make the decision it will automatically scan the current working directory for new files and regenerate the *"index.html"* with new posts.


<h2>Modification:</h2>

It's a shell script.

<h2>Bugs and Future Plans:</h2>

So far it seems to work fairly OK, ~~with the exception that it does not remove the file in *"/tmp"* once the blogpost is finished. So you have to backspace the fuck out of your previous blog entry before writing a new one (or just null the file). So I'll see if I can fix that soon enough.~~
The file is now nulled on it's own, bug fixed. It works great now. I also added debug mode which allows for insight into what you're doing in case something isn't right!

In terms of future features, first and foremost I'd like for this to be more well rounded and not a task split in two by separate scripts. However in terms of actual features, it'd be nice if you could select what editor you'd like to use, maybe a better way of directly editing the HTML and CSS so that you can easily swap styles, some minor refinements like that. Overall nothing too special, I want to keep it as minimal as possible.

<h2>FAQ</h2>

- <h4>Why didnt you just use lb?</h4>

  * It sucks, also fuck Luke Smith.

