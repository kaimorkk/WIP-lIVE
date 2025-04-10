TableExtension 52193794 tableextension52193794 extends "Posted Invt. Put-away Line" 
{
    procedure ShowRegisteredActivityDoc()
    var
        RegisteredWhseActivHeader: Record "Registered Whse. Activity Hdr.";
        RegisteredPutAwayCard: Page "Registered Put-away";
    begin
        RegisteredWhseActivHeader.SetRange("No.","No.");
        RegisteredPutAwayCard.SetTableview(RegisteredWhseActivHeader);
        RegisteredPutAwayCard.RunModal;
    end;

    procedure ShowWhseEntries(RegisterDate: Date)
    var
        WhseEntry: Record "Warehouse Entry";
        WhseEntries: Page "Warehouse Entries";
    begin
        WhseEntry.SetCurrentkey("Reference No.","Registering Date");
        WhseEntry.SetRange("Reference No.","No.");
        WhseEntry.SetRange("Registering Date",RegisterDate);
        WhseEntry.SetRange("Reference Document",WhseEntry."reference document"::"Put-away");
        WhseEntries.SetTableview(WhseEntry);
        WhseEntries.RunModal;
    end;
}

