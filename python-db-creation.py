import mysql.connector

# نمایش لیست کاربرها-
# نمایش لیست پر فروش ترین محصولات هفته و ماه
# نمایش ده سفارش اخر کاربر
# نمایش کاربران مربوط به یک شهر-





mydb1 = mysql.connector.connect(host='localhost',user='root',passwd='123kimiya4567',database='mydb')

mycuresor = mydb1.cursor()
#1 mycuresor.execute("SELECT userName,fName from user")
#4 mycuresor.execute(" SELECT k.city,GROUP_CONCAT(DISTINCT k.fName) FROM user AS k INNER JOIN user as d ON k.city = d.city GROUP BY k.city")
# for db in mycuresor:
#     print(db[0],' ',db[1])

#3 user ba basket id hich khasise moshtaraki nadarad
#mycuresor.execute("SELECT fName,p.name from product as p, user as u,basket as b,basketitem as bi WHERE u LIKE %s AND u.")

#2 bayad insert haye factor ro bishtar konim faqat 1 factor darim
#mycuresor.execute("SELECT DISTINCT f.date, p.name FROM factor as f,basketitem as i ,basket as b,product as p WHERE date>='2022-12-01' AND date<'2023-01-01' AND f.BasketID=b.BasketID AND b.BasketID=i.BasketID AND i.ProdID=p.ID")
#for db in mycuresor:
#    print(db)


# نمایش لیست سفارش ها
#5 mycuresor.execute("SELECT totalCost, BasketID from basket")

# نمایش لیست پیشهادات ویژه
#6 mycuresor.execute("SELECT name from product WHERE discount > 15")

# نمایش لیست فروشنده های یک ایتمم برای ادمین
#7 mycuresor.execute("SELECT S.idSupplier, P.ID FROM supplier as S INNER JOIN product as P WHERE S.idSupplier=P.ID")

# نمایش تامین کنندگان مربوط به یک شهر
#8 mycuresor.execute("SELECT k.city,GROUP_CONCAT(DISTINCT S.fName) FROM supply AS Su INNER JOIN supplier as Sr ON Su.city = SR.city GROUP BY S.city")
