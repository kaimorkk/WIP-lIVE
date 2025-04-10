
table 70190 "RFI Responsibility Center"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ',Invitation For Prequalification,EOI Invitation';
            OptionMembers = ,"Invitation For Prequalification","EOI Invitation";
        }
        field(2; "Document No"; Code[20])
        {
            TableRelation = "Request For Information".Code;
        }
        field(3; "Responsibility Center ID"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Region));

            trigger OnValidate()
            begin
                resp.Reset;
                resp.SetRange(Code, "Responsibility Center ID");
                if resp.FindSet then begin
                    "Operating Unit Type" := resp."Operating Unit Type";
                    Description := resp.Name;

                end;
            end;
        }
        field(4; "Operating Unit Type"; Option)
        {
            Editable = false;
            OptionCaption = 'Board,Company-Level,Directorate,Department,Section/Team,Region,Branch/Centre';
            OptionMembers = Board,"Company-Level",Directorate,Department,"Section/Team",Region,"Branch/Centre";
        }
        field(5; Description; Text[60])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        resp: Record "Responsibility Center";
}

