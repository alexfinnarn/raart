---
title: "Investigating Bridgetown"
description: "Another static site generator for Rails?"
tags: ["bridgetown", "static site generator", "roda"]
layout: post
---

In my last post, I detailed how I was switching from a PHP-based solution for my personal site to a Ruby-based 
solution. Not knowing much about Ruby, I of course chose Rails, and then I saw Sitepress as a great way to include a 
static file, bloggy part of an application. This works well with my intent to learn Rails while at the same time be 
able to post about what I'm learning in markdown.

And if you read some of my older posts where I go into building the PHP-based solution, you'll see I struggled with 
deciding on using htmx or Turbo. Maybe I'm doomed to continually find out better solutions to ones I'm working on, 
but I certainly consciously want to pick something and stick with it. So, a couple of days ago, I would have been 
continuing on with Sitpress, but then I found Bridgetown.

By all accounts, Bridgetown looks and feels better maintained than Sitepress. Let's pause here and I'll give you 
links you can look at to follow along:

- Sitepress code: https://github.com/sitepress/sitepress
- Sitepress docs: https://sitepress.cc/getting-started/rails
- Bridgetown code: https://github.com/bridgetownrb/bridgetown
- Bridgetown docs: https://www.bridgetownrb.com/docs

Glancing at the GitHub repos we can check things like activity, stars, repo pulse, etc. and get an idea of the 
trajectory of each project. Going by stars, activity, downloads, and really just about any metric, it looks like 
Bridgetown has more going on with its project. Sitepress is a bit older and has more of a gap in development. 

Moving onto the documentation, once again, I can tell that Bridgetown has more features and describes how to use the 
software in more detail. Since I don't have much knowledge of Ruby or Rails, I definitely like seeing comprehensive 
documentation, and Sitepress' docs didn't give me a comprehensive overview of everything. For instance, there was no 
mention of how layouts worked and how to tie them to content via front matter.

## Setup and Introduction

Bridgetown tells you to set up a site using the `bridgetown` gem whereas I'm using Sitepress to embed into a Rails 
app. So setup with Bridgetown is more involved than Sitepress, but of course you get more features. 

After a short intro on how to create a Bridgetown site, the docs delve into core concepts starting with a build. I'm 
more looking to have a server at all times so I can run logic as well as host static markdown so the build process 
is not my cup of tea. I suppose I could pivot to hosting just static content, but I'm pretty sure I'll want some 
kind of API. 

Also, while reading the build process docs, it states that the whole build runs each time you change a file. This 
seems odd to me after working with a SSG like Next.js where you have a dev server that builds routes on-demand and 
also a separate command that builds out the whole site. I may be missing things, but I'm not sure why there isn't a 
dev server for local development and a separate build process that runs through all content.

I couldn't actually get through all the setup from reading the docs, especially after I read this section:

> But as the concepts of modern static site generation and the “Jamstack” came to the forefront, a whole new 
> generation of tools rose up, like Hugo, Eleventy, Next.js, and many more. In the face of all this new competition, 
> Jekyll chose to focus on maintaining extensive backwards-compatibility and a paired-down feature set—noble goals 
> for an open source project generally speaking, but ones that were at odds with meaningful portions of the web 
> developer community. 

I'm trying to escape Next.js and here this project seems to think those projects and churn are good ideas. Maybe 
this is not for me, I think. I'm definitely at odds with portions of the web dev community, but I'm not sure my odds 
are "meaningful"...what the hell does that mean anyways? Like why add "meaningful" in the first place. It's not a 
good adjective to describe anything in that sentence.

Contrast that paragraph with one from the non-goals section of Sitepress' docs.

> Become a kitchen sink - One of the main goals of Sitepress was to have minimal dependencies so that it could be 
> easily embedded into other frameworks, like Rails, Sinatra, and Rack. It should be unaffected when upgrading those 
> respective frameworks. Middleman ships with an ActiveSupport dependency that makes upgrading Rails difficult; 
> Jekyll ships with fewer dependencies, but still includes many that are unnecessary for Sitepress to achieve its goals.

Now that's music to my ears. I definitely don't want to fight with dependencies, and I don't really need a whole lot 
of features to accomplish what I need. Judging from the "goals" section of each project's docs, I think Sitepress 
speaks more to me, even though the feature set is smaller and the project doesn't "look as cool".

## Writing Content

