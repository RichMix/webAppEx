# Intercepting Web Requests
Now that we have set up our proxy, we can use it to intercept and manipulate various HTTP requests sent by the web application we are testing. 
We'll start by learning how to intercept web requests, change them, and then send them through to their intended destination.

## Intercepting Requests
Burp
In Burp, we can navigate to the Proxy tab, and request interception should be on by default. 
If we want to turn request interception on or off, we may go to the Intercept sub-tab and click on Intercept is on/off button to do so:

## Burp Intercept On

Once we turn request interception on, we can start up the pre-configured browser and then visit our target website after spawning it from the exercise at the end of this section. 
Then, once we go back to Burp, we will see the intercepted request awaiting our action, and we can click on forward to forward the request:

## Burp Intercept Page
Note: as all Firefox traffic will be intercepted in this case, we may see another request has been intercepted before this one. 
If this happens, click 'Forward', until we get the request to our target IP, as shown above.

## ZAP
In ZAP, interception is off by default, as shown by the green button on the top bar (green indicates that requests can pass and not be intercepted). 
We can click on this button to turn the Request Interception on or off, or we can use the shortcut [CTRL+B] to toggle it on or off:

## ZAP Intercept On

Then, we can start the pre-configured browser and revisit the exercise webpage. 
We will see the intercepted request in the top-right pane, and we can click on the step (right to the red break button) to forward the request:

## ZAP Intercept Page

ZAP also has a powerful feature called Heads Up Display (HUD), which allows us to control most of the main ZAP features from right within the pre-configured browser. 
We can enable the HUD by clicking its button at the end of the top menu bar:

## ZAP HUD On

The HUD has many features that we will cover as we go through the module. For intercepting requests, we can click on the second button from the top on the left pane to turn request interception on:

   
## http://SERVER_IP:PORT/

Note: In some versions of browsers, the ZAP's HUD might not work as intended.

Now, once we refresh the page or send another request, the HUD will intercept the request and will present it to us for action:

   
## http://SERVER_IP:PORT/

We can choose to step to send the request and examine its response and break any further requests, or we can choose to continue and let the page send the remaining requests. 
The step button is helpful when we want to examine every step of the page's functionality, while continue is useful when we are only interested in a single request and can forward the remaining requests once we reach our target request.

Tip: The first time you use the pre-configured ZAP browser you will be presented with the HUD tutorial. You may consider taking this tutorial after this section, as it will teach you the basics of the HUD. 
Even if you do not grasp everything, the upcoming sections should cover whatever you missed. If you do not get the tutorial, you can click on the configuration button on the bottom right and choose "Take the HUD tutorial".

Manipulating Intercepted Requests
Once we intercept the request, it will remain hanging until we forward it, as we did above. We can examine the request, manipulate it to make any changes we want, and then send it to its destination. 
This helps us better understand what information a particular web application is sending in its web requests and how it may respond to any changes we make in that request.

## There are numerous applications for this in Web Penetration Testing, such as testing for:

SQL injections
Command injections
Upload bypass
Authentication bypass
XSS
XXE
Error handling
Deserialization
And many other potential web vulnerabilities, as we will see in other web modules in HTB Academy. So, let's show this with a basic example to demonstrate intercepting and manipulating web requests.

Let us turn request interception back on in the tool of our choosing, set the IP value on the page, then click on the Ping button. 
Once our request is intercepted, we should get a similar HTTP request to the following :

Code: http
POST /ping HTTP/1.1
Host: 46.101.23.188:30820
Content-Length: 4
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
Origin: http://46.101.23.188:30820
Content-Type: application/x-www-form-urlencoded
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
Referer: http://46.101.23.188:30820/
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
Connection: close

ip=1
Typically, we can only specify numbers in the IP field using the browser, as the web page prevents us from sending any non-numeric characters using front-end JavaScript. 
However, with the power of intercepting and manipulating HTTP requests, we can try using other characters to "break" the application ("breaking" the request/response flow by manipulating the target parameter, not damaging the target web application). 
If the web application does not verify and validate the HTTP requests on the back-end, we may be able to manipulate it and exploit it.

