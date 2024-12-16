
[General]
Version=1

[Preferences]
Username=
Password=2669
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=PAYMENT
Count=50

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
Data=Random(80, 1000)
Master=

[Record]
Name=ID_ORDER
Type=VARCHAR2
Size=10
Data=List(select id_order from invite)
Master=