- Sitepress forked `rails-markdown`
- Took me a little while to understand render order and file extensions. I only had `.md` which looked like source code

With Sitepress, I simply set up markdown files in the posts directory and went from there. Sitepress forked the 
`rails-markdown` to maintain it, but you can also use Slim and Haml for templating. 

I did see examples where you could use erb syntax in markdown files, but it took me a while to figure out how to do 
that. Adding erb to any `post.md` file didn't do anything. When I went to view the page in my browser, it looked 
like it did in my IDE. 

Then it dawned on me that having multiple file extensions on a file meant that it was parsed by different renderers 
in an order. I had seen this in other languages like PHP where `template.html.twig` first uses Twig to render the 
variables and logic and then renders the full HTML. 

For Sitepress, I started with `post.html.md`, but that only got me as far as basic markdown syntax would take me. 
For more involved logic and to use components, I switch to `post.html.markerb` in order to use erb syntax. 

The [Bridgetown docs get into writing content](https://www.bridgetownrb.com/docs/structure), and it is pretty 
similar to the structure for Sitepress. You have layouts and content, called "posts", but then there's several more 
files for configuration and a `/plugins` directory to put more functionality into.

While looking through plugins is compelling, the most interesting part of the structure for me are the components. 
I'm not sure how to integrate tools like Hotwire into either Sitepress or Bridgetown. I've heard of ViewComponent as 
well...StimulusReflex, CableReady...I know some names of things that deal with UI stuff, but I'm not sure they "just 
work" in any view layer.

### Components

Bridgetown has three different component types you can use: Liquid, Ruby, and Lit (Web Components). Lit has talk of 
hydration, which is fancier than I need, and Liquid talks of being simple. My Goldilocks choice would be the Ruby 
components if I were to use Bridgetown.

The [Ruby component docs](https://www.bridgetownrb.com/docs/components/ruby) have a lot of information on how to use 
them and also discuss ViewComponent integration. Since Bridgetown is not built on Rails, they have some kind of shim 
layer you can use to integrate with ViewComponent. Other topics include slotted content and view helpers. 

Once again, I see a lot of caveats and "choose your own adventure" notes which makes me feel like it isn't a 
"convention over configuration" type of project.

## Layouts

Bridgetown has layout support similar to how Sitepress works. You put layouts in a special `_layouts` directory and 
usually have a bade layout your posts can inherit. Sitepress seems to recommend having a base `body` layout and then 
`main_layout` and however many layouts you'd want to create around post types.

Just like with Sitepress where you can use `current_page.data` in layouts to render something like a title, 
Bridgetown has `resource.data` available in layout templates. It will pull from your frontmatter to get the data 
with the key you want, e.g. `resource.data.title` will pull the title key from the frontmatter. Then, you can use a 
`layout` key in the frontmatter to declare what layout a post uses when rendered.

The only major difference I saw between Sitepress and Bridgetown's implementation of layouts is that Bridgetown has 
the concept of a `layout.data` that can pick up frontmatter variables in layouts. You could create a view helper and 
use erb to do that in a Sitepress layout so I'm not that impressed, but it is different. I'm not even sure why you 
would need this feature since the variable is in the same file as the layout...but I guess you could use it in a 
post where you want to reference layout data occasionally but not all the time. 
 
## Plugins and Extensibility

One of the main advantages of using Bridgetown instead of Sitepress is the ecosystem of plugins. Since Sitepress is 
built on top of Rails, you can argue Sitepress has more plugins available, but here I am simply judging from the 
marketing websites and what they have to say. 

https://www.bridgetownrb.com/plugins

As you can see from the list of plugins, Bridgetown has a lot of capabilities and can mirror what Rails has in many 
categories. However, Rails will likely always be bigger than Bridgetown and so you'd have to play catch up all the 
time. 

## Conclusion

If I knew more about Ruby and had used Rails for a while, I'd probably be more interested in what Bridgetown has to 
offer. Roda seems interesting and more suited to an experienced Ruby web developer who wants a leaner version of 
Rails. The mention of all the SSG buzzwords I've seen in JS-land also tells me that the maintainers are trying to 
keep up with all the changes SSG tools are making across all programming languages.

For now, I will stick with Rails and be boring. I hope I can launch my site soon enough, and I'm sure I will revisit 
Bridgetown again after using Rails for awhile to see how the project evolves.



