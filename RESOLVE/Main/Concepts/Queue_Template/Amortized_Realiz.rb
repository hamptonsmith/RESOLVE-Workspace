Realization Amortized_Realiz for Queue_Template;

	Facility SF is Stack_Template(Entry, Max_Length) 
		realized by Array_Realiz;


	Type Queue is represented by Record
		Front, Back : SF.Stack;
	end;
	convention
		|Q.Front o Q.Back| <= Max_Length;
	correspondence
		Conc.Q = Q.Front o Reverse(Q.Back);


	Operation Fill_Front(updates Q : Queue);
		requires Q.Front = Empty_String;
		ensures Q.Front = Reverse(#Q.Back) and Q.Back = Empty_String;
	Procedure
		Var E : Entry;

		While (Depth(Q.Back) > 0)
			changing Q, E;
			maintaining Q.Front o Reverse(Q.Back) = 
				#Q.Front o Reverse(#Q.Back);
			decreasing |Q.Back|;
		do
			Pop(E, Q.Back);
			Push(E, Q.Front);
		end;
	end;
	

	Procedure Enqueue(alters E : Entry; updates Q : Queue);
		Push(E, Q.Back);
	end;
 
	Procedure Dequeue(replaces R : Entry; updates Q : Queue);
		if (Depth(Q.Front) = 0) then
			Fill_Front(Q);
		end;

		Pop(R, Q.Front);
	end;

	Procedure Swap_First_Entry(updates E: Entry; updates Q: Queue);
		Var Front : Entry;

		if (Depth(Q.Front) = 0) then
			Fill_Front(Q);
		end;

		Pop(Front, Q.Front);
		Push(E, Q.Front);

		E :=: Front;
	end;

	Procedure Length(restores Q : Queue): Integer;
		Length := Depth(Q.Front) + Depth(Q.Back);
	end;
 
	Procedure Rem_Capacity(restores Q : Queue): Integer;
		Rem_Capacity := Max_Length - Depth(Q.Front) - Depth(Q.Back);
	end;

	Procedure Clear(clears Q: Queue);
		Clear(Q.Front);
		Clear(Q.Back);
	end;
end;
