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

Precis Integer_Theory;
    uses Boolean_Theory, Set_Theory, Monogenerator_Theory;

	(* Note that the type Z is built-in.  No need to introduce it here.
	 * As a demonstration of how we might do so, however, we introduce the
	 * type ZZ, which is isomorphic to Z. *)

	Categorical Definition introduces
		ZZ : MType, ZZ0 : ZZ, succ : ZZ -> ZZ
	related by
		Is_Monogenerator_For(ZZ, ZZ0, succ);

	Definition N : Powerset(Z);

	Definition 0: N;
	Definition 1: N;
	Definition 2: N;

	Definition z : Z;

	Type Theorem N_Subset_of_Z:
		For all n : N,
			n : Z;

	Definition TakesZs(zs : (Z * Z * Z)) : B;
	Definition SomeNs : (N * N * N);
	Definition AFact : B = TakesZs(SomeNs);

    Definition neg: Z -> Z;

    Definition suc: Z -> Z;

    --------------------------------------------------------------

    Definition (i: Z) + (j: Z): Z = 0;

    Definition (i: Z) - (j: Z): Z = 0;

    Definition (i: Z) * (j: Z) : Z = 0;

    Definition (i: Z) ** (j: Z) : Z = 0;

    Definition (i: Z) / (j: Z) : Z = 0;

    Definition (i: Z) mod (j: Z) : Z = 0;

    Definition (i: Z) rem (j: Z) : Z = 0;

    Definition (i: Z) div (j: Z) : Z = 0;

    Definition (i: Z) <= (j: Z) : B = true;

    Definition (i: Z) >= (j: Z) : B = true;

    Definition (i: Z) < (j: Z) : B = true;

    Definition (i: Z) > (j: Z) : B = true;

    Definition |(i: Z)| : Z = 0;

    Definition (i: Z) .. (j: Z) : Set(Z) = Empty_Set;

	Definition Sum(a : Z, s : Set(Z)) : Z;

    Definition Summation(s: Set(Z), f: Z -> Z) : Z = 0;

	Definition isEven(i : Z) : B = true;

	---------------------------------------------------------------
	-- Obvious Theorems                                          --
	---------------------------------------------------------------
	Theorem Zero_Less_Than_One: 0 < 1;
	Theorem One_Greater_Than_Zero: 1 > 0;

	Theorem Zero_Not_Equal_To_Two: 2 /= 0;

	---------------------------------------------------------------
	-- Relation Theorems                                         --
	---------------------------------------------------------------

	Theorem NN_Not_Greater_Than_Zero:
		For all n : N,
			not(n > 0) = (n = 0);

	Theorem NN_Not_Zero_Addition_Right_LET:
		For all n, m : N, 
		For all i : Z,
			n + m <= i and m /= 0 implies n < i;

	Theorem NN_Not_Zero_Addition_Left_LET:
		For all n, m : N, 
		For all i : Z,
			n + m <= i and n /= 0 implies m < i;

	Theorem Even_More_LT_1:
		For all i, j, k : Z,
			i + j <= k and j > 0 implies i < k;

	Theorem Even_More_LT_2:
		For all i, j, k : Z,
			i + j <= k and i > 0 implies j < k;

	Theorem Greater_Than_Zero_Not_Equal_Zero:
		For all i : Z,
			i > 0 implies i /= 0;

	Theorem Not_Equal_Syntax:
		For all i, j : Z,
			not(i = j) = (i /= j);

	Theorem GET_And_Not_Equal_GT:
		For all i, j : Z,
			i >= j and i /= j implies i > j;

	Theorem Bound_1_1:
		For all i, j : Z,
			(i + 1 <= j) = (i < j);

	Theorem Bound_1_2:
		For all i, j : Z,
			(i <= j - 1) = (i < j);

	Theorem Bound_1_3:
		For all i, j : Z,
			(i - 1 >= j) = (i > j);

	Theorem Bound_N_1:
		For all i, j, k : Z,
			(i + j <= k) and j >= 0 implies i <= k;

	Theorem Balance:
		For all i, j, k : Z,
			(i + k) + (j - k) = (i + j);

	Theorem Easy_Less_Than:
		For all i : Z,
			i - 1 < i;

	Theorem LET_Both:
		For all i, j, k : Z,
			i <= j and k > j implies i < k;

	Theorem Less_Than_Equal_Self:
		For all i : Z,
			i <= i;

	Theorem Switch_1:
		For all i, j : Z,
			(i > j) = (j < i);

	Theorem Switch_2:
		For all i, j : Z,
			(i >= j) = (j <= i);

	Theorem Weaken_1:
		For all i, j : Z,
			i > j implies i >= j;

	Theorem Weaken_2:
		For all i, j : Z,
			i < j implies i <= j;

	Theorem LET_Transitive:
		For all i, j, k : Z,
			i <= j and j <= k implies i <= k;

	Theorem Mixed_Transitive_1:
		For all i, j, k : Z,
			i < j and j <= k implies i < k;

	Theorem Off_by_One_1:
		For all i, j : Z,
			(i <= j) = (i < j + 1);

	Theorem Off_by_One_2:
		For all i, j : Z,
			(i < j) = (i + 1 <= j);

	Theorem Off_by_One_3:
		For all i, j : Z,
			(i < j) = (i <= j - 1);

	Theorem Subtract_One_from_both_LET:
		For all i, j : Z,
			(i <= j) = ((i - 1) <= (j - 1));

	Theorem Subtract_One_Still_Less:
		For all i, j : Z,
			i <= j implies i - 1 <= j;

	Theorem Subtract_Positive_Still_Less:
		For all i, j, k : Z,
			i <= j and k >= 0 implies i - k <= j;

	Theorem LET_But_Not_Equal_1:
		For all i, j : Z,
			(i <= j and j /= i) = (i < j);

	Theorem Cheap_LEQ_Theorem_1:
		For all i, j, k : Z,
			k <= j and i <= 0 implies i <= j - k;

	Theorem Subtact_Makes_Less:
		For all i, j, k : Z,
			i = j - k and k > 0 implies i < j;

	---------------------------------------------------------------
	-- Zero Theorems                                             --
	---------------------------------------------------------------

	Theorem Zero_Property_Right:
		For all i : Z,
			i + 0 = i;

	Theorem Zero_Property_Left:
		For all i : Z,
			0 + i = i;

	Theorem Zero_Minus_Property:
		For all i : Z,
			i - 0 = i;

	Theorem Zero_Multiplication_Right:
		For all i : Z,
			i * 0 = 0;

	Theorem Zero_Multiplication_Left:
		For all i : Z,
			0 * i = 0;

	---------------------------------------------------------------
	-- Arithmetic                                                --
	---------------------------------------------------------------

	Theorem Plus_Minus:
		For all i, j : Z,
			i + j - j = i;

	Theorem Minus_Itself:
		For all i : Z,
			i - i = 0;

	Theorem Subtract_Both_Sides_LET:
		For all i, j : Z,
			i <= j implies 0 <= j - i;

	Theorem Equality_Move_Subtraction_1:
		For all i, j, k : Z,
			(i = j - k) = (i + k = j);

	Theorem Denied_Multiplications:
		For all i, j, k, h : Z,
			(i * (j - (k - h))) = (i * (j - k)) + (i * h);

	Theorem Multiplication_Identity_1:
		For all i : Z,
			i * 1 = i;

	Theorem Multiplication_Identity_2:
		For all i : Z,
			1 * i = i;

end Integer_Theory;
