
import java.util.List;

import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

public class Main extends TestBaseListener {
	
	private static final String FILE_NAME = "Test-0001.test";

	public static void main(final String[] args) {
		try {
			final Main main = new Main();
			// main.run(args[0]);
			main.run(Main.FILE_NAME);
		} catch (final Exception ex) {
			ex.printStackTrace();
		}
	}

	public Main() {
	}

	private void run(final String fileName) throws Exception {
		final TestLexer lexer = new TestLexer(new ANTLRFileStream(fileName));
		final CommonTokenStream tokens = new CommonTokenStream(lexer);
		final TestParser parser = new TestParser(tokens);
		final ParseTree tree = parser.unit();
		final ParseTreeWalker walker = new ParseTreeWalker();
		walker.walk(this, tree);
	}

	@Override
	public void enterLine(final TestParser.LineContext ctx) {
		System.out.println(
				"new line found with id='" + ctx.Identifier().getText() + "'");
	}
	
	@Override
	public void enterA(final TestParser.AContext ctx) {
		System.out.println("\tfound A='" + ctx.getText() + "'");
		final List<ParseTree> children = ctx.children;
		System.out.println("\t\tchildren='" + children + "'");
		if (children != null) {
			System.out.println("\t\tchildren.size()='" + children.size() + "'");
			for (int i = 0; i < children.size(); i++) {
				final ParseTree child = children.get(i);
				System.out.println("\t\tchildren('" + i + "'): toString='"
						+ children + "', class='" + child.getClass()
						+ "', text='" + child.getText() + "', childCount='"
						+ child.getChildCount() + "'");
			}
		}
		final int altNr = ctx.getAltNumber();
		System.out.println("\t\talt-nr='" + altNr + "'");
	}

}
