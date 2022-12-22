CREATE TABLE tblAdmins (
                AdminId int NOT NULL primary key,
                AdminName NVARCHAR(50) NOT NULL,
                AdminEmail NVARCHAR(50) ,
                AdminPass NVARCHAR(50) NOT NULL,
                
)

insert into tblAdmins (AdminId,  AdminName, AdminEmail , AdminPass) 
values (1,'Bao Ngan', 'ngan@gmail.com','123123');

CREATE TABLE tblBooks (
                BookId int IDENTITY(100,1)  primary key,
                BookName NVARCHAR(50) NOT NULL,
                BookAuthor NVARCHAR(50)  Not Null ,
                BookISBN NVARCHAR(50) NOT NULL,
                BookPrice money not null,
				BookCopies int not null
)
drop table tblBooks
insert into tblBooks(BookName, BookAuthor ,BookISBN,BookPrice,BookCopies ) 
values ('Wow Beutiful', 'Jim Jan','KS454WE', 200.00,9);

insert into tblBooks(BookName, BookAuthor ,BookISBN,BookPrice,BookCopies ) 
values ('Bun', 'Beena Ant','UFS45AS3', 160.00,8);

insert into tblBooks(BookName, BookAuthor ,BookISBN,BookPrice,BookCopies ) 
values ('Fault in Stars', 'Me Only','LDS45ED2', 200.00,8);

insert into tblBooks(BookName, BookAuthor ,BookISBN,BookPrice,BookCopies ) 
values ('Are you sure', 'Nancy','KSD14523', 20.00,3);

CREATE TABLE tblRecievedUsers (
                BookId int NOT NULL,
                BookName NVARCHAR(50) NOT NULL,
                DataRecieved date not null ,
                UserId int NOT NULL,
				UserName NVARCHAR(50) not null
                
)
drop table tblRecievedUsers
insert into tblRecievedUsers (BookId,  BookName, DataRecieved , UserId, UserName) 
values (2134,'Rainberry Plz', '2020-06-14',24028,'Luise Fonzy');

insert into tblRecievedUsers (BookId,  BookName, DataRecieved , UserId, UserName) 
values (100,'Wow Beutiful', '2020-06-17',24018,'Zayn');

insert into tblRecievedUsers (BookId,  BookName, DataRecieved , UserId, UserName) 
values (100,'Wow Beutiful', '2020-06-13',24024,'Prithvi');

insert into tblRecievedUsers (BookId,  BookName, DataRecieved , UserId, UserName) 
values (2128,'Some Where', '2020-06-14',24024,'Prithvi');


CREATE TABLE tblRequestedUsers (
                BookId int NOT NULL,
                BookName NVARCHAR(50) NOT NULL,
                DataRequested date not null ,
                UserId int NOT NULL,
				UserName NVARCHAR(50) not null
                
)
drop table tblRequestedUsers
insert into tblRequestedUsers (BookId,  BookName, DataRequested , UserId, UserName) 
values (103,'Bunny Bom', '2020-06-12',20004,'Selena Gomez');

insert into tblRequestedUsers (BookId,  BookName, DataRequested , UserId, UserName) 
values (2124,'I am sorry', '2020-06-14',20004,'Selena Gomez');

insert into tblRequestedUsers (BookId,  BookName, DataRequested , UserId, UserName) 
values (2124,'I am sorry', '2020-06-13',24026,'Khalid');

CREATE TABLE tblReturnedUsers (
                BookId int NOT NULL,
                BookName NVARCHAR(50) NOT NULL,
                DataReturned date not null ,
                UserId int NOT NULL,
				UserName NVARCHAR(50) not null
                
)
drop table tblReturnedUsers
insert into tblRequestedUsers (BookId,  BookName, DataRequested , UserId, UserName) 
values (104,'Fault in Stars', '2020-06-12',20004,'Selena Gomez');

insert into tblRequestedUsers (BookId,  BookName, DataRequested , UserId, UserName) 
values (2132,'You cant put', '2020-06-14',24028,'Luise fonzy');

