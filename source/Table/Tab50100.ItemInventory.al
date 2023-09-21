table 50100 ItemInventory
{
    Caption = 'ItemInventory';
    DataClassification = ToBeClassified;
    TableType = Temporary;
    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(2; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(3; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(4; Picture; MediaSet)
        {
            Caption = 'Picture';
        }
        field(5; ItemCategoryName; Text[100])
        {
            Caption = 'Item Category Name';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; ItemCategoryCode; Code[20])
        {
            Caption = 'Item Category Code';
        }
        field(8; ID; Integer)
        {
            Caption = 'ID';
        }
        field(9; UnitPrice; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(10; BLOB_Picture; Blob)
        {
            Caption = 'Image';
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}
