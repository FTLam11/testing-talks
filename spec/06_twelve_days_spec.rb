require 'spec_helper'

# Input: day number
# Loop through each day
# Ouput: verse for the requested day number


class XmasSongs
  def self.verse(day_number)
    <<~LYRICS
        On the first day of Christmas
        my true love sent to me:
        A Partridge in a Pear Tree
    LYRICS
  end
end

describe XmasSongs do
  describe "verse" do
    it 'has lyrics for the first day' do
      verse_lyrics = XmasSongs.verse(1)

      lyrics = <<~LYRICS
        On the first day of Christmas
        my true love sent to me:
        A Partridge in a Pear Tree
      LYRICS

      expect(verse_lyrics).to eq lyrics
    end
  end
end
