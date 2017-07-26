import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Main extends LeftyBaseListener {
	
	private static final String FILE_NAME = "Lefty-0004.lefty";
	
	public static void main(String [] args) {
		try {
			final Main main = new Main();
			//main.run(args[0]);
			main.run(Main.FILE_NAME);
		} catch (final Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public Main() { }
	
	private void run(final String fileName) throws Exception {
		final LeftyLexer lexer = new LeftyLexer( new ANTLRFileStream(fileName));
		final CommonTokenStream tokens = new CommonTokenStream( lexer );
		final LeftyParser parser = new LeftyParser( tokens );
		final ParseTree tree = parser.lefty();
		final ParseTreeWalker walker = new ParseTreeWalker();
		walker.walk( this, tree );
	}
	
	@Override
	public void enterLefty(LeftyParser.LeftyContext ctx) {
		System.out.println("found lefty!");
	}
	
	@Override
	public void enterSomething(LeftyParser.SomethingContext ctx) {
		System.out.println("found something!");
		final TerminalNode id = ctx.Identifier();
		final Token token = id.getSymbol();
		final String text = token.getText();
		System.out.println("found '" + text + "'");
	}
	
}
