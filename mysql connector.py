import mysql.connector

mydb = mysql.connector.connect(host="localhost",user="root"
                               ,passwd="password")
if (mydb):
    print("Successful")
else:
    print("unsSuccessful")