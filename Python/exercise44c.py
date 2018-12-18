class Parent(object):
    def altered(self):
        print("PARENT altered()")

class Child(Parent):
    def altered(self):
        print("CHILD, BEFORE PARENT Altered()")
        super(Child,self).altered()
        print("child, after parent altered()")


dad = Parent()
son = Child()

dad.altered()
son.altered()
