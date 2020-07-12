### For building docker container
`docker build . -t random_word`

### For running the docker container
`docker run -p 3000:3000 random_word`

### Verifying the app
Now you can go to url http://localhost:3000 and click on a button to random generate the word

There are two approaches to fetching the random word.
1. Generate random number and read the lines until you reach the line and return
2. Store the words in DB and read the word by its primary on generating the random number

The later approach is always efficient and scalable as it uses DB and we don't need to read all the way down to interested random word. It works perfectly.
The former approach is implemented for the sake of it.
