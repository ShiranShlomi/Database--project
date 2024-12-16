
[General]
Version=1

[Preferences]
Username=
Password=2389
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=CONTAINING
Count=50

[Record]
Name=AMOUNT
Type=NUMBER
Size=20
Data=Random(0, 10)
Master=

[Record]
Name=ID_ORDER
Type=VARCHAR2
Size=10
Data=List(select id_order from invite)
Master=

[Record]
Name=ID_DISH
Type=VARCHAR2
Size=10
Data=List(select id_dish from dish )
Master=

