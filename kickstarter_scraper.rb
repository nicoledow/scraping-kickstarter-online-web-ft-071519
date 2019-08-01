require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}
  
  #collects projects, makes the title of each a key within the projects hash pointing to an empty hash
  kickstarter.css("li.project.grid_4").each do |project|
    title = kickstarter.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => kickstarter.css("div.project-thumbnail a img").attribute("src").value,
      :description => kickstarter.css("p.bbcard_blurb").text,
      :location => kickstarter.css("ul .project-meta span.location-name").text,
      
    }
  end
  
  
end

create_project_hash


# image link: kickstarter.css("div.project-thumbnail a img").attribute("src").value
#descriptions: kickstarter.css("p.bbcard_blurb").text
#locations: kickstarter.css("ul .project-meta span.location-name").text
#percent funded: kickstarter.css("ul.project-stats li.first.funded strong").text..gsub("%", "").to_i