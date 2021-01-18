# Cupcake-Corner
App that lets user customize what type of cupcake they want from preselected options.

## What Technology / Techniques it Uses:
 The app uses a custom Order class to keep track of the user's order across multiple views (price, cupcakeType, etc)
 
 - Wrote custom implementation of Codable to handle class published data
 - Sent JSON over to https://reqres.in using a POST http request (URLRequest, URL, URLSession)
    - this website will send us back the data we send it
 - Receive data back from website and display it to user
 
 ## Potential
 This app could potentially become, if heavily modifies, an app where the user buys something from a website. The fact that we send data to the website and 
 receive back a confirmation opens up possibilities.
