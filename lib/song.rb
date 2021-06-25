require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new = Song.new
    new.save
    new
  end

  def self.new_by_name(name)
    new = self.create
    new.name = name
    new
  end

  def self.create_by_name(name)
    new = self.new_by_name(name)

  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    first_split = filename.split(" - ")
    song = self.create
    song.artist_name = first_split[0]
    song.name = first_split[1].split(".")[0]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end
end
