
table 69241 "HR Employee Attachments"
{
    DataClassification = CustomerContent;
    //LookupPageID = UnknownPage51516218;

    fields
    {
        field(1; "Employee No"; Code[50])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(2; "Document Description"; Text[200])
        {
            NotBlank = true;
        }
        field(3; "Document Link"; Text[200])
        {
        }
        field(6; "Attachment No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(7; "Language Code (Default)"; Code[10])
        {
            TableRelation = Language;
        }
        field(8; Attachment; Option)
        {
            Editable = false;
            OptionMembers = No,Yes;
        }
    }

    keys
    {
        key(Key1; "Employee No", "Document Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DocLink: Record "HR Employee Attachments";


    procedure PlaceFilter(prompt: Boolean; EmployeeNo: Code[10]): Boolean
    begin
        if prompt then begin
            SetFilter("Employee No", EmployeeNo);
        end;
    end;
}

