#!/bin/bash

# Function to create a formatted HTML file for the blog post
create_blog_post() {
    # Ask for the title, date, and image(s) to include in the post
    read -p "Enter the title of your blog post: " title
    read -p "Enter the date of the post (e.g., 2024-11-05): " date

    # Ask if the user wants to include an image
    read -p "Do you want to include an image in your post? (y/n): " include_image

    # Initialize image variable
    img_tag=""

    if [[ $include_image == "y" || $include_image == "Y" ]]; then
        read -p "Enter the path to the image(s) (or multiple images separated by spaces): " -a images
        img_tag="<div style='text-align: center; margin: 20px 0;'>"
        for image in "${images[@]}"; do
            # Ensure correct image path format (escape spaces, handle special chars)
            img_tag+="<img src='$image' alt='Blog Image' style='max-width: 100%; height: auto; margin-bottom: 20px;' />"
        done
        img_tag+="</div>"
    fi

    # Let the user write the content of the blog post in nano
    echo "Open nano to write the content of your blog post. Save and exit nano when you're done."
    nano /tmp/blog_content.txt

    # Read the content from the temporary file
    content=$(cat /tmp/blog_content.txt)

    # Define a simple HTML template
    html_content="
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>$title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        article {
            padding: 20px;
            margin: 20px auto;
            max-width: 800px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 2.5em;
            margin-bottom: 0.5em;
        }
        .date {
            color: #7f8c8d;
            font-style: italic;
        }
        p {
            line-height: 1.6;
            font-size: 1.1em;
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: #2c3e50;
            color: white;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

<header>
    <h1>$title</h1>
</header>

<article>
    <p class='date'>$date</p>
    $img_tag
    <p>$content</p>
</article>

<footer>
    <p>&copy; 2024 My Blog</p>
</footer>

</body>
</html>
"

    # Save the generated HTML content to a file
    output_file="blog_post_$(date +%Y%m%d%H%M%S).html"
    echo "$html_content" > "$output_file"
    echo "Your blog post has been created: $output_file"
}

# Run the function to create a blog post
create_blog_post
