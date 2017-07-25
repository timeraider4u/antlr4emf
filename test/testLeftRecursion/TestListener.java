// Generated from Test.g4 by ANTLR 4.5.3
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link TestParser}.
 */
public interface TestListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link TestParser#unit}.
	 * @param ctx the parse tree
	 */
	void enterUnit(TestParser.UnitContext ctx);
	/**
	 * Exit a parse tree produced by {@link TestParser#unit}.
	 * @param ctx the parse tree
	 */
	void exitUnit(TestParser.UnitContext ctx);
	/**
	 * Enter a parse tree produced by {@link TestParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(TestParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link TestParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(TestParser.StatementContext ctx);
}