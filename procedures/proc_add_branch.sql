Rem----------------------------------------------------------------------------
Rem Name 	- proc_add_branch
Rem Purpose - add a new branch to bank_locations table.
Rem Author  - AshishT
Rem Created - 29Jan2020
Rem----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE proc_add_branch
IS
BEGIN
	insert into bank_locations(branch_id, branch_code, address)
	VALUES(1,'BR001','850 Lincoln Centre Drive, Foster City, CA 94404');
	COMMIT;
END;
/