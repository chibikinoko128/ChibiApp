class Customer::VideosController < Customer::Base
  def video_menu
    time = Time.zone.now
    @month = time.month
    @day = time.day
    render action: 'video_menu'
  end
  
  def video_play
    time = Time.zone.now
    @month = time.month
    @day = time.day
    render action: 'video_play'
  end
  
  def privilege_video
    render action: 'privilege_video'
  end
  
  def back_number
    render action: 'back_number'
  end
  
  def party_video
    render action: 'party_video'
  end
  
  def phoenix_video
    render action: 'phoenix_video'
  end
  
  def queen_video
    render action: 'queen_video'
  end
  
  def king_video
    render action: 'king_video'
  end
  
  def president_video
    render action: 'president_video'
  end
  
  def video_week
    time = Time.zone.now
    @month = time.month
    @day = time.day
    render action: 'video_week'
  end
  
  def video_month
    render action: 'video_month'
  end
  
  def retrieval_month
    @number = Number.find(1)
    render action: 'retrieval_month'
  end
  
  def retrieval_week
    @number = Number.find(1)
    render action: 'retrieval_week'
  end
  
  def retrieval_day
    @number = Number.find(1)
    render action: 'retrieval_day'
  end
end
