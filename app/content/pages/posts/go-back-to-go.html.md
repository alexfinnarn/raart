---
title: "Go Back To Go"
description: "All your data infrastructure, in a gem!"
tags: ["rails", "lightstack", "data infrastructure"]
---

I looked into Go as a programming language a few years ago. I had heard good things about its speed and simplicity. 
At one point, someone told me that Go was the modern replacement to C and Rust the modern replacement for C++. I 
won't go into what I think about that assertion, mostly because I am not well versed in C or C++, but the advice did 
orient me for my investigation. 

Initially, I used Go to host some static files that I needed to serve for work. I also was planning to use the same 
application stack for a URL shortener, and Go seemed like it would be the fastest at performing a quick lookup to 
match a path to a short URL. 

The project I made was very simple and just worked. I remember liking how the dependencies were gathered straight 
from the source instead of via a package manager, and I also like the formatting built into the language. I can't 
remember too much more than that since my project never grew to be more complex, and we deprecated that project 
eventually.

## Looking for Go projects on GitHub

Upon wanting to look into Go again, I set out to find projects people were open sourcing to follow their development 
and test them out. Recently, I've been using GitHub's exploration tool to see what's being liked across different 
programming languages.

Go-trending projects this month: https://github.com/trending/go?since=monthly

First on the list, when I looked, was a [note taking application called Memos](https://github.com/usememos/memos). I 
got excited to see what an MVC-like web app looked like in Go, but unfortunately, the frontend was in JS using React 
so it looked like any backend connected to a JS frontend. 

I've been getting into the "HTML over the wire" movement, and I'm mainly looking to render everything server-side 
with the AJAX communication only sending back HTML instead of JSON. I have plenty of reasons why I'm looking for 
application stacks that primarily serve HTML, and I don't want to go back to bloated frontends connected to a 
neutered backend.

The backend of the Memos app seemed to be very basic CRUD endpoints, which disappointed me. I wanted to learn 
something and I all I saw was basic data manipulation...with kind of ugly code, too. Moving on...

## Looking for Go projects on the Go website

I will say that the Go website is quite well done. Not knowing much, I wondered if I would be able to find out 
community resources as well as popular projects. Well, it didn't take me long to find the two sections I was looking 
for:

- Slack invite - https://invite.slack.golangbridge.org/
- Web development links - https://go.dev/solutions/webdev

The web development page has a great list of resources to look at for more information on how people commonly use Go 
to create web-based applications. You can view books, but I gravitated to the list of web frameworks. I remembered 
Buffalo from before, and I think that framework would be the one I try to use if I continue with learning Go. 

I tried to sign up to the Slack only to find out that I had already created an account. I barely remembered doing 
this, but upon returning to the Slack, I noticed it pointed me to a specific conversation about something a newbie 
had said. People were discussing "microaggressions" and I always find these conversations tiring. I tried not 
spending too much time reading through that old conversation, but it drained me a little bit.

Any time I look into a community and immediately I am hit with a sense of disdain, it makes me more reticent to 
continue investigating whether I should use the tool/framework/language vs. peacing out. With Go's syntax and 
general feel, I get a sense that people are a bit "pointy" for a lack of a better word. Coming from a very "squishy" 
PHP community, I'm not sure I can survive this group.

However, 99% of the time, the responses to newbie posts in the Gopher Slack are very welcoming. Unfortunately, sour 
responses upon first look can spoil a newcomers enthusiasm, even if 99% of the time, people are cool.

> No need for a web framework — “In most of the cases you really don’t need any third-party library.”

Yeah, hmmm...maybe this language is not for me. While I think I can create web apps using a programming standard 
library and without help, I do think saying this on the main web development marketing page for Go means something: 
Go developers will always want to write the code themselves vs. borrow from others. OSS is built on the concept of 
"standing on the shoulders of giants". How do those two viewpoints compliment each other? I'm not sure.

Other than "Go is fast", I didn't see anything that great as far as reasons to use Go for web development. With a 
penchant for writing custom code, though, I guess there can't be much else to say that is worth sharing.

## A dev survey to the rescue

I then looked at their recent blog posts to see what I could find. A recap of a recent developer survey begged me to 
read it: https://go.dev/blog/survey2023-h2-results

The first thing I noticed is that they kept mentioning questions where more experienced Go developers trended 
differently than less experienced "Gophers". In their minds, this meant that the more people used Go, the more they 
liked it, but they also admitted that people who disliked Go were likely to not continue answering the survey: 
survivor bias. Well, I think I have a third explanation. 

Go has been a language a lot of devs wanted to learn in the future, and over time, more devs have started learning 
it. At a certain tipping point, companies start adopting tools for their production applications that they were 
testing out on internal projects before. At that point, you need to hire for that particular role. No longer are 
devs "finding Go", instead they are "just looking for a job" which happens to use Go. 

Anytime you go from surveying early adopters who love and choose to use a language to including people who "just 
work here", you'll tend to start including a more representative sample you can compare to other established 
languages. My theory is that the more popular a language becomes, it inevitably starts tanking in satisfaction 
surveys. 

Initially, people might even lie to say they've used a piece of tech they've wanted to use. Having no penalty for 
lying, each survey includes a certain amount of dishonest answers, and these answers are probably mostly extreme 
praise of a language, like Go, they want to use but can't or extreme hatred of a language they don't really use, 
like PHP, but it is hip to hate on. Being a PHP developer, I share some sense of amusement seeing languages people 
fawn over lose faith when most devs are forced to use it whether they like it or not. It is what it is...

> A majority of respondents told us they either use templates or copy+paste code from existing projects when starting
> a new Go project.

I also found this statement kind of comical since the main Go web development page touts devs not wanting to use 
third-party code. I am in the same boat as the majority, and hence here I am looking for some copy pasta to learn 
more Go. Coupled with that statement were responses of newer Go devs not knowing how to structure a project.

Another conclusion of the survey around AI/ML had me scratching my head:

> Wholesale writing or translating of code was of fairly low interest, especially to developers with more than a year 
> or two of experience. Taken together, it appears that today, developers are less excited by the prospect of 
> machines doing the fun (e.g., creative, enjoyable, appropriately challenging) parts of software development, but 
> do see value in another set of “eyes” reviewing their code and potentially handling dull or repetitive tasks for them.

Isn't writing code a dull and repetitive task? Isn't the fun part of creating software seeing people use it and 
helping them improve it? 

I guess I am way outside of the Venn diagram for a successful Go programmer myself. I get very tired talking to 
people who think they can beat a computer at writing an algorithm. These same people think the LLM should be used 
for documentation purposes. 

WTF? Have you ever tried to get GitHub Copilot to write documentation? It's terrible at anything more than creating 
a table of contents for documentation you've already written. If Go devs start having LLMs write docs, then stick a 
fork in their community. What the hell? I just can't get over how backwards I think their conclusion on using AI/ML 
in coding is. 

I agree that using AI bots to write tests make sense, but you should also have the bot write your code. This is how 
you work. You think in natural language terms and then convert those thoughts to programming language constructs. 
You are much more capable of creating language than current LLMs. You are much worse at creating algorithms than 
these AI tools. If you don't realize this now, you'll be unemployable in ten years time. No one will wait for you to 
catch up once you've figured out how to use AI tools properly. 

## Error Handling

If you've used Go, then you know what this section is talking about. Apparently, core Go devs have no interest in 
adding exceptions to the language so you'll end up seeing error handling all over Go code. For the uninitiated, this 
causes confusion. 

You might think: "Boy, these Go devs must be sloppy since they keep checking for errors all over the damn code!" And 
you might be right. Just `if err != nil` to find out...and keep doing it again and again. I found it kind of amusing,
kind of sad, that the Go dev survey I viewed had several questions on error handling. Maybe I missed it, but I think 
Go is the first language I've read a survey about that has flame wars over exception handling.

Well, I've checked, and my `err == nil`. However, I refuse to return a tuple to you. I will instead move onto 
looking into another programming language, which will likely be Python. I guess with PHP, JS, and Ruby, I'm a 
scripting swashbuckler.

