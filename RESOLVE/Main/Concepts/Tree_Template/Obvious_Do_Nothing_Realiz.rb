Realization Obvious_Do_Nothing_Realiz for Do_Nothing_Capability of Tree_Template;

	Procedure Do_Nothing(restores T : Tree);
		Var Child : Tree;

		Add_Child(Child, T);
		Remove_Rightmost_Child(Child, T);
	end;

end;
