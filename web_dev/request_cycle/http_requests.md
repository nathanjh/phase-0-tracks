#9.1 How the Web Works
##Release 0:
* 0.2
    - Some common HTTP status codes:
        + **200** OK...indicates that the request was successful.
        + **404** NOT FOUND...indicates that the origin server was unable to find the requested resource.
        + **500** INTERNAL SERVER ERROR...indicates that the server wasn't able to fulfill the request for some reason.
        + **401** UNAUTHORIZED...indicates that the resource requested was restricted (like a failed login)
        + **403** FORBIDDEN...same as above, but requested resource is forbidden/not able to be accessed/no login available    +
* 0.3  
    - Both GET and POST both submit requests to the server, but behave very differently in how they do so.  GET is typically used for requests where nothing is being changed in any siginificant way; in other words, making the same GET request will produce the same results regardless of how many times it is made.  GET requests also send parameters as part of the URL--making them less secure--and can be cached/bookmarked and remain in browser history. POST requests, on the other hand, are typically used to make requests to update/submit/change data in a significant way.  They are safer to use, as parameters are sent as part of the body of the request; they cannot be cached/bookmarked.
    - Cookies are pieces of data sent by the server (using the `Set-Cookie` header) when a browser request is made.  They are used to store information, and then sent back to the server (using the `Cookie` header) along with subsequent requests by the browser.  They are typically used to authenticate a session (by storing a unique id which is passed back and forth)...to access a shopping cart/ log into a website, etc. Because cookies can be modified to store information based on the browser's activity, they can be used to remember/ store user preferences, user data for autofilling forms, etc.  They can also be used to effectively track user activity...web sites visited, for how long, based on the requests made to the server.



