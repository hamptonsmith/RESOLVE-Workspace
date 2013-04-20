Realization Sequence_Realiz for Preemptable_Queue_Template;

    Facility SF is Sequence_Template(Entry, Max_Length)
	realized by Naive_Realiz;

    Type P_Queue = Record
	Contents : SF.Sequence;
	Dummy : Integer;
    end;
    correspondence
        Conc.Q = Q.Contents;

    Procedure Enqueue(alters E: Entry; updates Q: P_Queue);
        Insert_after(Length(Q.Contents), E, Q.Contents);
    end Enqueue;

    Procedure Inject(alters E: Entry; updates Q: P_Queue);
        Insert_after(0, E, Q.Contents);
    end Inject;

    Procedure Dequeue(replaces R: Entry; updates Q: P_Queue);
        Remove_after(0, R, Q.Contents);
    end Dequeue;

    Procedure Swap_Last_Entry(updates E: Entry; updates Q: P_Queue);
        Var len: Integer;
        Var temp: Entry;
        temp :=: E;
        Remove_after(Length(Q.Contents) - 1, E, Q.Contents);
        Insert_after(Length(Q.Contents), temp, Q.Contents);
    end Swap_Last_Entry;
      
    Procedure Length(restores Q: P_Queue): Integer;
        Length := Length(Q.Contents);
    end Length;

    Procedure Rem_Capacity(restores Q: P_Queue): Integer;
        Rem_Capacity := Rem_Capacity(Q.Contents);
    end Rem_Capacity;

    Procedure Clear(clears Q: P_Queue);
        Clear(Q.Contents);
    end Clear;

end;
