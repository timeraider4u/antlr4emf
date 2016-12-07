#!/bin/bash

function die() {
	echo "${1}"
	exit 1
}

CURR_DIR=$(pwd)
CP="${CURR_DIR}/antlr4-4.5.4-SNAPSHOT.jar:${CURR_DIR}"
rm *.log || die "could not delete log files"
java -cp "${CP}" org.antlr.v4.Tool -Xlog Lefty.g4 || die "could not parse g4"

#cat <<EOF > Demo.java
#package example.leftrecursion;
#
#public class Demo {
#	public static void main(String [] args) {
#		System.out.println("Hello World!");
#	}
#}
#EOF

javac -cp "${CP}" *.java || die "could not compile"

INPUT="${CURR_DIR}/Lefty-0001.lefty"
java -cp "${CP}" org.antlr.v4.gui.TestRig Lefty lefty -gui "${INPUT}" || die
INPUT="${CURR_DIR}/Lefty-0002.lefty"
java -cp "${CP}" org.antlr.v4.gui.TestRig Lefty lefty -gui "${INPUT}" || die
INPUT="${CURR_DIR}/Lefty-0003.lefty"
java -cp "${CP}" org.antlr.v4.gui.TestRig Lefty lefty -gui "${INPUT}" || die
INPUT="${CURR_DIR}/Lefty-0004.lefty"
java -cp "${CP}" org.antlr.v4.gui.TestRig Lefty lefty -gui "${INPUT}" || die

rm *.{java,tokens,class} || die
