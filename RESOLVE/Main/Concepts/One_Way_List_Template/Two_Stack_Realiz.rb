Realization Two_Stack_Realiz for One_Way_List_Template;
		uses Stack_Template, Std_Boolean_Fac;

	Facility SF is Stack_Template(Element, Max_Length)
		realized by Array_Realiz;

    	Type One_Way_List = Record
		Left : SF.Stack;
		Right : SF.Stack;
	end;
        correspondence
	    Conc.P.Prec = P.Left and Conc.P.Rem = P.Right;

	Procedure Advance(updates P : One_Way_List);
		Var E : Element;

		Pop(E, P.Right);
		Push(E, P.Left);
	end;

	Procedure Reset(updates P : One_Way_List);
		Var E : Element;

		While (Depth(P.Left) > 0)
			changing P, E;
			maintaining P.Left o P.Right = #P.Left o #P.Right;
			decreasing |P.Left|;
		do
			Pop(E, P.Left);
			Push(E, P.Right);
		end;
	end;

	Procedure Length_of_Rem(restores P : One_Way_List) : Integer;
		Length_of_Rem := Depth(P.Right);
	end;

	Procedure Insert(alters New_Entry : Element; updates P : One_Way_List);
		Push(New_Entry, P.Right);
	end;

	Procedure Remaining_Capacity(restores P : One_Way_List) : Integer;
		Remaining_Capacity := 
			Max_Length - Depth(P.Left) - Depth(P.Right);
	end;

	Procedure Remove(replaces Entry_Removed : Element; 
			updates P : One_Way_List );
		Pop(Entry_Removed, P.Right);
	end;

	Procedure Advance_to_End(updates P : One_Way_List);
		Var E : Element;

		While (Depth(P.Right) > 0)
			changing P, E;
			maintaining P.Left o P.Right = #P.Left o #P.Right;
			decreasing |P.Right|;
		do
			Pop(E, P.Right);
			Push(E, P.Left);
		end;
	end;

	Procedure Swap_Prev_Entry_w(updates E : Element; 
			updates P : One_Way_List);
		Var F : Element;
		Pop(F, P.Left);
		Push(E, P.Left);
		F :=: E;
	end;

	Procedure Length_of_Prec(restores P : One_Way_List) : Integer;
		Length_of_Prec := Depth(P.Left);
	end;

	Procedure Clear_List(clears P : One_Way_List);
		Clear(P.Left);
		Clear(P.Right);
	end;
end;
