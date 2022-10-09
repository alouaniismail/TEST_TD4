DIRSRC?=src
DIRTST=tst

DIRBUILD=build

TU= tec.TestJauge tec.TestPosition
#-d build/ -cp build/ avec package tec; => le TestJauge
#sans execution pour l'executer ca devient build/paquetage tec . TestJauge
#soit tec.TestJauge si on précise à l'execution -cp build/.
TR= tec.TestAutobus tec.TestPassagerStandard

COMPILER= javac
EXECUTE= java -ea
EXECUTE2=java

SRCCLASS=$(DIRSRC)/Autobus.java $(DIRSRC)/Passager.java\
$(DIRSRC)/Jauge.java $(DIRSRC)/PassagerStandard.java\
$(DIRSRC)/Position.java $(DIRSRC)/Vehicule.java

SRCTEST=$(DIRTST)/FauxPassager.java $(DIRTST)/FauxVehicule.java\
$(DIRTST)/TestAutobus.java $(DIRTST)/TestJauge.java\
$(DIRTST)/TestPassagerStandard.java $(DIRTST)/TestPosition.java

#toujours compilation+execution a part ou integre (2 manieres differentes).

source: $(DIRSRC) 
	${COMPILER} -d build -cp build/ $</*.java

test: $(DIRTST)
	${COMPILER} -d build -cp build/ $</*.java

source2: $(SRCCLASS)
	javac -d $(DIRBUILD) -cp $(DIRBUILD) $^

test2: source $(SRCTEST)
	javac -d build/ -cp build/ $(SRCTEST)

clean: $(DIRBUILD)
	rm -rf $</*
	rm -rf src/*.java~
	rm -rf tst/*.java~
	rm -f Makefile~ 

utest: source test $(DIRBUILD)
	for tstu in ${TU}; do ${EXECUTE} -cp build/ $$tstu; done
recette: source test $(DIRBUILD)
	for tstr in ${TR}; do ${EXECUTE} -cp build/ $$tstr; done

Simple: source Simple.java
#tec.Simple non car pas de package tec au debut.
	${COMPILER} -d build/ -cp build/ Simple.java

executer: $(DIRBUILD)
#-cp pour class path ou trouver $\@.build.
	${EXECUTE2} -cp $< Simple 

cleanAll: clean
	rm -f build/*.class && rm -f *.java~
