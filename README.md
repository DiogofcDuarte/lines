# README

* How does your system work? (if not addressed in comments in source)
    By running build it installs rbenv and then ruby 3.2.0, it installs bundler, rails 8.0.2 and does bundle install.
    This build assumes it will be run in macOS and brew is installed.
    It parses the file supplied and saves the offsets of each line in cache, which in this case is file_storage.
    It saves the offsets in tmp/cache/files. Once the file has been fully parsed the server starts and is ready to receive requests.
    It has only one route /lines/:line which will respond with a json with the text of the line and status 200 ok if it exists or 413 if it does not.

* How will your system perform with a 1 GB file? a 10 GB file? a 100 GB file?
    The system handles a 1GB, 10GB file with no issues. I am confident it would be capable of even handling an 100GB file in its current iteration but I didn't generate one to try. However eventually with a big enough file this solution would need to be improved.
    At least the offset caching would have to be distributed or optimized to scale efficiently.

* How will your system perform with 100 users? 10000 users? 1000000 users?
    System would work fine with 100 users. 10000 users I'm sure there would be bottlenecks and have some issues but should work and 1000000 users would definitely not be possible.

* What documentation, websites, papers, etc did you consult in doing this assignment?
    I mostly used chatgpt and stackoverflow.

* How long did you spend on this exercise? If you had unlimited more time to spend on this, how would you spend it and how would you prioritize each item?
    I spent around 4h I believe. Mostly second guessing if I did enough/addressed it correctly, and then making sure it could be ran and testing it with files. If I had unlimited time I would firstly set up redis to store my offsets and cache my responses. 
    But to reach 1000000 users I would probably need to have multiple servers with load balancing and auto scaling mechanisms in order to achieve that.

* If you were to critique your code, what would you have to say about it?
    The code is simple, I'm worried I missed the mark or the goal of this challenge however I think there is room to discuss the decisions and the thought process behind it.
