CC = g++
SRCDIR = src
BUILDDIR = build
TARGETDIR = bin
TARGET = ${TARGETDIR}/mg

SRCEXT = cpp
SOURCES = $(shell find ${SRCDIR} -type f -name *.${SRCEXT})
OBJECTS = $(patsubst ${SRCDIR}/%, ${BUILDDIR}/%, $(SOURCES:.${SRCEXT}=.o))
CFLAGS = -g -std=c++20
LIBS = -lgit2

${TARGET}: ${OBJECTS}
	@echo " Linking..."
	@mkdir -p ${TARGETDIR}
	${CC} $^ ${INC} ${LIBS} -o ${TARGET}

${OBJECTS}: src/magnesium.cpp
	@mkdir -p ${BUILDDIR}
	${CC} ${CFLAGS} ${INC} ${LIBS} -c -o $@ ${SOURCES}

clean:
	@echo " Cleaning..."
	${RM} -r ${BUILDDIR} ${TARGETDIR}

.PHONY: clean