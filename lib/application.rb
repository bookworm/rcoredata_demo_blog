require 'lib/bootstrap'   
class Blog
  include HotCocoa

  def start          
    application name: 'Blog' do |app| 
      app.delegate = self  
      PostsWindow.new
    end
  end 
  
  def bringAllToFront(sender)
  end

  def on_save(sender)   
    RCoreData::DataStore.save()
  end    

  def should_terminate?()  
    return RCoreData::DataStore.should_terminate?     
  end   
end

Blog.new.start