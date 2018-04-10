class Page < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, uniqueness: true

  def wiki_wordify
    title.split.collect {|s| s.capitalize}.join
  end

  def self.find_by_slug(slug)
  self.all.find do |page|
    if song.slug == slug
      @song = song
      end
    end
    @song
  end
end
