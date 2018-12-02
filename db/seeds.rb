require './app/models/comedian'
require './app/models/special'

Comedian.destroy_all
Special.destroy_all

cf = Comedian.create(name: "Craig Furgeson", age: 56, city: "Glasgow")
mb = Comedian.create(name: "Mike Birbiglia", age: 40, city: "Shrewsbury")
is = Comedian.create(name: "Iliza Shelsinger", age: 35, city: "New York City")
rp = Comedian.create(name: "Russel Peters", age: 48, city: "Toronto")
aa = Comedian.create(name: "Aziz Anazari", age: 35, city: "Columbia")
jj = Comedian.create(name: "Jim Jefferies", age: 41, city: "Sydney")
db = Comedian.create(name: "Doug Benson", age: 56, city: "San Diego")
cp = Comedian.create(name: "Chelsea Peretti", age: 40, city: "Contra Costa")
bb = Comedian.create(name: "Bill Burr", age: 50, city: "Canton")
rm = Comedian.create(name: "Ralphie May", age: 45, city: "Las Vegas")
cd = Comedian.create(name: "Chris D'elia", age: 38, city: "Montclair")
ct = Comedian.create(name: "Chris Tucker", age: 47, city: "Anlanta")


cf.specials.create(name: "Craig Furgeson's Comedy Special", runtime: 12, img: "image/dave.png")
cf.specials.create(name: "Craig Furgeson's Other Comedy Special", runtime: 3, img: "image/dave.png")
mb.specials.create(name: "Mike Birbiglia's Comedy Special", runtime: 25, img: "image/dave.png")
is.specials.create(name: "Iliza Shelsinger's Comedy Special", runtime: 24, img: "image/dave.png")
is.specials.create(name: "Iliza Shelsinger's Very Short Comedy Special", runtime: 1, img: "image/dave.png")
rp.specials.create(name: "Russel Peters's Comedy Special", runtime: 14, img: "image/dave.png")
aa.specials.create(name: "Aziz Anazari's Comedy Special", runtime: 9, img: "image/dave.png")
jj.specials.create(name: "Jim Jefferies's Comedy Special", runtime: 6, img: "image/dave.png")
db.specials.create(name: "Doug Benson's Comedy Special", runtime: 12, img: "image/dave.png")
cp.specials.create(name: "Chelsea Peretti's Comedy Special", runtime: 19, img: "image/dave.png")
bb.specials.create(name: "Bill Burr's Comedy Special", runtime: 18, img: "image/dave.png")
rm.specials.create(name: "Ralphie May's Comedy Special", runtime: 6, img: "image/dave.png")
cd.specials.create(name: "Chris D'elia's Comedy Special", runtime: 1, img: "image/dave.png")
ct.specials.create(name: "Chris Tucker's Comedy Special", runtime: 14, img: "image/dave.png")
