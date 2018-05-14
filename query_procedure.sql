/* The library query procedure */


/* query 1 of 7 */
SELECT
	a2.branch_name, a3.book_title, a1.no_of_copies
	FROM tbl_book_copies a1
	INNER JOIN tbl_book a3 ON a3.book_id = a1.book_id
	INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.branch_id
	WHERE branch_name = 'Sharpstown' AND a1.book_id = (1)

/* query 2 of 7 */
SELECT
	a2.branch_name, a3.book_title, a1.no_of_copies
	FROM tbl_book_copies a1
	INNER JOIN tbl_book a3 ON a3.book_id = a1.book_id
	INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.branch_id
	WHERE a1.book_id = (1)

/* query 3 of 7 */
SELECT
	a1.borrower_name
	FROM tbl_borrowers a1
	LEFT JOIN tbl_book_loans a2 ON a2.card_no = a1.card_no
	WHERE a2.card_no IS NULL

/* query 4 of 7 */
SELECT
	a2.book_title, a1.borrower_name, a1.borrower_address
	FROM tbl_borrowers a1
	INNER JOIN tbl_book_loans a4 ON a4.card_no = a1.card_no
	INNER JOIN tbl_book a2 ON a2.book_id = a4.book_id
	INNER JOIN tbl_library_branch a3 ON a3.branch_id = a4.branch_id
	/* here i changed the due date so that the query would get a result.
	since the due date is dependant on the outDate it will constantly change.
	i've made a query which will give a clear result, rather than returning nothing most of the time */
	WHERE a3.branch_id = '200' AND a4.due_date = '2018/05/26'

/* query 5 of 7 */
SELECT
	a1.branch_name, COUNT(a2.book_id) AS'Total Loans'
	FROM tbl_library_branch a1
	INNER JOIN tbl_book_loans a2 ON a2.branch_id = a1.branch_id
	GROUP BY a1.branch_name

/* query 6 of 7 */
SELECT
	a1.borrower_name, a1.borrower_address, COUNT(a2.book_id) AS 'Books Checked Out'
	FROM tbl_borrowers a1
	INNER JOIN tbl_book_loans a2 ON a2.card_no = a1.card_no
	GROUP BY a1.borrower_name, a1.borrower_address
	HAVING COUNT(a2.book_id) >5;

/* query 7 of 7 */
SELECT
	a1.book_title, a2.no_of_copies
	FROM tbl_book a1
	INNER JOIN tbl_book_copies a2 ON a2.book_id = a1.book_id
	INNER JOIN tbl_author a3 ON a3.book_id = a1.book_id
	INNER JOIN tbl_library_branch a4 ON a4.branch_id = a2.branch_id
	WHERE a3.author_name = 'Stephen King' AND a4.branch_name = 'Central'