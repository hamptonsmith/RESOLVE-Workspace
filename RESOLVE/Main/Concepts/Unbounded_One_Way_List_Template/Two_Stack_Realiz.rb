Realization Two_Stack_Realiz for Unbounded_One_Way_List_Template;
		uses Stack_Template;

	Facility SF is Stack_Template(Entry, Initial_Capacity)
            realized by Array_Realiz;

    	Type List_Position = Record
		Left: SF.Stack;
		Right: SF.Stack;
	end;
        convention
            true;
        correspondence
	    Conc.P = P;
            -- Conc.P.Prec = P.Left and Conc.P.Rem = P.Right;

	Procedure Advance( upd P: List_Position );
		Var E : Entry;
		Pop(E, P.Right);
		Push(E, P.Left);
	end Advance;

	Procedure Reset( upd P: List_Position );
		Var E : Entry;

		While (Depth(P.Left) > 0)
			changing P, E;
			maintaining P.Left o P.Right = #P.Left o #P.Right;
			decreasing |P.Left|;
		do
			Pop(E, P.Left);
			Push(E, P.Right);
		end;
	end Reset;

	Procedure Length_of_Rem( rest P: List_Position ): Integer;
		Length_of_Rem := Depth(P.Right);
	end Length_of_Rem;

	Procedure Insert( clr New_Entry: Entry; upd P: List_Position );
		Push(New_Entry, P.Right);
	end Insert;

	Procedure Rmng_Capacity(): Integer;
		Rmng_Capacity := Initial_Capacity;
	end;

	Procedure Remove( rpl Entry_Removed: Entry; upd P: List_Position );
		Pop(Entry_Removed, P.Right);
	end;

	Procedure Advance_to_End( upd P: List_Position );
		Var E : Entry;

		While (Depth(P.Right) > 0)
			changing P, E;
			maintaining P.Left o P.Right = #P.Left o #P.Right;
			decreasing |P.Right|;
		do
			Pop(E, P.Right);
			Push(E, P.Left);
		end;
	end;

	Procedure Swap_Remainders( upd P, Q: List_Position );
		P.Right :=: Q.Right;
	end;

	Procedure Swap_Prev_Entry_w( upd E: Entry; upd P: List_Position );
		Var F : Entry;
		Pop(F, P.Left);
		Push(E, P.Left);
		F :=: E;
	end;

	Procedure Length_of_Prec( rest P: List_Position ): Integer;
		Length_of_Prec := Depth(P.Left);
	end;

	Procedure Clear_List( clr P: List_Position );
		Clear(P.Left);
		Clear(P.Right);
	end;
end Two_Stack_Realiz;
