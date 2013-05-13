(*
 * This softare is released under the new BSD 2006 license.
 * 
 * Note the new BSD license is equivalent to the MIT License, except for the
 * no-endorsement final clause.
 * 
 * Copyright (c) 2007, Clemson University
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *   * Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer. 
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution. 
 *   * Neither the name of the Clemson University nor the names of its
 *     contributors may be used to endorse or promote products derived from
 *     this software without specific prior written permission. 
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 * This sofware has been developed by past and present members of the
 * Reusable Sofware Research Groups (RSRG) at Clemson University and
 * The Ohio State University.
 *)


Precis String_Theory;
    uses Integer_Theory;

	--The type of all strings of heterogenous type
	Definition SStr : MType;
	Definition Empty_String : SStr;

	--A function that restricts SStr to the type of all strings of some homogenous
	--type
	Definition Str : MType -> MType;
	Definition Empty_String_In(T : MType) : Str(T);

	Type Theorem Empty_String_In_All_Strs:
		For all T : MType,
			Empty_String : Str(T);

	Type Theorem All_Strs_In_SStr:
		For all T : MType,
		For all S : Str(T),
			S : SStr;

	--If R is a subset of T, then Str(R) is a subset of Str(T)
	Type Theorem Str_Subsets:
		For all T : MType,
		For all R : Powerset(T),
		For all s : Str(R),
			s : Str(T);

	--String length
	Definition |(s : SStr)| : N;

	--String concatenation
	--Definition (s : Str(U : MType)) o (t : Str(U)) : Str(U);
	Definition (s : SStr) o (t : SStr) : SStr;

	Type Theorem Concatenation_Preserves_Generic_Type:
		For all T : MType,
		For all U, V : Str(T),
			U o V : Str(T);

	--Definition Reverse(s : Str(U : MType)) : Str(U);

	Definition Reverse(s : SStr) : SStr;

	Type Theorem Reverse_Preserves_Generic_Type:
		For all T : MType,
		For all S : Str(T),
			Reverse(S) : Str(T);

	--Singleton string
	Definition <(e : (U : MType))> : Str(U);

	Definition Is_Permutation(s : SStr, t : SStr) : B;

	--Determines if for every pairing of elements from s and t, the given predicate
	--holds
	Definition Is_Universally_Related(s : SStr, t : SStr, 
		f : (Entity * Entity) -> B) : B;

	Definition Substring(s : SStr, startInclusive : Z, length : Z) :
		SStr;

	Definition Element_At(i : Z, s : SStr) : Entity;

	Type Theorem Element_At_Extracts_Generic_Type:
		For all T : MType,
		For all S : Str(T),
		For all i : Z,
			Element_At(i, S) : Str(T);

	Definition Exists_Between(E : Entity, S : SStr, From : Z, To : Z) : B;

	---------------------------------------------------------------
	-- String Equality Theorems                                  --
	---------------------------------------------------------------
	Theorem Structure_Equality:
		For all S, T : SStr,
		For all E, F : Entity,
			(S o <E> = T o <F>) implies ((S = T) and (E = F));


	---------------------------------------------------------------
	-- Empty String Theorems                                     --
	---------------------------------------------------------------
	Theorem Reverse_Empty_String:
		Reverse(Empty_String) = Empty_String;

	Theorem Empty_String_Concatenation_Right:
		For all S : SStr,
			S o Empty_String = S;

	Theorem Empty_String_Concatenation_Left:
		For all S : SStr,
			Empty_String o S = S;

	---------------------------------------------------------------
	-- String Length Theorems                                    --
	---------------------------------------------------------------
	Theorem Stringleton_Lenght_One:
		For all e : Entity,
			|<e>| = 1;

	Theorem Same_String_Same_Length:
		For all S, T : SStr,
			S = T implies |S| = |T|;

	Theorem String_Length_Boundary_1:
		For all S, T : SStr,
		For all i : Z,
			|S o T| <= i implies
				|S| <= i and
				|T| <= i;

	Theorem String_Length_Boundary_2:
		For all S, T : SStr,
		For all i : Z,
			|S o T| < i implies
				|S| < i and
				|T| < i;

	Theorem Lenght_Concatenate_Singleton:
		For all S : SStr,
		For all e : Entity,
			|S o <e>| = |S| + 1;

	Theorem String_Length_Boundary_Singleton_Left:
		For all S : SStr,
		For all E : Entity,
		For all i : Z,
			|<E> o S| <= i implies
				|S| < i;

	Theorem String_Length_Hack_1:
		For all U, V : SStr,
		For all E : Entity,
		For all i : Z,
			|U o (<E> o V)| <= i implies
				|U| < i and
				|V| < i;

	Theorem Reverse_Irrelevant_In_Length:
		For all S : SStr,
			|Reverse(S)| = |S|;

	Theorem Concatenate_Singleton_Greater_Than_Zero_Length:
		For all S : SStr,
		For all E : Entity,
			|(S o <E>)| > 0;

	Theorem Concatenate_Singleton_Increases_Length_Left:
		For all S : SStr,
		For all E : Entity,
			(|S| < |<E> o S|);

	Theorem Concatenate_Singleton_Increases_Length_Right:
		For all S : SStr,
		For all E : Entity,
			(|S| < |S o <E>|);

	Theorem Zero_Length_Implies_Empty_String:
		For all S : SStr,
			(|S| = 0) = (S = Empty_String);

	Theorem Length_Concatenation:
		For all U, V : SStr,
			|U o V| = |U| + |V|;

	Theorem Get_Rid_Of_Singleton_1:
		For all S, T : SStr,
		For all e : Entity,
			(|S o <e>| = |T|) implies
				(|S| < |T|);

	Theorem Get_Rid_Of_Singleton_2:
		For all S, T : SStr,
		For all e : Entity,
			(|<e> o S| = |T|) implies
				(|S| < |T|);

	Theorem Length_Relation_1:
		For all S, T, U : SStr,
			|S o T| = |U| and |S| > 0 implies
				|T| < |U|;

	Theorem Length_Relation_2:
		For all S : SStr,
		For all e : Entity,
		For all i, j : Z,
			|S o <e>| = i and i <= j implies |S| < j;

	Theorem Concat_Length_Not_Zero_Left:
		For all U, V, W : SStr,
			U o V = W and |U| /= 0 implies |V| < |W|;

	Theorem Concat_Length_Not_Zero_Right:
		For all U, V, W : SStr,
			U o V = W and |V| /= 0 implies |U| < |W|;

	---------------------------------------------------------------
	-- Singleton String Theorems                                 --
	---------------------------------------------------------------
	Theorem Reverse_Of_Singleton:
		For all E : Entity,
			Reverse(<E>) = <E>;

	---------------------------------------------------------------
	-- Reverse Theorems                                          --
	---------------------------------------------------------------
	Theorem Concatenation_Under_Reverse:
		For all U, V : SStr,
			Reverse(U o V) = Reverse(V) o Reverse(U);

	Theorem Reverse_Inverts_Itself:
		For all S : SStr,
			Reverse(Reverse(S)) = S;

	---------------------------------------------------------------
	-- Concatenation Theorems                                    --
	---------------------------------------------------------------
	Theorem Concatenation_Associative:
		For all U, V, W : SStr,
			(U o V) o W = U o (V o W);

	---------------------------------------------------------------
	-- Permutation Theorems                                      --
	---------------------------------------------------------------
	Theorem Identity_Permutation:
		For all S : SStr,
			Is_Permutation(S, S);

	Theorem Permutation_Lengths:
		For all S, T : SStr,
			Is_Permutation(S, T) implies |S| = |T|;

	Theorem Permutation_Extension_1:
		For all S, T, U, V : SStr,
			Is_Permutation(S, T) and
			Is_Permutation(T o U, V) implies
				Is_Permutation(S o U, V);

	Theorem Permutation_Shell_Game_1:
		For all S, T, U, V : SStr,
			Is_Permutation(S o (T o U), V) =
				Is_Permutation((S o U) o T, V);

	Theorem Permutation_Shell_Game_2:
		For all S, T : SStr,
			Is_Permutation(S o T, T o S);

	Theorem Permutation_Shell_Game_3:
		For all S, T, U, V, W : SStr,
			Is_Permutation((S o (T o U)) o V, W) =
				Is_Permutation(((S o V) o U) o T, W);

	Theorem Permutation_Commutative:
		For all S, T : SStr,
			Is_Permutation(S, T) = Is_Permutation(T, S);

	---------------------------------------------------------------
	-- Universal Relations Theorems                              --
	---------------------------------------------------------------
	Theorem Empty_String_Universally_Related_1:
		For all S : SStr,
		For all f : (Entity * Entity) -> B,
			Is_Universally_Related(Empty_String, S, f);

	Theorem Empty_String_Universally_Related_2:
		For all S : SStr,
		For all f : (Entity * Entity) -> B,
			Is_Universally_Related(S, Empty_String, f);

	Theorem Universally_Related_Distributes_1:
		For all f : (Entity * Entity) -> B,
		For all S, T, U : SStr,
			Is_Universally_Related(S o T, U, f) implies
				Is_Universally_Related(S, U, f) and
				Is_Universally_Related(T, U, f);

	Theorem Universally_Related_Distributes_2:
		For all f : (Entity * Entity) -> B,
		For all S, T, U : SStr,
			Is_Universally_Related(S, T o U, f) implies
				Is_Universally_Related(S, T, f) and
				Is_Universally_Related(S, U, f);

	Theorem Universally_Related_Distributes_3:
		For all f : (Entity * Entity) -> B,
		For all S, T, U : SStr,
			Is_Universally_Related(S, U, f) and
			Is_Universally_Related(T, U, f) implies
				Is_Universally_Related(S o T, U, f);

	Theorem Universally_Related_Distributes_4:
		For all f : (Entity * Entity) -> B,
		For all S, T, U : SStr,
			Is_Universally_Related(S, T, f) and
			Is_Universally_Related(S, U, f) implies
				Is_Universally_Related(S, T o U, f);

	Theorem Permutation_Maintains_Universal_Relation_1:
		For all f : (Entity * Entity) -> B,
		For all S, T, U : SStr,
			Is_Universally_Related(S, T, f) and
			Is_Permutation(U, T) implies
				Is_Universally_Related(S, U, f);

	Theorem Permutation_Maintains_Universal_Relation_2:
		For all f : (Entity * Entity) -> B,
		For all S, T, U : SStr,
			Is_Universally_Related(S, T, f) and
			Is_Permutation(U, S) implies
				Is_Universally_Related(U, T, f);

	Theorem Universal_Relation_Transitivity_1:
		For all f : (Entity * Entity) -> B,
		For all S : SStr,
		For all e1, e2 : Entity,
			f(e1, e2) and Is_Universally_Related(<e2>, S, f) implies
				Is_Universally_Related(<e1>, S, f);

	Theorem Universally_Related_Singletons:
		For all e1, e2 : Entity,
		For all f : (Entity * Entity) -> B,
			f(e1, e2) = Is_Universally_Related(<e1>, <e2>, f);

	---------------------------------------------------------------
	-- Exists_Between Theorems                                   --
	---------------------------------------------------------------
	Theorem Exists_Between_No_Window_1:
		For all e : Entity,
		For all S : SStr,
		For all i : Z,
			Exists_Between(e, S, i, i - 1) = false;

	Theorem Exists_Between_No_Window_2:
		For all e : Entity,
		For all S : SStr,
		For all i : Z,
			Exists_Between(e, S, i + 1, i) = false;

	Theorem Exists_Between_Decomposition:
		For all e : Entity,
		For all S : SStr,
		For all i, j, x, y : Z,
			x >= y - 1 implies
				((Exists_Between(e, S, i, x) or
				Exists_Between(e, S, y, j)) =
					Exists_Between(e, S, i, j));

	---------------------------------------------------------------
	-- Substring Theorems                                        --
	---------------------------------------------------------------
	Theorem Substring_Length:
		For all S : SStr,
		For all n : N,
			|Substring(S, n, |S| - n)| = |S| - n;

	Theorem Structure_1:
		For all S : SStr,
			<Element_At(0, S)> o Substring(S, 1, (|S| - 1)) = S;
end;
