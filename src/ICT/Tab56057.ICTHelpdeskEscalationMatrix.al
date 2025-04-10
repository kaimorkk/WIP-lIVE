
table 56057 "ICT Helpdesk Escalation Matrix"
{
    DrillDownPageID = "Escalation Matrix";
    LookupPageID = "Escalation Matrix";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Officer Name"; Code[100])
        {

            // trigger OnLookup()
            // begin

            //     UserManagement.LookupUserID("Officer Name");
            // end;

            // trigger OnValidate()
            // begin
            //     UserManagement.ValidateUserID("Officer Name");
            // end;
        }
        field(2; "Reports To Officer Name"; Code[100])
        {

            // trigger OnLookup()
            // begin
            //     UserManagement.LookupUserID("Reports To Officer Name");
            // end;

            // trigger OnValidate()
            // begin
            //     UserManagement.LookupUserID("Reports To Officer Name");
            // end;
        }
        field(3; "Category Head"; Text[250])
        {
        }
        field(4; "Category Code"; Code[50])
        {
            TableRelation = "ICT Helpdesk Category".Code;

            trigger OnValidate()
            begin
                ICTHelpdeskCategory.Reset;
                ICTHelpdeskCategory.SetRange(ICTHelpdeskCategory.Code, "Category Code");
                if ICTHelpdeskCategory.FindSet then begin
                    Description := ICTHelpdeskCategory.Description;
                    "Category Head" := ICTHelpdeskCategory."Category Head";
                end;
            end;
        }
        field(5; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Reports To Officer Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Officer Name", "Reports To Officer Name")
        {
        }
    }

    var
        UserManagement: Codeunit "User Management";
        ICTHelpdeskCategory: Record "ICT Helpdesk Category";
}

