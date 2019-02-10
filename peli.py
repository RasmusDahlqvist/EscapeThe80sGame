import mysql.connector 
import random as ran
import winsound 


#description of the room
def room_view(loc):
    cur = db.cursor()
    sql = "SELECT description FROM Location WHERE locationid ='" + loc + "'"

    cur.execute(sql)
    for i in cur:
        print(i[0])
    
    return

#Descriptions of  objects in room

def object_view(loc):
    cur = db.cursor()
    sql = "SELECT Item FROM OBJECT WHERE Hidden!=True and locationId ='" + loc + "'"
    cur.execute(sql)
    print('You see these awesome things: ')
    for i in cur:
        
        print(i[0])
    
    return



#Showing locations of the doors light my fire
def door_view(loc):
    
    cur=db.cursor()
    sql = "SELECT note, jotain FROM Door WHERE startingpoint ='" + loc + "' and locked != TRUE"
    
    cur.execute(sql)
    for i in cur:
        print(i[0])
        if(i[1]!=""):
            print(i[1])

    return

# Details from object when player examines them
def show_odetails(target,loc):
    cur = db.cursor()
    
    sql =" SELECT Odetails FROM Object WHERE name = '" + target + "' and  locationId ='" + loc + "'"
    cur.execute(sql)
    for i in cur:
        print(i[0])
 
    return

#smurf
def show_smurf():
    cur = db.cursor()
    sql =" SELECT Odetails FROM Object WHERE  name = 'smurf'"
    cur.execute(sql)
    for i in cur:
        print(i[0])

    return

 #Player moving from room to another   
def move(loc,newloc):
    finishpoint = loc
    cur = db.cursor()
    sql = "SELECT finishpoint FROM Door WHERE startingpoint ='" + loc + "' and locked = False" #Room2
    cur.execute(sql)
    if cur.rowcount >= 1:
        for row in cur.fetchall():
            finishpoint = row[0]
    else:
        finishpoint = loc
    return finishpoint



#Player taking objects to inventory
def take(target):
    
    cur = db.cursor()
    sql = "SELECT name  From Object WHERE Takeable = True and  locationId ='" + loc + "'"
    cur.execute(sql)
    for row in cur:
        listu.append(str(row[0]))

    x = target
   
    if x == 'fannypack':
        print("You took the fannypack")
        fannypack.append('fannypack')
    elif x in listu and 'fannypack' in fannypack :
            print("You took the item")
            fannypack.append(x)
    else:
            print("You can't do that")

    return listu, target, fannypack


#unlocking doors
def unlock(loc):
    cur=db.cursor()
    sql= "UPDATE Door SET Locked = False WHERE startingpoint ='" + loc + "' and Locked=True"
    cur.execute(sql)
    return

    
#using telefax
def faxing():
    cur = db.cursor()
    sql="UPDATE OBJECT SET Hidden=False WHERE locationId ='" + loc + "' and Hidden=True"
    cur.execute(sql)
    return

#opening the box
def open_box(loc):
    cur=db.cursor()
    sql= "UPDATE OBJECT SET Hidden = False, Takeable=True,Useability=True WHERE locationId ='" + loc +"'"
    
    cur.execute(sql)
    for i in cur:
        print(i[0])
        
    return       
          
          

#Help

def  help():
    print("You can use following commands: use, pause, look (l), examine (e), sing, dance, inventory (i), open, take and quit")
    print("You can do this! ")

#walkman
def music():
        winsound.PlaySound("Miami Nights 1984 - Turbulence Full album.wav ", winsound.SND_ASYNC)
        
    


#Log in to the database 
db = mysql.connector.connect(host="localhost",
                      user="hoffa",
                      passwd="salasana",
                      db="peli",
                      buffered=True)




#Making some room to console
print("\n"*1000)

#Variables
loc = 'ROOM1'
newloc=""
action =""
fannypack = []
listu= []

