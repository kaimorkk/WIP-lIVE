
table 70223 "IFS Tender Committe Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            TableRelation = "IFS Tender Committee"."Document No.";

            trigger OnValidate()
            begin
                IFSTenderCommitte.Reset;
                IFSTenderCommitte.SetRange("Document No.", "Document No.");
                if IFSTenderCommitte.FindSet then begin
                    Description := IFSTenderCommitte.Description;
                end;
            end;
        }
        field(2; "IFS Code"; Code[20])
        {
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            begin
                ifs.Reset;
                ifs.SetRange(Code, "IFS Code");
                if ifs.FindSet then begin


                    "External Document No" := ifs."External Document No";
                    "Tender Name" := ifs."Tender Name";
                    "Tender Opening Date" := ifs."Bid Opening Date";
                    "Tender Opeing Time" := ifs."Bid Opening Time";
                end;
            end;
        }
        field(3; Description; Text[60])
        {
        }
        field(4; "Tender Name"; Text[250])
        {
        }
        field(5; "External Document No"; Code[30])
        {
        }
        field(6; "Tender Opening Date"; Date)
        {
        }
        field(7; "Tender Opeing Time"; Time)
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "IFS Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BidCharge: Record "Bid Charges Schedule";
        ifs: Record "Standard Purchase Code";
        IFSTenderCommitte: Record "IFS Tender Committee";
}

