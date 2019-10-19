require 'pry'
class MusicLibraryController
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end
 
 def call
   input = ""
   
   while input != "exit"
     puts "Welcome to your music library!"
     puts "To list all of your songs, enter 'list songs'."
     puts "To list all of the artists in your library, enter 'list artists'."
     puts "To list all of the genres in your library, enter 'list genres'."
     puts "To list all of the songs by a particular artist, enter 'list artist'."
     puts "To list all of the songs of a particular genre, enter 'list genre'."
     puts "To play a song, enter 'play song'."
     puts "To quit, type 'exit'."
     puts "What would you like to do?"
  input = gets.strip
  end
 
  def list_songs
    song_list = Song.all.sort {|a, b| a.name <=> b.name} #Sort alphabetically by song name
    song_list.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
 end

  def list_artists
    artist_list = Artist.all.sort {|a, b| a.name <=> b.name}
    artist_list.each.with_index(1) do |artist, index| 
      puts "#{index}. #{artist.name}"
    end
  end


  def list_genres
    Genre.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |genre, index| 
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |song, index| 
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i #gets input, makes sure it's integer
    if song = Song.find_by_name(input) #if song input matches existing song (is valid input)
    #iterates over list_songs? but how to iterate over list of strings? why isn't list_songs showing up as list of strings?
    #pulls matching input from list_songs
    #puts "playing (song) by (artist)"
  end
end