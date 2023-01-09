import mysql.connector

mydb = mysql.connector.connect(host="localhost",user="root"
                               ,passwd="123")
if (mydb):
    print("Successful")
else:
    print("unsSuccessful")