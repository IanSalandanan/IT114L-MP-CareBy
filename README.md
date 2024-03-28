README:
How to configure the project (e.g. if any database scripts need to be run)
The file has SQL scripts to create the required tables for maintaining user profiles, therapist information, and appointment schedules. 
 
CREATE TABLE [dbo].[Users] (
    [UserID]    INT           IDENTITY (1, 1) NOT NULL,
    [Username]  VARCHAR (MAX) NULL,
    [Email]     VARCHAR (MAX) NULL,
    [Password]  VARCHAR (MAX) NULL,
    [FirstName] VARCHAR (MAX) NULL,
    [LastName]  VARCHAR (MAX) NULL,
    [age]       INT           NULL,
    [gender]    VARCHAR (10)  NULL,
    [UserType]  VARCHAR (MAX) DEFAULT ('User') NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);
 
CREATE TABLE [dbo].[TimeBlocks] (
    [time] VARCHAR (MAX) NOT NULL
);
 
CREATE TABLE [dbo].[Appointments] (
    [therapistName] VARCHAR (MAX) NOT NULL
);
 
CREATE TABLE [dbo].[appointment_details] (
    [chosen_date]          DATE          NULL,
    [chosen_therapistName] VARCHAR (MAX) NULL,
    [chosen_timeBlock]     VARCHAR (50)  NULL,
    [visit_desc]           VARCHAR (MAX) NULL,
    [userID]               INT           NULL
);
 
 
INSERT INTO Users (Username,Email,Password,Firstname,LastName,age,gender,UserType)
VALUES ('Kenshun','ken@gmail.com','123','KEN','DEMARTIN',19,'MALE','Therapist'),
       ('Kerby','kerby@gmail.com','123','CHRISTIAN','SALANDANAN',19,'MALE','Therapist'),
       ('Mnlvgan','vincent@gmail.com','123','VINCENT','NUÑEZ',19,'MALE','Therapist'),
       ('Carlie','carlie@gmail.com','123','CARLIE','ENDAYA',19,'FEMALE','Therapist'),
       ('Mico','mico@gmail.com','123','MICO','ESCOSURA',19,'MALE','Therapist'),
       ('Phaula','phaula@gmail.com','123','PHAULA','BRIOL',19,'FEMALE','Therapist')
 
INSERT INTO Appointments
VALUES ('KEN DE MARTIN'),
       ('CHRISTIAN SALANDANAN'),
       ('VINCENT NUÑEZ'),
       ('CARLIE ENDAYA'),
       ('MICO ESCOSURA'),
       ('PHAULA BRIOL')
 
 
INSERT INTO TimeBlocks 
VALUES ('8:00 AM'), ('9:00 AM'), ('10:00 AM'), ('11:00 AM'), ('1:00 PM'), ('2:00 PM'), ('3:00 PM'), ('4:00 PM')
 
Additionally, the user’s connection string modification is crucial to be permitted to perform CRUD operations on the database tables. In the project, the ‘var connection string’ value should be modified with the user’s connection string. 
 
How to run the project
To run the ASP.NET WebForms project, opening the project is the first step. Then set up the database needed for the project to open the connection. Configure the connection strings for properly connecting the database to the project. Having a start page, clicking the “run” button (in Visual Studio) will execute and open the first page the user should look at when visiting the website. 
 
The architecture of the project (i.e. how the project is structured).
 
The architecture of the CareBy project follows a typical three-tier architecture, separating concerns into presentation, business logic, and data access layers:
 
Presentation Layer: This layer comprises the ASP.NET Webforms and Master Page for building the user interface (UI) of the CareBy website. The website includes pages such as login/register, home, profile form, about us, and contact for the user. The website also contains a therapist page for the registered therapists in CareBy. Additionally, the user interface allows users to interact with the website which includes: Logging in and registering for the service, Browsing therapist profiles, Editing user profiles, Booking appointments, and Managing schedules.
 
Business Logic Layer: The business logic layer contains the code that implements the application's business rules and processes, ensuring proper validation and processing of user requests. The backend includes the client-side(Javascript) functions, server-side(C#) functions or code-behind, and lastly, classes for the Database connection. This layer handles tasks such as User authentication, Appointment scheduling, Displaying and updating user & therapist profiles, and Cancelling profile edits and appointments.
 
Data Access Layer: The data access layer is responsible for interacting with the database to retrieve and store data. This layer communicates with the SQL Server database to perform CRUD (Create, Read, Update, Delete) operations on Inserting user information once registered, Retrieving user and therapist profiles and information, Updating profile information, and Retrieving and deleting appointment schedules.
 
 
The features of your project. Provide screenshots of your project
For the User end: 
Register and Log In

<img width="1276" alt="image" src="https://github.com/IanSalandanan/IT114L-MP-CareBy/assets/154485644/44c6708c-344b-4d8a-8aa2-781f846ad7bf">

<img width="1275" alt="image" src="https://github.com/IanSalandanan/IT114L-MP-CareBy/assets/154485644/d59e18db-5bc1-406b-96fb-b393588bec8d">

View Therapist Profiles
<img width="1274" alt="image" src="https://github.com/IanSalandanan/IT114L-MP-CareBy/assets/154485644/7b449e0f-f2f5-4a52-a18b-7b2d0a42804c">

Book Appointment
<img width="1275" alt="image" src="https://github.com/IanSalandanan/IT114L-MP-CareBy/assets/154485644/c5d96589-666f-4d08-9513-1d177d2453a3">

Display Booked Appointment Details (join video): 
<img width="1277" alt="image" src="https://github.com/IanSalandanan/IT114L-MP-CareBy/assets/154485644/ff8f33ac-7b2b-4094-beb0-9665c9a792c3">

Edit User Profile
<img width="1277" alt="image" src="https://github.com/IanSalandanan/IT114L-MP-CareBy/assets/154485644/1cc2dd4a-83e2-418d-9b58-f2355ef36bb9">

Log Out
<img width="489" alt="image" src="https://github.com/IanSalandanan/IT114L-MP-CareBy/assets/154485644/810a4be5-cf7e-4cae-b8ee-d283ae4de5fc">

For the Therapist end:
Log In
<img width="1276" alt="image" src="https://github.com/IanSalandanan/IT114L-MP-CareBy/assets/154485644/e83d17e1-088a-4b35-ad5c-ece2abb589a3">

Find Upcoming Appointments Dashboard
<img width="1276" alt="image" src="https://github.com/IanSalandanan/IT114L-MP-CareBy/assets/154485644/2e63b7bc-41bd-4c58-8c13-a2b132c44498">

Edit Therapist Profile
<img width="1274" alt="image" src="https://github.com/IanSalandanan/IT114L-MP-CareBy/assets/154485644/9922179f-8a2f-48dd-a180-3906e275d5f2">

 
