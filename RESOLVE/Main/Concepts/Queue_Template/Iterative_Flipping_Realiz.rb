Realization Iterative_Flipping_Realiz for Flipping_Capability of Queue_Template;

	Facility Stack_Fac is Stack_Template(Entry, Max_Length)
		realized by Array_Realiz;

	Procedure Flip(updates Q : Queue);
		Var ResultQ : Queue;
		Var S : Stack;
		Var E : Entry;

		While (Length(Q) /= 0)
			changing E, S, Q;
			maintaining Reverse(S) o Q = #Q;
			decreasing |Q|;
		do
			Dequeue(E, Q);
			Push(E, S);
		end;

		While (Depth(S) /= 0)
			changing E, S, ResultQ;
			maintaining ResultQ o S = Reverse(#Q);
			decreasing |S|;
		do
			Pop(E, S);
			Enqueue(E, ResultQ);
		end;

		Q :=: ResultQ;
	end;
end;
