Theory Total_Preordering_Theory;
		uses String_Theory;

	Definition Is_Total_Preordering(f : ((D : MType) * D) -> B) : B =
		(For all d1 : D, f(d1, d1)) and
		(For all d1, d2, d3 : D, f(d1, d2) and f(d2, d3) 
			implies f(d1, d3)) and
		(For all d1, d2 : D, f(d1, d2) or f(d2, d1));		

	Definition Is_Conformal_With(f : (Entity * Entity) -> B, S : SStr) : B =
		For all i, j : Z,
			1 <= i and i <= j and j <= |S| implies
				f(Element_At(i, S), Element_At(j, S));

	---------------------------------------------------------------
	-- Conformity Theorems                                       --
	---------------------------------------------------------------
	Theorem Empty_String_Conformal:
		For all f : (Entity * Entity) -> B,
			Is_Conformal_With(f, Empty_String);

	Theorem Conformal_String_Extension:
		For all f : (Entity * Entity) -> B,
		For all S : SStr,
		For all e : Entity,
			Is_Conformal_With(f, S) and
			Is_Universally_Related(S, <e>, f)
				implies Is_Conformal_With(f, S o <e>);

	Theorem Total_Preordering_Symmetric:
		For all f : (Entity * Entity) -> B,
		For all e1, e2 : Entity,
			Is_Total_Preordering(f) and
			f(e1, e2) = not(f(e2, e1));
end;




