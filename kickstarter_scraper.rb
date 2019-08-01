require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  binding.pry
end

create_project_hash

# projects: kickstarter.css("li.project.grid_4")
#titles: kickstarter.css("h2.bbcard_name strong a").text
# image link: kickstarter.css("div.project-thumbnail a img").attribute("src").value
#descriptions: kickstarter.css("p.bbcard_blurb").text