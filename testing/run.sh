#!/bin/bash

function die() {
	echo "${1}"
	exit 1
}

function printUsage() {
	die "Usage: run.sh ( example-left-recursion-1 | example-left-recursion-2 | complex-example )"
}

function selectExampleDir() {
	EXAMPLE_DIR="${1}"
	if [[ "${EXAMPLE_DIR}" == "complex-example" ]]; then
		GRAMMAR_FILE="C.g4"
	elif [[ "${EXAMPLE_DIR}" == "example-left-recursion-1" ]]; then
		GRAMMAR_FILE="Test.g4"
	elif [[ "${EXAMPLE_DIR}" == "example-left-recursion-2" ]]; then
		GRAMMAR_FILE="Lefty.g4"
	else
		printUsage
	fi
}

function runExamples() {
	local INPUT=""
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
	fi
}

if [ $# -ne 1 ]; then
	printUsage
fi
selectExampleDir "${1}"

cd "${EXAMPLE_DIR}"
CURR_DIR=$(pwd)

CP="${CURR_DIR}/../lib/antlr4-4.5.4-SNAPSHOT.jar:${CURR_DIR}"
rm -rf *.log
java -cp "${CP}" org.antlr.v4.Tool -Xlog "${GRAMMAR_FILE}" || die "could not parse g4"
javac -cp "${CP}" *.java || die "could not compile"

runExamples

rm -f *.{class,java,tokens} || die "could not clean-up"
