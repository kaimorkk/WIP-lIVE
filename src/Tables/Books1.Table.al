Table 52193727 Books1
{
    // //DrillDownPageID = UnknownPage51511084;
    // //LookupPageID = UnknownPage51511084;

    fields
    {
        field(1; No; Code[20])
        {
            NotBlank = false;
        }
        field(2; Description; Text[200])
        {
        }
        field(3; Author; Text[100])
        {
        }
        field(4; ISBN; Code[20])
        {
        }
        field(5; Category; Code[10])
        {
            TableRelation = "Document Types1" where(Book = const(true));

            trigger OnValidate()
            begin
                Cat.Get(Category);
                "Category Name" := Cat."Document Name";
                Modify;
            end;
        }
        field(6; "Category Name"; Text[80])
        {
        }
        field(8; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(16; Status; Option)
        {
            OptionCaption = 'Available,Not Available';
            OptionMembers = Available,"Not Available";
        }
        field(17; approved; Boolean)
        {
        }
        field(18; "Donations Reference No"; Code[10])
        {
        }
        field(19; "donation?"; Boolean)
        {
        }
        field(20; "requested?"; Boolean)
        {
        }
        field(21; "Date donated/Bought"; Date)
        {
        }
        field(22; "Lost?"; Boolean)
        {
        }
        field(23; "Classification No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; "donation?")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            SalesSetup.Get;
            SalesSetup.TestField("Books No");
            NoSeriesMgt.InitSeries(SalesSetup."Books No", xRec.No, 0D, No, "No. Series");
            //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;
    end;

    var
        Cat: Record "Document Types1";
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