CREATE TABLE tblUsers (
                UserId int identity(20004,5) primary key,
                UserName NVARCHAR(50) NOT NULL,
                UserAdNo int NOT NULL,
				UserEmail NVARCHAR(50) not null,
				UserPass NVARCHAR(50) not null
                
)
insert into tblUsers (UserName, UserAdNo , UserEmail, UserPass) 
values ('Nguyen Ngcoc Bao Ngan',2503600, 'bngan@gmail.com','123123123');

insert into tblUsers (UserName, UserAdNo , UserEmail, UserPass) 
values ('Nguyen Thi Phuong Nhi',2065322, 'nhi@gmail.com','Luis1234');

insert into tblUsers (UserName, UserAdNo , UserEmail, UserPass) 
values ('Chau Que Binh',2015360, 'Binh@gmail.com','123123123');

insert into tblUsers (UserName, UserAdNo , UserEmail, UserPass) 
values ('Nguyen Thi Hong Linh',2013601, 'Linh@gmail.com','213123123');

insert into tblUsers (UserName, UserAdNo , UserEmail, UserPass) 
values ('Nguyen Thi Truc Mai',2015820, 'Mai@gmail.com','123123312');

insert into tblUsers (UserName, UserAdNo , UserEmail, UserPass) 
values ('Ariana Grande',2013520, 'ariana@gmail.com','123696123');

insert into tblUsers (UserName, UserAdNo , UserEmail, UserPass) 
values ('Nguyen Van A',2036153, 'VanA@gmail.com','zayn1904');

insert into tblUsers (UserName, UserAdNo , UserEmail, UserPass) 
values ('Bing Chilling',2035652, 'Bing@gmail.com','khalid1904');


GO
/****** Object: StoredProcedure [dbo].[Admin Login] Script Date: 7/2/2020 1:30:45 PM ******/ 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AdminLogin] (@adminEmail varchar(50), @adminPass varchar(50)) as 
begin
select count(*) from tblAdmins where AdminEmail=@adminEmail and AdminPass=@adminPass;
end
GO
/****** AddBook ******/

/****** Object: Stored Procedure [dbo].[AddBook] Script Date: 7/2/2020 1:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddBook] (@BookName nvarchar(50), @BookAuthor nvarchar(50), @BookISBN nvarchar(50), @BookPrice money, @BookCopies int) as 
begin
insert into tblBooks values (@BookName, @BookAuthor, @BookISBN, @BookPrice,  @BookCopies);
end
GO

/****** AddUser ******/
GO
/****** Object: Stored Procedure [dbo].[AddUser] Script Date: 7/2/2020 1:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddUser] (@userName varchar(50), @userAdNo int,@userEmail varchar(50), @userPass varchar(50)) as 
begin
insert into tblUsers values (@userName, @userAdNo, @userEmail, @userPass);
end
GO


/****** AddReturn ******/

GO
/****** Object: Stored Procedure [dbo].[AddReturn] Script Date: 7/2/2020 1:29:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddReturn] (@bookId int, @bookName varchar(50), @date date, @userId int, @userName varchar(50)) as 
begin
insert into tblReturnedUsers values (@bookId, @bookName, @date, @userId, @userName);
end
GO

/****** AddRequest ******/
GO
/****** Object: Stored Procedure [dbo].[AddRequest] Script Date: 7/2/2020 1:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddRequest] (@bookId int, @bookName varchar(50), @date date, @userId int, @userName varchar(50)) as 
begin
insert into tblRequestedUsers values (@bookId, @bookName, @date, @userId, @userName);
end
GO



/****** AddRecieve ******/
GO
/****** Object: Stored Procedure [dbo].[AddRecieve] Script Date: 7/2/2020 1:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddRecieve] (@bookId int, @bookName varchar(50), @date date, @userId int, @userName varchar(50)) as begin
insert into tblRecievedUsers values (@bookId, @bookName, @date, @userId, @userName);
end
GO

/**** IncBook ******/
GO
/****** Object: Stored Procedure [dbo].[IncBookCopy] ********/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[IncBookCopy] (@bookId int) as 
begin
update tblBooks set BookCopies=BookCopies+1 where BookId=@bookId;
end
GO

/**** GetAllReturrn ****/


