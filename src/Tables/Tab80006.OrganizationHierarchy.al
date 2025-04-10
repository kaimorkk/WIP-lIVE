
table 80006 "Organization Hierarchy"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Level; Option)
        {
            OptionCaption = ' ,Level 1,Level 2,Level 3,Level 4,Level 5,Level 6,Level 7,Level 8,Level 9,Level 10,Level 11,Level 12';
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7","Level 8","Level 9","Level 10","Level 11","Level 12";
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Document No."; Code[20])
        {
        }
        field(4; "Structure Type"; Option)
        {
            OptionMembers = ,Administrative,Functional;
        }
        field(5; "Status"; Option)
        {
            OptionMembers = New,"Under Review",Approved;
        }
        field(6; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(7; "Designation"; Code[20])
        {
            Caption = 'Code';

            TableRelation = if ("Structure Type" = filter(Functional)) "Company Positions"."Position ID"
            else
            if ("Structure Type" = filter(Administrative)) "Responsibility Center".Code /* where("Operating Unit Type" = const("Court Levels")) */;
            trigger OnValidate()
            var
                JobRec: Record "Company Positions";
                RespC: Record "Responsibility Center";
            begin
                if "Structure Type" = "Structure Type"::Functional then begin
                    JobRec.Reset();
                    JobRec.SetRange(JobRec."Position ID", Designation);
                    if JobRec.find('-') then
                        "Designation Description" := JobRec."Job Title";
                end else
                    if "Structure Type" = "Structure Type"::Administrative then begin
                        RespC.Reset();
                        RespC.SetRange(RespC.Code, Designation);
                        if RespC.find('-') then
                            "Designation Description" := RespC.Name;
                    end;

            end;
        }
        field(8; "Designation Description"; Text[250])
        {
            // TableRelation = "Company Positions";
            Caption = 'Description';
        }


    }

    keys
    {
        key(Key1; "Document No.", Level, "Structure Type", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Level, "Entry No.", "Designation Description")
        { }
    }

}

