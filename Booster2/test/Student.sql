drop database if exists Student;
create database Student;
 use Student;
 SET autocommit=0;
drop table if exists _Meta_Classes;
create table _Meta_Classes (id int   auto_increment primary key );
drop table if exists _Meta_Sets;
create table _Meta_Sets (id int   auto_increment primary key );
drop table if exists _Meta_Attributes;
create table _Meta_Attributes (id int   auto_increment primary key );
drop table if exists _Meta_Methods;
create table _Meta_Methods (id int   auto_increment primary key );
drop table if exists _Meta_Method_Params;
create table _Meta_Method_Params (id int   auto_increment primary key );
drop table if exists Status;
create table Status (Status varchar(100)  default "unassigned"  primary key );
drop table if exists Student;
create table Student (StudentId int   auto_increment primary key );
drop table if exists Staff;
create table Staff (StaffId int   auto_increment primary key );
drop table if exists Student_supervisors_Staff_supervisees;
create table Student_supervisors_Staff_supervisees (Student_supervisors_Staff_superviseesId int   auto_increment primary key );

alter table Student_supervisors_Staff_supervisees
	add column Student_supervisors int     , add foreign key (Student_supervisors) references Student ( StudentId);
alter table Student_supervisors_Staff_supervisees
	add column Staff_supervisees int     , add foreign key (Staff_supervisees) references Staff ( StaffId);

alter table Staff
	add column lastName varchar(1000)     ;
alter table Staff
	add column firstName varchar(1000)     ;

alter table Student
	add column lastName varchar(1000)     ;
alter table Student
	add column firstName varchar(1000)     ;
alter table Student
	add column status varchar(500)     , add foreign key (status) references Status ( Status);


alter table _Meta_Method_Params
	add column class varchar(500)     ;
alter table _Meta_Method_Params
	add column methodName varchar(500)     ;
alter table _Meta_Method_Params
	add column paramName varchar(500)     ;
alter table _Meta_Method_Params
	add column paramType varchar(500)     ;
alter table _Meta_Method_Params
	add column paramMultiplicity varchar(500)     ;
alter table _Meta_Method_Params
	add column paramInOut varchar(10)     ;
alter table _Meta_Method_Params
	add column paramClassName varchar(500)     ;
alter table _Meta_Method_Params
	add column paramSetName varchar(500)     ;

alter table _Meta_Methods
	add column class varchar(500)     ;
alter table _Meta_Methods
	add column methodName varchar(500)     ;
alter table _Meta_Methods
	add column isObjectMethod bit     ;

alter table _Meta_Attributes
	add column class varchar(500)     ;
alter table _Meta_Attributes
	add column attName varchar(500)     ;
alter table _Meta_Attributes
	add column primType varchar(500)     ;
alter table _Meta_Attributes
	add column typeMultiplicity varchar(500)     ;
alter table _Meta_Attributes
	add column className varchar(500)     ;
alter table _Meta_Attributes
	add column setName varchar(500)     ;
alter table _Meta_Attributes
	add column direction varchar(500)     ;
alter table _Meta_Attributes
	add column tableName varchar(500)     ;
alter table _Meta_Attributes
	add column oppAttName varchar(500)     ;
alter table _Meta_Attributes
	add column isId bit     ;

alter table _Meta_Sets
	add column setName varchar(500)     ;
alter table _Meta_Sets
	add column tableName varchar(500)     ;
alter table _Meta_Sets
	add column columnName varchar(500)     ;

alter table _Meta_Classes
	add column className varchar(500)     ;
alter table _Meta_Classes
	add column tableName varchar(500)     ;

drop procedure if exists Student_Create;
delimiter //
create procedure Student_Create ( in supervisor_in int, in status_in varchar(1000), in firstName_in varchar(1000), in lastName_in varchar(1000), out s_out int)
	begin
	declare exit handler for sqlwarning, sqlexception, not found 
	begin
	rollback;
	end; 
	start transaction;
  
  if true and true and true and true and true and true and true and true and true
  then begin
       
       insert  
       into
       Student
       ()
       values
       ()
        ;
       (select  LAST_INSERT_ID()  
       
       
       
       
       
       
       into s_out
       ) ;
       
       end ;
       begin
       
       begin
       
       begin
       
       if (select  count(*)  from Student_supervisors_Staff_supervisees
          where Staff_supervisees = supervisor_in and Student_supervisors = s_out
          
          
          
          
          
          
          ) = 0
       then insert  
            into
            Student_supervisors_Staff_supervisees
            (Staff_supervisees, Student_supervisors)
            values
            (supervisor_in,s_out)
             ;
            
       
       end if ;
       
       end ;
       begin
       
       if (select  count(*)  from Student_supervisors_Staff_supervisees
          where Student_supervisors = s_out and Staff_supervisees = supervisor_in
          
          
          
          
          
          
          ) = 0
       then insert  
            into
            Student_supervisors_Staff_supervisees
            (Student_supervisors, Staff_supervisees)
            values
            (s_out,supervisor_in)
             ;
            
       
       end if ;
       
       end ;
       
       end ;
       begin
       
       begin
       
       update  Student
       set status = status_in
       where s_out = StudentId
       
        ;
       
       end ;
       begin
       
       begin
       
       update  Student
       set firstName = firstName_in
       where s_out = StudentId
       
        ;
       
       end ;
       begin
       
       update  Student
       set lastName = lastName_in
       where s_out = StudentId
       
        ;
       
       end ;
       
       end ;
       
       end ;
       
       end ;
       
  
  end if ;
  
  commit;
	end //