So, let us change the ip parameter's value from 1 to ;ls; and see how the web application handles our input:

   
http://SERVER_IP:PORT/

Once we click continue/forward, we will see that the response changed from the default ping output to the ls output, meaning that we successfully manipulated the request to inject our command:

   
http://SERVER_IP:PORT/

This demonstrates a basic example of how request interception and manipulation can help with testing web applications for various vulnerabilities, which is considered an essential tool to be able to test different web applications effectively.

Note: As previously mentioned, we will not be covering specific web attacks in this module, but rather how Web Proxies can facilitate various types of attacks. Other web modules in HTB Academy cover these types of attacks in depth.

Using Web Proxies   
Page 5
Intercepting Responses
Intercepting Responses
In some instances, we may need to intercept the HTTP responses from the server before they reach the browser. This can be useful when we want to change how a specific web page looks, like enabling certain disabled fields or showing certain hidden fields, which may help us in our penetration testing activities.

So, let's see how we can achieve that with the exercise we tested in the previous section.

In our previous exercise, the IP field only allowed us to input numeric values. If we intercept the response before it reaches our browser, we can edit it to accept any value, which would enable us to input the payload we used last time directly.

## Burp
In Burp, we can enable response interception by going to (Proxy>Options) and enabling Intercept Response under Intercept Server Responses:

Burp Enable Response Int

After that, we can enable request interception once more and refresh the page with [CTRL+SHIFT+R] in our browser (to force a full refresh). When we go back to Burp, we should see the intercepted request, and we can click on forward. Once we forward the request, we'll see our intercepted response:

## Burp Intercept Response

Let's try changing the type="number" on line 27 to type="text", which should enable us to write any value we want. We will also change the maxlength="3" to maxlength="100" so we can enter longer input:

Code: html
<input type="text" id="ip" name="ip" min="1" max="255" maxlength="100"
    oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
    required>
Now, once we click on forward again, we can go back to Firefox to examine the edited response:

   
http://SERVER_IP:PORT/

As we can see, we could change the way the page is rendered by the browser and can now input any value we want. We may use the same technique to persistently enable any disabled HTML buttons by modifying their HTML code.

Exercise: Try using the payload we used last time directly within the browser, to test how intercepting responses can make web application penetration testing easier.

## ZAP
Let's try to see how we can do the same with ZAP. As we saw in the previous section, when our requests are intercepted by ZAP, we can click on Step, and it will send the request and automatically intercept the response:

## ZAP Intercept Response

Once we make the same changes we previously did and click on Continue, we will see that we can also use any input value:

   
http://SERVER_IP:PORT/

However, ZAP HUD also has another powerful feature that can help us in cases like this. While in many instances we may need to intercept the response to make custom changes, if all we wanted was to enable disabled input fields or show hidden input fields, then we can click on the third button on the left (the light bulb icon), and it will enable/show these fields without us having to intercept the response or refresh the page.

For example, the below web application has the IP input field as disabled:

   
http://SERVER_IP:PORT/

In these cases, we can click on the Show/Enable button, and it will enable the button for us, and we can interact with it to add our input:

   
http://SERVER_IP:PORT/

We can similarly use this feature to show all hidden fields or buttons. Burp also has a similar feature, which we can enable under Proxy>Options>Response Modification, then select one of the options, like Unhide hidden form fields.

Another similar feature is the Comments button, which will indicate the positions where there are HTML comments that are usually only visible in the source code. We can click on the + button on the left pane and select Comments to add the Comments button, and once we click on it, the Comments indicators should be shown. For example, the below screenshot shows an indicator for a position that has a comment, and hovering over it with our cursor shows the comment's content:

   
http://SERVER_IP:PORT/