GO
/****** Object: Stored Procedure [dbo].[GetAllReturn]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllReturn] as
begin
select * from tblReturnedUsers;
end
GO

/**** GetAllRequestUser ****/
GO
/****** Object: Stored Procedure [dbo].[GetAllRequestUser]****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllRequestUser] (@userId int) as 
begin
select BookId, BookName, DataRequested from tblRequestedUsers where UserId=@userId;
end
GO

/**** GetAllRequest ****/

GO
/****** Object: Stored Procedure [dbo].[GetAllRequest ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAllRequest] as
begin
select * from tblRequestedUsers;
end
GO

/**** GetAllRecieveUser ****/

GO
/****** Object: Stored Procedure [dbo].[GetAllRecieveUser] ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllRecieveUser] (@userId int) as
begin
select BookId, BookName, DataRecieved from tblRecievedUsers where UserId=@userId;
end
GO

/**** GetAllRecieve ****/

GO
/****** Object: StoredProcedure [dbo].[GetAllRecieve] ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllRecieve] as
begin
select * from tblRecievedUsers;
end
GO

/**** GetAllBook ****/


GO
/****** Object: Stored Procedure [dbo].[GetAllBooks ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllBooks] as
begin
select * from tblBooks;
end
GO

/**** DeleteUser ****/

GO
/****** Object: Stored Procedure [dbo].[DeleteUser] ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteUser] (@userId int) as 
begin
delete from tblUsers where UserId=@userId;
end
GO

/**** DeleteReturn ****/

GO
/****** Object: Stored Procedure [dbo].[DeleteReturn]  ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteReturn] (@bookId int, @userId int) as 
begin
delete top (1) from tblReturnedUsers where BookId=@bookId and UserId=@userId; 
end
GO

/**** DeleteRequest ****/


GO
/****** Object: Stored Procedure [dbo].[DeleteRequest] ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteRequest] (@bookId int, @userId int) as 
begin
delete top (1) from tblRequestedUsers where BookId=@bookId and UserId=@userId; 
end
GO

/**** DeleteRecieve ****/

GO
/****** Object: Stored Procedure [dbo].[DeleteRecieve] ****/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteRecieve] (@bookId int, @userId int) as 
begin
delete top (1) from tblRecievedUsers where BookId=@bookId and UserId=@userId; 
end
GO

/**** DeleteBook ****/


GO
/****** Object: Stored Procedure [dbo].[DeleteBook] ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteBook] (@bookId int) as 
begin
delete tblBooks where BookId=@bookId;
end
GO

GO
/****** Object: Stored Procedure [dbo].[UpdateBook] ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateBook] (@BookId int,@BookName nvarchar(50), @BookAuthor nvarchar(50), @BookISBN nvarchar(50), @BookPrice money, @BookCopies int) as 
begin
update tblBooks
set BookName = @BookName, BookAuthor = @BookAuthor , BookISBN = @BookISBN, BookPrice = @BookPrice, BookCopies = @BookCopies
where BookId = @BookId
end
GO

GO
/****** Object: Stored Procedure [dbo].[GetAllUsers] ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllUsers] as 
begin
select * from tblUsers;
end
GO

GO
/****** Object: Stored Procedure [dbo].[TakeUserName] ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TakeUserName] (@userID int) as 
begin
select UserName from tblUsers
where @userID = UserId;
end
GO
EXEC TakeUserName 20004

GO
/****** Object: StoredProcedure [dbo].[UserLogin] Script Date: 7/2/2020 1:30:45 PM ******/ 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UserLogin] (@userEmail varchar(50), @userPass varchar(50)) as 
begin
select UserId from tblUsers where UserEmail=@userEmail and UserPass=@userPass;
end
GO
EXEC UserLogin 'nhi@gmail.com', 'Luis1234';


GO
/****** Object: Stored Procedure [dbo].[UpdateUser] ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateUser] (@UserId int,@UserName nvarchar(50), @UserAdNo int, @UserEmail nvarchar(50), @UserPass nvarchar(50) ) as 
begin
update tblUsers
set  UserName = @UserName , UserAdNo = @UserAdNo, UserEmail = @UserEmail, UserPass = @UserPass
where UserId = @UserId
end
GO







