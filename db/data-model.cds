
namespace my.PizzaShop;

using { Country, managed } from '@sap/cds/common';


  entity Products : managed {
    key ID : Integer;
    title  : localized String;
    productName : Association to ProductsName;
    @EndUserText : {Label: 'CategoryName'}
    category : Association to CategoryName;
  }

  entity CategoryName  {
      key ID : Integer;
      name : String;
      category : Association to many Products on category.category = $self;
  }

  entity ProductsName  {
      key ID : Integer;
      name : String(20);
      productName : Association to many Products on productName.productName = $self;
  }

  entity Orders : managed {
    key ID  : UUID;
    book    : Association to Products;
    country : Country;
    amount  : Integer;
  }

