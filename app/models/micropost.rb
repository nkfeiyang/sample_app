class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  validates_presence_of :content, :user_id
  validates_length_of   :content, 
    :maximum => 140,
    :too_long => "不能超过{{count}}个字符。"
  
  ## 这种方法能够不显示字段名  
  # def validate
  #   errors.add '内容' , '不能超过140个字符。'  if :content.to_s.length < 140
  # end  
  
  default_scope :order => 'created_at DESC'
  
  named_scope :from_users_followed_by, lambda { |user| followed_by(user) }
  
  private

    # Return an SQL condition for users followed by the given user.
    # We include the user's own id as well.
    def self.followed_by(user)
      followed_ids = %(SELECT followed_id FROM relationships
                       WHERE follower_id = :user_id)
      { :conditions => ["user_id IN (#{followed_ids}) OR user_id = :user_id",
                        { :user_id => user }] }
    end
end
