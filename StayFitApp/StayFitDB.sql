drop database if exists StayFitApp;

create database StayFitApp;

use StayFitApp;

create table People(
PersonId			int				primary key auto_increment,
PersonName			varchar(100)	not null,
PersonEMail			varchar(100)	not null,	
PersonAddress		varchar(100)	null,
PersonCity			varchar(100)	not null,
StateAbbrev			char(2)			not null
);

create table Routines(
RoutineId			int				primary key auto_increment,
RoutineName			varchar(30)		not null,
ExDescription		varchar(250)	not null
);

create table Exercises(
ExerciseId			int				primary key auto_increment,
ExerciseName		varchar(50)		not null,
ExDescription		varchar(150)	not null,
DefaultReps			int				not null
);

create table PeopleRoutines(
PersonRoutineId		int				primary key auto_increment,
PersonId			int				not null,
RoutineId			int				not null,
RoutineDate			date			null,

foreign key FK_PeopleRoutines_People (PersonId)
	references People (PersonId),
foreign key FK_PeopleRoutines_Routines (RoutineId)
	references Routines (RoutineId)
);

create table RoutineExercises(
RoutineExerciseId	int				primary key auto_increment,
RoutineId			int				not null,
ExerciseId			int				not null,
DefaultReps			int				not null,

foreign key FK_RoutineExercises_Routines (RoutineId)
	references Routines (RoutineId),
foreign key FK_RoutineExercises_Exercises (ExerciseId)
	references Exercises (ExerciseId)
);

create table PersonRoutineExercises(
PersonRoutineExercisesId		int			primary key auto_increment,
PersonRoutineId					int			not null,
ExerciseId						int			not null,
NumberOfRepsExecuted			int			not null,

foreign key FK_PersonRoutineExercises_PersonRoutine (PersonRoutineId)
	references PeopleRoutines (PersonRoutineId),
foreign key FK_PersonRoutineExercises_RoutineExercises (RoutineExerciseId)
	references RoutineExercises (RoutineExerciseId)
);