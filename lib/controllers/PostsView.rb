class PostsViewController      
  attr_accessor :posts
  
  def initialize()            
    @posts = Post.all
  end       
  
  def numberOfRowsInTableView(sender)   
    @posts.count 
  end      
  
  def tableView(tableview, objectValueForTableColumn:column, row:row)   
    post = @posts[row]   
    if post   
      case column.identifier
      when 'title'
        return post.title
      when 'date'
        return post.date
      end
    end
  end        
end