delimiter ;

drop procedure if exists Staff_Create;
delimiter //
create procedure Staff_Create ( in firstName_in varchar(1000), in lastName_in varchar(1000), out s_out int)
	begin
	declare exit handler for sqlwarning, sqlexception, not found 
	begin
	rollback;
	end; 
	start transaction;
  
  if true and true
  then begin
       
       insert  
       into
       Staff
       ()
       values
       ()
        ;
       (select  LAST_INSERT_ID()  
       
       
       
       
       
       
       into s_out
       ) ;
       
       end ;
       begin
       
       begin
       
       update  Staff
       set firstName = firstName_in
       where s_out = StaffId
       
        ;
       
       end ;
       begin
       
       update  Staff
       set lastName = lastName_in
       where s_out = StaffId
       
        ;
       
       end ;
       
       end ;
       
  
  end if ;
  
  commit;
	end //
delimiter ;


insert  
into
_Meta_Sets
(setName, tablename, columnName)
values
('Status','Status','Status')
 ;
insert  
into
_Meta_Classes
(className, tablename)
values
('Student','Student')
 ;
insert  
into
_Meta_Attributes
(class, attName, primType, typeMultiplicity, oppAttName, className, setName, direction, tableName, isId)
values
('Student','lastName','String','Mandatory',null,'','','Uni','Student',1)
 ;
insert  
into
_Meta_Attributes
(class, attName, primType, typeMultiplicity, oppAttName, className, setName, direction, tableName, isId)
values
('Student','firstName','String','Mandatory',null,'','','Uni','Student',1)
 ;
insert  
into
_Meta_Attributes
(class, attName, primType, typeMultiplicity, oppAttName, className, setName, direction, tableName, isId)
values
('Student','status','SetValue','Mandatory',null,'','Status','Uni','Student',0)
 ;
insert  
into
_Meta_Attributes
(class, attName, primType, typeMultiplicity, oppAttName, className, setName, direction, tableName, isId)
values
('Student','supervisors','ClassRef','Set','supervisees','Staff','','Bi','Student_supervisors_Staff_supervisees',0)
 ;
insert  
into
_Meta_Methods
(class, methodName, isObjectMethod)
values
('Student','Create',false)
 ;
insert  
into
_Meta_Method_Params
(class, methodName, paramName, paramType, paramMultiplicity, paramInOut, paramClassName, paramSetName)
values
('Student','Create','supervisor','ClassRef','Mandatory','input','Staff','')
 ;
insert  
into
_Meta_Method_Params
(class, methodName, paramName, paramType, paramMultiplicity, paramInOut, paramClassName, paramSetName)
values
('Student','Create','status','SetValue','Mandatory','input','','Status')
 ;
insert  
into
_Meta_Method_Params
(class, methodName, paramName, paramType, paramMultiplicity, paramInOut, paramClassName, paramSetName)
values
('Student','Create','firstName','String','Mandatory','input','','')
 ;
insert  
into
_Meta_Method_Params
(class, methodName, paramName, paramType, paramMultiplicity, paramInOut, paramClassName, paramSetName)
values
('Student','Create','lastName','String','Mandatory','input','','')
 ;
insert  
into
_Meta_Method_Params
(class, methodName, paramName, paramType, paramMultiplicity, paramInOut, paramClassName, paramSetName)
values
('Student','Create','s','ClassRef','Mandatory','output','Student','')
 ;
insert  
into
_Meta_Classes
(className, tablename)
values
('Staff','Staff')
 ;
insert  
into
_Meta_Attributes
(class, attName, primType, typeMultiplicity, oppAttName, className, setName, direction, tableName, isId)
values
('Staff','lastName','String','Mandatory',null,'','','Uni','Staff',1)
 ;
