Realization Recursive_Append_Realiz for Append_Capability of Queue_Template;
    Recursive Procedure Append(updates P: Queue; clears Q: Queue);
        decreasing |Q|;

      Var E: Entry;
      If (Length (Q) /= 0) then
          Dequeue(E,Q);
          Enqueue(E,P);
          Append(P,Q);
      end;
    end Append;

end Recursive_Append_Realiz;