#functions
print("Type help to get available commands")
room_view(loc)
object_view(loc)
door_view(loc)

#Gameplay
while action != "quit" and loc != 'ROOM7':
    
    
    input_command = input("It's your move: ").split()
    if len(input_command)>=1:
        action = input_command[0].lower()
    else:
            action =""
    if len(input_command)>=2:
            target = input_command[len(input_command)-1].lower()
            
    else:
     target = ""

   

#examine
    if action == "examine" or action == "e" or  action == "look" or action == "l":
        
        show_odetails(target,loc)

#dance
    if action == "dance":
        print("You are dancing")

 #open door       
    elif action == "open" and target == "door":
         newloc = move(loc,action)
         if loc == newloc:
            print("Door is locked")
         else:
                print("You opened the door")
                loc = newloc
                room_view(loc)
                object_view(loc)


                
#Inventory
    if action == "i" or action == "inventory":
        print("You have these following items on your fannypack ",fannypack)



#command to take objects into inventory
    elif action == "take":
        take(target)

#command use key, unlocks the door

    if action=="use" and target=="key":
        
        if target in fannypack:
            unlock(loc)
            print("Door is now unlocked" )
        else:
            print("You need to find the key to unlock the door")
            
#opening the first codelock
    elif action=="use" and target=="codelock":
        y = input("Give the code: ")
        if y == "fresh":
            unlock(loc)
            
            print("Door is unlocked")
        else:
            print("Wrong code")

#poster
    if action == "take" and target == "poster":
        print("Behind the poster there is another poster. It is Julius Ceasar with a mullet wearing shirt which has number 8 wrote in glitter")
        

#opening the second key code pad

    if action == "use" and target == "kitt":
        x =  ran.randint(1,1000000)
        try:
            y=int(input("Guess a number between 1-1000000, why? Because you are Rocky and this KITT is your Mr.T. Guess:  "))
            
        except ValueError:
            print("That wasnt a number")
        while x != y:
                try:
                    y=int(input("Guess a number between 1-1000000, why? Because you are Rocky and this KITT is your Mr.T. Guess:  "))
                except ValueError:
                     print("That wasnt a number")
                if y<x:
                        print("You quess was too low. Or should I say Loki. That wasn't 80's joke but it was just too good")
                        
                 
                if y>x:
                    print("KITT: Your guess was too high just like your parents exceptations about you, guess again: ")
                    


                if x==y:
                   print("KITT: Well done, the door is now unlocked!")
                   print("Damn that KITT thing was mean")
                   unlock(loc)

#using telefax
    if action=="use" and target=="telefax":
        faxing()
        print("The telefax makes the weirdest sound ever, and something comes out on the side of the machine. Holy crap on a cracker, its a paper!")



#opening the codelock on the box
    if action=="use" and target=="box":
        y = input("Give the code: ")
        if y == "177":
            open_box(loc)
            print("The box is open.")
            show_smurf()
            unlock(loc)
        else:
            print("Wrong code")

#taking the rod
            
    #if action=="take" and target=="rod":
     #   print("sinulla on onki")
      #  take(loc, target)

#using the rod
    if action=="use" and target=="rod":
       print("You are one great fishman! You got the key!")
       faxing()

 
#help
    if action == "help":
        help()


#SINGING
    if action=="sing":
        
        target="SING"
        show_odetails(target, loc)
        unlock(loc)
        print("Okey thats enough please stop!!")
        print("The door is now unlocked")

#to make testing the game easier
    if action == "salsa":
        unlock(loc)


    if action == "pause":
        winsound.PlaySound(None, winsound.SND_PURGE)
        
        
#Walkman   
    if action == "use" and target == "walkman":
        
        music()
        continue
    
#timemachine
    if action=="use" and target=="timemachine":
        print("now youre getting back to 2017")
        break
        
        

        
        
        

if (loc == 'ROOM7'):
    print("good job")
else:
    print("bye")
db.rollback()
#db.close


