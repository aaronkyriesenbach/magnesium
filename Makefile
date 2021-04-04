CC = g++
SRCDIR = src
BUILDDIR = build
TARGETDIR = bin
TARGET = ${TARGETDIR}/mg

SRCEXT = cpp
SOURCES = $(shell find ${SRCDIR} -type f -name *.${SRCEXT})
OBJECTS = $(patsubst ${SRCDIR}/%, ${BUILDDIR}/%, $(SOURCES:.${SRCEXT}=.o))
CFLAGS = -g -std=c++20
INC = -I ${SRCDIR}

${TARGET}: ${OBJECTS}
	@echo " Linking..."
	@mkdir -p ${TARGETDIR}
	${CC} $^ -o ${TARGET}

${OBJECTS}:
	@mkdir -p ${BUILDDIR}
	${CC} ${CFLAGS} ${INC} -c -o $@ ${SOURCES}

clean:
	@echo " Cleaning..."
	${RM} -r ${BUILDDIR} ${TARGETDIR}

.PHONY: clean