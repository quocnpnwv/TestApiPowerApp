page 50144 "Item Ledger Entry Api"
{
    APIGroup = 'item';
    APIPublisher = 'itemLedgerEntry';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'itemLedgerEntryApi';
    DelayedInsert = true;
    EntityName = 'itemLedgerEntryApi';
    EntitySetName = 'itemLedgerEntryApi';
    PageType = API;
    SourceTable = "Item Ledger Entry";
    SourceTableView = where("Location Code" = filter(<> ''), Quantity = filter(> 0));
    ODataKeyFields = "Entry No.";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Item No.';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(unitPrice; gUnitPrice)
                {
                    Caption = 'Unit Price';
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
                field(UoMCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(Description; gDescription)
                {

                }
            }

        }
    }
    trigger OnAfterGetCurrRecord()
    var
        lRecItem: Record Item;
    begin
        lRecItem.SetRange("No.", Rec."Item No.");
        if lRecItem.FindSet() then begin
            gUnitPrice := lRecItem."Unit Price"
        end;

    end;

    var
        gUnitPrice: Decimal;
        ItemCategoryName: Text[100];
        TempPictureBlobStorage: Record "Name/Value Buffer" temporary; // The temporary record is used to load the picture
        PictureHeight: Integer;
        PictureWidth: Integer;
        gDescription: Text;

    // trigger OnAfterGetRecord()
    // var
    //     TenantMedia: Record "Tenant Media";
    //     OutStr: OutStream;
    //     InStr: InStream;
    //     MediaId: Guid;
    //     RecordR: RecordRef;
    //     FieldR: FieldRef;
    //     ItemCategory: Record "Item Category";
    //     // lRec_Item: Record Item;
    //     lQue_Item: Query ItemInventory;
    // begin
    //     lQue_Item.Open();
    //     lQue_Item.SetRange(No, Rec."Item No.");
    //     while lQue_Item.Read() do begin
    //         TempPictureBlobStorage.DeleteAll();
    //         TempPictureBlobStorage.Init();
    //         TempPictureBlobStorage."Value BLOB".CreateOutStream(OutStr);

    //         // If the picture is of type Media, use this code:
    //         // Rec.Picture.Image.ExportStream(OutStr);

    //         // If the picture is of type MediaSet, use this code:
    //         // if lRec_Item.FindSet() then begin
    //         if lQue_Item.Picture.Count > 0 then begin
    //             // If there are more than 1 pictures for this item. We take the first one.
    //             MediaId := lQue_Item.Picture.Item(1);

    //             TenantMedia.SetAutoCalcFields(Content);
    //             if not TenantMedia.Get(MediaID) then
    //                 exit;

    //             TenantMedia.Content.CreateInStream(InStr);
    //             CopyStream(OutStr, InStr);

    //             PictureWidth := TenantMedia.Width;
    //             PictureHeight := TenantMedia.Height;
    //         end;
    //         gDescription := lQue_Item.Description;
    //         TempPictureBlobStorage.Insert();

    //         ItemCategoryName := '';
    //         if lQue_Item.categoryCode <> '' then begin
    //             if ItemCategory.Get(lQue_Item.categoryCode)
    //             then
    //                 ItemCategoryName := ItemCategory.Description
    //         end;
    //         // end;
    //     end;
    // end;


    trigger OnAfterGetRecord()
    var
        TenantMedia: Record "Tenant Media";
        OutStr: OutStream;
        InStr: InStream;
        MediaId: Guid;
        RecordR: RecordRef;
        FieldR: FieldRef;
        ItemCategory: Record "Item Category";
        lRec_Item: Record Item;
    // lQue_Item: Query ItemInventory;
    begin
        // lQue_Item.Open();
        lRec_Item.SetRange("No.", Rec."Item No.");
        // while lQue_Item.Read() do begin
        TempPictureBlobStorage.DeleteAll();
        TempPictureBlobStorage.Init();
        TempPictureBlobStorage."Value BLOB".CreateOutStream(OutStr);

        // If the picture is of type Media, use this code:
        // Rec.Picture.Image.ExportStream(OutStr);

        // If the picture is of type MediaSet, use this code:
        if lRec_Item.FindSet() then begin
            // if lQue_Item.Picture.Count > 0 then begin
            // If there are more than 1 pictures for this item. We take the first one.
            MediaId := lRec_Item.Picture.Item(1);

            TenantMedia.SetAutoCalcFields(Content);
            if not TenantMedia.Get(MediaID) then
                exit;

            TenantMedia.Content.CreateInStream(InStr);
            CopyStream(OutStr, InStr);

            PictureWidth := TenantMedia.Width;
            PictureHeight := TenantMedia.Height;
        end;
        gDescription := lRec_Item.Description;
        TempPictureBlobStorage.Insert();

        ItemCategoryName := '';
        if lRec_Item."Item Category Code" <> '' then begin
            if ItemCategory.Get(lRec_Item."Item Category Code")
            then
                ItemCategoryName := ItemCategory.Description
        end;
    end;
}
