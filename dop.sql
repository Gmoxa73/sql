create table if not exists Otdel
(
OtdelID SERIAL PRIMARY KEY,
name varchar(50) NOT NULL
);

create table if not exists Sotrudnik
(
SotrudnikID SERIAL PRIMARY KEY,
OtdelID INT NOT NULL,
ManagerID INT NOT NULL,
name VARCHAR(50) NOT NULL,
CONSTRAINT FK_Sotrudnik_Manager FOREIGN KEY (ManagerID) REFERENCES Sotrudnik(SotrudnikID),
CONSTRAINT FK_Sotrudnik_Otdel FOREIGN KEY (OtdelID) REFERENCES Otdel(OtdelID)
);
