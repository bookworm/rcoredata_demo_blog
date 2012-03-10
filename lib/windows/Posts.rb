class PostsWindow < NSWindowController      
  attr_accessor :posts_tview 
  
  def init
    initWithWindowNibName('Posts')
    window
    @post_window = PostWindow.new 
    self
  end

  def windowDidLoad
    NSLog('Post Tview')     
    @datasource = PostsViewController.new
    @posts_tview.setDataSource(@datasource)     
    reloadData()
  end  
  
  def add(sender)   
    post = Post.create({:title => 'New Post'})    
    post_win = PostWindow.alloc.initWithPost(post)
    post_win.posts_window = self    
    NSApp.beginSheet(
      post_win.window,
      modalForWindow:self.window,     
      modalDelegate:post_win,
      didEndSelector:"sheetDidEnd:returnCode:contextInfo:",
      contextInfo:nil
    )
  end
  
  def edit(sender)  
    row  = @posts_tview.selectedRow()
    post = @datasource.posts[row]
    post_win = PostWindow.alloc.initWithPost(post)
    post_win.posts_window = self    
    NSApp.beginSheet(
      post_win.window,
      modalForWindow:self.window,     
      modalDelegate:post_win,
      didEndSelector:"sheetDidEnd:returnCode:contextInfo:",
      contextInfo:nil
    )
  end 
  
  def remove(sender)             
    row  = @posts_tview.selectedRow()
    post = @datasource.posts[row] 
     
    post.delete  
    reloadData()
  end    
  
  def reloadData()  
    @datasource.posts = Post.all  
    @posts_tview.reloadData()
  end    
end