import mysql.connector
mydb1 = mysql.connector.connect(host='localhost',user='root',passwd='123',database='mydb')

mycuresor = mydb1.cursor()
mycuresor.execute("Show tables")
for db in mycuresor:
    print(db)