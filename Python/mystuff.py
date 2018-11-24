class Song(object):

    def __init__(self,lyrics):
        self.lyrics = lyrics
    
    def sing_me_a_song(self):
        for line in self.lyrics:
            print(line)
    
    def make_a_full_song(self):
        for line in self.lyrics:
            full_song=line
            print(full_song)
        print(full_song)
    
happy_bday = Song(["Happy Birthday to You", 
                  "I don't want to get sued", 
                   "So I'll stop right there"])
bulls_on_parade = Song(["They rally around the family", 
                        "With pockets full of shells"])

#happy_bday.sing_me_a_song()
#bulls_on_parade.sing_me_a_song()

print("Full song now")
happy_bday.make_a_full_song()
bulls_on_parade.make_a_full_song()
