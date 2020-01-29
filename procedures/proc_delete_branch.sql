Rem----------------------------------------------------------------------------
Rem Name 	- proc_delete_branch
Rem Purpose - add a new branch to bank_locations table.
Rem Author  - AshishT
Rem Created - 29Jan2020
Rem----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE proc_add_branch(p_branch_code in number)
IS
BEGIN
  DELETE from bank_locations WHERE branch_code = 'BR001';
	COMMIT;
END;
/