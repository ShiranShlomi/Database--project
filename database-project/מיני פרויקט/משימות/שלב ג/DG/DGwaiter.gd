
[General]
Version=1

[Preferences]
Username=
Password=2867
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=WAITER
Count=30

[Record]
Name=ID_WAITER
Type=VARCHAR2
Size=10
Data=[000000000]
Master=

[Record]
Name=DOB
Type=DATE
Size=
Data=Random(01-01-1970,01-01-2010)
Master=

[Record]
Name=FNAME
Type=VARCHAR2
Size=20
Data=FirstName
Master=

[Record]
Name=LNAME
Type=VARCHAR2
Size=20
Data=LastName
Master=

[Record]
Name=SALERY
Type=NUMBER
Size=10
Data=Random(6000, 10000)
Master=

[Record]
Name=CITY
Type=VARCHAR2
Size=15
Data=City
Master=

[Record]
Name=NUMHOME
Type=NUMBER
Size=
Data=Random(1, 120)
Master=

[Record]
Name=STREET
Type=VARCHAR2
Size=15
Data=List('ETROG', 'BEN DURYON','ASHCHAR','NATHN','SHAPIRA','BEGIN','AFUNA','HOLZBERG')
Master=

