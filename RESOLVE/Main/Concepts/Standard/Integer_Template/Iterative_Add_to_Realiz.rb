Realization Iterative_Add_to_Realiz for Adding_Capability of Integer_Template;
		uses Integer_Theory, Boolean_Theory, Std_Integer_Fac, Std_Boolean_Fac;

	Procedure Add_to(updates i : Integer; evaluates j : Integer);
		While (Not(Is_Zero(j))) 
			changing i, j;
			maintaining (i + j = #i + #j) and j >= 0;
			decreasing j;
		do
			Increment(i);
			Decrement(j);
		end;
	end Add_to;
end Iterative_Add_to_Realiz;
