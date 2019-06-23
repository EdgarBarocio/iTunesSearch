# iTunesSearch
Quick search using iTunes API

It used Clean-Swift architecture to ensure responsibility of each class is separated, this helps with easy debugging. For example, I got no results from the iTunes call, and this was caused not by faulty requests, but because after parsing the data, it was not being sent to the view controller

For networking I just used a simple URLSession, because the search was only text, and the url elements handled spaces natively, I saw no need to add an external library like Alamofire, since it was a simple request. It uses JSONSerialization to create a model object of the search results, returning an array of songs in the end. 

For simplicity, on the search query to the iTunes api, I limited it to only display songs, adding media=music&entity=song& to the search URL

To display results, I used a CollectionView with custom cells and custom layout, the custom layout allows for further changes down the line. Currently displays two results per row, but easily adjusted on the custom flow. Custom cells only display Artwork, Artis and Title, the iTunes API has a lot more info in it, but due to time constrains I did not add anything. This is where custom cells come into play, the model can be expanded to include more pieces of information and the cell can later be modified to include those new pieces of information. 

Limitations in my delivery:

1- I did not check for network connectivity/reachability before doing a search, in the case of a network outage, it will return no results found instead of displaying a message.
2- I was not able to implement unit tests on the project. Clean-Swift makes this process much easier, but I was not able to implement it.
3- I noticed the iTunes API allows for the song preview. I ran out of time before I could try and implement a “Preview Song” functionality, like the iTunes app has.
4- I could not figure out how to implement a “Clear all” functionality if the search field is blank/deleted, allowing the app to go back to an initial state, I do prevent a search if the text field only contains white spaces.
5- For error handling on the search I did not pass the error in the completion handlers, I could have passed it and include logic to display a UIAlertController to display possible error, now, it only displays no results and prints the error in the console. 
