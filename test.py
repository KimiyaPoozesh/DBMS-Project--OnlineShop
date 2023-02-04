from fastapi import FastAPI
from pydantic import BaseModel
import mysql.connector


app = FastAPI()
mydb1 = mysql.connector.connect(host='localhost',user='root',passwd='fatem928',database='mydb')
a=[]

mycuresor = mydb1.cursor()


print("hello, choose a number for the following queries: ")
print("1. Display category of Products-")
print("2. Display worst 3 comments for the product ")
print("3. Display best 3 comments for the product ")
print("4. Display products")
print("5. Display top ten customers of month and week ")




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
        r=executor(" SELECT DISTINCT name FROM product ",cursor)
        cursor.close()
    elif choice.choice ==2:
        r=executor2("""SELECT rate, text
                    FROM comment
                    JOIN product ON product.ID = comment.prodID
                    WHERE product.name = %s
                    ORDER BY rate ASC LIMIT 3  """,choice.name,cursor)
        cursor.close()

    elif choice.choice == 3:
        r=executor2("""SELECT rate, text 
                    FROM comment 
                    JOIN product ON product.ID = comment.prodID
                    WHERE product.name = %s
                    ORDER BY rate DESC LIMIT 3 """,choice.name,cursor)
        cursor.close()

    elif choice.choice==4:
        r=executor(" SELECT name, size, gender, discount, age_range, availability, brand, color FROM product ",cursor)
        cursor.close()
    
    elif choice.choice == 5:
        r=executor(""" SELECT fname, customer.customerID
                    FROM user
                    JOIN customer ON customer.customerID = user.ID
                    JOIN basket ON basket.basketID = customer.basketID
                    JOIN factor ON factor.basketID = basket.basketID
                    WHERE (factor.date < curdate() AND factor.date > SUBDATE(curdate(), INTERVAL 01 MONTH)) 
                    ORDER BY basket.totalCost DESC LIMIT 10""",cursor)
        cursor.close()
    

    for db in r:
        a.append(db)
    return a

