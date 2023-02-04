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




def executor(query,cursor):
    cursor.execute(query)
    result = cursor.fetchall()
    cursor.nextset()
    return result

def executor2(query,var,cursor):
    cursor.execute(query,(var,))
    result = cursor.fetchall()
    cursor.nextset()
    return result

class Choice(BaseModel):
    choice: int
    name: str


@app.post('/')
def index(choice : Choice):
    cursor = mydb1.cursor(prepared=True)
    a.clear()
    if choice.choice == 1:
        print("here")
        r=executor("SELECT userName,fName from user",cursor)
        cursor.close()
    elif choice.choice ==2:
        r=executor(" SELECT f.date, p.name FROM factor as f,basketitem as i ,basket as b,product as p WHERE f.date>='2020-12-01' AND f.date<='2023-01-01' AND f.BasketID=b.BasketID AND b.BasketID=i.BasketID AND i.ProdID=p.ID",cursor)
        cursor.close()

    elif choice.choice == 3:
        r=executor2("""SELECT fName,p.name from product as p, customer as c,user as u,basket as b,basketitem as bi WHERE.\
        u.fName = %s AND bi.BasketID = b.BasketID AND b.BasketID = c.basketID AND c.customerID=u.ID""",choice.name,cursor)
        cursor.close()

    elif choice.choice==4:
        r=executor(" SELECT k.city,GROUP_CONCAT(DISTINCT k.fName) FROM user AS k INNER JOIN user as d ON k.city = d.city GROUP BY k.city",cursor)
        cursor.close()

    for db in r:
        a.append(db)
    return a

