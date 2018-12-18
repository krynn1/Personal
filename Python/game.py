class creature(object):
    def __init__(self, name, maxhitpoints, classtype):
        self.name = name
        self.maxhitpoints = maxhitpoints
        self.classtype = classtype
        self.hitpoints = maxhitpoints
    
    def charactersheet(self):
        print("Character name " + self.name)
        #print(self.maxhitpoints)
        print(f"Class = " + self.classtype)
        print(f"current hitpoints:", self.hitpoints)

Orc = creature("Valdar", 20, "Fighter")
Orc.charactersheet()


class actions(creature):    
    def damage(damage, creature):    
        creature.hitpoints = creature.hitpoints - damage
        print(creature.hitpoints)

    def healing(healing, creature):
        if creature.maxhitpoints < (healing+creature.hitpoints):
            creature.hitpoints=creature.hitpoints+healing
            if creature.maxhitpoints <= creature.hitpoints:
                creature.hitpoints = creature.maxhitpoints
        print(creature.hitpoints)

actions(orc).damage




        