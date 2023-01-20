{{ config(alias = 'customers', materialized='table', database='qwt' , schema='transforming') }}

select 
Key_Customers ,
 Add ,
  City ,
  CompanyName ,
  ContactName ,
  DivisionID ,
  DivisionName	,
  Fax ,
  Phone	,
  PostalCode ,
  RecNo_Customers ,
  replace(StateProvince,'-',' ') as StateProvince from qwt.staging.customers