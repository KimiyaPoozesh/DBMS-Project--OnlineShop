from fastapi import FastAPI
from pydantic import BaseModel
import mysql.connector


app = FastAPI()
mydb1 = mysql.connector.connect(host="localhost",user="root",password="password",database="project")
a=[]

mycuresor = mydb1.cursor()


print("hello, choose a number for the following queries: ")
print("1. Display the list of orders")
print("2. Display the list of special certificates")
print("3. Display the list of sellers of an item for the admin")
print("4. Show suppliers of goods for a city")




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
        r=executor("SELECT totalCost, BasketID from basket",cursor)
        cursor.close()
    elif choice.choice ==2:
        r=executor("SELECT name from product WHERE discount > 15",cursor)
        cursor.close()

    elif choice.choice == 3:
        r=executor2("SELECT S.idSupplier, P.ID FROM supplier as S INNER JOIN product as P WHERE S.idSupplier=P.ID",cursor)
        cursor.close()

    elif choice.choice==4:
        r=executor("SELECT k.city,GROUP_CONCAT(DISTINCT S.fName) FROM supply AS Su INNER JOIN supplier as Sr ON Su.city = SR.city GROUP BY S.city",cursor)
        cursor.close()

    for db in r:
        a.append(db)
    return a
