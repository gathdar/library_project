CREATE DATABASE db_library1
GO

USE db_library1
GO

/* the book table */
CREATE TABLE tbl_book (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	book_title VARCHAR(50) NOT NULL,
	book_publisherName VARCHAR(50) NOT NULL
);

/* the publisher table*/
CREATE TABLE tbl_publisher (
	publisher_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	publisher_name VARCHAR(50) NOT NULL,
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL
)

/* the author table*/
CREATE TABLE tbl_author (
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL,
)

/* values for the book table */
INSERT INTO tbl_book
(book_title, book_publisherName)
VALUES
('The Lost Tribe', 'PicadorUSA'),
('The Cat in the Hat', 'Random House'),
('The Sneetches and Other Stories', 'Random House'),
('Yertle the Turtle and Other Stories', 'Random House'),
('The Intelligent Investor', 'HarperCollins'),
('Principles of Orchestration', 'Dover Publications'),
('Mistborn', 'Tor Books'),
('Ender''''s Game', 'Tor Books'),
('Treasure Island', 'Cassell'),
('Dracula', 'Constable & Robinson'),
('Heart of Darkness', 'Blackwood''''s Magazine'),
('The 7 Habits of Highly Effective People', 'RosettaBooks'),
('blink: The Power of Thinking Without Thinking', 'Little, Brown and Company'),
('The Giver', 'Houghton Mifflin Harcourt'),
('Eternal Echoes', 'HarperCollins'),
('Resilience', 'First Mariner Books'),
('Daring Greatly', 'Penguin Group'),
('Capital in the Twenty-First Century', 'Harvard University Press'),
('Where Good Ideas Come From', 'Penguin Group'),
('The Stand', 'Doubleday'),
('IT', 'Viking Press'),
('The Shining', 'Doubleday')
;

/* values for the author table */
INSERT INTO tbl_author
(book_id, author_name)
VALUES
(1, 'Mark Lee'),
(2, 'Dr. Seuss'),
(3, 'Dr. Seuss'),
(4, 'Dr.Seuss'),
(5, 'Benjamin Graham'),
(6, 'Nikolay Rimsky-Korsakov'),
(7, 'Brandon Sanderson'),
(8, 'Orson Scott Card'),
(9, 'Robert Louis Stevenson'),
(10, 'Bram Stoker'),
(11, 'Joseph Conrad'),
(12, 'Steven R. Covey'),
(13, 'Malcolm Gladwell'),
(14, 'Lois Lowry'),
(15, 'John O''Donahue'),
(16, 'Eric Greitens'),
(17, 'Brene Brown'),
(18, 'Thomas Piketty'),
(19, 'Steven Johnson'),
(20, 'Stephen King'),
(21, 'Stephen King'),
(22, 'Stephen King')
;


