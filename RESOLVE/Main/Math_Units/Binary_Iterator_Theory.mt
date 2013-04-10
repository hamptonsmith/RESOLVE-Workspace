Precis Binary_Iterator_Theory;
		uses Integer_Theory, String_Theory, Conditional_Function_Theory;

	Definition Iterative_Apply(Step : ((R : MType) * (V : MType)) -> R,
		Start : R, Value_Function : Z -> V, Value_Count : Z) : R;

	Definition Concatenate(Value_Function : Z -> (T : MType), 
			Value_Count : Z) : Str(T) = 
		Iterative_Apply(lambda (s : Str(T), t : T).(s o <t>),
			Empty_String, Value_Function, Value_Count);

	Definition Shift(Value_Function : Z -> (V : MType), offset : Z) : 
		Z -> V;

	Theorem Concatenation_Length:
		For all f : Z -> Entity,
		For all i : Z,
			|Concatenate(f, i)| = i;

	Theorem Zero_Length_Concatenate:
		For all f : Z -> Entity,
			Concatenate(f, 0) = Empty_String;

	Theorem End_Changed:
		For all f : Z -> Entity,
		For all e : Entity,
		For all i : Z,
			Concatenate(
				lambda (j : Z).({{
					e if j = i;
					f(j) otherwise;
				}}),
				i)
			= Concatenate(f, i - 1) o <e>;

	Theorem End_Excluded:
		For all f : Z -> Entity,
		For all e : Entity,
		For all i : Z,
			Concatenate(
				lambda (j : Z).({{
					e if j = i;
					f(j) otherwise;
				}}),
				i - 1)
			= Concatenate(f, i - 1);

	Theorem Inductive_Reverse_1:
		For all f : Z -> Entity,
		For all i : Z,
		Reverse(Concatenate(f, i)) = 
			<f(i)> o Reverse(Concatenate(f, i - 1));
end;
