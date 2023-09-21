page 50142 Item
{
    APIGroup = 'item';
    APIPublisher = 'itemCheckInventory';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'item';
    DelayedInsert = true;
    EntityName = 'apiItemCheckInventory';
    EntitySetName = 'apiItemCheckInventory';
    PageType = API;
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'System ID';
                }
                field(number; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(DisplayName; Rec.Description)
                {
                    Caption = 'Display Name';
                }
                field("unitPrice"; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(baseUnitOfMeasureCode; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit Of Measure Code';
                }
                field(itemImageText; Rec.Picture)
                {
                    Caption = 'Picture Reference';
                }
                field(GTIN; Rec.GTIN)
                {
                    Caption = 'GTIN';
                }
                field(itemCategoryName; ItemCategoryName)
                {
                    Editable = false;
                    Caption = 'Item Category Name';
                }
                field("itemCategoryCode"; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(picture; TempPictureBlobStorage."Value BLOB")
                {
                    Caption = 'Picture';
                }
                field(pictureHeight; PictureHeight)
                {
                    Editable = false;
                    Caption = 'Picture Height';
                }
                field(pictureWidth; PictureWidth)
                {
                    Editable = false;
                    Caption = 'Picture Width';
                }
            }
        }
    }

    var
        ItemCategoryName: Text[100];
        TempPictureBlobStorage: Record "Name/Value Buffer" temporary; // The temporary record is used to load the picture
        PictureHeight: Integer;
        PictureWidth: Integer;

    trigger OnAfterGetRecord()
    var
        TenantMedia: Record "Tenant Media";
        OutStr: OutStream;
        InStr: InStream;
        MediaId: Guid;
        RecordR: RecordRef;
        FieldR: FieldRef;
        ItemCategory: Record "Item Category";
    begin
        TempPictureBlobStorage.DeleteAll();
        TempPictureBlobStorage.Init();
        TempPictureBlobStorage."Value BLOB".CreateOutStream(OutStr);

        // If the picture is of type Media, use this code:
        // Rec.Picture.Image.ExportStream(OutStr);

        // If the picture is of type MediaSet, use this code:
        if Rec.Picture.Count > 0 then begin
            // If there are more than 1 pictures for this item. We take the first one.
            MediaId := Rec.Picture.Item(1);

            TenantMedia.SetAutoCalcFields(Content);
            if not TenantMedia.Get(MediaID) then
                exit;

            TenantMedia.Content.CreateInStream(InStr);
            CopyStream(OutStr, InStr);

            PictureWidth := TenantMedia.Width;
            PictureHeight := TenantMedia.Height;
        end;

        TempPictureBlobStorage.Insert();

        ItemCategoryName := '';
        if Rec."Item Category Code" <> '' then begin
            if ItemCategory.Get(Rec."Item Category Code")
            then
                ItemCategoryName := ItemCategory.Description
        end;
        Page.Run(Page::"Item Ledger Entry Api", Rec);
    end;
}
