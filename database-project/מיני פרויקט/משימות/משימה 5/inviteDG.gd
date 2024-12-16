
[General]
Version=1

[Preferences]
Username=
Password=2417
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=INVITE
Count=50

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
Data=Random(01-01-2010, 01-05-2020)
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
Name=PHONE
Type=NUMBER
Size=10
Data=List(select phone from customer)
Master=

