require 'rubygems' # disable this for a deployed application
require 'hotcocoa'      
require 'lib/rcoredata/rcoredata'    
framework 'WebKit'     

# Load Menus     
Dir.glob("lib/menus/*.rb").each do |file|
  require file
end      

# Load Models
Dir.glob("lib/models/*.rb").each do |file|
  require file
end     

# Load Controllers
Dir.glob("lib/controllers/*.rb").each do |file|
  require file
end      

# Load Views       
Dir.glob("lib/views/*.rb").each do |file|
  require file
end     

# Load Window Controllers  
Dir.glob("lib/windows/*.rb").each do |file|
  require file
end