insert  
into
_Meta_Attributes
(class, attName, primType, typeMultiplicity, oppAttName, className, setName, direction, tableName, isId)
values
('Staff','firstName','String','Mandatory',null,'','','Uni','Staff',1)
 ;
insert  
into
_Meta_Attributes
(class, attName, primType, typeMultiplicity, oppAttName, className, setName, direction, tableName, isId)
values
('Staff','supervisees','ClassRef','Set','supervisors','Student','','Bi','Student_supervisors_Staff_supervisees',0)
 ;
insert  
into
_Meta_Methods
(class, methodName, isObjectMethod)
values
('Staff','Create',false)
 ;
insert  
into
_Meta_Method_Params
(class, methodName, paramName, paramType, paramMultiplicity, paramInOut, paramClassName, paramSetName)
values
('Staff','Create','firstName','String','Mandatory','input','','')
 ;
insert  
into
_Meta_Method_Params
(class, methodName, paramName, paramType, paramMultiplicity, paramInOut, paramClassName, paramSetName)
values
('Staff','Create','lastName','String','Mandatory','input','','')
 ;
insert  
into
_Meta_Method_Params
(class, methodName, paramName, paramType, paramMultiplicity, paramInOut, paramClassName, paramSetName)
values
('Staff','Create','s','ClassRef','Mandatory','output','Staff','')
 ;
insert  
into
Status
(Status)
values
('Undergraduate')
 ;
insert  
into
Status
(Status)
values
('Staff')
 ;
insert  
into
Status
(Status)
values
('Chancellor')
 ;
insert  
into
Status
(Status)
values
('Postgraduate')
 ;
insert  
into
Status
(Status)
values
('Congregation')
 ;
insert  
into
Status
(Status)
values
('ViceChancellor')
 ;
insert  
into
Status
(Status)
values
('unassigned')
 ;

SET @@GLOBAL.max_sp_recursion_depth = 255;
SET @@session.max_sp_recursion_depth = 255; 

DELIMITER $$

CREATE PROCEDURE `COUNT_ALL_RECORDS_BY_TABLE`()
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE TNAME CHAR(255);

DECLARE table_names CURSOR for 
    SELECT tableName FROM _Meta_Classes;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN table_names;   

DROP TABLE IF EXISTS TCOUNTS;
CREATE TEMPORARY TABLE TCOUNTS 
  (
    TABLE_NAME CHAR(255),
    RECORD_COUNT INT,
	MIN_ID INT
  ) ENGINE = MEMORY; 


WHILE done = 0 DO

  FETCH NEXT FROM table_names INTO TNAME;

   IF done = 0 THEN
    SET @SQL_TXT = CONCAT("INSERT INTO TCOUNTS(SELECT '" , TNAME  , "' AS TABLE_NAME, COUNT(*) AS RECORD_COUNT, MIN(",TNAME,"Id) AS MIN_ID FROM ", TNAME, ")");

    PREPARE stmt_name FROM @SQL_TXT;
    EXECUTE stmt_name;
    DEALLOCATE PREPARE stmt_name;  
  END IF;

END WHILE;

CLOSE table_names;

SELECT * FROM TCOUNTS;

END
$$

CREATE PROCEDURE `GET_OBJECT_DESCRIPTION`( className_in VARCHAR(500), objectID INT, out objectDesc VARCHAR(100))
BEGIN

DROP TABLE IF EXISTS ATTRIBUTES_FOR_DESC;
CREATE TEMPORARY TABLE ATTRIBUTES_FOR_DESC 
  (
    ID INT PRIMARY KEY AUTO_INCREMENT,
	CALL_CLASS VARCHAR(500),
	CALL_OID INT,
    ATT_NAME VARCHAR(500),
    ATT_PRIM_TYPE VARCHAR(500),
    TYPE_MULT VARCHAR(500),
    INT_VALUE INT,
    STRING_VALUE VARCHAR(500),
    DATETIME_VALUE TIMESTAMP,
    SET_VALUE VARCHAR(500),
    OID_VALUE INT,
    CLASS_NAME VARCHAR(100)
  ) ENGINE = MEMORY; 

CALL `GET_OBJECT_DESCRIPTION_RECURSE`( className_in, objectID, objectDesc);

/*SELECT * FROM ATTRIBUTES_FOR_DESC; */
END
$$


DELIMITER $$

CREATE PROCEDURE `GET_OBJECT_DESCRIPTION_RECURSE`( className_in VARCHAR(500), objectID INT, out objectDesc VARCHAR(100))
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE ANAME CHAR(255);

DECLARE attribute_names CURSOR for 
    SELECT attName FROM _Meta_Attributes WHERE class = className_in and isId = 1;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN attribute_names;   



