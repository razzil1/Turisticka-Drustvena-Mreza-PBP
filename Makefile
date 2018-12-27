DIR	= mysql-C
CC = gcc
PROGS	= src/turistickaDrustvenaMreza.c src/sqlFunkcije.c
OUTPUT = turistickaDrustvenaMreza
CFLAGS	= -g -Wall `mysql_config --cflags --libs`

.PHONY: all create trigger insert beauty dist progs

all: create trigger insert progs

progs:
	$(CC) -o $(OUTPUT) $(PROGS) $(CFLAGS)

create:
	mysql -u root -p < sql/create-tables.sql

trigger:
	mysql -u root -p < sql/trigger.sql

insert:
	mysql -u root -p < sql/insert.sql

beauty:
	-indent $(PROGS)

clean:
	-rm -f *~ $(OUTPUT)

dist: beauty clean
	-tar -zcvf $(DIR).tar.gz $(DIR)
