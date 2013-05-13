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

Precis Set_Theory;
    uses Boolean_Theory;

	Definition Set : (MType -> MType);

	Type Theorem Restricted_Set_Subtype_of_Big_Set:
		For all T : MType,
		For all S : Set(T),
			S : SSet;

	Type Theorem Empty_Set_In_All_Sets:
		For all T : MType,
			Empty_Set : Set(T);

	Definition Is_In(e : Entity, T : MType) : B;

    (*Definition elem: Gamma x Set(Gamma) -> B;

    --------------------------------------------------------------

    Definition (e: Gamma) is_in (s: Set(Gamma)): B =
        elem(e, s);

    --------------------------------------------------------------

    Definition (e: Gamma) is_not_in (s: Set(Gamma)): B =
        not (e is_in s);

    Definition complement (s: Set(Gamma)): Set(Gamma) =
        { e: Gamma, e is_not_in s };

    Definition (s: Set(Gamma)) union (t: Set(Gamma)): Set(Gamma) =
        { e: Gamma, e is_in s or e is_in t };

    Definition (s: Set(Gamma)) intersection (t: Set(Gamma)): Set(Gamma) =
        { e: Gamma, e is_in s and e is_in t };

    Definition (s: Set(Gamma)) without (t: Set(Gamma)): Set(Gamma) =
        { e: Gamma, e is_in s and e is_not_in t };

    Definition (s: Set(Gamma)) is_subset_of (t: Set(Gamma)): B =
        For all e: Gamma, if e is_in s then e is_in t;

    Definition (s: Set(Gamma)) is_proper_subset_of (t: Set(Gamma)): B =
        s is_subset_of t and s /= t;

    Definition (s: Set(Gamma)) is_not_subset_of (t: Set(Gamma)): B =
        not (s is_subset_of t);

    Definition (s: Set(Gamma)) is_not_proper_subset_of (t: Set(Gamma)): B =
        not (s is_proper_subset_of t);

    Definition Singleton(e : Gamma) : Set(Gamma);

    --Definition ||(s: Set(Gamma))||: Z = 0;

    --Definition Foo(D : SSet, E : D): SSet;
*)
end Set_Theory;
