import mysql.connector

mydb = mysql.connector.connect(host="localhost",user="root"
                               ,passwd="fatem928")
if (mydb):
    print("Successful")
else:
    print("unsSuccessful")