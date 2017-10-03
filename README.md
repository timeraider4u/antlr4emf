# antlr4emf
Automatic ANTLR4-to-EMF converter

At the moment this is just an idea / a project proposal.
Due to time constraints, I do not have time to 
work on this project at the moment and, therefore, 
will try to implement this at some point in the future.
Feel free to take-up the ideas presented and
provide feedback or an implementation ;-).

Notes:
It seems that pitfall-1 can be solved / is already solved.
See `testing/pitfall-1/Main.java:47-54`

More notes:
No, not really, not yet!
Problem is the following:
if we have `unit: A (b c d | b c e)` we can go through the children of `unit`
in a visitor class in `visitUnit(Pitfall1Parser.UnitContext ctx)`
with `ctx.getChildCount()` and `ctx.getChild(i)`
but we would than have to do all the checks ourselves, e.g.,
```
boolean firstAlternative = false;
ParseTree child1 = ctx.getChild(1);
ParseTree child2 = ctx.getChild(2);
ParseTree child3 = ctx.getChild(3);
if ((child1 instanceof Pitfall1Parser.BContext)
&& (child2 instanceof Pitfall1Parser.CContext)
&& (child3.instanceof Pitfall1Parser.DContext))
{
  firstAlternative = true;
}
Unit unit = this.factory.createUnit();
if (firstAlternative) {
	// ...
} else {
	// ...
}

```
In `PitfallParser1.java` the following line can be found:
`enterOuterAlt(_localctx, 1);`
And `runtime/Java/src/org/antlr/v4/runtime/Parser.java` from ANTLR4 git
repository will call `localctx.setAltNumber(altNum);`.
But `runtime/Java/src/org/antlr/v4/runtime/RuleContext.java` will just do
`public void setAltNumber(int altNumber) { }`.
What we really need would be that
`runtime/Java/src/org/antlr/v4/runtime/RuleContextWithAltNum.java` is always
created in such cases.
