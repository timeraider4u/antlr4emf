MYPATH=$(pwd)
echo "MYPATH='${MYPATH}'"
rm *.log
#java -cp /home/harry/workspace/test/antlr4-4.5.4-SNAPSHOT.jar:. org.antlr.v4.Tool -Xlog C.g4
java -cp "${MYPATH}/../lib/antlr4-4.5.4-SNAPSHOT.jar":. org.antlr.v4.Tool -Xlog Test.g4
#rm *.tokens
#rm *.java
