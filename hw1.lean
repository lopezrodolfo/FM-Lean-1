-- Math 494 Homework #1
-- Rodolfo Lopez

-- I didn't mention this in class, but "sorry" is a way to tell Lean
-- "I haven't filled in this part of the function yet, but I want to
-- go on and write some other things later in the file."  Thus, I've
-- put "sorry" as the definition of all the functions below; your job
-- is to replace each "sorry" with an actual definition.  You'll also
-- need to define a few types with the "inductive" command.

-- FYI, the natural numbers ℕ have all the basic arithmetic functions:
-- addition (+)
-- multiplication (*)
-- division: a / b is the integer quotient, a % b is the remainder.
--   Thus for instance 9 / 4 = 2 and 9 % 4 = 1.
#eval 9 / 4
#eval 9 % 4


-- Define a function that implements one step of the Collatz
-- Conjecture: if x is even, divide it by two, otherwise multiply by
-- three and add one.
def collatz (x : ℕ) : ℕ := 
if x % 2 = 0 then x / 2 else 3 * x + 1

#eval collatz(1)
#eval collatz((2))


-- Recall that the booleans are defined like this:
/- (This is the syntax for a multi-line comment)
inductive bool : Type
| ff
| tt
-/

-- Here's a reminder of the syntax for "match":
def bool_to_nat (x : bool) : nat :=
match x with
| ff := 0
| tt := 1
end

-- An equivalent definition using if-then-else:
def bool_to_nat' (x : bool) : nat := if x then 1 else 0

-- Define the "negation" operation on booleans.  Remember that the
-- elements of "bool" are called "tt" and "ff".  You can use either
-- "match" or "if-then-else"; try it both ways!
def neg (x : bool) : bool := 
match x with
| tt := ff
| ff := tt
end

--if x then ff else tt

#eval neg(tt)
#eval neg(ff)


-- Define the "NAND" function on booleans, where "NAND(x,y)" is false
-- if both x and y are true, and true otherwise.
def nand (x : bool) (y : bool) : bool := 
if x && y then ff else tt

#eval nand(tt)(tt)
#eval nand(tt)(ff)

-- Define an enumerated type called "month" representing the months of
-- the year.  The individual months should be named "january",
-- "february", etc. in lowercase.  You'll probably want to "open
-- month" afterwards.

-- (YOUR DEFINITION OF "month" GOES HERE)
inductive month : Type
|january
|february
|march
|april
|may
|june
|july
|august
|september
|october
|november
|december
open month

-- Define a function that returns the number of days in a month of a
-- standard non-leap year.  (Note that Lean will put a red underline
-- on "month" here if you haven't defined it yet.)
def days_in_month (m : month) : ℕ := 
match m with 
|january := 31
|february := 28
|march := 31
|april := 30
|may := 31
|june := 30
|july := 31
|august := 31
|september := 30
|october := 31
|november := 30
|december := 31
end

--month.rec_on m 31 28 31 30 31 30 31 31 30 31 30 31
#eval days_in_month(january)
#eval days_in_month(february)
#eval days_in_month(april)
#eval days_in_month(november)


-- Improve your previous function to compute the number of days in a
-- specified month of a specified year, taking leap years and leap
-- centuries into account.  (If you want some extra fun, implement
-- October 1582.)
def improved_days_in_month (year : ℕ) (m : month) : ℕ := 
match m with 
|january := 31 
|february := if year % 100 = 0 ∧ year % 400 = 0 then 29 else if year % 4 = 0 then 29 else 28
|march := 31
|april := 30
|may := 31
|june := 30
|july := 31
|august := 31
|september := 30
|october := 31
|november := 30
|december := 31
end


--if year % 4 = 0 ∨ year % 400 = 0 then month.rec_on m 31 29 31 30 31 30 31 31 30 31 30 31
--else month.rec_on m 31 28 31 30 31 30 31 31 30 31 30 31

#eval improved_days_in_month(2003)(january)
#eval improved_days_in_month(2004)(april)
#eval improved_days_in_month(2004)(february)
#eval improved_days_in_month(1900)(february)
#eval improved_days_in_month(2007) (november)


-- Now recall the syntax for defining constructors with arguments:
inductive nat_plus_int : Type
| inl (x : nat)
| inr (y : int)
open nat_plus_int

-- We didn't do an example in class of matching against such
-- constructors to show the syntax, so here is one:
def add_or_subtract_two (u : nat_plus_int) : nat_plus_int :=
match u with
| (inl x) := inl (x + 2)
| (inr y) := inr (y - 2)
end

-- Define a type called "day" representing individual days of the
-- year, with one constructor for each month (with the same name as
-- before) taking a natural number argument representing a day of that
-- month.  (For now, don't worry about the possibility of "january 35"
-- or "march 0", just as our definition of "color" in class permitted
-- "rgb(1000,300,-3)" even though RGB values are generally between 0
-- and 255.  Later on we'll see how to impose restrictions like this.)

-- (YOUR DEFINITION OF "day" GOES HERE.)
inductive day : Type 
|january (d : ℕ)
|february (d : ℕ)
|march (d : ℕ)
|april (d : ℕ)
|may (d : ℕ)
|june (d : ℕ)
|july (d : ℕ)
|august (d : ℕ)
|september (d : ℕ)
|october (d : ℕ)
|november (d : ℕ)
|december (d : ℕ)
open day



-- Define a type called "season" with the obvious four elements.

-- (YOUR DEFINITION OF "season" GOES HERE.)
inductive season : Type
| fall
| winter
| spring
| summer
open season


-- Define a function that takes a day of the year and computes what
-- season it lies in.  Assume for simplicity that all solstices and
-- equinoxes are always on the 21st of a month.
def get_season (d : day) : season := 
match d with
|january (x) := winter
|february (x) := winter 
|march (x) := if x ≥ 21 then spring else winter
|april (x) := spring
|may (x) := spring
|june (x) := if x ≥ 21 then summer else spring
|july (x) := summer
|august (x) := summer
|september (x) := if x ≥ 21 then fall else summer
|october (x) := fall
|november (x) := fall
|december (x) := if x ≥ 21 then winter else fall
end

#eval get_season(december(2))
#eval get_season(february(21))
#eval get_season(may(21))
#eval get_season(june(23))
#eval get_season(november(24))
#eval get_season(march(20))
#eval get_season(march(21))





