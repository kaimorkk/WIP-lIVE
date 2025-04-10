TableExtension 52193438 tableextension52193438 extends "Sales Header"
{
    fields
    {

        field(50000; "Invoice Amount"; Decimal)
        {
        }
        field(50001; "Record From SMS"; Boolean)
        {
        }
        field(50002; "Transaction ID SMS"; Code[50])
        {
        }
        field(70002; "Method of Disposal"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Transfer to Public Entity,Sale by Public Tender,Sale by Public Auction,Trade-in,Waste Disposal Management';
            OptionMembers = " ","Transfer to Public Entity","Sale by Public Tender","Sale by Public Auction","Trade-in","Waste Disposal Management";
        }
        field(70000; "Disposal Invitation No"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Standard Sales Code".Code;
            trigger OnValidate()
            var
                myInt: Integer;
                Lines: Record "Standard Sales Line";
                Header: Record "Standard Sales Code";
                SalesLines: Record "Sales Line";
            begin
                Lines.Reset();
                Lines.setrange("Standard Sales Code", "Disposal Invitation No");
                if Lines.FindSet() then begin
                    repeat
                        SalesLines.Init();
                        SalesLines."Document No." := "No.";
                        SalesLines."Line No." := Lines."Line No.";
                        SalesLines.Type := Lines.type;
                        SalesLines."No." := Lines."No.";
                        SalesLines.Description := Lines.Description;
                        SalesLines.Quantity := Lines.Quantity;
                        SalesLines.Insert(true);
                    until Lines.next = 0;

                end;


            end;
        }
        field(70003; "Disposal Type"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Disposal Types".Code;
        }
    }
}

