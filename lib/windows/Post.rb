class PostWindow < NSWindowController  
  attr_accessor :title, :date, :post, :posts_window
  
  def init
    initWithWindowNibName('Post')
    self
  end  
  
  def initWithPost(post)   
    initWithWindowNibName('Post')     
    @post = post     
    self
  end  
  
  def windowDidLoad()   
    # puts @post.inspect
    @title.setStringValue(@post.title)   
    @date.setDateValue(@post.date)
  end

  def save(sender)  
    @post.title = @title.stringValue()
    @post.date  = @date.dateValue()   
    @post.save       
    closeWindow  
    @posts_window.reloadData()
  end

  def cancel(sender)   
    closeWindow
  end   
  
  def closeWindow
    NSApp.endSheet(window)
  end    
  
  def sheetDidEnd(sheet, returnCode:code, contextInfo:info)
    sheet.orderOut(nil)
  end
end