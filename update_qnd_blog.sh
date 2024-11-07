#!/bin/bash

# Directory where blog posts are stored
BLOG_DIR="."
INDEX_FILE="index.html"

# Ask the user if they want to run debug mode or not.
read -p "Do you want to run the script in debug mode? (y/n): " debug_mode

# Scan for HTML blog post files generated by the blog creation script
echo "Scanning for blog posts in '$BLOG_DIR'..."

# Check if there are any HTML files that match the blog post pattern
HTML_FILES=($(find "$BLOG_DIR" -name "blog_post_*.html" -type f))

# If no HTML files found, exit
if [ ${#HTML_FILES[@]} -eq 0 ]; then
    echo "No HTML blog posts found in '$BLOG_DIR'."
    exit 1
fi

# Start the index.html content
index_content="
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>blog</title>
    <style>
        body {
            font-family: monospace;
            background-color: #211f31;
            color: #333;
            margin: 0;
            padding: 0;
        }
        header {
            color: white;
            text-align: center;
            padding: 20px;
        }
        a {
            text-decoration: none;
        }
        h1 {
            margin: 0;
        }
        article {
            padding: 20px;
            margin: 20px auto;
            max-width: 800px;
            background-color: white;
            border-radius: 8px;
            margin-top: 10%;
        }
        .post-list {
            margin: 20px auto;
            max-width: 800px;
        }
        .post-list ul {
            list-style-type: none;
            padding: 0;
        }
        .post-list li {
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        .post-list a {
            text-decoration: none;
            color: #2c3e50;
            font-size: 1.2em;
        }
        .post-list .date {
            color: #7f8c8d;
            font-style: italic;
        }
    </style>
</head>
<body>


<article>
    <h2>Blog Posts:</h2>
    <div class='post-list'>
        <ul>
"

# Loop through all blog post HTML files matching the pattern
for file in "${HTML_FILES[@]}"; do
    echo "Processing file: $file"

    # Extract the title (using a simple grep)
    title=$(grep -o '<title>.*</title>' "$file" | sed 's/<title>\(.*\)<\/title>/\1/')

    # Extract the date (using sed for matching <p class="date"> or <p class='date'>)
    date=$(sed -n "s/.*<p class=['\"]date['\"][^>]*>\([^<]*\)<\/p>.*/\1/p" "$file")

    # Debug: Print extracted title and date
    echo "Extracted title: '$title'"
    echo "Extracted date: '$date'"

    # If title or date is not found, skip the file and print an error message
    if [ -z "$title" ] || [ -z "$date" ]; then
        echo "Skipping file '$file' due to missing title or date."
        continue
    fi

    # Create a list item with a link to the blog post
    index_content+="
            <li>
                <a href='$file'>$title</a><br>
                <span class='date'>$date</span>
            </li>
"
done

# Close the list and HTML structure
index_content+="
        </ul>
    </div>
    <a href="http://doggoli.mooo.com"><~~ back to the main page</a>
</article>


</body>
</html>
"

# Initialize the debug variable

if [[ $debug_mode == "y" || $debug_mode == "Y" ]]; then

    # Output raw content of the file to help with debugging
    echo "Raw content of '$file':"
    cat "$file"
fi

# Write the content to the index.html file
echo "$index_content" > "$INDEX_FILE"
echo "Index file '$INDEX_FILE' has been generated."
