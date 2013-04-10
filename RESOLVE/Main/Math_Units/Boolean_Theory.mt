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


Precis Boolean_Theory;
    -- all definitions are syntactic place holders

	Type Theorem Cart_Prod_Thingy:
		For all T1, T2 : MType,
		For all R1 : Powerset(T1),
		For all R2 : Powerset(T2),
		For all r1 : R1,
		For all r2 : R2,
			(r1, r2) : (T1 * T2);

	Definition (a : B) implies (b : B) : B = not(a) or b;

	---------------------------------------------------------------
	-- Basic Boolean Theorems                                    --
	---------------------------------------------------------------
	Theorem Or_False_Theorem:
		false or false = false;

    (*Math Type B: SSet;

    Definition False: B;

    Definition neg: B -> B;

    Definition conj: B x B -> B;

    --------------------------------------------------------------

    Definition not (b: B): B = neg(b);

    Definition (a: B) and (b: B): B = conj(a, b);

    --------------------------------------------------------------

    Definition True: B = not False;

    Definition (a: B) or (b: B): B = not (not(a) and not(b));

    Definition (a: B) implies (b: B): B = not(a) or b;

    Definition (a: B) iff (b: B): B = (a implies b) and (b implies a);

    Definition (a: B) xor (b: B): B = (a or b) and not (a and b);*)

end Boolean_Theory;
