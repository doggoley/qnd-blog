<h1>qnd-blog - Quick and Dirty Blogging Shell Script</h1>

There are two main shell script files. One responsible for creating the blog posts itself and the other responsible for updating the main index.html file which contains all the blog posts. The base itself was generated using ChatGPT (because I am lazy as fuck) but heavy modifications were carried out to implement certain features such as images and a general styling rebrand to fit my own personal website (doggoli.mooo.com).

<h2>Installation:</h2>

It's a shell script. Just download it and use ```chmod +x``` dummy!

<h2>Usage:</h2> 

Initialize the blog by launching the update script for the first time:

```
./update_qnd_blog.sh
```
This will create a folder called *"blog_posts"* in whatever directory you ran/initialized it. I recommend moving *"qndblog.sh"* into this folder so that you don't have to move every single blog entry manually into the *"blog_posts"* folder once you've created it. I will try to somehow automate that process so that you don't have to do this in the future...

After you've done that you can run *"qndblog.sh"* which will prompt you with some basic info about creating a blog post.

```
andrija@leliel:~$ ./qndblog.sh
Enter the title of your blog post:
Enter the date of the post (e.g., 2024-11-05):
Do you want to include an image in your post? (y/n):
```

<h4>To include an image either input a direct path or if you've placed them in the "blog_posts" folder just the name of the image will suffice.</h4>

Once you've finished with the basic information, you will be bounced into nano which is the editor in which you can write your blog post. Maybe I'll implement a way to select editors maybe not, we'll see, I like nano a lot. Once you're done just save it and it will automatically generate an HTML file. 

After that just run the first script again:

```
./update_qnd_blog.sh
```

It will automatically scan the folder *"blog_posts"* for new files and regenerate the *"index.html"* with new posts.

<h2>Bugs and Future Plans:</h2>

So far it seems to work fairly OK, with the exception that it does not remove the file in *"/tmp"* once the blogpost is finished. So you have to backspace the fuck out of your previous blog entry before writing a new one (or just null the file). So I'll see if I can fix that soon enough.

In terms of future features, first and foremost I'd like for this to be more well rounded and not task split in two by separate scripts. However in terms of actual features, it'd be nice if you could select what editor you'd like to use, maybe a better way of directly editing the HTML and CSS so that you can easily swap styles, some minor refinements like that. Overall nothing too special, I want to keep it as minimal as possible.

<h2>FAQ</h2>

- <h4>Why didnt you just use lb?</h4>

  * It sucks, also fuck Luke Smith.

