class Page < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  def wiki_wordify
    title.split.collect {|s| s.capitalize}.join
  end

end
