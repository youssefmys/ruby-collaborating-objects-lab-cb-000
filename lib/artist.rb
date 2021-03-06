require "pry"

class Artist
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = [] 
  end

  def add_song (song)
    song.artist = self 
    @songs << song
  end

  def save
    @@all << self 
  end

  def self.find_or_create_by_name(artist_name) 
    artist = @@all.detect {|artist| artist.name == artist_name}
    if artist 
      return artist
    else
      artist = Artist.new(artist_name)
      artist.save
      artist
    end
    
  end

  def self.all
    
    @@all
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end
  
end
