
Precis Monogenerator_Theory;
		uses Basic_Function_Properties_Theory;

	Implicit Definition Is_Monogenerator_For(
		T : MType, Start : T, F : T -> T) : B
	is
		(For all t : T, F(t) /= t) and
		(Is_Injective(F)) and
		(For all T2 : Powerset(T),
			Instance_Of(T2, Start) and 
			(for all t : T, 
					Instance_Of(T2, t) 
						implies Instance_Of(T2, F(t)))
				implies T2 = T);

end;
