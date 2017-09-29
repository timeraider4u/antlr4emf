#!/bin/bash

function die() {
	echo "${1}"
	exit 1
}

function printUsage() {
	local USAGE="Usage: run.sh ("
	USAGE="${USAGE} example-left-recursion-1"
	USAGE="${USAGE} | example-left-recursion-2"
	USAGE="${USAGE} | complex-example"
	USAGE="${USAGE} | pitfall-1"
	USAGE="${USAGE} ) [no-cleanup]"
	die "${USAGE}"
}

function selectExampleDir() {
	EXAMPLE_DIR="${1}"
	if [[ "${EXAMPLE_DIR}" == "complex-example" ]]; then
		GRAMMAR_FILE="C.g4"
	elif [[ "${EXAMPLE_DIR}" == "example-left-recursion-1" ]]; then
		GRAMMAR_FILE="Test.g4"
	elif [[ "${EXAMPLE_DIR}" == "example-left-recursion-2" ]]; then
		GRAMMAR_FILE="Lefty.g4"
	elif [[ "${EXAMPLE_DIR}" == "pitfall-1" ]]; then
		GRAMMAR_FILE="Test.g4"
	else
		printUsage
	fi
	cd "${EXAMPLE_DIR}"
	CURR_DIR=$(pwd)
}

function generateAndCompile() {
	CP="${CURR_DIR}/../lib/antlr4-4.5.4-SNAPSHOT.jar:${CURR_DIR}"
	rm -rf *.log
	java -cp "${CP}" org.antlr.v4.Tool \
		-visitor -listener \
		-Xlog "${GRAMMAR_FILE}" || die "could not parse g4"
	javac -cp "${CP}" *.java || die "could not compile"
}

function runExamples() {
	local INPUT=""
	if [ -f "Main.java" ]; then
		java -cp "${CP}" "Main"
	fi
	if [[ "${EXAMPLE_DIR}" == "complex-example" ]]; then
		:
	elif [[ "${EXAMPLE_DIR}" == "example-left-recursion-1" ]]; then
		:
	elif [[ "${EXAMPLE_DIR}" == "example-left-recursion-2" ]]; then
		#INPUT="${CURR_DIR}/Lefty-0001.lefty"
		#java -cp "${CP}" org.antlr.v4.gui.TestRig Lefty lefty -gui "${INPUT}" || die
		#INPUT="${CURR_DIR}/Lefty-0002.lefty"
		#java -cp "${CP}" org.antlr.v4.gui.TestRig Lefty lefty -gui "${INPUT}" || die
		#INPUT="${CURR_DIR}/Lefty-0003.lefty"
		#java -cp "${CP}" org.antlr.v4.gui.TestRig Lefty lefty -gui "${INPUT}" || die
		INPUT="${CURR_DIR}/Lefty-0004.lefty"
		java -cp "${CP}" org.antlr.v4.gui.TestRig Lefty lefty -gui "${INPUT}" || die
	elif [[ "${EXAMPLE_DIR}" == "pitfall-1" ]]; then
		:
	fi
}

function cleanUp() {
	rm -f *.class || die "could not clean-up bin output files"
	if [ ${CLEAN_UP_SRC_GEN_FILES} -eq 0 ]; then
		rm -f *.tokens || die "could not clean-up token files"
		find . -name "*.java" ! -name "Main.java" -exec rm {} \; \
			|| die "could not clean-up src-gen files"
	fi
}

if [ $# -eq 1 ]; then
	CLEAN_UP_SRC_GEN_FILES=0
elif [ $# -eq 2 ] && [ "${2}" == "no-cleanup" ]; then
		CLEAN_UP_SRC_GEN_FILES=1
else
	printUsage
fi

selectExampleDir "${1}"

generateAndCompile

runExamples

cleanUp
