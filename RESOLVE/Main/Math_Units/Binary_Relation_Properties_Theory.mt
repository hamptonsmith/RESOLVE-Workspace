Theory Binary_Relation_Properties_Theory;
		uses Boolean_Theory;

	Definition Is_Symmetric(f : (Entity * Entity) -> B) : B;

	Theorem Symmetric_Implies_Equal:
		For all f : (Entity * Entity) -> B,
		For all a, b : Entity,
			Is_Symmetric(f) implies 
				((f(a, b) and f(b, a)) = (a = b));

end;
