
table 69255 "Disciplinary Committee Members"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Committee; Code[20])
        {
            NotBlank = true;
        }
        field(2; "Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                Board.Reset;
                Board.SetRange("No.", Code);
                if Board.FindSet then
                    Names := Board."First Name" + ' ' + Board."Middle Name" + ' ' + Board."Last Name";
                Designation := Board."Job Title";
                Email := Board."Company E-Mail";
                "Phone Number" := Board."Phone No.";
                Address := Board.Address;
                "Address 2" := Board."Address 2";
            end;
        }
        field(4; Names; Text[250])
        {
            Editable = false;
        }
        field(5; Designation; Text[250])
        {
        }
        field(6; Remarks; Text[200])
        {
        }
        field(7; Role; Option)
        {
            OptionCaption = ' ,Chairman,Secretary,Member,Consultant';
            OptionMembers = " ",Chairman,Secretary,Member,Consultant;
        }
        field(9; "Director No"; Code[20])
        {
            TableRelation = Vendor."No." /*where("Vendor Type" = filter(Director))*/;

            trigger OnValidate()
            begin
                Directors.Get("Director No");
                Names := Directors.Name;
            end;
        }
        field(10; Email; Text[30])
        {
        }
        field(11; "Phone Number"; Code[10])
        {
        }
        field(12; Address; Code[30])
        {
        }
        field(13; "Address 2"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; Committee, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Board: Record Employee;
        Directors: Record Vendor;
}

