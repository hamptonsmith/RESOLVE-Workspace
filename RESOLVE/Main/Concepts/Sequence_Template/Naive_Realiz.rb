Realization Naive_Realiz for Sequence_Template;

    Type Sequence = Record
        Contents: Array 1..Max_Length of Entry;
        Len: Integer;
    end;
    convention 0 <= S.Len <= Max_Length;
    correspondence Conc.S = Empty_String;

    Procedure Insert_after(evaluates pos: Integer; alters E: Entry; updates S: Sequence);
        Var i: Integer;
        i := S.Len;
        pos := pos+1;
        (*Shift contents right 1*)
        While (i > pos)
            changing i, S;
        do
            S.Contents[i] :=: S.Contents[i-1];
            Decrement(i);
        end;

        Increment(S.Len);
        S.Contents[pos] :=: E;
    end Insert_after;

    Procedure Remove_after(evaluates pos: Integer; replaces R: Entry; updates S: Sequence);
        Var i: Integer;
        i := pos + 1;
        R :=: S.Contents[pos+1];

        (*Shift contents left*)
        While (i < S.Len)
            changing i, S;
        do
            S.Contents[i] :=: S.Contents[i+1];
            Increment(i);
        end;

        Decrement(S.Len);
    end Remove_after;

    Procedure Length(restores S: Sequence): Integer;
        Length := S.Len;
    end Length;

    Procedure Rem_Capacity(restores S: Sequence): Integer;
        Rem_Capacity := Max_Length - S.Len;
    end Rem_Capacity;

    Procedure Clear(clears S: Sequence);
        S.Len := 0;
    end Clear;

end;
