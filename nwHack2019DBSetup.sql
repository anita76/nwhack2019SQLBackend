drop table if exists favorites;
drop table if exists experiences;
drop table if exists users;
drop table if exists cities;
drop table if exists countries;

create table countries(
	countryName varchar(255) not null,
	primary key(countryName),
	unique (countryName)
);

create table cities(
	cityName varchar(255) not null,
	countryName varchar(255) not null,
	primary key (cityName, countryName),
	foreign key (countryName) references countries(countryName),
	unique (cityName, countryName)
);

create table users (
    	userName  varchar(255) unique not null,
    	lastName varchar(255) not null,
    	firsName varchar(255) not null,
    	email varchar(255) not null,
    	country varchar(255) not null,
    	city varchar(255) not null,
    	pass varchar(255) not null,
    	primary key (userName)
);

create table experiences (
	cityName varchar(255) not null,
	countryName varchar(255) not null,
	userName varchar(255) not null,
	briefDescp text,
	transport text,
	healthcare text,
	cost text,
	banking text,
	culture text,
	weather text,
	safety text,
	leisure text,
	numLikes int,
	datePosted date,
	primary key (cityName, countryName, userName),
	unique (cityName, countryName, userName),
	foreign key (cityName, countryName) references cities(cityName, countryName)
);

create table favorites(
    cityName varchar(255) not null,
    countryName varchar(255) not null,
    userName varchar(255) not null,
    likedByUserName varchar(255) not null,
    primary key(cityName, countryName, userName, likedByUserName),
    unique (cityName, countryName, userName, likedByUserName),
    foreign key(cityName, countryName, userName) references experiences(cityName, countryName, userName),
    foreign key(likedByUserName) references users(userName)
);

insert into countries values('Germany');
insert into countries values('Australia');
insert into countries values('Canada');
insert into countries values('United States');
insert into countries values('England');
insert into countries values('China');
insert into countries values('Spain');
insert into countries values('Japan');

insert into cities values("Berlin", "Germany");
insert into cities values("Vancouver", "Canada");
insert into cities values("Seattle", "United States");
insert into cities values("Stuttgart", "Germany");
insert into cities values("Tokyo", "Japan");
insert into cities values("Beijing", "China");
insert into cities values("Brisbane", "Australia");
insert into cities values("Madrid", "Spain");
insert into cities values("London", "England");


insert into users values('mgreen', 'Green', 'Marjorie', 'greenmarjorie@hotmail.com', 'Germany', 'Berlin', '12345');
insert into users values('cCarson', 'Carson', 'Cheryl', 'carsoncheryl@hotmail.com', 'Canada', 'Vancouver', '23456');
insert into users values('aringer', 'Ringer', 'Albert', 'ringeralbert@yahoo.com', 'United States', 'Seattle' 'asfef');
insert into users values('aRinger', 'Ringer', 'Anne','ringeranne@gmail.com', 'Canada', 'Vancouver', '23435');
insert into users values('michel', 'DeFrance', 'Michel', 'defrancemichel@gmail.com', 'Germany', 'Stuttgart', 'aaaaa');
insert into users values('sPanteley', 'Panteley', 'Sylvia', 'panteleysylvia@gmail.com', 'China', 'Beijing', '343534');
insert into users values('hBadden', 'McBadden', 'Heather', 'mcbaddenheather@gmail.com', 'Australia', 'Brisbane', '23435');
insert into users values('dStringer', 'Stringer', 'Dirk', 'stringerdirk123@gmail.com', 'England', 'London', '234325');
insert into users values('lKarson', 'Karsen', 'Livia', 'karsenlivia123@gmail.com', 'Spain', 'Madrid', '23435');
insert into users values('sFeather', 'MacFeather', 'Stearns', 'macfeatherstearns@gmail.com', 'Japan', 'Tokyo', 'fsdg');

