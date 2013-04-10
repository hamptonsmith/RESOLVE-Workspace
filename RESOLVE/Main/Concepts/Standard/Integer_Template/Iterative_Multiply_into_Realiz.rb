Realization Iterative_Multiply_into_Realiz for Multiplying_Capability of Integer_Template;
		uses Integer_Theory, Boolean_Theory, Std_Integer_Fac, Std_Boolean_Fac;

	Procedure Multiply_into(updates i : Integer; evaluates j : Integer);
		Var result : Integer;

		While (j /= 0) 
			changing result, j;
			maintaining result = i * (#j - j) and j >= 0;
			decreasing j;
		do
			result := result + i;
			j := j - 1;
		end;

		i :=: result;
	end;
end;