Being able to modify how the web page looks makes it much easier for us to perform web application penetration testing in certain scenarios instead of having to send our input through an intercepted request. Next, we will see how we can automate this process to modify our changes in the response automatically so we don't have to keep intercepting and manually changing the responses.

+10 Streak pts

Table of Contents
Getting Started
Web Proxy
Web Fuzzer
Web Scanner
Skills Assessment
My Workstation



# Automatic Modification

We may want to apply certain modifications to all outgoing HTTP requests or all incoming HTTP responses in certain situations. In these cases, we can utilize automatic modifications based on rules we set, so the web proxy tools will automatically apply them.

# Automatic Request Modification
Let us start with an example of automatic request modification. We can choose to match any text within our requests, either in the request header or request body, and then replace them with different text. For the sake of demonstration, let's replace our User-Agent with HackTheBox Agent 1.0, which may be handy in cases where we may be dealing with filters that block certain User-Agents.

Burp Match and Replace
We can go to (Proxy>Options>Match and Replace) and click on Add in Burp. As the below screenshot shows, we will set the following options:

# Burp Match Replace

Type: Request header	Since the change we want to make will be in the request header and not in its body.
Match: ^User-Agent.*$	The regex pattern that matches the entire line with User-Agent in it.
Replace: User-Agent: HackTheBox Agent 1.0	This is the value that will replace the line we matched above.
Regex match: True	We don't know the exact User-Agent string we want to replace, so we'll use regex to match any value that matches the pattern we specified above.
Once we enter the above options and click Ok, our new Match and Replace option will be added and enabled and will start automatically replacing the User-Agent header in our requests with our new User-Agent. We can verify that by visiting any website using the pre-configured Burp browser and reviewing the intercepted request. We will see that our User-Agent has indeed been automatically replaced:

# Burp Match Replace

ZAP Replacer
ZAP has a similar feature called Replacer, which we can access by pressing [CTRL+R] or clicking on Replacer in ZAP's options menu. It is fairly similar to what we did above, so we can click on Add and add the same options we used earlier:

# ZAP Match Replace

Description: HTB User-Agent.
Match Type: Request Header (will add if not present).
Match String: User-Agent. We can select the header we want from the drop-down menu, and ZAP will replace its value.
Replacement String: HackTheBox Agent 1.0.
Enable: True.
ZAP also has the Request Header String that we can use with a Regex pattern. Try using this option with the same values we used for Burp to see how it works.

ZAP also provides the option to set the Initiators, which we can access by clicking on the other tab in the windows shown above. Initiators enable us to select where our Replacer option will be applied. We will keep the default option of Apply to all HTTP(S) messages to apply everywhere.

We can now enable request interception by pressing [CTRL+B], then can visit any page in the pre-configured ZAP browser:

## ZAP Match Replace

Automatic Response Modification
The same concept can be used with HTTP responses as well. In the previous section, you may have noticed when we intercepted the response that the modifications we made to the IP field were temporary and were not applied when we refreshed the page unless we intercepted the response and added them again. To solve this, we can automate response modification similarly to what we did above to automatically enable any characters in the IP field for easier command injection.

Let us go back to (Proxy>Options>Match and Replace) in Burp to add another rule. This time we will use the type of Response body since the change we want to make exists in the response's body and not in its headers. In this case, we do not have to use regex as we know the exact string we want to replace, though it is possible to use regex to do the same thing if we prefer.

# Burp Match Replace

Type: Response body.
Match: type="number".
Replace: type="text".
Regex match: False.
Try adding another rule to change maxlength="3" to maxlength="100".

Now, once we refresh the page with [CTRL+SHIFT+R], we'll see that we can add any input to the input field, and this should persist between page refreshes as well:

Burp Match Replace

We can now click on Ping, and our command injection should work without intercepting and modifying the request.

Exercise 1: Try applying the same rules with ZAP Replacer. You can click on the tab below to show the correct options.

Exercise 2: Try adding a rule that automatically adds ;ls; when we click on Ping, by matching and replace the request body of the Ping request.


