Realization Iterative_Append_Realiz for Append_Capability of Explicit_Queue_Template;
    Procedure Append(updates P: Queue; clears Q: Queue);
        Var E: Entry;
        While (Length(Q) /= 0)
          maintaining (P o Q = #P o #Q);
          decreasing |Q|;
        do
          Dequeue(E,Q);
          Enqueue(E,P);
        end;
    end Append;
end Iterative_Append_Realiz;
