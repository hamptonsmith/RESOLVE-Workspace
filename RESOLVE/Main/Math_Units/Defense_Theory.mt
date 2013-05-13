Precis Defense_Theory;
		uses Integer_Theory;

	Definition MySSet : MType;
	Definition MySet : MType -> MType;

	Definition TakesZs : MySet(Z) -> B;

	Definition SomeNs : MySet(N);

	(*Type Theorem MySetSubsetTheorem:
		For all T1 : MType,
		For all T2 : Powerset(T1),
		For all a : MySet(T2),
			a : MySet(T1);*)
	
	Theorem Fact1:
		TakesZs(SomeNs);

	Definition MyEmptySet : MySSet;

	(*Type Theorem MyEmptySetInAllSubsets:
		For all T1 : MType,
			MyEmptySet : MySet(T1);*)

	(*Theorem Fact2:
		TakesZs(MyEmptySet);*)

end;
