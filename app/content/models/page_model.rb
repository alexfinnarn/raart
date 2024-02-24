class PageModel < Sitepress::Model
  collection glob: "**/*.md*"
  data :title
end
