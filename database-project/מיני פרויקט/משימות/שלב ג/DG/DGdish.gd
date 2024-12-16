
[General]
Version=1

[Preferences]
Username=
Password=2745
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=DISH
Count=30

[Record]
Name=ID_DISH
Type=VARCHAR2
Size=10
Data=Sequence(Start, [Inc], [WithinParent])
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=10
Data=Random(10, 60)
Master=

[Record]
Name=NAME
Type=VARCHAR2
Size=20
Data=Elements.Name
Master=

[Record]
Name=TYPE_DISH
Type=VARCHAR2
Size=20
Data=List('first dish', 'main dish','last dish')
Master=

[Record]
Name=IDCHEF
Type=NUMBER
Size=
Data=List(select idchef from chef)
Master=

[Record]
Name=IDSALE
Type=NUMBER
Size=
Data=List(select idsale from sale)
Master=

