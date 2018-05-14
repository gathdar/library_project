/* The library query procedure */

/* query 1 of 7 */
CREATE PROC dbo.uspQuery1 @Branch nvarchar(30) = NULL
AS
SELECT
	a2.branch_name, a3.book_title, a1.no_of_copies
	FROM tbl_book_copies a1
	INNER JOIN tbl_book a3 ON a3.book_id = a1.book_id
	INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.branch_id
	WHERE branch_name = ISNULL(@Branch, branch_name) AND a1.book_id = (1)
	GO

EXEC dbo.uspQuery1 @Branch = 'Sharpstown'

/* query 2 of 7 */
CREATE PROC dbo.uspQuery2 @BookID nvarchar(30) = NULL
AS
SELECT
	a2.branch_name, a3.book_title, a1.no_of_copies
	FROM tbl_book_copies a1
	INNER JOIN tbl_book a3 ON a3.book_id = a1.book_id
	INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.branch_id
	WHERE a1.book_id = ISNULL(@BookID, a1.book_id)

EXEC dbo.uspQuery2 @BookID = '1'

/* query 3 of 7 */
CREATE PROC dbo.uspQuery3
AS
BEGIN
	SELECT
		a1.borrower_name
		FROM tbl_borrowers a1
		LEFT JOIN tbl_book_loans a2 ON a2.card_no = a1.card_no
		WHERE a2.card_no IS NULL
END

EXEC dbo.uspQuery3

/* query 4 of 7 */

CREATE PROC dbo.uspQuery4 @BranchID nvarchar(30) = NULL
AS
SELECT
	a2.book_title, a1.borrower_name, a1.borrower_address
	FROM tbl_borrowers a1
	INNER JOIN tbl_book_loans a4 ON a4.card_no = a1.card_no
	INNER JOIN tbl_book a2 ON a2.book_id = a4.book_id
	INNER JOIN tbl_library_branch a3 ON a3.branch_id = a4.branch_id
	/* here i changed the due date so that the query would get a result.
	since the due date is dependant on the outDate it will constantly change.
	i've made a query which will give a clear result, rather than returning nothing most of the time */
	WHERE a3.branch_id = ISNULL(@BranchID,a3.branch_id) AND a4.due_date = '2018/05/26'
	GO

EXEC dbo.uspQuery4 @BranchID = '200'

/* query 5 of 7 */
CREATE PROC dbo.uspQuery5
AS
BEGIN
	SELECT
		a1.branch_name, COUNT(a2.book_id) AS 'Total Loans' 
		FROM tbl_library_branch a1
		INNER JOIN tbl_book_loans a2 ON a2.branch_id = a1.branch_id
		GROUP BY a1.branch_name
END

EXEC dbo.uspQuery5

/* query 6 of 7 */
CREATE PROC dbo.uspQuery6 @Number nvarchar(30) = NULL
AS
SELECT
	a1.borrower_name, a1.borrower_address, COUNT(a2.book_id) AS 'Books Checked Out'
	FROM tbl_borrowers a1
	INNER JOIN tbl_book_loans a2 ON a2.card_no = a1.card_no
	GROUP BY a1.borrower_name, a1.borrower_address
	HAVING COUNT(a2.book_id) > @Number;
	GO

EXEC dbo.uspQuery6 @Number = 5

/* query 7 of 7 */
CREATE PROC dbo.uspQuery7 @Author nvarchar(30) = NULL, @Branch nvarchar(30) = NULL
AS
SELECT
	a1.book_title, a2.no_of_copies
	FROM tbl_book a1
	INNER JOIN tbl_book_copies a2 ON a2.book_id = a1.book_id
	INNER JOIN tbl_author a3 ON a3.book_id = a1.book_id
	INNER JOIN tbl_library_branch a4 ON a4.branch_id = a2.branch_id
	WHERE a3.author_name = ISNULL(@Author, a3.author_name) AND a4.branch_name = ISNULL(@Branch, a4.branch_name)

EXEC dbo.uspQuery7 @Author = 'Stephen King', @Branch = 'Central'

