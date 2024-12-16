
[General]
Version=1

[Preferences]
Username=
Password=2814
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=INVITE
Count=30

[Record]
Name=ID_ORDER
Type=VARCHAR2
Size=10
Data=Sequence(Start, [Inc], [WithinParent])
Master=

[Record]
Name=DATE_ORDER
Type=DATE
Size=
Data=Random(01-01-2010,01-01-2021)
Master=

[Record]
Name=TYPE_ORDER
Type=VARCHAR2
Size=20
Data=List('sitting', 'take away')
Master=

[Record]
Name=FEEDBACK
Type=VARCHAR2
Size=20
Data=Random(1, 5)
Master=

[Record]
Name=ID_WAITER
Type=VARCHAR2
Size=10
Data=List(select id_waiter from waiter)
Master=

[Record]
Name=PHONEORDERER
Type=NUMBER
Size=10
Data=List(select phone from customer)
Master=

[Record]
Name=NAMEORDERER
Type=VARCHAR2
Size=10
Data=List(select fname from customer)
Master=

[Record]
Name=NUMDINERS
Type=NUMBER
Size=
Data=Random(1, 10)
Master=

[Record]
Name=CITYORDERER
Type=VARCHAR2
Size=15
Data=List(select city from customer)
Master=

[Record]
Name=ADDRESSORDERER
Type=VARCHAR2
Size=15
Data=List(select address from customer)
Master=