insert into experiences values("Tokyo", "Japan", "cCarson", "Worked for 8 months as a co-op student in Japan",
    "Japan has an efficient public transport network, especially within its large cities. The Japanese transport system including Shinkansen (the famous Bullet Train) is characterized by its punctuality, excellent service and its cleanliness.",
    "The health care system in Japan provides free screening processes for certain diseases, infectious disease control, and prenatal care. Under the health care system in Japan, the patient accepts responsibility for 30% of the medical costs, and the government pays the remaining 70%.",
    "But, I would peg an average monthly cost of living, including rent, utilities, food and liesure activities at around 100,000 yen. Just like anywhere else, in Japan some things are more expensive than others.",
    "The Bank of Tokyo, Ltd was a Japanese foreign exchange bank that operated from 1946 to 1996",
    "The culture of Japan has changed greatly over the millennia, from the country's prehistoric Jōmon period, to its contemporary modern culture, which absorbs .",
    "former city of Tokyo and the majority of mainland Tokyo lie in the humid subtropical climate zone (Köppen climate classification Cfa), with hot, humid summers and generally cool winters with cold spells",
    "Tokyo is that safe. Japan is the safest place I have ever travelled to as a single woman.",
    "Tokyo has numbers of famous night clubs especially in Roppongi and Shibuya areas.",
    3,
    '2014-04-01'
    );

    insert into experiences values("Tokyo", "Japan", "hBadden", "Worked for 8 months as a co-op student in Japan",
    "Japan has an efficient public transport network, especially within its large cities. The Japanese transport system including Shinkansen (the famous Bullet Train) is characterized by its punctuality, excellent service and its cleanliness.",
    "The health care system in Japan provides free screening processes for certain diseases, infectious disease control, and prenatal care. Under the health care system in Japan, the patient accepts responsibility for 30% of the medical costs, and the government pays the remaining 70%.",
    "But, I would peg an average monthly cost of living, including rent, utilities, food and liesure activities at around 100,000 yen. Just like anywhere else, in Japan some things are more expensive than others.",
    "The Bank of Tokyo, Ltd was a Japanese foreign exchange bank that operated from 1946 to 1996",
    "The culture of Japan has changed greatly over the millennia, from the country's prehistoric Jōmon period, to its contemporary modern culture, which absorbs .",
    "former city of Tokyo and the majority of mainland Tokyo lie in the humid subtropical climate zone (Köppen climate classification Cfa), with hot, humid summers and generally cool winters with cold spells",
    "Tokyo is that safe. Japan is the safest place I have ever travelled to as a single woman.",
    "Tokyo has numbers of famous night clubs especially in Roppongi and Shibuya areas.",
    3,
    '2014-04-01'
    );

    insert into experiences values("Vancouver", "Canada", "hBadden", "Worked for 8 months as a co-op student in Japan",
    "Japan has an efficient public transport network, especially within its large cities. The Japanese transport system including Shinkansen (the famous Bullet Train) is characterized by its punctuality, excellent service and its cleanliness.",
    "The health care system in Japan provides free screening processes for certain diseases, infectious disease control, and prenatal care. Under the health care system in Japan, the patient accepts responsibility for 30% of the medical costs, and the government pays the remaining 70%.",
    "But, I would peg an average monthly cost of living, including rent, utilities, food and liesure activities at around 100,000 yen. Just like anywhere else, in Japan some things are more expensive than others.",
    "The Bank of Tokyo, Ltd was a Japanese foreign exchange bank that operated from 1946 to 1996",
    "The culture of Japan has changed greatly over the millennia, from the country's prehistoric Jōmon period, to its contemporary modern culture, which absorbs .",
    "former city of Tokyo and the majority of mainland Tokyo lie in the humid subtropical climate zone (Köppen climate classification Cfa), with hot, humid summers and generally cool winters with cold spells",
    "Tokyo is that safe. Japan is the safest place I have ever travelled to as a single woman.",
    "Tokyo has numbers of famous night clubs especially in Roppongi and Shibuya areas.",
    3,
    '2014-04-01'
    );

       insert into experiences values("Stuttgart", "Germany", "aRinger", "Worked for 8 months as a co-op student in Japan",
    "Japan has an efficient public transport network, especially within its large cities. The Japanese transport system including Shinkansen (the famous Bullet Train) is characterized by its punctuality, excellent service and its cleanliness.",
    "The health care system in Japan provides free screening processes for certain diseases, infectious disease control, and prenatal care. Under the health care system in Japan, the patient accepts responsibility for 30% of the medical costs, and the government pays the remaining 70%.",
    "But, I would peg an average monthly cost of living, including rent, utilities, food and liesure activities at around 100,000 yen. Just like anywhere else, in Japan some things are more expensive than others.",
    "The Bank of Tokyo, Ltd was a Japanese foreign exchange bank that operated from 1946 to 1996",
    "The culture of Japan has changed greatly over the millennia, from the country's prehistoric Jōmon period, to its contemporary modern culture, which absorbs .",
    "former city of Tokyo and the majority of mainland Tokyo lie in the humid subtropical climate zone (Köppen climate classification Cfa), with hot, humid summers and generally cool winters with cold spells",
    "Tokyo is that safe. Japan is the safest place I have ever travelled to as a single woman.",
    "Tokyo has numbers of famous night clubs especially in Roppongi and Shibuya areas.",
    3,
    '2014-04-01'
    );

           insert into experiences values("Stuttgart", "Germany", "lCarson", "Worked for 8 months as a co-op student in Japan",
    "Japan has an efficient public transport network, especially within its large cities. The Japanese transport system including Shinkansen (the famous Bullet Train) is characterized by its punctuality, excellent service and its cleanliness.",
    "The health care system in Japan provides free screening processes for certain diseases, infectious disease control, and prenatal care. Under the health care system in Japan, the patient accepts responsibility for 30% of the medical costs, and the government pays the remaining 70%.",
    "But, I would peg an average monthly cost of living, including rent, utilities, food and liesure activities at around 100,000 yen. Just like anywhere else, in Japan some things are more expensive than others.",
    "The Bank of Tokyo, Ltd was a Japanese foreign exchange bank that operated from 1946 to 1996",
    "The culture of Japan has changed greatly over the millennia, from the country's prehistoric Jōmon period, to its contemporary modern culture, which absorbs .",
    "former city of Tokyo and the majority of mainland Tokyo lie in the humid subtropical climate zone (Köppen climate classification Cfa), with hot, humid summers and generally cool winters with cold spells",
    "Tokyo is that safe. Japan is the safest place I have ever travelled to as a single woman.",
    "Tokyo has numbers of famous night clubs especially in Roppongi and Shibuya areas.",
    3,
    '2014-04-01'
    );


