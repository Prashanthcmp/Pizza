using my.PizzaShop as myPizzaShop from '../db/data-model';

service PizzaService {

    entity Products @odata.draft.enabled as projection on myPizzaShop.Products
    entity CategoryName @readonly as projection on myPizzaShop.CategoryName
    entity Orders @insertonly as projection on myPizzaShop.Orders
    entity ProductVH @readonly as projection on myPizzaShop.ProductVH

    annotate my.PizzaShop.Products with @(
        
        UI: {
            
            SelectionFields  : [
                ID,category_ID
            ],

            LineItem  : [
                {Value: ID, Label: 'Product ID'},
                {Value: title, Label: 'Product Name'},
                {Value: category.name, Label: 'Category Name'},
                {Value: amount, Label: 'Amount'}
            ],

            HeaderInfo  : {
                $Type : 'UI.HeaderInfoType',
                TypeName : 'Products',
                TypeNamePlural : 'Products',
                Title: {Value: ID},
			    Description: {Value: title}
            },

            Facets  : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'GenaeralInfo',
                    Target : '@UI.FieldGroup#GeanralInfo',
                }
            ],

            FieldGroup#GeanralInfo: {
                Data: [
                    {Value:ID, Label: 'Prodcut ID'},
                    {Value:title, Label: 'Product Name'},
                    {Value:category_ID, Label: 'Category'},
                    {Value:amount, Label: 'Amount'}
                ]
            }
        }
    ) {

    
    ID @ValueList.entity:'ProductVH';
    category @ValueList.entity:'CategoryName'
};
  
    
}