WHILE done = 0 DO

  FETCH NEXT FROM attribute_names INTO ANAME;
  SET @SQL_TXT = null;
   IF done = 0 THEN
    SET @primType = (SELECT primType FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    SET @typeMult = (SELECT typeMultiplicity FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    SET @direction = (SELECT direction FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    SET @className = (SELECT _Meta_Attributes.className FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    SET @tableName = (SELECT _Meta_Attributes.tableName FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    SET @oppAttName = (SELECT _Meta_Attributes.oppAttName FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    
    IF @primType = 'String' and @typeMult != 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES_FOR_DESC 
                                    (CALL_CLASS, CALL_OID, ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, STRING_VALUE) 
                                    (SELECT '", className_in, "','",objectID,"','" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS STRING_VALUE FROM ", @tableName," WHERE ",@tableName,"Id = ", objectID, ")");
    ELSEIF @primType = 'Integer' and @typeMult != 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES_FOR_DESC
                                    (CALL_CLASS, CALL_OID, ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, STRING_VALUE)
                                    (SELECT '", className_in, "','",objectID,"','" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS STRING_VALUE FROM ", @tableName," WHERE ",@tableName,"Id = ", objectID, ")");
    ELSEIF @primType = 'DateTime' and @typeMult != 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES_FOR_DESC
                                    (CALL_CLASS, CALL_OID, ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, DATETIME_VALUE)
                                    (SELECT '", className_in, "','",objectID,"','" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS DATETIME_VALUE FROM ", @tableName," WHERE ",@tableName,"Id = ", objectID, ")");
    ELSEIF @primType = 'SetValue' and @typeMult != 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES_FOR_DESC
                                    (CALL_CLASS, CALL_OID, ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, STRING_VALUE)
                                    (SELECT '", className_in, "','",objectID,"','" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS STRING_VALUE FROM ", @tableName," WHERE ",@tableName,"Id = ", objectID, ")");
    ELSEIF @primType = 'ClassRef' and @typeMult != 'Set' and @direction = 'Uni' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES_FOR_DESC
                                    (CALL_CLASS, CALL_OID, ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, OID_VALUE, CLASS_NAME)
                                    (SELECT '", className_in, "','",objectID,"','" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS OID_VALUE,'",@className,"' AS CLASS_NAME FROM ", @tableName," WHERE ",@tableName,"Id = ", objectID, ")");
    ELSEIF @primType = 'ClassRef' and @typeMult != 'Set' and @direction = 'Bi' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES_FOR_DESC
                                    (CALL_CLASS, CALL_OID, ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, OID_VALUE, CLASS_NAME)
                                    (SELECT '", className_in, "','",objectID,"','" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",@className,"_",@oppAttName," AS OID_VALUE,'",@className,"' AS CLASS_NAME FROM ", @tableName," WHERE ",@tableName,"Id = ", objectID, ")");

    

    END IF;

    IF(@SQL_TXT is not null ) THEN
        PREPARE stmt_name FROM @SQL_TXT;
        EXECUTE stmt_name;
        DEALLOCATE PREPARE stmt_name;
    END IF;
  END IF;

END WHILE;

CLOSE attribute_names;


BEGIN
DECLARE AID INT;
DECLARE OBJID INT;
DECLARE CNAME VARCHAR(500);

DECLARE attribute_values CURSOR for 
    SELECT ID, OID_VALUE, CLASS_NAME FROM ATTRIBUTES_FOR_DESC 
	WHERE OID_VALUE is not null
	AND CALL_CLASS = className_in
	AND CALL_OID = objectID;

SET done = 0;
OPEN attribute_values;  

WHILE done = 0 DO

  FETCH NEXT FROM attribute_values INTO AID, OBJID, CNAME;
   IF done = 0 THEN
    CALL `GET_OBJECT_DESCRIPTION_RECURSE`(CNAME, OBJID, @objDesc);
    UPDATE ATTRIBUTES_FOR_DESC SET STRING_VALUE = @objDesc WHERE ID = AID;
    
   END IF;

END WHILE;

CLOSE attribute_values;
END;

SET objectDesc = (SELECT group_concat(STRING_VALUE separator ', ') 
	FROM ATTRIBUTES_FOR_DESC 
	WHERE CALL_CLASS = className_in
	AND CALL_OID = objectID);

END
$$
DELIMITER $$

CREATE PROCEDURE `GET_OBJECT`( className_in VARCHAR(500), objectID INT)
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE ANAME CHAR(255);


DECLARE attribute_names CURSOR for 
    SELECT attName FROM _Meta_Attributes WHERE class = className_in;


DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN attribute_names;   

DROP TABLE IF EXISTS ATTRIBUTES;
CREATE TEMPORARY TABLE ATTRIBUTES 
  (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ATT_NAME VARCHAR(500),
    ATT_PRIM_TYPE VARCHAR(500),
    TYPE_MULT VARCHAR(500),
    INT_VALUE INT,
    STRING_VALUE VARCHAR(500),
    DATETIME_VALUE TIMESTAMP,
    SET_VALUE VARCHAR(500),
    OID_VALUE INT,
    CLASS_NAME VARCHAR(100),
    OBJ_DESC VARCHAR(500)
  ) ENGINE = MEMORY; 


WHILE done = 0 DO

  FETCH NEXT FROM attribute_names INTO ANAME;
  SET @SQL_TXT = null;
   IF done = 0 THEN
    SET @primType = (SELECT primType FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    SET @typeMult = (SELECT typeMultiplicity FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    SET @direction = (SELECT direction FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    SET @className = (SELECT _Meta_Attributes.className FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    SET @oppAttName = (SELECT _Meta_Attributes.oppAttName FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    SET @tableName = (SELECT _Meta_Attributes.tableName FROM _Meta_Attributes WHERE attName = ANAME AND class = className_in);
    
    IF @primType = 'String' and @typeMult != 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES 
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, STRING_VALUE) 
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS STRING_VALUE FROM ", @tableName," WHERE ",@tableName,"Id = ", objectID, ")");
    ELSEIF @primType = 'Integer' and @typeMult != 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, INT_VALUE)
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS INT_VALUE FROM ", @tableName," WHERE ",@tableName,"Id = ", objectID, ")");
    ELSEIF @primType = 'DateTime' and @typeMult != 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, DATETIME_VALUE)
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS DATETIME_VALUE FROM ", @tableName," WHERE ",@tableName,"Id = ", objectID, ")");
    ELSEIF @primType = 'SetValue' and @typeMult != 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, SET_VALUE)
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS SET_VALUE FROM ", @tableName," WHERE ",@tableName,"Id = ", objectID, ")");
    ELSEIF @primType = 'ClassRef' and @typeMult != 'Set' and @direction = 'Uni' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, OID_VALUE, CLASS_NAME)
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS OID_VALUE,'",@className,"' AS CLASS_NAME FROM ", @tableName," WHERE ",@tableName,"Id = ", objectID, ")");
    ELSEIF @primType = 'ClassRef' and @typeMult != 'Set' and @direction = 'Bi' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, OID_VALUE, CLASS_NAME)
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",@className,"_",@oppAttName," AS OID_VALUE,'",@className,"' AS CLASS_NAME FROM ", @tableName," WHERE ",className_in,"_",ANAME," = ", objectID, ")");

    ELSEIF @primType = 'String' and @typeMult = 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES 
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, STRING_VALUE) 
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS STRING_VALUE FROM ", @tableName," WHERE ",className_in,"Id = ", objectID, ")");
    ELSEIF @primType = 'Integer' and @typeMult = 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES 
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, INT_VALUE) 
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS INT_VALUE FROM ", @tableName," WHERE ",className_in,"Id = ", objectID, ")");
    ELSEIF @primType = 'DateTime' and @typeMult = 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES 
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, DATETIME_VALUE) 
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS DATETIME_VALUE FROM ", @tableName," WHERE ",className_in,"Id = ", objectID, ")");

    ELSEIF @primType = 'SetValue' and @typeMult = 'Set' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES 
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, SET_VALUE) 
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS SET_VALUE FROM ", @tableName," WHERE ",className_in,"Id = ", objectID, ")");

   ELSEIF @primType = 'ClassRef' and @typeMult = 'Set' and @direction = 'Uni' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, OID_VALUE, CLASS_NAME)
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",ANAME," AS OID_VALUE,'",@className,"' AS CLASS_NAME FROM ", @tableName," WHERE ",className_in,"Id = ", objectID, ")");

    ELSEIF @primType = 'ClassRef' and @typeMult = 'Set' and @direction = 'Bi' THEN
        SET @SQL_TXT = CONCAT("INSERT INTO ATTRIBUTES
                                    (ATT_NAME, ATT_PRIM_TYPE, TYPE_MULT, OID_VALUE, CLASS_NAME)
                                    (SELECT '" , ANAME  , "' AS ATT_NAME, '",@primType,"' AS ATT_PRIM_TYPE, '",@typeMult,"' AS TYPE_MULT, ",@className,"_",@oppAttName," AS OID_VALUE,'",@className,"' AS CLASS_NAME FROM ", @tableName," WHERE ",className_in,"_",ANAME," = ", objectID, ")");
 


    END IF;

    IF(@SQL_TXT is not null ) THEN
        PREPARE stmt_name FROM @SQL_TXT;
        EXECUTE stmt_name;
        DEALLOCATE PREPARE stmt_name;
    END IF;
  END IF;

END WHILE;

CLOSE attribute_names;


BEGIN
DECLARE AID INT;
DECLARE OBJID INT;
DECLARE CNAME VARCHAR(500);

DECLARE attribute_values CURSOR for 
    SELECT ID, OID_VALUE, CLASS_NAME FROM ATTRIBUTES WHERE OID_VALUE is not null;

SET done = 0;
OPEN attribute_values;  

WHILE done = 0 DO

  FETCH NEXT FROM attribute_values INTO AID, OBJID, CNAME;
   IF done = 0 THEN
    CALL `GET_OBJECT_DESCRIPTION`(CNAME, OBJID, @objDesc);
    UPDATE ATTRIBUTES SET OBJ_DESC = @objDesc WHERE ID = AID;
    
   END IF;

END WHILE;

CLOSE attribute_values;

SELECT * FROM ATTRIBUTES;
		
				END;
				
				END
				$$

			
CREATE PROCEDURE `GET_OBJECT_METHOD_NAMES` ( className_in VARCHAR(500))
	BEGIN
    SELECT * FROM _Meta_Methods WHERE class = className_in AND isObjectMethod = true;
  END;
$$

CREATE PROCEDURE `GET_CLASS_METHOD_NAMES` ( className_in VARCHAR(500))
	BEGIN
    SELECT * FROM _Meta_Methods WHERE class = className_in AND isObjectMethod = false;
  END;
$$

CREATE PROCEDURE `METHOD_PARAMS` ( className_in VARCHAR(500),  methodName_in VARCHAR(500))
	BEGIN
    SELECT * FROM _Meta_Method_Params WHERE class = className_in and methodName = methodName_in;
  END;
$$

DELIMITER ;
drop procedure if exists `GET_OBJECT_BROWSE_LOCATION`;
DELIMITER $$
CREATE PROCEDURE `GET_OBJECT_BROWSE_LOCATION` ( className_in VARCHAR(500), Id_in INT)
	BEGIN
		
		SET @tableName = (SELECT tableName FROM _Meta_Classes WHERE className = className_in);  
		SET @idName = CONCAT(@tableName, "ID");
		
		SET @SQL_TXT = CONCAT("select ", 
				"(select min(",@idName,") from ",@tableName," where ",@idName," > ", Id_in, ") as next,", 
				"(select max(",@idName,") from ",@tableName," where ",@idName," < ", Id_in, ") as prev,",
				"(select min(",@idName,") from ",@tableName,") as first,",
				"(select max(",@idName,") from ",@tableName,") as last"); 
    	
		IF(@SQL_TXT is not null ) THEN
        	PREPARE stmt_name FROM @SQL_TXT;
        	EXECUTE stmt_name;
        	DEALLOCATE PREPARE stmt_name;
    	END IF;
  	END;
 $$

DELIMITER ;

DROP PROCEDURE IF EXISTS `GET_OBJECT_DESCRIPTION_AS_TABLE`;

DELIMITER $$

CREATE PROCEDURE `GET_OBJECT_DESCRIPTION_AS_TABLE`( className_in VARCHAR(500), orderBy_in VARCHAR(255), direction_in VARCHAR(10), start_in INT, limit_in INT, searchTerm_in VARCHAR(100), out total_out INT)
BEGIN
DECLARE thisTableName CHAR(255);
DECLARE idField CHAR(255);
if orderBy_in is null or orderBy_in = '' then
begin
	set orderBy_in = 'ID';
end;
end if;
set @thisTableName = (select tableName from _Meta_Classes where className = className_in);
set @idField = CONCAT(@thisTableName, 'Id');


DROP TABLE IF EXISTS ATTRIBUTES_FOR_DESC;
CREATE TEMPORARY TABLE ATTRIBUTES_FOR_DESC 
  (
    ID INT PRIMARY KEY AUTO_INCREMENT,
	CALL_CLASS VARCHAR(500),
	CALL_OID INT,
    ATT_NAME VARCHAR(500),
    ATT_PRIM_TYPE VARCHAR(500),
    TYPE_MULT VARCHAR(500),
    INT_VALUE INT,
    STRING_VALUE VARCHAR(500),
    SET_VALUE VARCHAR(500),
    OID_VALUE INT,
    CLASS_NAME VARCHAR(100)
  ) ENGINE = MEMORY; 

BEGIN


DROP TABLE IF EXISTS OBJECT_IDS;
CREATE TEMPORARY TABLE OBJECT_IDS 
  (
    ID INT PRIMARY KEY 
  );

SET @SQL_TEXT = CONCAT('INSERT INTO `OBJECT_IDS` SELECT ', @idField, ' FROM ', @thisTableName, '');

PREPARE stmt_name FROM @SQL_TEXT;
EXECUTE stmt_name;
DEALLOCATE PREPARE stmt_name; 


/*SELECT * FROM OBJECT_IDS;*/


/*DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; */
	

END;


BEGIN
DECLARE done INT DEFAULT 0;
DECLARE OID INT ;

DECLARE object_ids CURSOR for 
    SELECT ID FROM OBJECT_IDS ;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


OPEN object_ids;   

WHILE done = 0 DO
	FETCH NEXT FROM object_ids INTO OID;
		IF done = 0 THEN
			SET @SQL_TEXT = CONCAT('CALL `GET_OBJECT_DESCRIPTION_RECURSE`( \'', className_in, '\',', OID, ',@objectDesc)');
			PREPARE stmt_name5 FROM @SQL_TEXT;
			EXECUTE stmt_name5;
			DEALLOCATE PREPARE stmt_name5; 
		END IF;
END WHILE;

END;
/*SELECT * FROM ATTRIBUTES_FOR_DESC;
SELECT DISTINCT ATT_NAME, ATT_PRIM_TYPE FROM ATTRIBUTES_FOR_DESC WHERE CALL_CLASS = className_in; */

BEGIN

DECLARE done INT DEFAULT 0;
DECLARE ANAME CHAR(255);
DECLARE APT CHAR(20);

DECLARE WHERE_CLAUSE TEXT;


DECLARE attribute_names CURSOR for 
    SELECT DISTINCT ATT_NAME, ATT_PRIM_TYPE FROM ATTRIBUTES_FOR_DESC WHERE CALL_CLASS = className_in;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN attribute_names;   
SET @WHERE_CLAUSE = '';

WHILE done = 0 DO
	FETCH NEXT FROM attribute_names INTO ANAME, APT;
		IF done = 0 THEN
			IF(APT = 'String') THEN
				SET @SQL_TEXT1 = CONCAT('ALTER TABLE `OBJECT_IDS` ADD COLUMN `',ANAME, '` VARCHAR(1000);');
			ELSEIF(APT = 'Integer') THEN
				SET @SQL_TEXT1 = CONCAT('ALTER TABLE `OBJECT_IDS` ADD COLUMN `',ANAME, '` INT;');
			END IF;
			/* SELECT @SQL_TEXT1; */
			
			IF(@SQL_TEXT1 is not null ) THEN
				PREPARE stmt_name6 FROM @SQL_TEXT1;
				EXECUTE stmt_name6;
				DEALLOCATE PREPARE stmt_name6; 
				
			END IF;
			SET @WHERE_CLAUSE = CONCAT(@WHERE_CLAUSE, 'OR CAST(', ANAME, ' AS CHAR) LIKE "%', searchTerm_in, '%" ');
		END IF; 
END WHILE;
END;


BEGIN

DECLARE done INT DEFAULT 0;
DECLARE ANAME CHAR(255);
DECLARE OID INT;
DECLARE APT CHAR(20);
DECLARE STRV CHAR(255);
DECLARE INTV INT;

DECLARE attribute_rows CURSOR for 
    SELECT CALL_OID, ATT_NAME, ATT_PRIM_TYPE, INT_VALUE, STRING_VALUE
  FROM ATTRIBUTES_FOR_DESC WHERE CALL_CLASS = className_in;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN attribute_rows;   

/*SELECT * FROM ATTRIBUTES_FOR_DESC;*/
WHILE done = 0 DO
	FETCH NEXT FROM attribute_rows INTO OID, ANAME, APT, INTV, STRV;
		IF done = 0 THEN
		/*SELECT ANAME; */		

		SET @SQL_TEXT2 = null;
			SET @SQL_TEXT2 = CONCAT('INSERT INTO `OBJECT_IDS` (ID, ',ANAME,' ) VALUES (?,?) ON DUPLICATE KEY UPDATE ',ANAME,' = ?');
			/*SET @SQL_TEXT2 = CONCAT('INSERT INTO `OBJECT_IDS` (ID, ',ANAME, ') VALUES (',OID, ',', STRV, ') ON DUPLICATE KEY UPDATE ', ANAME, ' = ', STRV); */
		IF(@SQL_TEXT2 is not null ) THEN
			PREPARE stmt_name FROM @SQL_TEXT2;
			SET @OIDV = OID;
			SET @STRVV = STRV;
			EXECUTE stmt_name USING @OIDV, @STRVV, @STRVV;
			DEALLOCATE PREPARE stmt_name; 
		END IF; 
	END IF;
END WHILE;

CLOSE attribute_rows;
END;

SET @SQL_RESULT1 = CONCAT('SELECT * FROM OBJECT_IDS ',
							'WHERE false ', @WHERE_CLAUSE,
							'ORDER BY ', orderBy_in, ' ', direction_in, ' LIMIT ', start_in, ', ', limit_in, 
							';');
SET @SQL_RESULT2 = CONCAT('SELECT COUNT(*) INTO @total_rows FROM OBJECT_IDS ', 
							'WHERE false ', @WHERE_CLAUSE,
							';');

PREPARE stmt_result FROM @SQL_RESULT1;
EXECUTE stmt_result;
DEALLOCATE PREPARE stmt_result; 

PREPARE stmt_result FROM @SQL_RESULT2;
EXECUTE stmt_result;
DEALLOCATE PREPARE stmt_result; 

/* SELECT @WHERE_CLAUSE; */
SET total_out = @total_rows ;
/*SELECT * FROM ATTRIBUTES_FOR_DESC; */
END
$$

DELIMITER ;

DELIMITER ;
DROP PROCEDURE IF EXISTS `GET_NO_OBJECTS_FOR_CLASS` ;
DELIMITER $$
CREATE PROCEDURE `GET_NO_OBJECTS_FOR_CLASS`( className_in VARCHAR(100), out recordCount_out INT)
BEGIN
DECLARE done INT DEFAULT 0;


SELECT tableName INTO @TNAME FROM _Meta_Classes where className = className_in;

SET @SQL_TXT = CONCAT("SELECT COUNT(*) INTO @rc FROM ", @TNAME);

PREPARE stmt_name FROM @SQL_TXT;
EXECUTE stmt_name;
DEALLOCATE PREPARE stmt_name; 
SET recordCount_out = @rc;
END
$$

DELIMITER ;

DROP PROCEDURE IF EXISTS `GET_OBJECT_DESCRIPTION_ATTRIBUTES`;
DELIMITER $$

CREATE PROCEDURE `GET_OBJECT_DESCRIPTION_ATTRIBUTES`( className_in VARCHAR(500))
BEGIN
    SELECT * FROM _Meta_Attributes WHERE class = className_in and isId = 1;
END 
$$

DELIMITER ;
DROP PROCEDURE IF EXISTS `GET_SET_VALUES`;
DELIMITER $$

CREATE PROCEDURE `GET_SET_VALUES`( setName_in VARCHAR(500))
BEGIN
	DECLARE setTableName TEXT; 
	DECLARE setColumnName TEXT; 
    SELECT tableName, columnName  into @setTableName, @setColumnName 
		FROM _Meta_Sets WHERE setName = setName_in;

	SET @SQL_TXT = CONCAT('SELECT ',  @setColumnName, ' from ', @setTableName);
	PREPARE stmt_name FROM @SQL_TXT;
	EXECUTE stmt_name;
	DEALLOCATE PREPARE stmt_name; 
END 
$$

DELIMITER ;
DROP PROCEDURE IF EXISTS `GET_CLASS_VALUES`;
DELIMITER $$

CREATE PROCEDURE `GET_CLASS_VALUES`( className_in VARCHAR(500))
BEGIN

DECLARE classTableName TEXT; 



DROP TABLE IF EXISTS CLASS_DESCS;
CREATE TEMPORARY TABLE CLASS_DESCS 
  (
    OBJECT_ID INT PRIMARY KEY,
	DESCRIPTION VARCHAR(500)
  ) ENGINE = MEMORY; 


	SELECT tableName  into @classTableName 
		FROM _Meta_Classes WHERE className = className_in;

	SET @SQL_TXT = CONCAT('INSERT INTO CLASS_DESCS (OBJECT_ID)  SELECT ',  @classTableName, 'Id from ', @classTableName, ';');
	PREPARE stmt_name FROM @SQL_TXT;
	EXECUTE stmt_name;
	DEALLOCATE PREPARE stmt_name; 

BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE OID INT;

	DECLARE object_ids CURSOR for 
		SELECT OBJECT_ID FROM CLASS_DESCS;


	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	OPEN object_ids;   



	WHILE done = 0 DO
		FETCH NEXT FROM object_ids INTO OID;
		IF done = 0 THEN
			CALL `GET_OBJECT_DESCRIPTION`(className_in, OID, @objDesc);
			UPDATE CLASS_DESCS SET DESCRIPTION = @objDesc WHERE OBJECT_ID = OID;    
		END IF;

	END WHILE;
END;

	SELECT * FROM CLASS_DESCS;
END 
$$
DELIMITER ;
