from fastapi import FastAPI
from pydantic import BaseModel
import mysql.connector


app = FastAPI()
mydb1 = mysql.connector.connect(host='localhost',user='root',passwd='123kimiya4567',database='mydb')
a=[]

mycuresor = mydb1.cursor()

print("hello, choose a number for the following queries: ")
print("1. Display Users lists-")
print("2. Display the list of the best-selling products of the week and month")
print("3. Display the last ten orders of the user")
print("4. Display users from the same city")


def query1():
    mycuresor.execute("SELECT userName,fName from user")
def query2():
    mycuresor.execute(" SELECT k.city,GROUP_CONCAT(DISTINCT k.fName) FROM user AS k INNER JOIN user as d ON k.city = d.city GROUP BY k.city")
#have to add variable
def query3():
    mycuresor.execute("SELECT fName,p.name from product as p, customer as c,user as u,basket as b,basketitem as bi WHERE.\
        u.fName = 'mostafa' AND bi.BasketID = b.BasketID AND b.BasketID = c.basketID AND c.customerID=u.ID")
def query4():
    mycuresor.execute(" SELECT k.city,GROUP_CONCAT(DISTINCT k.fName) FROM user AS k INNER JOIN user as d ON k.city = d.city GROUP BY k.city")

class Choice(BaseModel):
    choice: int
@app.post('/')
def index(choice : Choice):
    if choice == 1:
        query1()
    elif choice ==2:
        query2()
    elif choice == 3:
        query3()
    else:
        query4()
    for db in mycuresor:
        a.append(db)
    return a

