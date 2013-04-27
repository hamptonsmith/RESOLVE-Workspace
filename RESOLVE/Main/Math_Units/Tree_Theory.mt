Precis Tree_Theory;
		uses String_Theory;

	Definition TTree : MType;
	Definition Tree : MType -> MType;

	Type Theorem Tree_Subset:
		For all T : MType,
		For all Tr : Tree(T),
			Tr : TTree;

	Definition Treeify(Root : Entity, Children : Str(TTree)) : TTree;
	Definition Split(Tr : TTree) : Str(TTree);
	Definition Get_Root(Tr : TTree) : Entity;

	---------------------------------------------------------------
	-- Tree Equality Theorems                                    --
	---------------------------------------------------------------

	Theorem Structural_Equality:
		For all T1, T2 : TTree,
			((Get_Root(T1) = Get_Root(T2)) and 
				(Split(T1) = Split(T2))) = (T1 = T2);

end;
