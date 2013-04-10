Realization Recursive_Multiply_into_Realiz for Adding_Capability of Integer_Template;

	Recursive Operator Recursive_Multiply_int(evaluates i : Integer;
			evaluates j : Integer; updates accumulator : Integer);
		requires min_int <= i * j and i * j <= max_int and j >= 0;
		ensures accumulator = #i * j;
	Procedure
		if (j > 0) then
			
		end;
	end;

	Recursive Procedure Multiply_into(updates i : Integer; 
			evaluates j : Integer);
		decreasing j;

		If (j /= 0) then
			j := j - 1;
			result := result + i;
			Decrement (j);
			Add_to (i, j);
		end;
	end;
end;
