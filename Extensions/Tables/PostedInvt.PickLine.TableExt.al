TableExtension 52193796 tableextension52193796 extends "Posted Invt. Pick Line" 
{
    procedure ShowRegisteredActivityDoc()
    var
        RegisteredWhseActivHeader: Record "Registered Whse. Activity Hdr.";
        RegisteredPickCard: Page "Registered Pick";
    begin
        RegisteredWhseActivHeader.SetRange("No.","No.");
        RegisteredPickCard.SetTableview(RegisteredWhseActivHeader);
        RegisteredPickCard.RunModal;
    end;

    procedure ShowWhseEntries(RegisterDate: Date)
    var
        WhseEntry: Record "Warehouse Entry";
        WhseEntries: Page "Warehouse Entries";
    begin
        WhseEntry.SetCurrentkey("Reference No.","Registering Date");
        WhseEntry.SetRange("Reference No.","No.");
        WhseEntry.SetRange("Registering Date",RegisterDate);
        WhseEntry.SetRange("Reference Document",WhseEntry."reference document"::Pick);
        WhseEntries.SetTableview(WhseEntry);
        WhseEntries.RunModal;
    end;
}

