page 50102 CheckItemInventory
{
    APIGroup = 'itemInventory';
    APIPublisher = 'itemInventoryCheck';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'checkItemInventory';
    DelayedInsert = true;
    EntityName = 'itemInventory';
    EntitySetName = 'itemInventories';
    PageType = API;
    SourceTable = ItemInventory;
    ODataKeyFields = ID;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    Caption = 'ID';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(ItemCategoryName; Rec.ItemCategoryName)
                {
                    Caption = 'Item Category Name';
                }
                field(ItemCategoryCode; Rec.ItemCategoryCode)
                {
                    Caption = 'Item Category Code';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(picture; Rec.BLOB_Picture)
                {
                    Caption = 'Image';
                    Editable = false;
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(unitPrice; Rec.UnitPrice)
                {
                    Caption = 'Unit Price';
                }
            }
        }
    }
    var
        TempPictureBlobStorage: Record "Name/Value Buffer" temporary; // The temporary record is used to load the picture

    trigger OnInit()
    var
        TenantMedia: Record "Tenant Media";
        OutStr: OutStream;
        InStr: InStream;
        MediaId: Guid;
        ItemCategory: Record "Item Category";
        lQue_Item: Query ItemInventory;
        intID: Integer;
        lRec_Item: Record Item;
    begin
        intID := 0;
        lQue_Item.Open();
        // If the picture is of type Media, use this code:
        // Rec.Picture.Image.ExportStream(OutStr);
        while lQue_Item.Read() do begin

            Clear(lRec_Item);
            //progress media
            lRec_Item.SetRange("No.", lQue_Item.Item_No);
            if lRec_Item.FindFirst() then begin
                intID += 1;
                TempPictureBlobStorage."Value BLOB".CreateOutStream(OutStr);
                TempPictureBlobStorage.ID := intID;
                // If there are more than 1 pictures for this item. We take the first one.
                MediaId := lRec_Item.Picture.Item(1);

                TenantMedia.SetAutoCalcFields(Content);
                if not TenantMedia.Get(MediaID) then
                    exit;

                TenantMedia.Content.CreateInStream(InStr);
                CopyStream(OutStr, InStr);
            end;

            TempPictureBlobStorage.Insert();

            //insert table
            Rec.ID := intID;
            Rec.Description := lQue_Item.Description;
            Rec."Item No." := lQue_Item.Item_No;
            Rec."Location Code" := lQue_Item.Location_Code;
            Rec.Quantity := lQue_Item.Sum_Quantity;
            Rec.ItemCategoryCode := lQue_Item.Category;
            Rec.UnitPrice := lQue_Item.unitPrice;
            Rec.BLOB_Picture := TempPictureBlobStorage."Value BLOB";
            if lQue_Item.Category <> '' then begin
                if ItemCategory.Get(lQue_Item.Category)
                then
                    Rec.ItemCategoryName := ItemCategory.Description
            end;
            Rec.Insert(true);

        end;
        lQue_Item.Close();
    end;
}
