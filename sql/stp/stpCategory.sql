/*PROCEDURE CRUD CATEGORY*/

drop procedure if exists stpCCategory;
delimiter //
create procedure stpCCategory(
		in name_param varchar(35)
    )
	begin 
		insert into category(name,idCatalogStatus) values (name_param,1);
		select idCategory, name from category where idCategory = LAST_INSERT_ID();
    end
//

drop procedure if exists stpRCategory;
delimiter //
create procedure stpRCategory()
	begin 
		select idCategory, name from category where idCatalogStatus = 1;
	end
//

drop procedure if exists stpUCategory;
delimiter //
create procedure stpUCategory(
		in idCategory_param int, 
		in name_param varchar(35)
    )
	begin
		update category set name = name_param where idCategory = idCategory_param;
		select idCategory, name from category where idCategory = idCategory_param;
	end
//

drop procedure if exists stpDCategory;
delimiter //
create procedure stpDCategory(
		in idCatalogStatus_param int,
		in idCategory_param int
    )
	begin
		update category set idCatalogStatus = idCatalogStatus_param where idCategory = idCategory_param;
		select idCategory, name from category where idCategory = idCategory_param;
	end 
//
drop procedure if exists stpSCategory
delimiter //
create procedure stpSCategory(
    in name_param varchar(35)
)
begin
    select idCategory, name from category where name like concat('%',name_param,'%');
end //

drop procedure if exists stpGTIDCategory;
delimiter //
create procedure stpGTIDCategory(
		in idCategory_param int
	)
	begin 
		select idCategory, name from category where idCategory = idCategory_param;
	end
//


call stpCCategory('Polos');
call stpCCategory('Poleras');
call stpCCategory('Jeans');
call stpCCategory('Blusas');
call stpCCategory('Vestidos');
call stpCCategory('Enterizos');
call stpCCategory('Chompas');
call stpCCategory('Shorts');
call stpCCategory('Joggers');
call stpCCategory('Toreros');
call stpCCategory('Baggi');

call stpCCategory('Faldas');
call stpCCategory('Bustieres');
call stpCCategory('Pantalones');
call stpCCategory('Tutus');
call stpCCategory('Capas');
call stpRCategory();
