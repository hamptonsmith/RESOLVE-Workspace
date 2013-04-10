Realization Bin_Search_Realiz(
		Operation Are_Ordered(restores x,y: Entry): Boolean;
			ensures Are_Ordered = (LEQ(x,y));)
	for Search_Capability of Static_Array_Template;
	uses Std_Boolean_Fac;

	Operation Are_Equal(restores x, y : Entry) : Boolean;
		ensures Are_Equal = (x = y);
	Procedure 
		Are_Equal := And(Are_Ordered(x, y), Are_Ordered(y, x));
	end; 

	Procedure Is_Present(restores key: Entry; restores A: Static_Array): Boolean;
		Var low, mid, high, one, two : Integer;
		Var midVal : Entry;
		Var result : Boolean;

		one := One();
		two := Two();

		result := False();
		low := Lower_Bound;
		high := Upper_Bound;

		While (low <= high)
			changing low, mid, high, A, midVal, result;
			maintaining result =
				(Exists_Between(key, Concatenate(
						Shift(A, 
							(Lower_Bound - 1) * -1), 
						Upper_Bound - Lower_Bound), 
					Lower_Bound, low - 1) or
				 Exists_Between(key, Concatenate(
						Shift(A, 
							(Lower_Bound - 1) * -1), 
						Upper_Bound - Lower_Bound), 
					high + 1, Upper_Bound))
				and Lower_Bound <= low and high <= Upper_Bound
				and A = #A;
			decreasing (high - low);
		do
			Divide(Difference(high, low), two, mid);
			mid := Sum(low, mid);
			Swap_Entry(A, midVal, mid);
			if (Are_Equal(midVal, key)) then
				result := True();
				low := Sum(high, one);
			else 
				if (Are_Ordered(midVal, key)) then
					low := Sum(mid, one);
				else
					high := Difference(mid, one);
				end;
			end;
			Swap_Entry(A, midVal, mid);
		end;

		Is_Present := result;
	end;
end;
