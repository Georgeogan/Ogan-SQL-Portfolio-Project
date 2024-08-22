select *
from PortfolioProject..Nashvillehousing
;

USE [PortfolioProject]
GO

/****** Object:  Table [dbo].[Nashvillehousing]    Script Date: 8/19/2024 8:49:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Nashvillehousing1](
	[UniqueID ] [float] NULL,
	[ParcelID] [nvarchar](255) NULL,
	[LandUse] [nvarchar](255) NULL,
	[PropertyAddress] [nvarchar](255) NULL,
	[SaleDate] [datetime] NULL,
	[SalePrice] [float] NULL,
	[LegalReference] [nvarchar](255) NULL,
	[SoldAsVacant] [nvarchar](255) NULL,
	[OwnerName] [nvarchar](255) NULL,
	[OwnerAddress] [nvarchar](255) NULL,
	[Acreage] [float] NULL,
	[TaxDistrict] [nvarchar](255) NULL,
	[LandValue] [float] NULL,
	[BuildingValue] [float] NULL,
	[TotalValue] [float] NULL,
	[YearBuilt] [float] NULL,
	[Bedrooms] [float] NULL,
	[FullBath] [float] NULL,
	[HalfBath] [float] NULL
) ON [PRIMARY]
GO
;

select *
from PortfolioProject..Nashvillehousing1
;

insert PortfolioProject..Nashvillehousing1
select *
from PortfolioProject..Nashvillehousing
;

select *
from PortfolioProject..Nashvillehousing1
;

select saleDate
from PortfolioProject..Nashvillehousing1
;

select saleDate, convert(date, saleDate)
from PortfolioProject..Nashvillehousing1
;

Alter table Nashvillehousing1
add Sale_date date
;

update Nashvillehousing1
set Sale_date = convert(date, saleDate)
;

select *
from PortfolioProject..Nashvillehousing1
;

select PropertyAddress
from PortfolioProject..Nashvillehousing1
where PropertyAddress is NULL
;

select *
from PortfolioProject..Nashvillehousing1
where PropertyAddress is NULL
;

select *
from PortfolioProject..Nashvillehousing1
order by ParcelID
;

select vic.ParcelID, vic.PropertyAddress, vin.ParcelID, vin.PropertyAddress
from PortfolioProject..Nashvillehousing1 vic
join PortfolioProject..Nashvillehousing1 vin
	on vic.ParcelID = vin.ParcelID
	and vic.[UniqueID ] != vin.[UniqueID ]
;

select vic.ParcelID, vic.PropertyAddress, vin.ParcelID, vin.PropertyAddress
from PortfolioProject..Nashvillehousing1 vic
join PortfolioProject..Nashvillehousing1 vin
	on vic.ParcelID = vin.ParcelID
	and vic.[UniqueID ] != vin.[UniqueID ]
where vic.PropertyAddress is null
;

select vic.ParcelID, vic.PropertyAddress, vin.ParcelID, vin.PropertyAddress, isnull(vic.PropertyAddress, vin.PropertyAddress)
from PortfolioProject..Nashvillehousing1 vic
join PortfolioProject..Nashvillehousing1 vin
	on vic.ParcelID = vin.ParcelID
	and vic.[UniqueID ] != vin.[UniqueID ]
where vic.PropertyAddress is null
;

update vic
set PropertyAddress = isnull(vic.PropertyAddress, vin.PropertyAddress)
from PortfolioProject..Nashvillehousing1 vic
join PortfolioProject..Nashvillehousing1 vin
	on vic.ParcelID = vin.ParcelID
	and vic.[UniqueID ] != vin.[UniqueID ]
where vic.PropertyAddress is null
;

select PropertyAddress
from PortfolioProject..Nashvillehousing1
;

Select PropertyAddress,
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) Address1
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, len(PropertyAddress)) Address2
from PortfolioProject..Nashvillehousing1
;

Alter table Nashvillehousing1
add Property_Address nvarchar(255)
;

update Nashvillehousing1
set Property_Address = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1)
;

Alter table Nashvillehousing1
add Property_City nvarchar(255)
;

update Nashvillehousing1
set Property_City = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, len(PropertyAddress))
;

select *
from PortfolioProject..Nashvillehousing1
;

select OwnerAddress
from PortfolioProject..Nashvillehousing1
where OwnerAddress is NULL
;

select OwnerAddress
from PortfolioProject..Nashvillehousing1
where OwnerAddress is not NULL
;

select *
from PortfolioProject..Nashvillehousing1
where OwnerAddress is NULL
;

select vic.ParcelID, vic.OwnerAddress, vin.ParcelID, vin.OwnerAddress
from PortfolioProject..Nashvillehousing1 vic
join PortfolioProject..Nashvillehousing1 vin
	on vic.ParcelID = vin.ParcelID
	and vic.[UniqueID ] != vin.[UniqueID ]
	where vic.OwnerAddress is NULL
;

select OwnerAddress
from PortfolioProject..Nashvillehousing1
where OwnerAddress is not NULL
;

Select OwnerAddress,
SUBSTRING(OwnerAddress, 1, CHARINDEX(',', PropertyAddress)-1) Address1,
 CHARINDEX(',', PropertyAddress)
--, SUBSTRING(OwnerAddress, CHARINDEX(',', PropertyAddress)+1, len(PropertyAddress)) Address2
from PortfolioProject..Nashvillehousing1
order by OwnerAddress desc
;

select OwnerAddress,
PARSENAME(replace(OwnerAddress,',','.'), 3) Address
,PARSENAME(replace(OwnerAddress,',','.'), 2) City
,PARSENAME(replace(OwnerAddress,',','.'), 1) state
from PortfolioProject..Nashvillehousing1
order by OwnerAddress desc
;

Alter table Nashvillehousing1
add Owner_Address nvarchar(255)
;

update Nashvillehousing1
set Owner_Address = PARSENAME(replace(OwnerAddress,',','.'), 3)
;

Alter table Nashvillehousing1
add Owner_City nvarchar(255)
;

update Nashvillehousing1
set Owner_City = PARSENAME(replace(OwnerAddress,',','.'), 2)
;

Alter table Nashvillehousing1
add Owner_State nvarchar(255)
;

update Nashvillehousing1
set Owner_State = PARSENAME(replace(OwnerAddress,',','.'), 1)
;

select *
from PortfolioProject..Nashvillehousing1
;

select Distinct SoldAsVacant
from PortfolioProject..Nashvillehousing1
;

select SoldAsVacant,
case when SoldAsVacant = 'Y' then 'Yes'
	 when SoldAsVacant = 'N' then 'No'
	 else SoldAsVacant
	 end
from PortfolioProject..Nashvillehousing1
;

update Nashvillehousing1
set SoldAsVacant = case when SoldAsVacant = 'Y' then 'Yes'
	 when SoldAsVacant = 'N' then 'No'
	 else SoldAsVacant
	 end
;

select Distinct (SoldAsVacant), count(SoldAsVacant)
from PortfolioProject..Nashvillehousing1
group by SoldAsVacant
;

select *
from PortfolioProject..Nashvillehousing1
order by saledate
;


select *,
row_number() over(
partition by [ParcelID], [PropertyAddress], [SaleDate],[SalePrice],
	[LegalReference] order by UniqueID) row_num
from PortfolioProject..Nashvillehousing1
;

with duplicatecte as
(
select *,
row_number() over(
partition by [ParcelID], [PropertyAddress], [SaleDate],[SalePrice],
	[LegalReference] order by UniqueID) row_num
from PortfolioProject..Nashvillehousing1
)
select *
from duplicatecte
where row_num > 1
order by PropertyAddress
;

with duplicatecte as
(
select *,
row_number() over(
partition by [ParcelID], [PropertyAddress], [SaleDate],[SalePrice],
	[LegalReference] order by UniqueID) row_num
from PortfolioProject..Nashvillehousing1
)
delete
from duplicatecte
where row_num > 1
;

with duplicatecte as
(
select *,
row_number() over(
partition by [ParcelID], [PropertyAddress], [SaleDate],[SalePrice],
	[LegalReference] order by UniqueID) row_num
from PortfolioProject..Nashvillehousing1
)
select *
from duplicatecte
where row_num > 1
;


select *
from PortfolioProject..Nashvillehousing1
order by saledate
;

alter table PortfolioProject..Nashvillehousing1
drop column PropertyAddress, SaleDate, OwnerAddress, TaxDistrict,OwnerName, LegalReference
;

select *
from PortfolioProject..Nashvillehousing1
;
