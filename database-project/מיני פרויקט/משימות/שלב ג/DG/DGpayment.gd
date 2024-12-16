
[General]
Version=1

[Preferences]
Username=
Password=2526
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=PAYMENT
Count=30

[Record]
Name=DATE_PAY
Type=DATE
Size=
Data=List(select date_order from invite)
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=10
Data=Random(30, 800)
Master=

[Record]
Name=ID_ORDER
Type=VARCHAR2
Size=10
Data=List(select id_order from invite)
Master=

[Record]
Name=ID_PAYMENT
Type=NUMBER
Size=
Data=Sequence(Start, [Inc], [WithinParent])
Master=

[Record]
Name=TYPEPAYMENT
Type=VARCHAR2
Size=10
Data=List('cash', 'card')
Master=

