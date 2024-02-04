---
title: "Rails Sitepress"
description: "A static site generator for Rails"
tags: ["rails", "sitepress", "static site generator"]
---

I started building an application to help start my consulting business several months ago. It had the usual arc
that many of my side projects take: a bang in the start and then a fizzle follows. How dark it gets in the winter
had something to do with my slowdown, but I also slowed down because my initial "big bang" wasn't big enough. 

## Symfony UX

I was building my consulting app using Symfony and PHP. However, it wasn't the combination of Symfony + PHP that
attracted me to that stack. While I have plenty of PHP experience and some Symfony experience, I was most interested
in what people call the "Hotwire stack" these days: HTML-over-the-wire.

The techniques used in Hotwire date back many years, but I first saw them being used in the Phoenix web framework 
built with Elixir. Phoenix/Elixir devs mainly came from the Rails world, so it's not surprising that Rails had 
Hotwire in the works and made it the default frontend for Rails 7 released around December of 2021.

It didn't take long for Symfony to take notice and create "Symfony UX". They actually started in December 2020, but 
I didn't notice until around the middle of 2022. By that time both Turbo and Stimulus had been integrated and you 
could build an application in the same way you could with Rails, at least it seemed. 

## htmx

htmx is a library that can be seen as a competitor to Hotwire. After looking into both, you'll see that they aren't 
really competitors, but for the less informed, it's common to see "hotwire vs htmx" questions arise. I would say 
that you can use htmx to build a hotwire stack, and once you start using hotwire, you're building on many more 
abstractions than htmx.

I once did a presentation on htmx, Hotwire, and another similar library called Unpoly. htmx was my clear favorite 
mainly for the better documentation and straightforward approach. However, I also noted that if you are using Rails, 
then it would be way better to just use Hotwire since it is integrated in Rails by default. If you're curious, you 
can learn more about my rundown in the following video:

https://www.youtube.com/watch?v=lOmhnU51sQM

So, I embarked to build my application using Symfony and htmx and trying to keep things as simple as possible. I got 
some things to work, but then I noticed I was adding a bunch of custom code to approximate what Hotwire does with 
simple configuration. 

## Main Problems

The first problem I ran into with my old site was loading and rendering markdown. I could find packages that helped 
parse markdown files, but I didn't look too far into having static files integrated into a Symfony site. So, I 
decided to tackle that problem with some custom code. 

The code worked fine initially, but then I started wanting to filter by month, tag, etc. and with that comes more 
custom code. On top of that, I started wondering if I should have a database to store filtering information or write 
out files with that information already included.

To be honest, I was learning a ton about PHP, including PHP serialization files and how storing data in that format 
allows for you to keep class information for de-serializing and normalization. Without that knowledge, I might have 
tried to use plain JSON or a simpler format. However, learning such low-level information was keeping me from my 
goal of starting a consulting business. 

I also had nasty CLS, cumulative layout shift, on my homepage since I initially show only data gathered from parsing 
the file name and lazily load data from parsing markdown using htmx. Logically, it made sense to lay out my list of 
blog posts this way in order to load the fastest, and it also gave me an excuse to use htmx. I think use of modern 
CSS techniques would have fixed my CLS issue, but also the way I set up the blog post listing was probably overkill.

Finally, I wanted to include UI components in my app so I could break pages up and handle logic within those UI 
components like pretty much everyone does on the frontend these days. Sending back HTML fragments using htmx was 
working well, but merging the CSS was not working. I eventually came up with a hacky, maybe clever, way of merging 
CSS only to find out htmx has an extension you can install to merge CSS in the head. If only I knew that sooner...

At the end of the day, I was spending far too much time in the plumbing, and I kept thinking I should just adopt 
Symfony UX fully which would have me ditching htmx for Hotwire.

## Switch to Rails

- saw several things I liked and was trying to build, including Sitepress
- Sitepress handles all the markdown needs. Even with custom markdown extensions that I didn't get to in Symfony.

Coming to an impasse with my consulting app development direction, I was simultaneously coming to an impasse with my 
job. I'm a contractor, and when I get close to ending one contract my company introduces me to new project 
possibilities. The opportunities usually center around PHP and the Drupal CMS framework, but this time I was sent a 
project including Ruby and Go.

If you had asked me what the chances of me working on a Ruby project was two weeks ago, I would have said 0%, or at 
least a conservative 1%. However, now my odds are at least 60% after one conversation. I can't be assured that I 
will end up working with Ruby at my current job, but I sure feel like I should prepare. Plus, I already have some 
Ruby/Rails experience and really liked the people I met when I was first learning.

Since I'm subscribed to Ruby Weekly, I started looking at the articles with more interest, and one of them caught my 
eye: a post on choosing a Rails-based tech stack in 2024. The author lists all the Ruby gems they decided to use and 
why they chose them.

https://allaboutcoding.ghinda.com/the-tech-stack-i-choose-to-build-my-email-courses-project

It was while reading that post I started thinking, "Holy crap, several things I've had to custom build have great 
solutions I can just simply configure." One of the things was Sitepress, and that's what I'm using to render this 
post into HTML. 

## Sitepress

I won't go over how to start a Rails project since it's a famously easy web framework to get started with. I also 
won't go over installing Sitepress since that is rather easy to do as well. My perspective will describe what a 
seasoned developer needs to do after initial installation in order to get posts rendering at `/posts` like in my 
PHP/Symfony-based version of this same app.

To follow along, before you continue reading, add these two gems and run the install commands:

- Sitepress - https://sitepress.cc/
- rails-markdown - https://github.com/sitepress/markdown-rails

My first action was to create a markdown file in the `app/content/pages` directory. I briefly looked at the 
generated helper and model file, but I wanted to get my thoughts down before exploring any farther. 

### Non-root Route

Sitepress generates two routes for you in the initial install command.

```ruby
Rails.application.routes.draw do
  sitepress_pages
  sitepress_root
  # ...other routes...   
end 
```

The root route sends your app to the `app/content/pages/index.html.erb`, but that isn't what I want here. I want my 
pages to load at `/posts` and not `/`. My homepage will list some posts and link to the posts listing page, but I 
want the homepage to be more dynamic...or at least I thought.

