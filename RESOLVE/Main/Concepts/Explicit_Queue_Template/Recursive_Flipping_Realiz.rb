Realization Recursive_Flipping_Realiz for Flipping_Capability of Explicit_Queue_Template;
    Recursive Procedure Flip(updates Q: Queue);
        decreasing |Q|;

        Var E: Entry;
        If (Length(Q) /= 0) then
            Dequeue(E, Q);
            Flip(Q);
            Enqueue(E, Q);
        end;
    end Flip;
end Recursive_Flipping_Realiz;