/* values for the publisher table */
INSERT INTO tbl_publisher
(publisher_name, publisher_address, publisher_phone)
VALUES
('PicadorUSA', '101 Vine Street', '555-129-3497'),
('Random House', '45 East 32nd Street', '555-345-0045'),
('Random House', '45 East 32nd Street', '555-345-0045'),
('Random House', '45 East 32nd Street', '555-345-0045'),
('HarperCollins', '300 Central Avenue', '555-111-2222'),
('Dover Publications', '888 Russian Hill', '555-484-1120'),
('Tor Books', '410 West 10th Street', '555-285-5647'),
('Tor Books', '410 West 10th Street', '555-285-5647'),
('Cassell', '1st Bridgeport Way', '0049-234-88122'),
('Constable & Robinson', '1235 Warwick Avenue', '0049-566-17720'),
('Blackwood''''s Magazine', '28 West Lane', '555-376-6771'),
('RosettaBooks', '1 Nauvoo Hill Drive', '555-303-7803'),
('Little, Brown and Company', '45 Central Way', '555-711-7011'),
('Houghton Mifflin Harcourt', '101 Oneida Avenue', '555-210-3356'),
('HarperCollins', '300 Central Avenue', '555-111-2222'),
('First Mariner Books', '34783 Seahawk Lane', '555-329-4783'),
('Penguin Group', '5 Dover Hills', '555-459-9090'),
('Harvard University Press', '1000 Philadelphia Way', '555-131-3501'),
('Penguin Group', '5 Dover Hills', '555-459-9090'),
('Doubleday', '490 Mountain Pass', '555-124-5790'),
('Viking Press', '9398 Nova Street', '555-730-2348'),
('Doubleday', '490 Mountain Pass', '555-124-5790')
;

/*the branch table */
CREATE TABLE tbl_library_branch(
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (200,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL
)

INSERT INTO tbl_library_branch
	(branch_name, branch_address)
	VALUES
	('Sharpstown', '101 Tree Lane'),
	('Central', '40690 Vine Street'),
	('Hillside', '2001 Hillside Drive'),
	('Wallingford', '509 30th Avenue'),
	('South', '73303 Denver Road')
;

/*the book copies table */
CREATE TABLE tbl_book_copies(
	book_id INT NOT NULL CONSTRAINT fk_book_id1 FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	no_of_copies INT NOT NULL,
)

INSERT INTO tbl_book_copies
	(book_id, branch_id, no_of_copies)
	VALUES
	(1, 200, 3),
	(2, 200, 2),
	(3, 200, 2),
	(4, 200, 4),
	(6, 200, 2),
	(7, 200, 3),
	(8, 200, 5),
	(10, 200, 5),
	(13, 200, 3),
	(14, 200, 2),
	(20, 200, 3),
	(21, 200, 4),
	(1, 201, 3),
	(2, 201, 2),
	(3, 201, 2),
	(5, 201, 4),
	(6, 201, 2),
	(7, 201, 3),
	(8, 201, 5),
	(9, 201, 5),
	(10, 201, 3),
	(12, 201, 2),
	(20, 201, 3),
	(22, 201, 4),
	(2, 202, 2),
	(3, 202, 2),
	(4, 202, 5),
	(5, 202, 4),
	(6, 202, 2),
	(10, 202, 3),
	(12, 202, 2),
	(13, 202, 5),
	(14, 202, 2),
	(17, 202, 2),
	(20, 202, 3),
	(22, 202, 2),
	(2, 203, 2),
	(3, 203, 2),
	(5, 203, 4),
	(7, 203, 3),
	(8, 203, 5),
	(9, 203, 5),
	(10, 203, 3),
	(11, 203, 2),
	(14, 203, 3),
	(15, 203, 4),
	(16, 203, 3),
	(22, 203, 4),
	(2, 204, 3),
	(3, 204, 5),
	(5, 204, 2),
	(9, 204, 3),
	(10, 204, 2),
	(12, 204, 5),
	(13, 204, 3),
	(14, 204, 2),
	(15, 204, 3),
	(16, 204, 4),
	(17, 204, 3),
	(18, 204, 4),
	(19, 204, 2),
	(21, 204, 3)
;

/*the borrower table */
CREATE TABLE tbl_borrowers(
	card_no INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone VARCHAR(50) NOT NULL
)

INSERT INTO tbl_borrowers
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('Mary Jones', '100 Fremont Way', '555-321-1156'),
	('Todd Lancaster', '1986 145th Street', '555-779-1237'),
	('George Mankin', '388 Trenton Lane', '555-255-6580'),
	('Terry Harbison', '2378 Locust Avenue', '555-189-9663'),
	('Vicky Perry', '4780 Wealtha Road', '555-328-1000'),
	('Orlando Monson', '9040 Derringer Avenue', '555-436-7819'),
	('Marnie Hicks', '32 Juanita Drive', '555-273-1397'),
	('Dick Farnsworth', '389 Broad Street', '555-001-8284'),
	('Roy Smith', '88 Nantuckett Way', '555-252-2283'),
	('Mervin Sharp', '180 Truvere Lane', '555-844-3900'),
	('Rebekah Lowry', '3000 Fortunato Court', '555-290-9978')
;

/* the book_loans table */
CREATE TABLE tbl_book_loans(
	book_id INT NOT NULL CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id1 FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrowers(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE NOT NULL,
	due_date AS DATEADD(week, 3, date_out)
)

INSERT INTO tbl_book_loans
	(book_id, branch_id, card_no, date_out)
	VALUES
	('1', '200', '5000', '2018/05/05'),
	('2', '200', '5000', '2018/05/05'),
	('3', '200', '5000', '2018/05/05'),
	('6', '200', '5000', '2018/05/10'),
	('8', '200', '5000', '2018/05/10'),
	('1', '200', '5001', '2018/05/08'),
	('7', '200', '5002', '2018/05/08'),
	('11', '200', '5002', '2018/05/08'),
	('22', '200', '5002', '2018/05/08'),
	('1', '201', '5003', '2018/05/02'),
	('5', '201', '5003', '2018/05/02'),
	('12', '201', '5003', '2018/05/03'),
	('14', '201', '5003', '2018/05/03'),
	('6', '201', '5004', '2018/04/30'),
	('9', '201', '5004', '2018/04/30'),
	('13', '201', '5004', '2018/04/30'),
	('14', '201', '5004', '2018/04/30'),
	('15', '201', '5004', '2018/05/01'),
	('17', '201', '5004', '2018/05/01'),
	('19', '201', '5004', '2018/05/01'),
	('1', '202', '5005', '2018/05/07'),
	('2', '202', '5005', '2018/05/07'),
	('3', '202', '5005', '2018/05/07'),
	('4', '202', '5005', '2018/05/07'),
	('7', '202', '5005', '2018/05/07'),
	('8', '202', '5005', '2018/05/07'),
	('9', '202', '5005', '2018/05/11'),
	('21', '202', '5005', '2018/05/11'),
	('13', '202', '5006', '2018/05/06'),
	('15', '202', '5006', '2018/05/06'),
	('16', '202', '5006', '2018/05/06'),
	('1', '203', '5008', '2018/05/05'),
	('6', '203', '5008', '2018/05/05'),
	('18', '203', '5008', '2018/05/11'),
	('1', '203', '5009', '2018/04/29'),
	('5', '203', '5009', '2018/04/29'),
	('10', '203', '5009', '2018/04/30'),
	('14', '203', '5009', '2018/04/30'),
	('15', '203', '5009', '2018/05/10'),
	('16', '203', '5009', '2018/05/10'),
	('20', '203', '5009', '2018/05/11'),
	('21', '203', '5009', '2018/05/11'),
	('22', '203', '5009', '2018/05/11'),
	('1', '204', '5010', '2018/05/05'),
	('5', '204', '5010', '2018/05/05'),
	('12', '204', '5010', '2018/05/05'),
	('13', '204', '5010', '2018/05/09'),
	('14', '204', '5010', '2018/05/09'),
	('15', '204', '5010', '2018/05/09'),
	('1', '204', '5010', '2018/05/11'),
	('2', '204', '5010', '2018/05/11'),
	('3', '204', '5010', '2018/05/11'),
	('4', '204', '5010', '2018/05/11'),
	('5', '204', '5010', '2018/05/11'),
	('16', '204', '5010', '2018/05/11'),
	('20', '204', '5010', '2018/05/11')
;