from fastapi import FastAPI
from pydantic import BaseModel
import mysql.connector


app = FastAPI()
mydb1 = mysql.connector.connect(host='localhost',user='root',passwd='password',database='mydb')
a=[]

mycuresor = mydb1.cursor()


print("hello, choose a number for the following queries: ")
print("1. Display average sell amount-")
print("2. Display the sales amount during this month")
print("3. Display comments for the product")
print("4. Display supplier who has the cheapest price")




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
        r=executor("SELECT avg(totalCost) AS avgcost FROM basket",cursor)
        cursor.close()
    elif choice.choice ==2:
        r=executor2("SELECT product.name, factor.date, ProdID, basketitem.BasketID FROM basketitem JOIN factor ON basketitem.BasketID = factor.BasketID JOIN product ON product.ID = basketitem.ProdID WHERE product.name = %s AND factor.date < curdate() AND factor.date > SUBDATE(curdate(), INTERVAL 01 MONTH);", choice.name, cursor)
        cursor.close()

    elif choice.choice == 3:
        r=executor2("""SELECT product.name, text,prodID FROM comment join product on comment.prodID = product.ID WHERE product.name = %s""", choice.name, cursor)
        cursor.close()

    elif choice.choice==4:
        r=executor2(" SELECT DISTINCT fname, price, product.name, supply.prodID FROM supply JOIN supplier ON supply.idSupplier = supplier.idSupplier JOIN user ON supplier.idSupplier = user.ID JOIN product ON supply.ProdID = product.ID JOIN (SELECT idSupplier, prodID, min(price) as min_price FROM supply GROUP BY prodID) AS Subquery ON supply.idSupplier = Subquery.idSupplier AND supply.price = Subquery.min_price WHERE product.name = %s", choice.name, cursor)
        cursor.close()

    for db in r:
        a.append(db)
    return a

